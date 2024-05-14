# Neovim Setup

### Initial Setup

#### Step 1: Create an `~/.config/nvim/` folder

```bash
mkdir -p ~/.config/nvim
```

#### Step 2: Copy `init.vim` to `~/.config/nvim/init.vim`

```bash
cp init.vim ~/.config/nvim/init.vim
```

#### Step 3: Install vim-plug

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Step 4: Setup LSP

**For Python:**
```bash
npm install -g pyright
```

**For Rust:**
```bash
rustup component add rust-analyzer
```


### List of Stuff
- Basic Color scheme and nerdtree - **DONE**
- LSP Setup for Python, C/C++, and Rust - **DONE**
- Setup Debugger - **TODO**

