# TPT - Terminal Presentation Tool

A simple tool for displaying presentations from *.md files (Markdown) on the terminal written in Ruby with much love ❤️

## Requirements

Tested only in Ubuntu 20.04 and derivatives

- Ruby 2.5.1 (may work in previous versions)

> *Machine useted to test*
> OS: Pop!_OS 20.10 x86_64
> Kernel: 5.11.0-7614-generic
> Shell: zsh 5.8
> DE: GNOME 3.38.3
> Terminal: tilix
> CPU: Intel i7-7700 (8) @ 4.200GHz
> GPU: NVIDIA GeForce GTX 1070 8GB
> Memory: 16G DDR4


## Install

```bash
git clone https://github.com/guilhermefeitosa66/tpt.git ~/.tpt/

cd ~/.tpt

bundle install

cp tpt.rb ./tpt

echo "export PATH=$PATH:~/.tpt/" >> ~/.bashrc

# or if you use zshell

echo "export PATH=$PATH:~/.tpt/" >> ~/.zshrc
```

## Setup file

You'll need a *.md (Markdown) file and add at the beginning of the file:

```javascript
{  
  "title": "My Terminal Presentation Tool",
  "author": "Guilherme Feitoza"
}
--tpt-config
.
.
.
// the rest of your md file
```

And add this flah: --new-slide in your *.md file, to split the slides sections

```
.
.
.
--new-slide
.
.
.
```

## Usage

- *tpt <path/to/slide.md>* or
- *tpt <path/to/slide.md> <start slide number>*

Example:

```bash
tpt ~/.tpt/example.md
```

```bash
tpt ~/.tpt/example.md 5
```



## Commands

- Prev slide: **b**
- Next slide: **n**
- Quit:       **q**
