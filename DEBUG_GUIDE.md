# 🐛 Debug Guide - LazyVim

Huong dan chi tiet debug Node.js, React, Python trong LazyVim voi nvim-dap.

---

## 📋 Yeu cau

### Da co san trong config

- `nvim-dap` - Debug core
- `nvim-dap-ui` - Debug UI
- `nvim-dap-virtual-text` - Hien thi gia tri bien inline
- `nvim-dap-vscode-js` - Node.js/React debug adapter
- `nvim-dap-python` - Python debug adapter

### Can cai them

```bash
# Node.js - tu dong qua Mason
# Trong nvim chay :Mason, tim "js-debug-adapter", nhan `i`

# Python - qua uv
uv pip install --python ~/.local/share/nvim-python/bin/python debugpy

# Hoac pip thong thuong
pip install debugpy
```

---

## ⌨️ Keymaps Debug

### Dieu khien Debug co ban

| Phim | Chuc nang | Mo ta |
|------|-----------|-------|
| `F5` | **Continue / Start** | Bat dau debug hoac chay tiep sau breakpoint |
| `F10` | **Step Over** | Chay qua dong hien tai (khong vao function) |
| `F11` | **Step Into** | Nhay vao trong function |
| `F12` | **Step Out** | Thoat khoi function hien tai |
| `Shift + F5` | **Stop** | Dung debug hoan toan |
| `Ctrl + F5` | **Restart** | Chay lai tu dau |

### Breakpoint

| Phim | Chuc nang | Mo ta |
|------|-----------|-------|
| `Space db` | **Toggle Breakpoint** | Bat/tat breakpoint o dong hien tai |
| `Space dB` | **Conditional Breakpoint** | Dat breakpoint co dieu kien |
| `Space dc` | **Clear All Breakpoints** | Xoa tat ca breakpoint |

### UI & REPL

| Phim | Chuc nang | Mo ta |
|------|-----------|-------|
| `Space du` | **Toggle Debug UI** | Mo/dong giao dien debug |
| `Space dr` | **Open REPL** | Mo console tuong tac |
| `Space de` | **Eval Expression** | Tinh gia tri bieu thuc duoc chon |
| `Space dl` | **Run Last** | Chay lai lan debug cuoi |
| `Space dt` | **Terminate** | Ket thuc debug session |

### Di chuyen khi dang debug

| Phim | Chuc nang | Mo ta |
|------|-----------|-------|
| `]]` | **Jump to Next** | Nhay den breakpoint tiep theo |
| `[[` | **Jump to Previous** | Nhay ve breakpoint truoc do |

---

## 🟢 Debug Node.js

### 1. Cac cau hinh co san

| Ten | Muc dich | Command khoi dong |
|-----|----------|-------------------|
| `Launch file` | Chay file JS/TS hien tai | `node file.js` |
| `Attach` | Gan vao process dang chay | `node --inspect` |
| `Debug Jest Tests` | Debug test Jest | `jest --runInBand` |
| `Launch Chrome` | Debug React tren Chrome | Chrome DevTools |

### 2. Debug file JavaScript don gian

**File:** `calculator.js`

```javascript
function add(a, b) {
    const result = a + b;      // ← Dat breakpoint o day
    console.log(`Sum: ${result}`);
    return result;
}

function multiply(a, b) {
    return a * b;              // ← Hoac o day
}

const x = 10;
const y = 20;
const sum = add(x, y);
const product = multiply(x, y);
console.log({ sum, product });
```

**Cac buoc:**

```vim
1. Mo file: nvim calculator.js

2. Dat breakpoint:
   - Di chuyen den dong `const result = a + b;`
   - Nhan: Space db
   - Se thay dau ● mau do ben trai

3. Bat dau debug:
   - Nhan: F5
   - Chon: "Launch file" (dung phim mui ten + Enter)

4. Dieu khien:
   - F10: Chay qua dong hien tai
   - F11: Vao trong function add()
   - F12: Thoat khoi function
   - F5: Chay tiep den breakpoint ke

5. Xem bien:
   - Space du (mo Debug UI)
   - Panel "Scopes" ben trai hien thi a=10, b=20, result=30

6. Dung debug:
   - Shift + F5 hoac Space dt
```

### 3. Debug React App

**Cau hinh:** `Launch Chrome` - Debug tren trinh duyet

