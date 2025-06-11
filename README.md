
---

## Note

I made this installer because the base instructions were not working on my computer, and I figured I could probably just replace everything. It ended up working, so I decided to share this on GitHub.  
This is a one-button-click installer for anyone with an NVIDIA RTX 50-series GPU.

---

# ai-toolkit-50series-installer

Batch-based installer for [`ostris/ai-toolkit`](https://github.com/ostris/ai-toolkit) — sets up a Python 3.12 virtual environment, installs PyTorch 2.7.1 with CUDA 12.8, Triton, and all required dependencies.

✅ Optimized for NVIDIA **RTX 50-series GPUs**  
⚙️ Includes installation of **Triton**, **torchao**, and other compatible libraries  
🧪 Automatically pulls the latest `ai-toolkit` repo and sets it up in one go

---

## Requirements

- NVIDIA RTX 50-series GPU  
- Windows (recommended)  
- Python 3.12 (you **must** install it **before** running the `.bat` file)  
- Git installed and available in your system `PATH`

---

## Quick Setup

1. Download and install [Python 3.12 (Windows installer)](https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe)  
   - **Important:** Make sure to check **"Add Python to PATH"** during installation.

2. Download or copy the contents of `setup_ai_toolkit_50series.bat` into the folder where you'd like to install `ai-toolkit`.

3. Run the `.bat` file by **double-clicking it** or executing it in a Command Prompt.

---

## Batch File Code (`setup_ai_toolkit_50series.bat`)

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
1. **Clone the `ai-toolkit` repository and enter its directory:**  
   Downloads the latest project files from GitHub.

2. **Delete any existing `requirements.txt` file:**  
   Removes old dependency listings to avoid conflicts.

3. **Create a new `requirements.txt` file:**  
   Writes a pinned list of dependencies optimized for RTX 50-series GPUs including Triton and torchao.

4. **Create a Python 3.12 virtual environment:**  
   Sets up an isolated environment inside the folder called `venv`.

5. **Activate the virtual environment:**  
   Makes sure all Python commands run inside the venv.

6. **Upgrade pip, setuptools, and install wheel:**  
   Ensures the package manager and build tools are up to date.

7. **Install PyTorch and torchvision with CUDA 12.8 support:**  
   Installs GPU-accelerated deep learning frameworks.

8. **Install all other dependencies listed in `requirements.txt`:**  
   Installs all packages needed by `ai-toolkit`.

breakdown:
  - command: git clone https://github.com/ostris/ai-toolkit.git
    description: >
      Clones the official ai-toolkit repository from GitHub. This pulls the latest
      source code and project files into your local machine.

  - command: cd ai-toolkit
    description: >
      Changes the current directory to the newly cloned ai-toolkit folder where
      the project files are located.

  - command: py -3.12 -m venv venv
    description: >
      Creates a new Python 3.12 virtual environment named 'venv' inside the project folder.
      This isolated environment ensures dependencies won't conflict with other Python
      installations on your system.

  - command: .\venv\Scripts\activate
    description: >
      Activates the virtual environment, so all subsequent Python commands run within
      this isolated environment, using its Python interpreter and installed packages.

  - command: python -m pip install --upgrade pip setuptools==80.9.0 wheel
    description: >
      Upgrades the pip installer itself along with setuptools and wheel to specific
      versions for reliable package building and installation.

  - command: pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 --index-url https://download.pytorch.org/whl/cu128
    description: >
      Installs PyTorch 2.7.1 and torchvision 0.22.1 built specifically for CUDA 12.8,
      optimized for NVIDIA RTX 50-series GPUs. The '--no-cache-dir' option avoids
      using any cached files to ensure a fresh install.

  - command: pip install -r requirements.txt
    description: >
      Installs the rest of the dependencies listed in the requirements.txt file.
      These dependencies are pinned and selected specifically to work well with the
      50-series GPUs and include packages like Triton, torchao, and many AI-related
      libraries.

additional_notes: >
  The reason for replacing the default requirements.txt with a custom one is to ensure
  compatibility and optimal performance with the RTX 50-series GPUs and CUDA 12.8.
  The custom requirements file includes:
    - torchao for audio-related AI tasks
    - triton-windows for GPU-accelerated deep learning primitives
    - pinned versions of diffusers, transformers, and other libraries ensuring
      stable and tested versions that work well together
  This avoids common installation issues or incompatibilities that users might face
  with the base ai-toolkit requirements.

