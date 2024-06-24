const express = require('express');
const path = require('path');

const app = express();
const port = 3000;

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Serve static files from node_modules
app.use('/node_modules', express.static(path.join(__dirname, 'node_modules')));

// Set the view engine to EJS
app.set('view engine', 'ejs');

// Define a simple route
app.get('/', (req, res) => {
  res.render('index');
});

// Add this route to handle htmx requests
app.get('/message', (req, res) => {
  res.send('<p>Hello, this is a message from the server!</p>');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
