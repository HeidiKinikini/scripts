EMAIL_ADDRESS = 'your_email@gmail.com'
EMAIL_PASSWORD = 'your_app_password'
SMTP_SERVER = 'smtp.gmail.com'
SMTP_PORT = 587

def generate_daily_report():
    return "Hello! This is your daily report."

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def send_email(subject, message, to_email):
    # Create a MIMEText object to represent the email content
    msg = MIMEMultipart()
    msg['From'] = EMAIL_ADDRESS
    msg['To'] = to_email
    msg['Subject'] = subject
    msg.attach(MIMEText(message, 'plain'))

    # Connect to the SMTP server and send the email
    try:
        server = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
        server.starttls()
        server.login(EMAIL_ADDRESS, EMAIL_PASSWORD)
        server.sendmail(EMAIL_ADDRESS, to_email, msg.as_string())
        server.quit()
        print("Email sent successfully!")
    except Exception as e:
        print("Email could not be sent. Error:", str(e))


import schedule
import time

# Schedule the email to be sent daily at 8:00 AM
schedule.every().day.at("08:00").do(lambda: send_email("Daily Report", generate_daily_report(), 'recipient@example.com'))

# Run the scheduled tasks
while True:
    schedule.run_pending()
    time.sleep(1)
