# Usage

เครื่องที่จะใช้งานต้องติดตั้ง docker และ docker-compose ให้เรียบร้อย ถ้าเป็น Linux ได้จะดีมาก

git clone https://github.com/songwutk/odoo-12-docker-compose.git

cd odoo-12-docker-compose


Change the folder permission to make sure that the container is able to access the directory:

กำหนดให้โฟลเดอร์ addons และ etc เขียนได้ทุกระดับ user
```
$ sudo chmod -R 777 addons
$ sudo chmod -R 777 etc
```

Start the container:
เริ่มขึ้นระบบ
```
$ docker-compose up -d
```

* Then open `localhost:8069` to access Odoo 12.0. If you want to start the server with a different port, change **8069** to another value:

การเข้าเว็บให้ชี้ไปที่ port 8069 เช่น localhost:8069 หรือ http://(ip):8069 เป็นต้น
```
# ข้อความใน docker-compose.yml
# -"ด้านนอกฝั่ง user":"ด้านใน container"
ports:
 - "8069:8069"
```

# ตั้งเวลาท้องถิ่นใน Container Odoo เป็นประเทศไทย
docker exec -t --user root  odoo  rm -f /etc/localtime

docker exec -t --user root  odoo  ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

# การติดตามการทำงานของ Odoo

* Log file is printed @ **etc/odoo-server.log**
 tail etc/odoo-server.log  -f

** คำเตือน : ระบบเปิด log ของ odoo แบบ 100% โปรดระวังขนาดไฟล์ใน etc/odoo-server.log

# Custom addons

ทดลองสร้าง Module ขึ้นมาใหม่ในชื่อ phone book 

The **addons** folder contains custom addons. Just put your custom addons if you have any.

Create new module "phonebook" by command

ใช้คำสั่ง docker ดังนี้

docker exec -t odoo odoo scaffold /mnt/extra-addons/phonebook

Basic module stater is in addons host folder

# Odoo configuration

To change Odoo configuration, edit file: **etc/odoo.conf**.

# docker-compose.yml

* odoo : 12.0
* postgres : 11.0


# Odoo 12 screenshots

![odoo-12-welcome-docker](screenshots/odoo-12-welcome-screenshot.png)

![odoo-12-apps-docker](screenshots/odoo-12-apps-screenshot.png)

![odoo-12-sales](screenshots/odoo-12-sales-screen.png)

![your new module ](screenshots/phonebook.png)
