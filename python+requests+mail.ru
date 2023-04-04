общим примером кода для отправки почты с вложением с использованием библиотеки requests:

```python
import requests

# данные отправителя и получателя
sender_email = 'sender@mail.ru'
sender_password = 'password'
receiver_email = 'receiver@mail.ru'

# создание объекта сообщения
message = {'subject': 'Тестовое сообщение', 'from': sender_email, 'to': receiver_email}

# добавление текста сообщения
message['text'] = 'Привет, это тестовое сообщение.'

# добавление изображения в качестве вложения
with open('image.jpg', 'rb') as f:
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
response = requests.post(
    'https://smtp.mail.ru:465/messages',
    auth=(sender_email, sender_password),
    data=message,
    files=files,
    verify=True
)

print(response.status_code)
```

В этом примере мы создаем объект сообщения и указываем тему, отправителя и получателя. 
Затем мы добавляем текст сообщения и изображение в качестве вложения. 
Наконец, мы отправляем сообщение через SMTP-сервер mail.ru, используя HTTP POST-запрос и передавая аутентификационные данные отправителя. 
Ответ сервера мы получаем в переменной response.
