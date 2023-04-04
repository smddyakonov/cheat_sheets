Для отправки почты с вложением используется библиотека smtplib и классы EmailMessage и MIMEImage из библиотеки email.mime. Вот пример кода:

```python
import smtplib
from email.message import EmailMessage
from email.mime.image import MIMEImage

# данные отправителя и получателя
sender_email = 'sender@mail.ru'
sender_password = 'password'
receiver_email = 'receiver@mail.ru'

# создание объекта сообщения
message = EmailMessage()
message['Subject'] = 'Тестовое сообщение'
message['From'] = sender_email
message['To'] = receiver_email

# добавление текста сообщения
message.set_content('Привет, это тестовое сообщение.')

# добавление изображения в качестве вложения
with open('image.jpg', 'rb') as f:
    img_data = f.read()
    image = MIMEImage(img_data, name='image.jpg')
    message.add_attachment(image)

# отправка сообщения
with smtplib.SMTP_SSL('smtp.mail.ru', 465) as smtp:
    smtp.login(sender_email, sender_password)
    smtp.send_message(message)
```

В этом примере мы создаем объект сообщения и указываем тему, отправителя и получателя. 
Затем мы добавляем текст сообщения и изображение в качестве вложения. 
Наконец, мы отправляем сообщение через SMTP-сервер mail.ru, используя SSL-шифрование для безопасности.
