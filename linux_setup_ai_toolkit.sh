#!/bin/bash
# ============================
# AI-Toolkit Installer (Linux, Fully Local)
# Builds Python 3.12.8, installs dependencies, sets up UI
# ============================

set -e  # Exit immediately if any command fails

# ============================
# Variables
# ============================
PYTHON_VERSION="3.12.8"
PYTHON_PREFIX="$HOME/python3128"
AI_TOOLKIT_DIR="$HOME/ai-toolkit"

# ============================
# Install build dependencies
# ============================
sudo apt update
sudo apt install -y build-essential wget libssl-dev zlib1g-dev \
    libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
    libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev \
    tk-dev libffi-dev uuid-dev curl git

# ============================
# Download and build Python 3.12.8
# ============================
mkdir -p "$HOME/src"
cd "$HOME/src"
wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
tar xvf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION
./configure --prefix="$PYTHON_PREFIX" --enable-optimizations --with-ensurepip=install
make -j$(nproc)
make install

# ============================
# Confirm python binary
# ============================
$PYTHON_PREFIX/bin/python3.12 --version

# ============================
# Clone AI Toolkit repo
# ============================
git clone https://github.com/ostris/ai-toolkit.git "$AI_TOOLKIT_DIR"
cd "$AI_TOOLKIT_DIR"

# Remove existing requirements.txt
rm -f requirements.txt

# ============================
# Create requirements.txt
# ============================
cat > requirements.txt <<EOF
torchao==0.10.0
safetensors==0.5.3
git+https://github.com/jaretburkett/easy_dwpose.git
transformers==4.57.3
lycoris-lora==1.8.3
flatten_json==0.1.14
pyyaml==6.0.2
oyaml==1.0
tensorboard==2.19.0
kornia==0.8.1
invisible-watermark==0.2.0
einops==0.8.1
accelerate==1.12.0
toml==0.10.2
albumentations==1.4.15
albucore==0.0.16
pydantic==2.11.5
omegaconf==2.3.0
k-diffusion==0.1.1.post1
open_clip_torch==2.32.0
timm==1.0.15
diffusers
prodigyopt==1.1.2
controlnet_aux==0.0.10
python-dotenv==1.1.0
bitsandbytes==0.46.0
hf_transfer==0.1.9
lpips==0.1.4
pytorch_fid==0.3.0
optimum-quanto==0.2.4
sentencepiece==0.2.0
huggingface_hub
peft==0.18.0
gradio==5.33.1
python-slugify==8.0.4
opencv-python==4.11.0.86
pytorch-wavelets==1.3.0
matplotlib==3.10.1
triton
EOF

# ============================
# Create virtual environment with Python 3.12.8
# ============================
$PYTHON_PREFIX/bin/python3.12 -m venv venv
source venv/bin/activate

# ============================
# Force setuptools <82 so pkg_resources works
# ============================
python -m pip install --upgrade pip
python -m pip install --upgrade --force-reinstall "setuptools<82" wheel

# ============================
# Verify pkg_resources
# ============================
python -c "import pkg_resources; print('pkg_resources works ✅')"

# ============================
# Install FFmpeg dev libraries and PyAV (Linux)
# ============================
sudo apt update
sudo apt install -y ffmpeg libavcodec-dev libavformat-dev libavdevice-dev libavutil-dev
python -m pip install av

# ============================
# Install Python dependencies
# ============================
# Torch with CUDA 12.8
python -m pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 torchaudio==2.7.1+cu128 --index-url https://download.pytorch.org/whl/cu128

# Install rest of requirements
python -m pip install -r requirements.txt

# Upgrade diffusers from GitHub
python -m pip install --upgrade git+https://github.com/huggingface/diffusers.git

# ============================
# Install Node/npm locally via nvm
# ============================
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.6/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 20
nvm use 20

# ============================
# Create UI launch script
# ============================
cat > start_training.sh <<EOL
#!/bin/bash
source venv/bin/activate
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
nvm use 20
cd ui
npm run build_and_start
EOL
chmod +x start_training.sh

# ============================
# Create datasets folder
# ============================
mkdir -p datasets

# ============================
# Final message
# ============================
echo
echo "Python 3.12.8 installed at $PYTHON_PREFIX"
echo "Virtual environment created in $AI_TOOLKIT_DIR/venv"
echo "pkg_resources works ✅ inside the venv"
echo "PyAV installed with FFmpeg ✅"
echo "To start the UI, run:"
echo "./start_training.sh"
echo
