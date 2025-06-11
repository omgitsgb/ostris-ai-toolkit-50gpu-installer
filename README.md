# ai-toolkit-50series-installer

**Batch-based installer for [`ostris/ai-toolkit`](https://github.com/ostris/ai-toolkit)** — sets up a Python 3.12 virtual environment, installs PyTorch 2.7.1 with CUDA 12.8, Triton, and all required dependencies.

✅ Optimized for NVIDIA **RTX 50-series GPUs**  
⚙️ Includes installation of **Triton**, **torchao**, and other compatible libraries  
🧪 Automatically pulls the latest `ai-toolkit` repo and sets it up in one go

---

## 🔧 Requirements

- NVIDIA RTX 50-series GPU  
- Windows (recommended)  
- Python 3.12 (you **must** install it **before** running the `.bat` file)  
- Git installed and available in your system `PATH`

---

## 🚀 Quick Setup

1. Download and install [Python 3.12 (Windows installer)](https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe)  
   - **Important:** Make sure to check **"Add Python to PATH"** during installation.

2. Download or copy the contents of [`setup_ai_toolkit_50series.bat`](setup_ai_toolkit_50series.bat) into the folder where you'd like to install `ai-toolkit`.

3. Run the `.bat` file by **double-clicking it** or executing it in a Command Prompt.

---

## 🗂 What the script does

The script will:

1. Clone the latest `ai-toolkit` repository from GitHub  
2. Delete the existing `requirements.txt` (if any) and create a new one with pinned dependencies  
3. Create and activate a Python 3.12 virtual environment (`venv`)  
4. Upgrade `pip`, install `setuptools` and `wheel`  
5. Install PyTorch 2.7.1 + CUDA 12.8 and all other required packages from the custom `requirements.txt`  
6. Prepare the environment to run ComfyUI workflows optimized for RTX 50-series GPUs

---

## 📦 Installed dependencies

- `torch==2.7.1+cu128` (PyTorch with CUDA 12.8)  
- `torchvision==0.22.1+cu128`  
- `torchao==0.9.0`  
- `triton-windows==3.3.1.post19`  
- `transformers==4.52.4`  
- `diffusers` (pinned commit)  
- `lycoris-lora==1.8.3`  
- `huggingface_hub==0.32.6`  
- `controlnet_aux==0.0.10`  
- and many others tailored for 50-series hardware

*For the full list, see the generated `requirements.txt`.*

---

## 📖 Additional Notes

- This installer assumes you have **Git** installed and accessible via the command line.  
- The `.bat` file is designed for Windows. For other OSes, you will need to adapt the script accordingly.  
- Python **must** be installed beforehand (version 3.12 recommended). You can download it [here](https://www.python.org/downloads/release/python-3123/).

---

## 🔗 Links

- [Python 3.12 Windows installer](https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe)  
- [ostris/ai-toolkit GitHub repository](https://github.com/ostris/ai-toolkit)  

---

Feel free to open issues or submit pull requests for improvements!
