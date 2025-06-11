Got it! Here's your **full README content** properly styled and formatted for GitHub, including the batch code block inside a fenced code block and the step-by-step breakdown nicely formatted — ready to copy-paste and upload:

---

```markdown
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

## 📝 Batch Script (`setup_ai_toolkit_50series.bat`)

```bat
@echo off
REM Clone repo and enter folder
git clone https://github.com/ostris/ai-toolkit.git
cd ai-toolkit

REM Delete existing requirements.txt if it exists
if exist requirements.txt del requirements.txt

REM Create new requirements.txt with the required dependencies
(
echo torchao==0.9.0
echo safetensors==0.5.3
echo git+https://github.com/jaretburkett/easy_dwpose.git
echo git+https://github.com/huggingface/diffusers@363d1ab7e24c5ed6c190abb00df66d9edb74383b
echo transformers==4.52.4
echo lycoris-lora==1.8.3
echo flatten_json==0.1.14
echo pyyaml==6.0.2
echo oyaml==1.0
echo tensorboard==2.19.0
echo kornia==0.8.1
echo invisible-watermark==0.2.0
echo einops==0.8.1
echo accelerate==1.7.0
echo toml==0.10.2
echo albumentations==1.4.15
echo albucore==0.0.16
echo pydantic==2.11.5
echo omegaconf==2.3.0
echo k-diffusion==0.1.1.post1
echo open_clip_torch==2.32.0
echo timm==1.0.15
echo prodigyopt==1.1.2
echo controlnet_aux==0.0.10
echo python-dotenv==1.1.0
echo bitsandbytes==0.46.0
echo hf_transfer==0.1.9
echo lpips==0.1.4
echo pytorch_fid==0.3.0
echo optimum-quanto==0.2.4
echo sentencepiece==0.2.0
echo huggingface_hub==0.32.6
echo peft==0.15.2
echo gradio==5.33.1
echo python-slugify==8.0.4
echo opencv-python==4.11.0.86
echo pytorch-wavelets==1.3.0
echo matplotlib==3.10.1
echo triton-windows==3.3.1.post19
) > requirements.txt

REM Create virtual environment
py -3.12 -m venv venv

REM Activate virtual environment
call .\venv\Scripts\activate

REM Upgrade pip and setuptools, install wheel
python -m pip install --upgrade pip setuptools==80.9.0 wheel

REM Install torch and torchvision from CUDA 12.8 index
pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 --index-url https://download.pytorch.org/whl/cu128

REM Install requirements
pip install -r requirements.txt
```

---

## 🗂 What the script does (Step-by-step breakdown)

1. **Clone the `ai-toolkit` repository:**  
   ```bat
   git clone https://github.com/ostris/ai-toolkit.git
   cd ai-toolkit
   ```  
   Downloads the latest project files and enters the repository folder.

2. **Delete the existing `requirements.txt` if present:**  
   ```bat
   if exist requirements.txt del requirements.txt
   ```  
   Removes any old dependency files to avoid conflicts.

3. **Create a new `requirements.txt` with pinned dependencies:**  
   ```bat
   (
   echo torchao==0.9.0
   echo safetensors==0.5.3
   ...
   echo triton-windows==3.3.1.post19
   ) > requirements.txt
   ```  
   Writes the exact package versions optimized for RTX 50-series GPUs, including Triton.

4. **Create a Python 3.12 virtual environment:**  
   ```bat
   py -3.12 -m venv venv
   ```  
   Sets up an isolated environment so package installs do not affect your system Python.

5. **Activate the virtual environment:**  
   ```bat
   call .\venv\Scripts\activate
   ```  
   Ensures Python commands run inside the virtual environment.

6. **Upgrade pip, setuptools, and install wheel:**  
   ```bat
   python -m pip install --upgrade pip setuptools==80.9.0 wheel
   ```  
   Prepares the package manager for reliable installs.

7. **Install PyTorch and torchvision with CUDA 12.8 support:**  
   ```bat
   pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 --index-url https://download.pytorch.org/whl/cu128
   ```  
   Installs GPU-accelerated deep learning libraries compatible with your hardware.

8. **Install all other required dependencies:**  
   ```bat
   pip install -r requirements.txt
   ```  
   Installs everything else needed by `ai-toolkit` for full functionality.

---

If you need the batch file prepared for download or want me to help with anything else, just ask!
