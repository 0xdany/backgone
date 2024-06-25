const express = require('express');
const path = require('path');
const multer = require('multer');
const { spawn } = require('child_process');
const fs = require('fs');

const app = express();
const port = 3000;

// Configure Multer for file uploads
const upload = multer({ dest: 'uploads/' });

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Serve static files from node_modules
app.use('/node_modules', express.static(path.join(__dirname, 'node_modules')));

// Serve processed images
app.use('/processed', express.static(path.join(__dirname, 'processed')));

// Set the view engine to EJS
app.set('view engine', 'ejs');

// Define a simple route
app.get('/', (req, res) => {
  res.render('index');
});

// Handle file uploads and background removal
app.post('/upload', upload.single('image'), (req, res) => {
  console.log('File uploaded:', req.file); // Log file upload
  const inputPath = req.file.path;
  const outputPath = path.join(__dirname, 'processed', `${req.file.filename}.png`);

  const pythonProcess = spawn(path.join(__dirname, 'backgone_venv/bin/python3'), ['process_image.py', inputPath, outputPath]);

  pythonProcess.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`);
  });

  pythonProcess.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`);
  });

  pythonProcess.on('close', (code) => {
    console.log(`Python process exited with code ${code}`);
    if (code !== 0) {
      return res.status(500).send('Error processing image');
    }

    res.json({ imageUrl: `/processed/${req.file.filename}.png` });
  });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
