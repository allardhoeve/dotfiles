# Install

## Bash prompt

```bash
ln -s $(pwd)/.bash_prompt ~/.bash_prompt
echo ". ~/.bash_prompt" >> ~/.bashrc
```

## Bash functions

```bash
ln -s $(pwd)/.bash_functions ~/.bash_functions
echo ". ~/.bash_functions" >> ~/.bashrc
```

## Docker fixture

```bash
ln -s $(pwd)/.my.cnf ~/.my.cnf
```

# Change defaults to Chrome

```
xdg-mime default google-chrome.desktop text/html
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https
xdg-mime default google-chrome.desktop x-scheme-handler/about
```

