# Revamped Dotfiles

This isn't really a document for you, unless you're me. I'm writing this mostly to remind myself what this is for and how to use it.

## Personal Motivation

This is a rewrite of the dotfiles I've been using throughout the last few years either on my own computer or when I was working at Facebook.

Those old dotfiles got pretty out of hand and I realized I started having no idea what was going on sometimes because some of my configuration was abstracted away via the likes of `prezto`. Plus, it started making my command line super-slow to load.

I also need way less complexity now in my dotfiles because I also just slimmed down what I need to write code or whatever.

## Basic Setup

```
# clone the repo
cd dotfiles
./install.sh

# install brew
homebrew/brew.sh

# make vim install its plugins
vim +'call minpac#update()'
```

## Vim Setup

```
# I use YouCompleteMe which requires some installation of stuff...
# So let's enable the C++ completer

cd .vim/pack/minpac/start/youcompleteme
python3 install.py --clangd-completer
```

## Dev Setup

My current setup includes some extra dev/container tools like...

* `asdf`
* `podman` - because I didn't want to keep using `docker`, and `podman` has a nicer logo

So to start, add the elixir plugin to `asdf`

```
# add elixir plugin to asdf and install latest elixir version
# note that erlang is needed, and that brew should have been run
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install erlang latest
asdf install elixir latest
```


## Extra Git Setup

1. `.gitconfig` reads from `~/.gitconfig.local` if you need to specify stuff like usernames

2.  Gotta set up `gpg` for commit signing? Remember `gpg --full-generate-key` to generate.
