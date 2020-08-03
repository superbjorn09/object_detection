.PHONY: setup install run run-verbose

# This does only work on apt based systems and has only been tested on raspbian buster

setup:
	# This might include some unnecessary packages..
	echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
	sudo apt update && sudo apt install python3 \
		python3-pip \
		python3-numpy \
		python3-scipy \
		python3-edgetpu \
		libopenjp2-7 \
		libatlas-base-dev \
		libjasper-dev \
		libqtgui4 \
		python3-pyqt5 \
		libqt4-test \
		libilmbase-dev \
		libopenexr-dev \
		libopencv-dev \
		python3-opencv \
		ffmpeg \
		libgstreamer1.0-dev -y

install:
	pip3 install -r requirements.txt

run:
	./personfinder.py

run-verbose:
	./personfinder.py --verbose
