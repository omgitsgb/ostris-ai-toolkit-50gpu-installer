[![Watch the video](https://i9.ytimg.com/vi_webp/bXiaFF5zh60/mqdefault.webp?v=68d59736&sqp=COSy1sYG&rs=AOn4CLBxFhhjRJTsZSJSV50oJL2xOzfxuA)](https://youtu.be/bXiaFF5zh60)



---

## Note

I made this installer because the base instructions were not working on my computer, and I figured I could probably just replace everything. It ended up working, so I decided to share this on GitHub.  
This is a one-button-click installer for anyone with an NVIDIA RTX 50-series GPU.

---

# ai-toolkit-50series-installer

Batch-based installer for ostris/ai-toolkit
 — sets up a Python 3.12 virtual environment, installs PyTorch 2.7.1 with CUDA 12.8, Triton, and all required dependencies.

✅ Optimized for NVIDIA RTX 50-series GPUs
⚙️ Includes installation of Triton, torchao, and other compatible libraries
🧪 Automatically pulls the latest ai-toolkit repo and sets it up in one go
🚀 Creates Start_training.bat automatically so you can start the UI with one click
---

## Requirements

NVIDIA RTX 50-series GPU

Windows (recommended)

Python 3.12 (you must install it before running the .bat file)

Git installed and available in your system PATH

---

## Quick Setup (Recommended)

1. Download and install [Python 3.12 (Windows installer)](https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe)  
   - **Important:** Make sure to check "Add Python to PATH" during installation.

Download or copy the contents of setup_ai_toolkit_50series.bat into the folder where you'd like to install ai-toolkit.

Double-click the .bat file or run it in Command Prompt.

The script automatically:

Clones the ai-toolkit repository

Creates and activates a Python 3.12 virtual environment

Installs PyTorch 2.7.1 + CUDA 12.8, Triton, torchao, and all other dependencies

Creates Start_training.bat inside the folder so you can start the UI easily

Once complete, your environment is ready.

---

## Optional: Manual Setup

For advanced users or troubleshooting, you can install step by step:
```
git clone https://github.com/ostris/ai-toolkit.git
cd ai-toolkit

# Create and activate Python 3.12 virtual environment
py -3.12 -m venv venv
.\venv\Scripts\activate

# Upgrade pip and setuptools
python -m pip install --upgrade pip setuptools==80.9.0 wheel

# Install PyTorch + CUDA 12.8
pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 --index-url https://download.pytorch.org/whl/cu128

# Install all other dependencies
pip install -r requirements.txt


```
Running the UI

Once installed:
```
cd ui
npm run build_and_start
```
Open the provided local or network IP in your browser.

Notes

- The batch file is designed to replace any existing requirements with a version compatible with RTX 50-series GPUs.

- Activate your virtual environment anytime you want to run the toolkit:
```
.\venv\Scripts\activate
```
- If you encounter errors, fix them before launching the UI. Pip commands can be run with the environment active.
References

Original [Ostris AI Toolkit](https://github.com/ostris/ai-toolkit)

✅ One-click, RTX 50-series ready, fully automated installer.


















# Breakdown of the Code 
If you want to do it all manually here is a break down of what we are doing.
# Git Clone the toolkit and go into.
```
git clone https://github.com/ostris/ai-toolkit.git
cd ai-toolkit
```
- We want to get the github and CD into the folder we put it in.
# Make an enviroment from Python 3.12 and activate it
```
py -3.12 -m venv venv

.\venv\Scripts\activate
```
- We want to make sure we are making an enviroment in Python 3.12
- We are activating the enviroment we make.

# Get setuptools, Torch, Torchvision and Cuda
```
python -m pip install --upgrade pip setuptools==80.9.0 wheel

pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 --index-url https://download.pytorch.org/whl/cu128

```
- We are getting the setuptools so we can build wheels and set everything up properly.
- We are getting the proper Torch, Torchvision and Cuda that works on 50+ series.

# Install the Proper requirements for it to work.
We want to delete and make a new requirements since the 50 series and everything so far, needs things that are compatible.

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
 # We are installing from the requirements
```
pip install -r requirements.txt
```
 # We are installing from the requirements
Run the program
In your ai-toolkit, for me its C:\AI\ai-toolkit, we are going to our navigation bar, typing CMD so we are now in the folder in the command prompt. 
it should say.
```
Microsoft Windows [Version 10.0.26100.4061]
(c) Microsoft Corporation. All rights reserved.

C:\AI\ai-toolkit>
```
 # Lastly we are creating a Start_training.bat to make it easier to start the training and a completed message.
```
REM Create Start_training.bat in the same folder
(
echo @echo off
echo call .\venv\Scripts\activate.bat
echo cd ui
echo npm run build_and_start
echo pause
 ) > Start_training.bat

echo.
echo Setup complete! You can now run Start_training.bat to start training.
pause
```


 # IMPORTANT:
If anything is wrong with your setup, at this point before going into the UI and running it, is when you would fix whatever errors you have. At this point you can run Pip commands with the enviroment active.

 # CD into the UI and Run
```
cd ui
npm run build_and_start
```
Or, simply run the automatically created batch file:
```
Start_training.bat
```
This batch file is automatically created by the installer and will:

1. Activate your Python virtual environment (venv)

2. Navigate to the ui folder

3. Run the build/start command (npm run build_and_start)

4. Pause the terminal so you can see any messages

✅ This makes it a true one-click start — no need to manually activate the environment or navigate folders.
If everything works right, it should give you a local IP as well as a Network IP.  Copy and paste into a browser window.

 # Notes

The batch file replaces any existing requirements.txt with a version compatible with RTX 50-series GPUs.

Activate your virtual environment anytime you want to run the toolkit manually:
```
.\venv\Scripts\activate
```
If you encounter errors, fix them before launching the UI. Pip commands can be run with the environment active.

---
 # Hope this helps someone! :) I just wanted to make someones life easier. 
