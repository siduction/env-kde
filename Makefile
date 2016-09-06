#!/usr/bin/make -f

include ./VERSION
THEME= $(NAME)

all: prepare Preview background animation

prepare: clean
	$(RM) -r ./build

	mkdir -p ./build/1920x1200
	mkdir -p ./build/1600x1200
	mkdir -p ./build/1280x1024
	mkdir -p ./build/1024x768

	cp ./theme/Theme.rc ./build/
	cp ./theme/description.txt ./build/1920x1200
	cp ./theme/description.txt ./build/1600x1200
	cp ./theme/description.txt ./build/1280x1024
	cp ./theme/description.txt ./build/1024x768

Preview:
	inkscape --without-gui --export-width=300 --export-height=225 \
	    --export-png="./build/$@.png" ./svg/1024x768.svg
background:
	inkscape --without-gui --export-width=1024 --export-height=768 \
	    --export-png="./build/1024x768/$@.png" ./svg/1024x768.svg
	inkscape --without-gui --export-width=1280 --export-height=1024 \
	    --export-png="./build/1280x1024/$@.png" ./svg/1280x1024.svg
	inkscape --without-gui --export-width=1600 --export-height=1200 \
	    --export-png="./build/1600x1200/$@.png" ./svg/1600x1200.svg
	inkscape --without-gui \
	    --export-png="./build/1920x1200/$@.png" ./svg/1920x1200.svg

animation:
#	inkscape --without-gui \
#	     --export-png="./build/1920x1200/0.png" ./svg/0.svg
	inkscape --without-gui \
	    --export-png="./build/1920x1200/1.png" ./svg/1.svg
	inkscape --without-gui \
	    --export-png="./build/1920x1200/2.png" ./svg/2.svg
	inkscape --without-gui \
	    --export-png="./build/1920x1200/3.png" ./svg/3.svg
	inkscape --without-gui \
	    --export-png="./build/1920x1200/4.png" ./svg/4.svg

	ln -s ./build/1920x1200/1.png ./build/1600x1200/1.png
	ln -s ./build/1920x1200/1.png ./build/1280x1024/1.png
	ln -s ./build/1920x1200/1.png ./build/1024x768/1.png

	ln -s ./build/1920x1200/2.png ./build/1600x1200/2.png
	ln -s ./build/1920x1200/2.png ./build/1280x1024/2.png
	ln -s ./build/1920x1200/2.png ./build/1024x768/2.png

	ln -s  ./build/1920x1200/3.png ./build/1600x1200/3.png
	ln -s  ./build/1920x1200/3.png ./build/1280x1024/3.png
	ln -s  ./build/1920x1200/3.png ./build/1024x768/3.png

	ln -s  ./build/1920x1200/4.png ./build/1600x1200/4.png
	ln -s  ./build/1920x1200/4.png ./build/1280x1024/4.png
	ln -s  ./build/1920x1200/4.png ./build/1024x768/4.png

clean:
	$(RM) -r ./build
