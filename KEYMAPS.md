# ⌨️ Keymaps Guide - LazyVim

Tong hop tat ca phim tat trong LazyVim config.

---

## 🎯 Leader Key

| Phim | Mo ta |
|------|-------|
| `Space` | **Leader key** - Phim dan dau cho cac lenh |

> **Luu y**: Nhan `Space` va doi 1 giay de hien thi menu goi y (which-key)

---

## 🚀 Debug Keymaps

### Dieu khien Debug

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `F5` | **Continue / Start** | Bat dau debug hoac chay tiep sau breakpoint |
| `F10` | **Step Over** | Chay qua dong hien tai, khong vao function |
| `F11` | **Step Into** | Nhay vao ben trong function |
| `F12` | **Step Out** | Thoat khoi function hien tai |
| `Shift + F5` | **Stop** | Dung debug hoan toan |
| `Ctrl + F5` | **Restart** | Chay lai tu dau |

### Breakpoint

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space db` | **Toggle Breakpoint** | Bat/tat breakpoint o dong hien tai |
| `Space dB` | **Conditional Breakpoint** | Dat breakpoint co dieu kien (vi du: `i > 10`) |
| `Space dc` | **Clear All Breakpoints** | Xoa tat ca breakpoint trong file/project |

### UI va REPL

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space du` | **Toggle Debug UI** | Mo/dong giao dien debug panel |
| `Space dr` | **Open REPL** | Mo console tuong tac de chay code |
| `Space de` | **Eval Expression** | Tinh gia tri bieu thuc duoc chon |
| `Space dl` | **Run Last** | Chay lai lan debug cuoi cung |
| `Space dt` | **Terminate** | Ket thuc debug session ngay lap tuc |

### Di chuyen trong Debug

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `]]` | **Jump Next** | Nhay den breakpoint tiep theo |
| `[[` | **Jump Previous** | Nhay ve breakpoint truoc do |

---

## 🤖 AI Keymaps (Avante + Kimi)

### Chat va Edit

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space aa` | **AI Ask** | Mo sidebar chat voi Kimi AI |
| `Space ae` | **AI Edit** | Yeu cau AI edit code tai vi tri con tro |
| `v` + `Space ae` | **AI Edit Selection** | Yeu cau AI edit doan code duoc chon |

### Trong AI Sidebar

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Enter` (Normal) | **Submit** | Gui cau hoi/chat |
| `Ctrl + s` (Insert) | **Submit** | Gui cau hoi khi dang nhap |
| `Tab` | **Switch Windows** | Chuyen giua cac panel trong sidebar |
| `Shift + Tab` | **Reverse Switch** | Chuyen nguoc lai |
| `A` | **Apply All** | Ap dung tat ca thay doi cua AI |
| `a` | **Apply Cursor** | Ap dung thay doi tai vi tri con tro |

### Diff (so sanh thay doi)

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `co` | **Ours** | Giu code cua ban |
| `ct` | **Theirs** | Lay code cua AI |
| `ca` | **All Theirs** | Lay tat ca code cua AI |
| `cb` | **Both** | Giu ca hai phien ban |
| `cc` | **Cursor** | Chon tai vi tri con tro |
| `]x` | **Next Diff** | Chuyen den diff tiep theo |
| `[x` | **Previous Diff** | Chuyen ve diff truoc do |

---

## 📁 File Explorer (Neo-tree)

### Mo/Dong

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space e` | **Toggle Explorer** | Mo/dong file explorer sidebar |
| `Space E` | **Explorer Focus** | Focus vao file explorer |

### Trong Explorer

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Enter` | **Open** | Mo file/folder |
| `a` | **Add** | Them file/folder moi |
| `d` | **Delete** | Xoa file/folder |
| `r` | **Rename** | Doi ten file/folder |
| `c` | **Copy** | Copy file/folder |
| `x` | **Cut** | Cut file/folder |
| `p` | **Paste** | Paste file/folder |
| `y` | **Yank** | Copy duong dan |
| `.` | **Toggle Hidden** | Hien/an file an |
| `R` | **Refresh** | Lam moi danh sach |
| `q` | **Close** | Dong explorer |
| `?` | **Help** | Hien thi phim tat |

