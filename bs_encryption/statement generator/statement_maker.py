from PyPDF2 import PdfFileReader, PdfFileWriter

# Loads the passwords from the passwords file
with open("passwords.txt", "r") as password_file:
    passwords = password_file.readlines()

passwords = [password.rstrip() for password in passwords]  # Removes any trailing white space characters


for i in range(0, len(passwords)):
    encrypted_pdf = PdfFileWriter()
    with open("template.pdf", "rb") as file:
        starter_pdf = PdfFileReader(file)
        encrypted_pdf.appendPagesFromReader(starter_pdf)
        encrypted_pdf.encrypt(passwords[i])
        with open("statement " + str(i) + ".pdf", "wb") as output:
            encrypted_pdf.write(output)
