echo "\033[0;32m"'  _______  ___      ___   _______  __    _  _______  __   __  '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |       ||  |  | ||       ||  | |  | '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |    ___||   |_| ||_     _||  |_|  | '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |   |___ |       |  |   |  |       | '"\033[0m"
echo "\033[0;32m"' |      _||   |___ |   | |    ___||  _    |  |   |  |       | '"\033[0m"
echo "\033[0;32m"' |     |_ |       ||   | |   |___ | | |   |  |   |   |     |  '"\033[0m"
echo "\033[0;32m"' |_______||_______||___| |_______||_|  |__|  |___|    |___|   '"\033[0m"

echo "\033[0;33minstalling dependencies\033[0m"

echo "\033[0;33minstalling curl\033[0m"
sudo apt-get install curl

echo "\033[0;33minstalling git\033[0m"
sudo apt-get install git

echo "\033[0;33minstalling wget\033[0m"
sudo apt-get install wget

echo "\033[0;33minstalling emacs\033[0m"
sudo apt-get install emacs

echo "\033[0;33minstalling rsync\033[0m"
sudo apt-get install rsync

if [ ! -d ~/.clienTV ]
then
  echo "\033[0;33mYou don't have clienTV installed.\033[0m I'll try to download it\033[0m"

  echo "\033[0;34mCloning clienTV...\033[0m"
  hash git >/dev/null && /usr/bin/env git clone https://github.com/rodrigocuriel/clienTV.git ~/.clienTV || {
    echo "git not installed"
    exit
  }
fi

if [ ! -d ~/movies ]
then
  echo "\033[0;33mcreating directories\033[0m"
  mkdir ~/movies
  cd ~/movies
  wget -i ~/.clienTV/playlist/playlist001.txt
fi

echo "\033[0;33mDownloading latest version\033[0m"
cd ~/.clienTV
git pull
 
echo "\033[0;33m install new cron file \033[0m"
chmod +x -R ~/.clienTV/cron/
crontab ~/.clienTV/cronjobs

if [ ! -f ~/.xbmc/userdata/autoexec.py ]
then
  echo "\033[0;34mUsing the clienTV template\033[0m"
  ln -s  ~/.clienTV/autoexec.py ~/.xbmc/userdata/autoexec.py
  # cp ~/.clienTV/autoexec.py ~/.xbmc/userdata/
fi

echo "\033[0;34mTime to restart your system, but first let's turn that huge TV off!\033[0m"

echo "\033[0;32m"'  _______  ___      ___   _______  __    _  _______  __   __  '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |       ||  |  | ||       ||  | |  | '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |    ___||   |_| ||_     _||  |_|  | '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |   |___ |       |  |   |  |       | '"\033[0m"
echo "\033[0;32m"' |      _||   |___ |   | |    ___||  _    |  |   |  |       | '"\033[0m"
echo "\033[0;32m"' |     |_ |       ||   | |   |___ | | |   |  |   |   |     |  '"\033[0m"
echo "\033[0;32m"' |_______||_______||___| |_______||_|  |__|  |___|    |___|   '"\033[0m"

echo "\033[0;32m"'  															'"\033[0m"
echo "\033[0;32m"'Install script by @roocuriel'"\033[0m"

~/.clienTV/cron/stopXBMC