```vim
1. Chay dev server (trong terminal rieng):
   npm run dev

2. Mo file component trong nvim:
   nvim src/components/Counter.tsx

3. Dat breakpoint trong ham xu ly su kien:
   const handleClick = () => {
       setCount(count + 1);     // ← Space db
   };

4. Bat dau debug:
   - F5
   - Chon: "Launch Chrome"
   - Chrome se mo tai http://localhost:3000

5. Tuong tac voi app trong Chrome:
   - Click nut "Increment"
   - Code dung tai breakpoint trong nvim

6. Xem state:
   - Space du
   - Panel Scopes: count = 0 → 1 → 2
```

### 4. Debug Jest Tests

**File:** `sum.test.js`

```javascript
function sum(a, b) {
    return a + b;
}

describe('sum', () => {
    test('adds 1 + 2 to equal 3', () => {
        expect(sum(1, 2)).toBe(3);     // ← Space db
    });

    test('adds -1 + 1 to equal 0', () => {
        expect(sum(-1, 1)).toBe(0);    // ← Space db
    });
});
```

```vim
1. Mo file test: nvim sum.test.js

2. Dat breakpoint o dong expect

3. Chay debug:
   - F5
   - Chon: "Debug Jest Tests"
   - Jest se chay test voi breakpoint

4. Xem ket qua:
   - Panel Scopes: a=1, b=2
   - REPL (Space dr): > sum(1,2) → 3
```

### 5. Attach vao process dang chay

**Terminal 1 - Chay app voi inspect:**

```bash
# Cach 1: Dung ngay tu dau
cd my-project
node --inspect-brk server.js
# Debugger listening on ws://127.0.0.1:9229

# Cach 2: Chay binh thuong, co the attach sau
node --inspect server.js
```

**Terminal 2 - Trong nvim:**

```vim
1. Mo file server.js: nvim server.js

2. Dat breakpoint o route handler:
   app.get('/api/users', (req, res) => {
       const users = db.getUsers();     // ← Space db
       res.json(users);
   });

3. Attach:
   - F5
   - Chon: "Attach"
   - Chon process "node --inspect server.js" tu danh sach

4. Goi API (trong terminal thu 3):
   curl http://localhost:3000/api/users

5. Code dung tai breakpoint, xem req, res trong Scopes
```

---

## 🔵 Debug Python

### 1. Cac cau hinh co san

| Ten | Muc dich | Su dung |
|-----|----------|---------|
| `Launch file` | Chay file Python hien tai | Script don le |
| `Django` | Chay Django dev server | Django projects |
| `FastAPI` | Chay FastAPI voi uvicorn | FastAPI projects |
| `Attach remote` | Gan vao remote debugger | Docker, remote server |

### 2. Debug file Python don gian

**File:** `data_processor.py`

```python
def process_data(items):
    results = []
    for item in items:
        processed = item * 2           # ← Space db
        results.append(processed)
    return results

def main():
    data = [1, 2, 3, 4, 5]
    output = process_data(data)        # ← Space db
    print(f"Result: {output}")

if __name__ == "__main__":
    main()
```

```vim
1. Mo file: nvim data_processor.py

2. Dat breakpoint:
   - Dong `processed = item * 2`
   - Space db

3. Bat dau debug:
   - F5
   - Chon: "Launch file"

4. Dieu khien:
   - F10: Chay qua vong lap
   - F11: Vao trong process_data()
   - Xem bien: item=1, processed=2
   - Tiep tuc F5, item=2, processed=4

5. Xem danh sach trong REPL:
   Space dr
   > results
   [2, 4]
   > len(items)
   5
```

### 3. Debug voi Virtual Environment

```bash
# Tao venv
uv venv .venv
source .venv/bin/activate

# Cai dependencies
uv pip install requests flask
```

```vim
# Trong nvim, debug tu dong detect venv
# Python path se lay tu bien moi truong VIRTUAL_ENV

1. Mo file: nvim app.py

2. Dat breakpoint

3. F5 → Chon "Launch file"
# Dap se dung python tu .venv/bin/python
```

### 4. Debug Django Project

**Cau truc project:**

```
myproject/
├── manage.py
├── myproject/
│   ├── settings.py
│   └── urls.py
└── myapp/
    ├── views.py          ← File dat breakpoint
    └── models.py
```

