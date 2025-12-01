@echo off
REM ============================
REM AI-Toolkit Installer (Final)
REM ============================

REM Clone repo and enter folder
git clone https://github.com/ostris/ai-toolkit.git
cd ai-toolkit

REM Delete existing requirements.txt if it exists
if exist requirements.txt del requirements.txt

REM Create new requirements.txt with required versions
(
echo torchao==0.10.0
echo safetensors==0.5.3
echo git+https://github.com/jaretburkett/easy_dwpose.git
echo transformers==4.57.3
echo lycoris-lora==1.8.3
echo flatten_json==0.1.14
echo pyyaml==6.0.2
echo oyaml==1.0
echo tensorboard==2.19.0
echo kornia==0.8.1
echo invisible-watermark==0.2.0
echo einops==0.8.1
echo accelerate==1.12.0
echo toml==0.10.2
echo albumentations==1.4.15
echo albucore==0.0.16
echo pydantic==2.11.5
echo omegaconf==2.3.0
echo k-diffusion==0.1.1.post1
echo open_clip_torch==2.32.0
echo timm==1.0.15
echo diffusers
echo prodigyopt==1.1.2
echo controlnet_aux==0.0.10
echo python-dotenv==1.1.0
echo bitsandbytes==0.46.0
echo hf_transfer==0.1.9
echo lpips==0.1.4
echo pytorch_fid==0.3.0
echo optimum-quanto==0.2.4
echo sentencepiece==0.2.0
echo huggingface_hub
echo peft==0.18.0
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

REM Install torch, torchvision, torchaudio with CUDA 12.8 support
pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 torchaudio==2.7.1+cu128 --index-url https://download.pytorch.org/whl/cu128

REM Install requirements from requirements.txt
pip install -r requirements.txt

REM Upgrade diffusers from GitHub to latest dev (optional but recommended)
pip install --upgrade git+https://github.com/huggingface/diffusers.git

REM Create UI launch script
(
echo @echo off
echo call .\venv\Scripts\activate.bat
echo cd ui
echo npm run build_and_start
echo pause
) > Start_training.bat

REM Create datasets folder
if not exist datasets mkdir datasets

REM Final message
echo.
echo Thank you for using my installer! I hope it helped.
echo Please feel free to follow me on Instagram: omgitsgb, YouTube, and LinkedIn:
echo https://www.linkedin.com/in/giancarlo-bellino-02a2292a5/
echo.
pause
