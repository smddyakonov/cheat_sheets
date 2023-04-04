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