**File:** `myapp/views.py`

```python
from django.http import JsonResponse
from .models import User

def user_list(request):
    users = User.objects.all()         # ← Space db
    data = [{"id": u.id, "name": u.name} for u in users]
    return JsonResponse({"users": data})
```

```vim
1. Mo project trong nvim:
   cd myproject
   nvim myapp/views.py

2. Dat breakpoint o dong query

3. Bat dau debug:
   - F5
   - Chon: "Django"
   - Server chay o http://localhost:8000

4. Goi API:
   curl http://localhost:8000/api/users/
   # Hoac mo trinh duyet

5. Xem trong Debug UI:
   - users: QuerySet [<User: Alice>, <User: Bob>]
   - request: WSGIRequest
```

### 5. Debug FastAPI

**File:** `main.py`

```python
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Item(BaseModel):
    name: str
    price: float

@app.get("/")
def read_root():
    return {"Hello": "World"}          # ← Space db

@app.post("/items/")
def create_item(item: Item):
    total = item.price * 1.1           # ← Space db (tinh thue)
    return {"item": item, "total": total}
```

```vim
1. Mo file: nvim main.py

2. Dat breakpoint o ca 2 route

3. Chay debug:
   - F5
   - Chon: "FastAPI"
   - Uvicorn chay voi --reload

4. Test API:
   # GET request
   curl http://localhost:8000/

   # POST request
   curl -X POST http://localhost:8000/items/ \
     -H "Content-Type: application/json" \
     -d '{"name":"Laptop","price":1000}'

5. Xem trong Scopes:
   - item: Item(name='Laptop', price=1000.0)
   - total: 1100.0
```

### 6. Remote Attach Debug

**Trong code Python (them vao de cho attach):**

```python
import debugpy

# Bat dau listen
debugpy.listen(("0.0.0.0", 5678))
print("Waiting for debugger attach...")
debugpy.wait_for_client()  # Dung cho den khi attach

# Code chinh
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    name = "World"                     # ← Se dung o day sau khi attach
    return f"Hello, {name}!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

**Chay app:**

```bash
python app.py
# Output: Waiting for debugger attach...
```

**Trong nvim - Attach:**

```vim
1. Mo file: nvim app.py

2. Dat breakpoint:
   - Dong `name = "World"`
   - Space db

3. Attach:
   - F5
   - Chon: "Attach remote"
   - Tu dong ket noi localhost:5678

4. Truy cap http://localhost:5000/
   - Code dung tai breakpoint
   - Co the debug tu xa (Docker, server)
```

---

## 🖥️ Giao dien Debug UI

### Layout

```
┌─────────────────────────────────────────┐
│  Scopes    │  1  function add(a, b)     │
│  ▼ locals  │  2    const result = a + b;│ ← Breakpoint (●)
│    a = 10  │  3 →  console.log(...);    │ ← Dong hien tai (→)
│    b = 20  │  4    return result;       │
│    result  │  5  }                      │
│  ▼ globals │  6                         │
│            │  7  function multiply(...) │
├────────────┤                            │
│  Watch     ├────────────────────────────┤
│  □ result  │  Console / REPL            │
│  □ a + b   │  > result                  │
├────────────┤  30                        │
│  Call Stack├────────────────────────────┤
│  > add()   │  Breakpoints               │
│    main()  │  ● calculator.js:2         │
│            │  ○ calculator.js:7         │
└────────────┴────────────────────────────┘
```

### Cac panel

| Panel | Chuc nang |
|-------|-----------|
| **Scopes** | Xem bien local, global, argument |
| **Watch** | Theo doi gia tri bieu thuc tuy chon |
| **Call Stack** | Xem chuoi ham goi (stack trace) |
| **Breakpoints** | Liet ke tat ca breakpoint |
| **REPL** | Console tuong tac, chay code |
| **Console** | Output tu chuong trinh |

---

## 🔍 Conditional Breakpoint

### Dat breakpoint co dieu kien

```vim
1. Di chuyen den dong muon dat

2. Nhan: Space dB
   (Chu B hoa = Conditional)

3. Nhap dieu kien:
   i > 10
   # hoac
   user != null && user.active
   # hoac
   error.message.includes("timeout")
   # hoac
   data.length === 0

4. Breakpoint chi dung khi dieu kien dung
   Hien thi dau ◆ thay vi ●