---

## 🔍 Telescope (Tim kiem)

### Tim kiem File

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space f f` | **Find Files** | Tim file theo ten |
| `Space f F` | **Find Files (cwd)** | Tim file trong thu muc hien tai |
| `Space f r` | **Recent Files** | Mo file gan day |
| `Space f b` | **Buffers** | Tim trong cac buffer dang mo |

### Tim kiem Noi dung

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space f g` | **Grep** | Tim kiem text trong toan bo project |
| `Space f w` | **Grep Word** | Tim tu duoi con tro |
| `Space f /` | **Search History** | Lich su tim kiem |

### Tim kiem khac

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space f h` | **Help Tags** | Tim trong tai lieu tro giup |
| `Space f m` | **Man Pages** | Tim trang huong dan Linux |
| `Space f k` | **Keymaps** | Tim kiem phim tat |
| `Space f c` | **Commands** | Tim kiem lenh |
| `Space f s` | **Colorschemes** | Doi theme |
| `Space f n` | **Notifications** | Lich su thong bao |

### Trong Telescope

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Ctrl + n/p` | **Next/Previous** | Di chuyen len/xuong |
| `Ctrl + j/k` | **Next/Previous** | Di chuyen len/xuong (alt) |
| `Ctrl + v` | **Vertical Split** | Mo file chia doc |
| `Ctrl + x` | **Horizontal Split** | Mo file chia ngang |
| `Ctrl + t` | **Tab** | Mo file trong tab moi |
| `Tab` | **Toggle Selection** | Chon/bo chon + di chuyen xuong |
| `Shift + Tab` | **Toggle Selection Up** | Chon/bo chon + di chuyen len |
| `Esc` | **Close** | Dong Telescope |

---

## 📝 Buffer (File dang mo)

### Chuyen Buffer

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Shift + h` | **Previous Buffer** | Chuyen ve buffer truoc |
| `Shift + l` | **Next Buffer** | Chuyen den buffer tiep |
| `[b` | **Previous Buffer** | Chuyen ve buffer truoc (alt) |
| `]b` | **Next Buffer** | Chuyen den buffer tiep (alt) |
| `Space ,` | **Switch Buffer** | Chon buffer tu danh sach |

### Quan ly Buffer

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space bd` | **Delete Buffer** | Dong buffer hien tai |
| `Space bD` | **Force Delete** | Dong buffer (khong luu) |
| `Space bp` | **Pin Buffer** | Ghim buffer (khong bi xoa) |
| `Space bP` | **Unpin Buffer** | Bo ghim buffer |
| `Space bo` | **Close Others** | Dong tat ca buffer khac |
| `Space br` | **Rename Buffer** | Doi ten buffer |

---

## 🪟 Window (Cua so chia)

### Di chuyen giua Windows

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Ctrl + h` | **Go Left** | Di chuyen sang cua so trai |
| `Ctrl + j` | **Go Down** | Di chuyen xuong cua so duoi |
| `Ctrl + k` | **Go Up** | Di chuyen len cua so tren |
| `Ctrl + l` | **Go Right** | Di chuyen sang cua so phai |

> **Luu y**: Hoat dong ca voi Tmux panes!

### Dieu chinh kich thuoc

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Ctrl + Up` | **Increase Height** | Tang chieu cao cua so |
| `Ctrl + Down` | **Decrease Height** | Giam chieu cao cua so |
| `Ctrl + Left` | **Decrease Width** | Giam chieu rong cua so |
| `Ctrl + Right` | **Increase Width** | Tang chieu rong cua so |

### Tao/Dong Windows

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space w v` | **Split Vertical** | Chia cua so doc |
| `Space w s` | **Split Horizontal** | Chia cua so ngang |
| `Space w d` | **Close Window** | Dong cua so hien tai |
| `Space w o` | **Close Others** | Dong cac cua so khac |
| `Space w m` | **Maximize** | Phong to/Thu nho cua so |
| `Space w =` | **Equalize** | Bang nhau kich thuoc cac cua so |

---

## 📐 Di chuyen va Edit Code

### Di chuyen dong

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Alt + j` | **Move Line Down** | Di chuyen dong xuong |
| `Alt + k` | **Move Line Up** | Di chuyen dong len |
| `v` + `Alt + j/k` | **Move Selection** | Di chuyen doan chon |

