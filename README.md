# Neovim Setup

## Warning:
- This setup is far from being complete.

### Step 1: Create an `~/.config/nvim/` folder

```bash
mkdir -p ~/.config/nvim
```

### Step 2: Copy `init.vim` to `~/.config/nvim/init.vim`

```bash
cp init.vim ~/.config/nvim/init.vim
```

### Step 3: Install vim-plug

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Step 4: Setup LSP

**For Python:**
```bash
npm install -g pyright
```

**For Rust:**
```bash
rustup component add rust-analyzer
```

### Step 5: Setup DAP (Debug Adapter Protocol)
- Follow the instructions here [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- Install codelldb by following instructions here [code-lldb](https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb))

### Step 6: Install lua and luarocks
- You can install lua using `brew install lua`
- You can install `luarocks` from this link [luarocks](https://luarocks.org)
- Install `dkjson` with `luarocks --local install dkjson`
- Make sure to setup lua's environment variables

```bash
export LUA_PATH="$HOME/.luarocks/share/lua/5.4/?.lua;$HOME/.luarocks/share/lua/5.4/?/init.lua;;"
export LUA_CPATH="$HOME/.luarocks/lib/lua/5.4/?.so;;"
```


### List of Stuff
- Basic Color scheme and nerdtree - **DONE**
- LSP Setup for Python, C/C++, and Rust - **DONE**
- Setup Debugger - **TODO**
- Create a Bash Script that automates everything. - **TODO**

