FILE_URL=https://data.keithito.com/data/speech/LJSpeech-1.1.tar.bz2
FILE_NAME=LJSpeech-1.1.tar.bz2
TARGET_DIRECTORY=DUMMY

all:
	make download extract clean

download:
	wget -c -qqq ${FILE_URL} -O ${FILE_NAME}

extract: ${FILE_NAME}
	mkdir -p extracted ${TARGET_DIRECTORY}
	tar -xf ${FILE_NAME} -C extracted
	mv extracted/*/wavs/*.wav ${TARGET_DIRECTORY}/
	rm -rf extracted

clean:
	rm ${FILE_NAME}

clear:
	rm -rf ${TARGET_DIRECTORY}
