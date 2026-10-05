# 🐙 คู่มือการนำโปรเจกต์ขึ้น GitHub (GitHub Setup & Deployment Guide)

คู่มือฉบับสมบูรณ์สำหรับนำ **ระบบจัดทำและพิมพ์เช็ค (Cheque Management & Printing System)** ขึ้นสู่ **GitHub** เพื่อจัดเก็บซอร์สโค้ดอย่างปลอดภัย สำรองข้อมูล และสามารถดึงไปติดตั้งบนเครื่อง Server อื่นๆ หรือเครื่องคอมพิวเตอร์ในหน่วยงานได้สะดวกรวดเร็ว

---

## 📋 สารบัญ (Table of Contents)
1. [สิ่งที่ต้องเตรียมพร้อมก่อนเริ่ม](#1-สิ่งที่ต้องเตรียมพร้อมก่อนเริ่ม-prerequisites)
2. [ขั้นตอนที่ 1: สร้าง Repository ใหม่บน GitHub](#ขั้นตอนที่-1-สร้าง-repository-ใหม่บน-github)
3. [วิธีที่ 1: อัปโหลดผ่าน Git Command Line (แนะนำสำหรับสายคำสั่ง)](#วิธีที่-1-อัปโหลดผ่าน-git-command-line-terminal--cmd)
4. [วิธีที่ 2: อัปโหลดผ่านโปรแกรม GitHub Desktop (แนะนำสำหรับสายคลิก GUI)](#วิธีที่-2-อัปโหลดผ่านโปรแกรม-github-desktop-ง่ายที่สุด)
5. [การจัดการสิทธิ์การเข้าถึง (Personal Access Token / PAT)](#การจัดการสิทธิ์การเข้าถึง-github-personal-access-token-pat)
6. [การอัปเดตโค้ดเมื่อมีการแก้ไขในอนาคต (Daily Git Workflow)](#การอัปเดตโค้ดเมื่อมีการแก้ไขในอนาคต-daily-workflow)
7. [การดึงโค้ดจาก GitHub ไปติดตั้งบนเครื่องจริงในหน่วยงาน (Clone & Deploy)](#การดึงโค้ดจาก-github-ไปติดตั้งบนเครื่องจริงในหน่วยงาน)

---

## 1. สิ่งที่ต้องเตรียมพร้อมก่อนเริ่ม (Prerequisites)

1. **บัญชี GitHub**: หากยังไม่มี สามารถสมัครสมาชิกได้ฟรีที่ 👉 [https://github.com](https://github.com)
2. **โปรแกรม Git**: 
   * ตรวจสอบว่าในเครื่องมี Git หรือไม่ โดยเปิด Terminal / Command Prompt แล้วพิมพ์:
     ```bash
     git --version
     ```
   * หากยังไม่มี ให้ดาวน์โหลดและติดตั้งจาก 👉 [https://git-scm.com](https://git-scm.com) (หรือติดตั้งโปรแกรม **GitHub Desktop** จาก [https://desktop.github.com](https://desktop.github.com))

---

## ขั้นตอนที่ 1: สร้าง Repository ใหม่บน GitHub

1. เข้าสู่ระบบเว็บไซต์ [https://github.com](https://github.com)
2. คลิกปุ่ม **`+`** ที่มุมขวาบน แล้วเลือก **`New repository`** (หรือไปที่ [https://github.com/new](https://github.com/new))
3. กรอกข้อมูลดังนี้:
   * **Repository name**: ตั้งชื่อคลังโค้ด เช่น `cheque-management-system` หรือ `hospital-cheque-app`
   * **Description**: เช่น `ระบบจัดทำและสั่งพิมพ์เช็คมาตรฐานสำหรับฝ่ายการเงิน`
   * **Visibility**: 
     * แนะนำเลือกเป็น **`Private`** (เฉพาะคุณและทีมงานที่อนุญาตเท่านั้นที่เข้าถึงได้ เพื่อความปลอดภัยของข้อมูลการเงิน)
     * หรือเลือก **`Public`** (หากต้องการเปิดเป็นโอเพ่นซอร์สสาธารณะ)
   * ⚠️ **ข้อสำคัญ**: ในส่วน *"Initialize this repository with:"* **ไม่ต้องติ๊กถูก** ช่อง Add a README, .gitignore หรือ license ใดๆ ทั้งสิ้น (เพราะในโปรเจกต์ของเรามีไฟล์เหล่านี้จัดเตรียมไว้ครบถ้วนแล้ว)
4. คลิกปุ่มสีเขียว **`Create repository`**
5. เมื่อสร้างเสร็จ คุณจะได้ URL ของคลังโค้ด เช่น:  
   👉 `https://github.com/<ชื่อผู้ใช้ของคุณ>/cheque-management-system.git`

---

## วิธีที่ 1: อัปโหลดผ่าน Git Command Line (Terminal / CMD)

เปิดโปรแกรม **Terminal** (สำหรับ macOS/Linux) หรือ **Command Prompt / PowerShell / Git Bash** (สำหรับ Windows) แล้วเข้าไปที่โฟลเดอร์โปรเจกต์:

### ขั้นตอนที่ 1.1: เข้าไปที่โฟลเดอร์โปรเจกต์
```bash
# ตัวอย่าง: เข้าไปที่โฟลเดอร์โปรเจกต์ของคุณ
cd /path/to/your/project
# หรือบน Windows เช่น:
cd C:\cheque-system
```

### ขั้นตอนที่ 1.2: ตั้งชื่อและอีเมลผู้ใช้งาน Git (ทำครั้งแรกครั้งเดียว)
```bash
git config --global user.name "ชื่อ-นามสกุลของคุณ"
git config --global user.email "อีเมลที่ใช้สมัคร_github@example.com"
```

### ขั้นตอนที่ 1.3: เริ่มต้น Git ในโปรเจกต์
```bash
git init
```

### ขั้นตอนที่ 1.4: เพิ่มไฟล์ทั้งหมดเข้าสู่ Git Staging
```bash
git add .
```
*(ไฟล์ `.gitignore` จะช่วยคัดแยกโฟลเดอร์ชั่วคราวอย่าง `node_modules/`, `dist/` และไฟล์ระบบออกให้อัตโนมัติ)*

### ขั้นตอนที่ 1.5: บันทึกประวัติเวอร์ชันแรก (Commit)
```bash
git commit -m "feat: เริ่มต้นโปรเจกต์ระบบจัดทำและพิมพ์เช็ค v2.5.0"
```

### ขั้นตอนที่ 1.6: ตั้งชื่อ Branch หลักเป็น `main`
```bash
git branch -M main
```

### ขั้นตอนที่ 1.7: เชื่อมโยงโปรเจกต์ในเครื่องเข้ากับ GitHub Repository
*(เปลี่ยน `<ชื่อผู้ใช้ของคุณ>` และ `<ชื่อ-repo>` เป็นของคุณจริง)*
```bash
git remote add origin https://github.com/<ชื่อผู้ใช้ของคุณ>/cheque-management-system.git
```

### ขั้นตอนที่ 1.8: สั่ง Push โค้ดขึ้นสู่ GitHub
```bash
git push -u origin main
```

> 💡 **หมายเหตุ**: หากระบบถามรหัสผ่าน ให้ดูวิธีสร้าง **Personal Access Token (PAT)** ในหัวข้อถัดไป

---

## วิธีที่ 2: อัปโหลดผ่านโปรแกรม GitHub Desktop (ง่ายที่สุด)

หากไม่ถนัดการใช้คำสั่ง Terminal สามารถทำผ่านหน้าต่างกราฟิกได้ในไม่กี่คลิก:

1. ดาวน์โหลดและติดตั้ง **GitHub Desktop** จาก 👉 [https://desktop.github.com](https://desktop.github.com)
2. เปิดโปรแกรม แล้วเข้าสู่ระบบด้วยบัญชี GitHub ของคุณ
3. ไปที่เมนู **File** ➔ **Add Local Repository...** (หรือกด `Ctrl + O`)
4. คลิก **Choose...** แล้วเลือกโฟลเดอร์โปรเจกต์นี้
5. หากขึ้นข้อความเตือนว่า *"This directory does not appear to be a Git repository"* ให้คลิกปุ่มสีฟ้า **`create a repository`**
6. ตรวจสอบรายการไฟล์ทางซ้ายมือ กรอกช่อง Summary ด้านล่างซ้ายว่า:  
   `Initial Commit: ระบบจัดทำและพิมพ์เช็ค v2.5.0`
7. คลิกปุ่มสีฟ้า **`Commit to main`**
8. คลิกปุ่ม **`Publish repository`** ด้านบนขวา:
   * ตั้งชื่อ Repository
   * ติ๊กถูกที่ `Keep this code private` (แนะนำเพื่อความปลอดภัย)
   * คลิก **`Publish Repository`**
9. เพียงเท่านี้ โค้ดทั้งหมดจะถูกอัปโหลดขึ้น GitHub ทันที!

---

## การจัดการสิทธิ์การเข้าถึง (GitHub Personal Access Token / PAT)

ปัจจุบัน GitHub ไม่อนุญาตให้ใช้รหัสผ่านบัญชีทั่วไปในการ Push โค้ดผ่าน Terminal อีกต่อไป แต่ต้องใช้ **Personal Access Token** แทนรหัสผ่าน:

### วิธีสร้าง Token:
1. เข้าไปที่ GitHub ➔ คลิกรูปโปรไฟล์มุมขวาบน ➔ เลือก **`Settings`**
2. เลื่อนลงมาล่างสุดทางซ้าย คลิก **`Developer settings`**
3. เลือก **`Personal access tokens`** ➔ **`Tokens (classic)`**
4. คลิกปุ่ม **`Generate new token`** ➔ เลือก **`Generate new token (classic)`**
5. ตั้งชื่อ Note เช่น `Cheque System CLI`
6. เลือก Expiration: เช่น `90 days` หรือ `No expiration`
7. ในหัวข้อ Select scopes ให้ติ๊กถูกที่ช่อง **`repo`** (ครอบคลุมการอ่านเขียนคลังโค้ดทั้งหมด)
8. เลื่อนลงไปล่างสุด คลิกปุ่มสีเขียว **`Generate token`**
9. **คัดลอกรหัส Token ที่แสดงขึ้นมาเก็บไว้ทันที** (เช่น `ghp_xxxxxxxxxxxxxxxxxxxx`)
10. เมื่อ Terminal สั่ง `git push` แล้วถามหา:
    * **Username**: ให้ใส่อีเมลหรือชื่อผู้ใช้ GitHub ของคุณ
    * **Password**: ให้วาง **Token** ที่เพิ่งคัดลอกมานี้แทนรหัสผ่าน

---

## การอัปเดตโค้ดเมื่อมีการแก้ไขในอนาคต (Daily Workflow)

เมื่อคุณปรับแต่งหน้าตา แก้ไขพิกัด หรือเพิ่มฟังก์ชันใหม่ในโปรเจกต์ และต้องการบันทึกขึ้น GitHub:

```bash
# 1. ตรวจสอบไฟล์ที่มีการแก้ไข
git status

# 2. เพิ่มไฟล์ที่แก้ไขเข้าสู่ชุดเตรียมบันทึก
git add .

# 3. บันทึกคำอธิบายการเปลี่ยนแปลง
git commit -m "update: ปรับปรุงตัวอย่างเช็คจริงและเพิ่มฟังก์ชันส่งออกข้อมูล"

# 4. ส่งขึ้น GitHub
git push
```

---

## การดึงโค้ดจาก GitHub ไปติดตั้งบนเครื่องจริงในหน่วยงาน

เมื่อโค้ดอยู่บน GitHub แล้ว หากฝ่าย IT หรือคุณต้องการนำไปติดตั้งบนเครื่องคอมพิวเตอร์ตัวอื่นในโรงพยาบาล/หน่วยงาน:

### ขั้นตอน:
```bash
# 1. โคลนคลังโค้ดลงมาที่เครื่อง
git clone https://github.com/<ชื่อผู้ใช้ของคุณ>/cheque-management-system.git

# 2. เข้าสู่โฟลเดอร์โปรเจกต์
cd cheque-management-system

# 3. ติดตั้ง Dependencies ทั้งหมด
npm install

# 4. สร้างและ Build ไฟล์ระบบ
npm run build

# 5. เปิดใช้งานระบบ
npm start
```
หรือหากต้องการรันด้วย Docker:
```bash
docker compose up -d
```
เข้าใช้งานระบบได้ทันทีที่ 👉 **`http://localhost:3000`** หรือผ่าน IP ของเครื่องแม่ข่ายในวงแลน! 🚀

---

## 🛡️ ไฟล์ความปลอดภัย (.gitignore)

โปรเจกต์นี้ได้รับการกำหนดค่าไฟล์ `.gitignore` ไว้เรียบร้อยแล้ว โดยจะป้องกันไม่ให้ไฟล์ต่อไปนี้หลุดขึ้นไปบน GitHub:
- `node_modules/` (แพ็กเกจไลบรารีขนาดใหญ่)
- `dist/` และ `build/` (ไฟล์ที่คอมไพล์แล้ว)
- `.env` และ `.env.local` (ไฟล์เก็บกุญแจความลับเฉพาะเครื่อง)
- `*.log` (ไฟล์บันทึกข้อผิดพลาดชั่วคราว)

คุณจึงมั่นใจได้ว่าคลังโค้ดบน GitHub จะสะอาด ปลอดภัย และมีเฉพาะซอร์สโค้ดที่จำเป็นเท่านั้นครับ