### Indent

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Shift + >` (Visual) | **Indent Right** | Thut le phai |
| `Shift + <` (Visual) | **Indent Left** | Thut le trai |
| `>>` (Normal) | **Indent Line** | Thut le dong hien tai |
| `<<` (Normal) | **Unindent Line** | Giam le dong hien tai |

### Comment

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `gcc` | **Toggle Comment Line** | Comment/uncomment dong |
| `gc` (Visual) | **Toggle Comment** | Comment/uncomment doan chon |
| `gco` | **Comment Below** | Them comment xuong dong duoi |
| `gcO` | **Comment Above** | Them comment len dong tren |

---

## 🔧 LSP (Language Server)

### Di chuyen trong code

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `g d` | **Go to Definition** | Nhay den dinh nghia |
| `g D` | **Go to Declaration** | Nhay den khai bao |
| `g r` | **References** | Tim tat ca noi su dung |
| `g i` | **Go to Implementation** | Nhay den implementation |
| `g y` | **Type Definition** | Xem dinh nghia kieu |
| `K` | **Hover** | Hien thi tai lieu (documentation) |
| `Space c d` | **Diagnostics** | Hien thi loi/warning |
| `[d` | **Previous Diagnostic** | Nhay den loi truoc |
| `]d` | **Next Diagnostic** | Nhay den loi tiep |

### Code Actions

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space c a` | **Code Action** | Hien thi cac hanh dong co the thuc hien |
| `Space c r` | **Rename** | Doi ten bien/function/lop |
| `Space c f` | **Format** | Format code |
| `Space c F` | **Format Range** | Format doan chon |
| `Space c o` | **Organize Imports** | Tu dong sap xep imports |
| `Space c R` | **Restart LSP** | Khoi dong lai language server |

### Signature va Completion

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Ctrl + k` (Insert) | **Signature Help** | Hien thi tham so function |
| `Ctrl + Space` | **Trigger Completion** | Bat goi y code |
| `Tab` / `Shift + Tab` | **Navigate** | Di chuyen trong menu goi y |
| `Enter` | **Confirm** | Chon goi y |
| `Ctrl + e` | **Close** | Dong menu goi y |
| `Ctrl + d` | **Scroll Down** | Cuon xuong tai lieu |
| `Ctrl + u` | **Scroll Up** | Cuon len tai lieu |

---

## 🌳 Treesitter (Syntax)

### Di chuyen theo cau truc

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `[m` | **Previous Function** | Nhay den function truoc |
| `]m` | **Next Function** | Nhay den function tiep |
| `[M` | **Previous Class** | Nhay den class truoc |
| `]M` | **Next Class** | Nhay den class tiep |
| `[c` | **Previous Comment** | Nhay den comment truoc |
| `]c` | **Next Comment** | Nhay den comment tiep |

### Chon theo cau truc

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `v i f` | **Select Function Inner** | Chon ben trong function |
| `v a f` | **Select Function Outer** | Chon ca function |
| `v i c` | **Select Class Inner** | Chon ben trong class |
| `v a c` | **Select Class Outer** | Chon ca class |
| `v i p` | **Select Paragraph** | Chon doan van |

---

## 🎨 Git

### Xem thay doi

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space g g` | **LazyGit** | Mo LazyGit (UI day du) |
| `Space g d` | **Diff This** | So sanh voi file goc |
| `Space g D` | **Diff Split** | So sanh chia cua so |
| `Space g h` | **File History** | Xem lich su file |
| `Space g b` | **Blame Line** | Xem ai viet dong nay |

### Hunk (Doan thay doi)

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `]h` | **Next Hunk** | Doan thay doi tiep theo |
| `[h` | **Previous Hunk** | Doan thay doi truoc |
| `Space g s` | **Stage Hunk** | Them vao staging |
| `Space g r` | **Reset Hunk** | Hoan tac thay doi |
| `Space g S` | **Stage Buffer** | Stage toan bo file |
| `Space g R` | **Reset Buffer** | Hoan tac toan bo file |
| `Space g u` | **Undo Stage** | Bo khoi staging |
| `Space g p` | **Preview Hunk** | Xem truoc thay doi |

