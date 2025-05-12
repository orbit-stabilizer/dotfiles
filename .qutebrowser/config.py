c.content.user_stylesheets = ['~/.qutebrowser/styles/youtube-tweaks.css']
c.window.hide_decoration = True


config.bind('J', 'tab-prev', mode='normal')
config.bind('K', 'tab-next', mode='normal')

config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')

config.load_autoconfig(False)

