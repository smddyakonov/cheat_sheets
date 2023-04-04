Для отправки письма с вложениями в Python с помощью библиотеки smtplib можно использовать следующий код:

```python
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

# Данные для авторизации на почтовом сервере
email = 'your_email@mail.ru'
password = 'your_password' #пароль для внешних подключений, получаю в настройках mail.ru

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

В этом примере мы используем классы MIMEText, MIMEMultipart и MIMEApplication из модуля email для формирования письма с текстом и вложениями. 
Метод attach() используется для добавления текста и каждого вложения в сообщение. 
Затем мы подключаемся к почтовому серверу с помощью smtplib, отправляем сообщение и закрываем соединение. 

Обратите внимание, что для отправки писем через mail.ru необходимо использовать стандартный порт SMTP (587) 
и перед отправкой вызвать метод starttls() для защиты передачи данных. 
Также убедитесь, что вы указали правильные данные для авторизации на сервере (email и password).
