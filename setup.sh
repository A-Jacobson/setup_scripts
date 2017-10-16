# This script is designed to work with ubuntu 16.04 LTS

# ensure system is updated and has basic build tools
sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install build-essential gcc g++ make binutils
sudo apt-get --assume-yes install software-properties-common

# basic utils
sudo apt-get --assume-yes install tmux git tree jq

# download and install GPU drivers
wget "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.44-1_amd64.deb" -O "cuda-repo-ubuntu1604_8.0.44-1_amd64.deb"
sudo dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda
sudo modprobe nvidia
nvidia-smi

# tweak tool
sudo apt-get install unity-tweak-tool

# themes
sudo add-apt-repository ppa:moka/daily
sudo apt-get update
sudo apt-get --assume-yes install moka-icon-theme
sudo apt-get --assume-yes install faba-icon-theme faba-mono-icons

sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get --assume-yes install arc-theme

sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
sudo apt-get --assume-yes install arc-icons

# conda3
wget "https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh" -O "Anaconda3-4.4.0-Linux-x86_64.sh"
bash "Anaconda3-4.4.0-Linux-x86_64.sh" -b
echo "export PATH=\"$HOME/anaconda3/bin:\$PATH\"" >> ~/.bashrc
export PATH="$HOME/anaconda3/bin:$PATH"
conda upgrade -y --all

#jupyter notebook themes
pip install jupyterthemes
conda install -y -c conda-forge jupyter_contrib_nbextensions
pip install autopep8

# fast pillow
pip uninstall pillow
CC="cc -mavx2" pip install -U --force-reinstall pillow-simd