# TPT - Terminal Presentation Tool

A simple tool for displaying presentations on the terminal written in Ruby

## Requeriments

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
