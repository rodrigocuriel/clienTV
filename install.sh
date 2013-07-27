if [ -d ~/.clienTV ]
then
  echo "\033[0;33mYou already have clienTV installed.\033[0m I'll update it to the latest version"
  cd ~/.clienTV
  git pull
  cp ~/.clienTV/autoexec.py ~/.xbmc/userdata/
  exit
fi

echo "\033[0;33mYou don't have clienTV installed.\033[0m I'll try to download it"
echo "\033[0;34mCloning clienTV...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/rodrigocuriel/clienTV.git ~/.clienTV || {
  echo "git not installed"
  exit
}

echo "\033[0;34mUsing the clienTV template file and adding it to ~/.xbmc/userdata\033[0m"
cp ~/.clienTV/autoexec.py ~/.xbmc/userdata/

echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
echo "export PATH=\$PATH:$PATH" >> ~/.clienTV

echo "\033[0;34mTime to restart your system!\033[0m"

echo "\033[0;32m"'  _______  ___      ___   _______  __    _  _______  __   __  '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |       ||  |  | ||       ||  | |  | '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |    ___||   |_| ||_     _||  |_|  | '"\033[0m"
echo "\033[0;32m"' |       ||   |    |   | |   |___ |       |  |   |  |       | '"\033[0m"
echo "\033[0;32m"' |      _||   |___ |   | |    ___||  _    |  |   |  |       | '"\033[0m"
echo "\033[0;32m"' |     |_ |       ||   | |   |___ | | |   |  |   |   |     |  '"\033[0m"
echo "\033[0;32m"' |_______||_______||___| |_______||_|  |__|  |___|    |___|   '"\033[0m"