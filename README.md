# Revamped Dotfiles

This isn't really a document for you, unless you're me. I'm writing this mostly to remind myself what this is for and how to use it.

This is a rebuild of the dotfiles I've been using throughout the last few years either on my own computer or when I was working at Facebook. Those old dotfiles got pretty out of hand and I realized I started having no idea what was going on sometimes because some of my configuration was abstracted away via the likes of `prezto`.

I also need way less complexity now in my dotfiles because I also just slimmed down what I need to write code or whatever.

## Setup

```
# clone the repo
cd dotfiles
./install.sh

# install brew
homebrew/brew.sh
```

## Things to Remember

1. `.gitconfig` reads from `~/.gitconfig.local` if you need to specify stuff like usernames

2.  Gotta set up `gpg` for commit signing? Remember `gpg --full-generate-key` to generate.
