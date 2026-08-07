# Minimal Neovim configuration

## User Guide, Tips and Tricks

### Searching for Files

```
:fin[d] <filename>
```

This command can be tab-completed.

### Searching for text in files

```
:grep <searchterm>
```

### Snippets 

Snippets for certain languages are defined in `./after/ftplugin/`.
A snippet can be expanded in insert mode with `<c-]>`. 
Defined hooks can be navigated with `<tab>`.

As snippets are defined as abbreviations they can be viewed with following
command:

```
:abbrev
```

### Keymaps

These commands may be used to see configured mappings:

```
:map
:verbose map
:map <beginning>
```

### Project Local Settings

If enabled Neovim searches for a local `.nvim.lua` file in the current directory
before opening up.

### Spell Checking

Enable spell checking:

```
:set spell spelllang=<langcode>
```

A misspelled word can be checked with `z=`. 
The commands `]s` and `[s` may be used to navigate to the next or previous 
spelling error.

Other languages than "en" need a spelling file *.spl in `/home/$USER/.local/share/nvim/site/spell`.
These files should be downloaded automatically. This however does not work.
These files can be downloaded from: [Spell File FTP](https://ftp.nluug.nl/vim/runtime/spell)

Currently spell checking is enabled for `*.md` and `*.tex` files for both German
and English.
To only use one of these languages for a file a local configuration file can be
created containing only the desired spell checking language. 

### Folds

To create a toggle:

```
zf{motion}

//create fold for whole function
zfa}
```

To open and close fold:

```
za
```

### Filename Registers

The register `%` contains the current's file name. The register `#` contains
the last opened file name.

Example: pasting current filename to the buffer
```
"%p
```

Example: Full filename to the buffer
```
:let @" = expand("%")
p
```

### Quickfix List

Open a quickfix list: `:copen` or `:cwindow`.
All Telescope searches can be turned into quickfix lists by pressing 'C-q'.
Commmands like `:vimgrep`,`:grep` or`:make` will also result in a quickfix.

### Inserting in Command or Insert Mode

With `CTRL-R{register}` like `CTRL-R 0` the specified register can be inserted 
into the current buffer or command line in command or insert mode.

### Current Working Directory

Print current working directory:

```
:pwd
```

change the current working directory:

```
:cd <directory>
```

change the current working directory to the directory containing the file:

```
:cd %:p:h
```

### UPPER and lower case

In visual mode press `u` to lower case the visual selection and `U` to upper case 
the selection;

### Incrementing Numbers

`CTRL-A` and `CTRL-X` can be used to increment a decrement the number under the 
current cursor.

Following command can be used to create following example:
```
0
0
0
0
0
->
1
2
3
4
5
```

visually select all the lines then `gCTRL-A`.

### execute normal mode commands for selection

`norm[al]` can be used to execute normal mode commands for a specific selection.

Examples:

```
:% norm! @a 
```

Execute macro a on all lines of the current buffer.

```
:'<,'> norm! @a
```

Execute macro a on all lines in the visual selection.

```
:g/pattern/ norm! @a
```

Executre macrr a on all lines matching pattern.

### Reformatting Text to a specified textwidth

When a text is visually selected use:
```
gq
```

## TODO 

Following points should still be improved upon.

- [ ] create command :Ff which basically does command `:find ./**/**<text>`
- [ ] replacing with gc does not highlight the current word to be replaced
- [ ] customize the status line :help 'statusline
- [ ] maybe implement a git integration in some way
- [ ] Terminal handling for various tasks like git and running a program
- [ ] some tex files to not load syntax correctly on first load `:syntax on`re-enables this 
- [ ] show code - hierarchy in status line should be doable with some {{ matching
- [ ] many spelling mistakes notably slows down the editor. Maybe disable
  spellchecking when to many errors occur
- [ ] dealing with merge conflicts 

### C programming

- [ ] ctags (auto create or creation command?)
- [ ] TermDebug package for gdb integration

# Default Colorscheme Ranking 

All themes: 

|theme      |light|dark|
|-----------|-|-|
|blue       | |x|
|catppuccin |x|x|
|darkblue   | |x|
|default    |x|x|
|delek      |x| |
|desert     | |x|
|elflord    | |x|
|evening    | |x|
|habamax    | |x|
|industry   | |x|
|koehler    | |x|
|lunaperche |x|x|
|morning    |x| |
|murphy     | |x|
|pablo      | |x|
|peachpuff  |x| |
|quiet      |x|x|
|retrobox   |x|x|
|ron        | |x|
|shine      |x| |
|slate      | |x|
|sorbet     | |x|
|torte      | |x|
|unokai     | |x|
|vim        |x|x|
|wildcharm  |x|x|
|zaibatsu   | |x|
|zeller     |x| |


## colorscheme light rating 

01. catppuccin
02. wildcharm
03. lunaperche
04. shine
05. zellner
06. delek
07. retrobox
08. peachpuff
09. default
10. morning

- quiet
- vim (does not work with system theme and background)

## colorscheme dark rating

01. retrobox
02. catppuccin
03. wildcharm
04. slate
05. unokai
06. sorbet
07. lunaperche
08. evening
09. desert
10. habamax
11. zaibatsu
12. torte
13. default
14. koehler
15. industry
16. pablo
17. murphy
18. darkblue
19. ron
20. elflord
21. blue

- vim (does not work with system theme and background) 
- quiet (does not do much)
