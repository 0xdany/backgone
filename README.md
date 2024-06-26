<p align="center">
  <img src="/public/assets/logo.svg" width="100" />
</p>
<p align="center">
    <h1 align="center">Backgone.</h1>
</p>
<p align="center">
    <em><code>► Containerized background remover built using HTMX + Express.js</code></em>
</p>
<p align="center">
	<img src="https://img.shields.io/github/license/0xdany/backgone?style=flat&color=0080ff" alt="license">
	<img src="https://img.shields.io/github/last-commit/0xdany/backgone?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
	<img src="https://img.shields.io/github/languages/top/0xdany/backgone?style=flat&color=0080ff" alt="repo-top-language">
	<img src="https://img.shields.io/github/languages/count/0xdany/backgone?style=flat&color=0080ff" alt="repo-language-count">
<p>
<p align="center">
		<em>Developed using these tools.</em>
</p>
<p align="center">
	<img src="https://img.shields.io/badge/tqdm-FFC107.svg?style=flat&logo=tqdm&logoColor=black" alt="tqdm">
	<img src="https://img.shields.io/badge/JavaScript-F7DF1E.svg?style=flat&logo=JavaScript&logoColor=black" alt="JavaScript">
	<img src="https://img.shields.io/badge/Prettier-F7B93E.svg?style=flat&logo=Prettier&logoColor=black" alt="Prettier">
	<img src="https://img.shields.io/badge/PostCSS-DD3A0A.svg?style=flat&logo=PostCSS&logoColor=white" alt="PostCSS">
	<img src="https://img.shields.io/badge/Autoprefixer-DD3735.svg?style=flat&logo=Autoprefixer&logoColor=white" alt="Autoprefixer">
	<img src="https://img.shields.io/badge/YAML-CB171E.svg?style=flat&logo=YAML&logoColor=white" alt="YAML">
	<img src="https://img.shields.io/badge/SciPy-8CAAE6.svg?style=flat&logo=SciPy&logoColor=white" alt="SciPy">
	<img src="https://img.shields.io/badge/Nodemon-76D04B.svg?style=flat&logo=Nodemon&logoColor=white" alt="Nodemon">
	<br>
	<img src="https://img.shields.io/badge/PowerShell-5391FE.svg?style=flat&logo=PowerShell&logoColor=white" alt="PowerShell">
	<img src="https://img.shields.io/badge/SymPy-3B5526.svg?style=flat&logo=SymPy&logoColor=white" alt="SymPy">
	<img src="https://img.shields.io/badge/Python-3776AB.svg?style=flat&logo=Python&logoColor=white" alt="Python">
	<img src="https://img.shields.io/badge/Docker-2496ED.svg?style=flat&logo=Docker&logoColor=white" alt="Docker">
	<img src="https://img.shields.io/badge/NumPy-013243.svg?style=flat&logo=NumPy&logoColor=white" alt="NumPy">
	<img src="https://img.shields.io/badge/Numba-00A3E0.svg?style=flat&logo=Numba&logoColor=white" alt="Numba">
	<img src="https://img.shields.io/badge/Express-000000.svg?style=flat&logo=Express&logoColor=white" alt="Express">
	<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON">
</p>
<hr>

## 🔗 Quick Links

> - [📍 Overview](#-overview)
> - [📦 Features](#-features)
> - [📂 Repository Structure](#-repository-structure)
> - [🚀 Getting Started](#-getting-started)
>   - [⚙️ Installation](#️-installation)
>   - [🤖 Running backgone](#-running-backgone)
> - [🤝 Contributing](#-contributing)
> - [📄 License](#-license)
> - [👏 Acknowledgments](#-acknowledgments)

---

## 📍 Overview

<code> BackGone provides a simple and intuitive interface for users to drag and drop or click to upload images. The dockerized application processes the images by removing the background and returns the processed image, which can be downloaded by the user.
</code>

---

## 📦 Features

- **Drag and Drop Upload**: Easily upload images by dragging and dropping them into the designated area.
- **Background Removal**: Uses the `rembg` to remove the background from uploaded images.
- **Download Processed Images**: Download the processed images with the background removed.
- **Responsive Design**: The user interface is built with Tailwind CSS to ensure responsiveness and a modern look.


---

## 📂 Repository Structure

```sh
└── backgone/
    ├── Dockerfile
    ├── backgone_venv/
    ├── bs-config.js
    ├── docker-compose.yml
    ├── nodemon.json
    ├── package-lock.json
    ├── package.json
    ├── postcss.config.js
    ├── process_image.py
    ├── processed/
    ├── public
    │   ├── assets
    │   │   └── logo.svg
    │   └── styles
    │       └── tailwind.css
    ├── requirements.txt
    ├── server.js
    ├── tailwind.config.js
    ├── uploads/
    └── views
        └── index.ejs
```

---

## 🚀 Getting Started

***Requirements***

- **Node.js**: Version 18 or higher
- **Python**: Version 3.11 or higher
- **Docker**: For containerization (optional but recommended)

### ⚙️ Installation

1. Clone the backgone repository:

```sh
git clone https://github.com/0xdany/backgone
```

2. Change to the project directory:

```sh
cd backgone
```

3. Activate virtual environment:

```sh
source backgone_venv/bin/activate
```

4. Install the dependencies:

```sh
npm install
pip install --no-cache-dir -r requirements.txt
```

5. Download `.onnx` model
```
mkdir -p /root/.u2net
curl -L -o /root/.u2net/u2net.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
```

### 🤖 Running backgone

Use the following command to run backgone on `port: 8080`:

```sh
npm run dev
```

### 🐳 Building the image

Use the following command to build the image:

```sh
docker-compose build
```

---


## 🤝 Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Submit Pull Requests](https://github.com/0xdany/backgone/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/0xdany/backgone/discussions)**: Share your insights, provide feedback, or ask questions.
- **[Report Issues](https://github.com/0xdany/backgone/issues)**: Submit bugs found or log feature requests for Backgone.

<details closed>
    <summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your GitHub account.
2. **Clone Locally**: Clone the forked repository to your local machine using a Git client.
   ```sh
   git clone https://github.com/0xdany/backgone
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.

Once your PR is reviewed and approved, it will be merged into the main branch.

</details>

---
