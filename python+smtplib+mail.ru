# данные отправителя и получателя
sender_email = 'sender_email@mail.ru'
sender_password = 'sender_password' #пароль для внешних подключений получаем в  mail.ru
receiver_email = 'receiver_email@mail.ru'

# создание объекта сообщения
message = EmailMessage()
message['Subject'] = 'Тестовое сообщение'
message['From'] = sender_email
message['To'] = receiver_email

# добавление текста сообщения
message.set_content('Привет, это тестовое сообщение.')

# добавление изображения в качестве вложения
with open('path/to/your/file.jpg', 'rb') as f:
    files = {'attachment': ('image.jpg', f.read(), 'image/jpeg')}

# добавление file.xlsx в качестве вложения
with open('path/to/your/file.xlsx', 'rb') as f:
    files = {'attachment': ('file.xlsx', f.read(), 'application/vnd.ms-excel')}

# добавление file.pdf в качестве вложения
with open('path/to/your/file.pdf', 'rb') as f:
    files = {'attachment': ('file.pdf', f.read(), 'application/pdf')}
    
# добавление file.docx в качестве вложения
with open('path/to/your/file.docx', 'rb') as f:
    files = {'attachment': ('file.docx', f.read(), 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')}

    
# отправка сообщения
with smtplib.SMTP_SSL('smtp.mail.ru', 465) as smtp:
    smtp.login(sender_email, sender_password)
    smtp.send_message(message)

Для отправки письма с вложениями в Python с помощью библиотеки smtplib можно использовать следующий код:

```python
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

# Данные для авторизации на почтовом сервере
email = 'your_email@mail.ru'
password = 'your_password'

# Формирование сообщения
msg = MIMEMultipart()
msg['From'] = email
msg['To'] = 'recipient_email@mail.ru'
msg['Subject'] = 'Тема письма'

# Добавление текста сообщения
text = 'Текст сообщения'
msg.attach(MIMEText(text))

# Добавление вложений
files = ['file1.png', 'file2.jpeg', 'file3.xlsx', 'file4.pdf', 'file5.docx', 'file6.mp3', 'file7.html', 'file8.json']
for f in files:
    with open(f, "rb") as fil:
        ext = f.split('.')[-1:]
        attachedfile = MIMEApplication(fil.read(), _subtype = ext)
        attachedfile.add_header('content-disposition', 'attachment', filename=str(f))
        msg.attach(attachedfile)

# Отправка сообщения
server = smtplib.SMTP('smtp.mail.ru', 587)
server.starttls()
server.login(email, password)
server.sendmail(email, 'recipient_email@mail.ru', msg.as_string())
server.quit()
```

В этом примере мы используем классы MIMEText, MIMEMultipart и MIMEApplication из модуля email для формирования письма с текстом и вложениями. Метод attach() используется для добавления текста и каждого вложения в сообщение. Затем мы подключаемся к почтовому серверу с помощью smtplib, отправляем сообщение и закрываем соединение. 

Обратите внимание, что для отправки писем через mail.ru необходимо использовать стандартный порт SMTP (587) и перед отправкой вызвать метод starttls() для защиты передачи данных. Также убедитесь, что вы указали правильные данные для авторизации на сервере (email и password).