```

### Vi du thuc te

```javascript
// Chi dung khi gap loi
for (let i = 0; i < items.length; i++) {
    const result = process(items[i]);
    if (result.error) {              // ← Space dB, dieu kien: result.error
        console.error(result.error);
    }
}
```

```python
# Chi dung voi user VIP
for user in users:
    if user.is_vip:                  # ← Space dB, dieu kien: user.is_vip
        send_notification(user)
```

---

## 💡 Eval Expression

### Tinh gia tri bieu thuc

```vim
1. Chon bieu thuc trong Visual mode:
   - vi" (chon trong dau ngoac kep)
   - hoac V (chon ca dong)

2. Nhan: Space de

3. Ket qua hien thi trong popup
```

### Trong REPL

```vim
Space dr  # Mo REPL

# JavaScript/Node.js
> typeof myVar
"object"
> JSON.stringify(data)
'{"id":1,"name":"Alice"}'
> Date.now()
1714123456789

# Python
> type(my_list)
<class 'list'>
> len(my_dict)
5
> my_dict.keys()
dict_keys(['a', 'b', 'c'])
```

---

## 🐛 Xy ly loi thuong gap

### 1. "Debug adapter not found"

**Nguyen nhan:** Chua cai debug adapter

**Khac phuc:**

```vim
:Mason
# Tim va cai:
# - js-debug-adapter (cho Node.js)
# - debugpy (cho Python, qua uv/pip)
```

### 2. "Cannot launch program path"

**Nguyen nhan:** Duong dan file khong dung

**Khac phuc:**

```vim
# Dam bao mo file tu dung thu muc
:cd /path/to/project
:pwd  # Kiem tra

# Hoac sua cwd trong config
```

### 3. "Connection refused" (Attach)

**Nguyen nhan:** Process khong chay hoac port bi chiem

**Khac phuc:**

```bash
# Kiem tra process
ps aux | grep node

# Kiem tra port
lsof -i :9229  # Node inspect
lsof -i :5678  # Python debugpy

# Doi port trong code
node --inspect=9230 server.js
debugpy.listen(("0.0.0.0", 5679))
```

### 4. Breakpoint khong dung

**Nguyen nhan:**
- Source map khong dung (React/TypeScript)
- File chua duoc save
- Dang chay version cu

**Khac phuc:**

```vim
# Luu file truoc
:w

# Kiem tra source map trong tsconfig.json
{
  "compilerOptions": {
    "sourceMap": true
  }
}

# Restart debug
Ctrl + F5
```

### 5. Python khong tim thay module

**Nguyen nhan:** Chua active virtual environment

**Khac phuc:**

```bash
# Active venv truoc khi mo nvim
source .venv/bin/activate
nvim app.py

# Hoac sua pythonPath trong config
```

---

## 📝 Them cau hinh debug tuy chinh

### Them vao `lua/plugins/dap.lua`

**Node.js voi arguments:**

```lua
{
    type = "pwa-node",
    request = "launch",
    name = "Launch with args",
    program = "${file}",
    args = { "--port", "3000", "--env", "development" },
    cwd = "${workspaceFolder}",
    env = {
        NODE_ENV = "development",
        API_KEY = "your-api-key",
    },
}
```

**Python voi input:**

```lua
{
    type = "python",
    request = "launch",
    name = "Python with input",
    program = "${file}",
    console = "integratedTerminal",  -- Cho phep nhap input
}
```

**Docker Remote:**

```lua
{
    type = "python",
    request = "attach",
    name = "Attach Docker",
    connect = {
        host = "localhost",
        port = 5678,
    },
    pathMappings = {
        {
            localRoot = "${workspaceFolder}",
            remoteRoot = "/app",
        },
    },
}
```

---

## 🎯 Luu y quan trong

1. **Luon luu file truoc khi debug** (`:w` hoac `Ctrl+s`)
2. **Dat breakpoint truoc khi chay** (Space db)
3. **Dung Debug UI de xem bien** (Space du)
4. **Dung REPL de test code** (Space dr)
5. **Restart sau khi sua code** (Ctrl+F5)

---

## 📚 Tai lieu tham khao

- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js)
- [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- [Node.js Debugging](https://nodejs.org/en/docs/guides/debugging-getting-started/)
- [Python debugpy](https://github.com/microsoft/debugpy)
