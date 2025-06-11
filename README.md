
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

# Original Install Instructions
The installer has you doing.
```
git clone https://github.com/ostris/ai-toolkit.git
cd ai-toolkit
python -m venv venv
.\venv\Scripts\activate
pip install --no-cache-dir torch==2.6.0 torchvision==0.21.0 --index-url https://download.pytorch.org/whl/cu126
pip install -r requirements.txt
```
- This is from the Ostris-ai-toolkit Install Page

# Git Clone the toolkit and go into.
```
git clone https://github.com/ostris/ai-toolkit.git
cd ai-toolkit
```

# Make an enviroment from Python 3.12 and activate it
```
py -3.12 -m venv venv

.\venv\Scripts\activate
```
# Get the Proper setuptools, Torch, Torchvision and Cuda
```
python -m pip install --upgrade pip setuptools==80.9.0 wheel

pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 --index-url https://download.pytorch.org/whl/cu128

```
# Install the Proper requirements for it to work.

We want to make sure we have setuptools==80.9.0 wheel and then install torch==2.7.1+cu128 torchvision==0.22.1+cu128 --index-url https://download.pytorch.org/whl/cu128

The requirements.txt is still the same one from before if we just run the commands regularly, and overwite some of the stuff we need, so we are tossing out the old one and replacing it with the stuff we need.

```
pip install -r requirements.txt
```
# The Patched Requirments are
```
torchao==0.9.0
safetensors==0.5.3
git+https://github.com/jaretburkett/easy_dwpose.git
git+https://github.com/huggingface/diffusers@363d1ab7e24c5ed6c190abb00df66d9edb74383b
transformers==4.52.4
lycoris-lora==1.8.3
flatten_json==0.1.14
pyyaml==6.0.2
oyaml==1.0
tensorboard==2.19.0
kornia==0.8.1
invisible-watermark==0.2.0
einops==0.8.1
accelerate==1.7.0
toml==0.10.2
albumentations==1.4.15
albucore==0.0.16
pydantic==2.11.5
omegaconf==2.3.0
k-diffusion==0.1.1.post1
open_clip_torch==2.32.0
timm==1.0.15
prodigyopt==1.1.2
controlnet_aux==0.0.10
python-dotenv==1.1.0
bitsandbytes==0.46.0
hf_transfer==0.1.9
lpips==0.1.4
pytorch_fid==0.3.0
optimum-quanto==0.2.4
sentencepiece==0.2.0
huggingface_hub==0.32.6
peft==0.15.2
gradio==5.33.1
python-slugify==8.0.4
opencv-python==4.11.0.86
pytorch-wavelets==1.3.0
matplotlib==3.10.1
triton-windows==3.3.1.post19
```
