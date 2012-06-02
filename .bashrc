# rbenv
eval "$(rbenv init -)"

# For Xampp
export PATH=/Applications/xampp/xamppfiles/bin:$PATH
alias xampp='sudo /Applications/XAMPP/xamppfiles/xampp'
alias xamysql="/Applications/XAMPP/xamppfiles/bin/mysql"
alias xamysqldump="/Applications/XAMPP/xamppfiles/bin/mysqldump"
alias xamysqladmin="/Applications/XAMPP/xamppfiles/bin/mysqladmin"

# For CakePHP
alias cake='cake/console/cake'
alias bake='cake bake'
alias cake-cc="find ./app/tmp/cache -type f -name 'cake_*' -exec rm {} \;"
# For 2.0
alias cake2='lib/Cake/Console/cake'
alias bake2='cake2 bake'
# For Git
export EDITOR=emacs

# For Titanium
export ANDROID='~/develop/sdk/android-sdk-macosx/'

# nave
alias nave='~/.nave/nave.sh'

# Google GO
export GOROOT=$HOME/go
export GOARCH=386
export GOOS=darwin
export GOBIN=$HOME/bin
export PATH=$PATH:$GOBIN
