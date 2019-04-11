# Studio
В данном репозитории размещены все файлы необходимые для установки и сборки проекта "Студия".  
Для развертывания Студии необходимо иметь машину с установленной на ней Ubuntu 14.04.  
Для запуска развертывания следует выполнить следующие действия:
1.	Скачать файл Studio_download.sh на компьютер
2.	Открыть терминал
3.	Набрать команду «sudo -i»
4.	Ввести пароль администратора
5.	Перейти в директорию с файлом Studio_download.sh
6.	Набрать команду chmod +x Studio_download.sh
7.	Набрать команду ./Studio_download.sh

Для самостоятельной установки:

1.	Заходим в терминал
2.	Переходим в режим root: sudo -i
3.	Вводим пароль администратора
4.	Создаем директорию Studio: mkdir Studio
5.	Переходим в эту директорию: cd Studio
6.	Обновляем пакеты: sudo apt update
7.	Создаем директорию StudioClone: mkdir StudioClone
8.	Переходим в нее: cd StudioClone
9.	Скачиваем на GitHub файлы в StudioClone: 
Install_Snowmix.sh
MIDIInput.sh
myscene
in_audio
out2
rtsp2feed_alpha
rtsp2feed_wo_alpha
killsnowmix.sh
10.	 Делаем их исполняемыми:
sudo chmod +x Install_Snowmix.sh
sudo chmod +x MIDIInput.sh
sudo chmod +x myscene
sudo chmod +x in_audio
sudo chmod +x out2
sudo chmod +x rtsp2feed_alpha
sudo chmod +x rtsp2feed_wo_alpha
sudo chmod +x killsnowmix.sh
11.	 Копируем файл Install_Snowmix.sh в корневую директорию: sudo cp Install_Snowmix.sh /
12.	 Переходим в корневую директорию: cd /
13.	 Запускаем Install_Snowmix.sh: ./Install_Snowmix.sh
14.	 Переходим в директорию загрузок: cd “$(dirname “$(find / -name “StudioClone”)”)”
15.	 Переходим в StudioClone: cd StudioClone
16.	 Копируем файлы в директорию usr/local/bin: 
sudo cp myscene /usr/local/bin/
sudo cp in_audio /usr/local/bin/
sudo cp out2 /usr/local/bin/
sudo cp rtsp2feed_alpha /usr/local/bin/
sudo cp rtsp2feed_wo_alpha /usr/local/bin/
sudo cp killsnowmix.sh /usr/local/bin/
17.	 Копируем myscene.ini в папку ini в Snowmix-0.5.1: 
sudo cp myscene.ini /usr/local/lib/Snowmix-0.5.1/ini
18.	 Копируем MIDIInput.sh в /usr/local/bin/MIDIInput.sh:
sudo cp MIDIInput.sh /usr/local/bin/MIDIInput.sh
19.	 Устанавливаем элемент x264enc:
cd /tmp/gst-plugins-ugly-1.6.3
sudo apt-get install libx264-dev
sudo ./configure
sudo make
sudo make install
20.	 Выходим из режима root: exit
21.	 Копируем скрипт пульта в автостарт:
cd ~/.config
mkdir autostart
cd "$(dirname "$(find / -name "StudioClone")")"
cd StudioClone
cp midi.desktop ~/.config/autostart/midi.desktop
22.	 Удаляем мусор:
cd "$(dirname "$(find / -name "Studio")")"
sudo rm -R Studio
sudo apt-get remove git
cd /
sudo rm Install_Snowmix.sh

Установка завершена.


Known poroblems

While executing Snowmix ./bootstrap script it check needed packages. Among them - libpng12-dev,
that is deprecated sonce Ubuntu 16.10. In order to successfully build Snowmix you have to 
manually download .dep packages of libpng12-0, zlib1g and libpng12-dev.
https://packages.ubuntu.com/xenial/amd64/libpng12-0/download
https://packages.ubuntu.com/xenial/amd64/libpng12-dev/download
zlib1g is provided from actual Ubuntu repository (as for 18.04LTS).