---

## 🖥️ Terminal

### Mo Terminal

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space t` | **Open Terminal** | Mo terminal ben duoi |
| `Space T` | **Float Terminal** | Mo terminal noi |
| `Ctrl + \` | **Toggle Terminal** | Bat/tat terminal (neu co toggleterm) |

### Trong Terminal Mode

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Esc Esc` | **Normal Mode** | Chuyen ve che do Normal |
| `Ctrl + n` | **Normal Mode** | Chuyen ve che do Normal (alt) |
| `Ctrl + h/j/k/l` | **Navigate** | Di chuyen sang window khac |

---

## 📋 Clipboard va Luu

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Ctrl + s` | **Save** | Luu file |
| `Space w` | **Save** | Luu file (alt) |
| `Space W` | **Save All** | Luu tat ca buffer |
| `Space q` | **Quit** | Thoat |
| `Space Q` | **Force Quit** | Thoat khong luu |
| `Space qq` | **Quit All** | Thoat tat ca |
| `Space fn` | **New File** | Tao file moi |
| `Space fN` | **New File (cwd)** | Tao file trong thu muc hien tai |

---

## 🎭 LuaSnip (Code Snippets)

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Tab` | **Expand/Jump Next** | Mo rong snippet hoac nhay den vi tri tiep |
| `Shift + Tab` | **Jump Previous** | Nhay ve vi tri truoc |
| `Ctrl + l` | **Change Choice** | Doi lua chon trong snippet |

---

## 🆘 Tro giup

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Space h` | **Help** | Mo trang tro giup |
| `Space ?` | **Keymaps** | Tim kiem phim tat |
| `Space :` | **Command History** | Lich su lenh |
| `F1` | **Help** | Tro giup nhanh |

---

## 🎯 Tmux Integration

> Hoat dong khi dung Tmux song song

| Phim | Chuc nang | Mo ta chi tiet |
|------|-----------|----------------|
| `Ctrl + h` | **Left** | Sang pane trai (vim hoac tmux) |
| `Ctrl + j` | **Down** | Xuong pane duoi (vim hoac tmux) |
| `Ctrl + k` | **Up** | Len pane tren (vim hoac tmux) |
| `Ctrl + l` | **Right** | Sang pane phai (vim hoac tmux) |
| `Ctrl + \` | **Previous** | Pane truoc do |

---

## 📝 Cheat Sheet Nhanh

### Cac phim dung nhieu nhat

```
Space e     → File explorer
Space ff    → Tim file
Space fg    → Tim text
Space aa    → Hoi AI
Space db    → Dat breakpoint
F5          → Debug
Space du    → Mo Debug UI
Ctrl+h/j/k/l→ Di chuyen window
Alt+j/k     → Di chuyen dong
```

### Combo thuong dung

```
1. Mo file nhanh:
   Space ff → go ten file → Enter

2. Tim va thay the:
   Space fg → go tu khoa → Ctrl+q → :cdo s/old/new/g

3. Debug nhanh:
   Space db → F5 → F10/F11 → Space du → Space dt

4. Refactor:
   gd → Space ca (code action) → chon rename

5. AI assist:
   Space aa → go cau hoi → Enter → a (apply)
```

---

## 🔧 Custom Keymaps

De them phim tat tuy chinh, sua file `lua/config/keymaps.lua`:

```lua
local map = vim.keymap.set

-- Vi du: Mo file config nhanh
map("n", "<leader>c", "<cmd>e ~/.config/nvim/<cr>", { desc = "Open Config" })

-- Vi du: Chay test
map("n", "<leader>rt", "<cmd>!npm test<cr>", { desc = "Run Tests" })
```

---

## 📚 Tai lieu tham khao

- [LazyVim Keymaps](https://www.lazyvim.org/keymaps)
- [Which Key](https://github.com/folke/which-key.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [Avante.nvim](https://github.com/yetone/avante.nvim)
