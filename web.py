cssContent="""
* {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
  padding: 0;
}

"""
import os
import subprocess
def make_files():
    print("Creating index.html")
    print("Enter the Title")
    title = input(">>> ")
    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>{title}</title>
        <link rel="stylesheet" href="style.css">
      </head>
      <body>
      <h1>{title}</h1>
      </body>
    </html>
    """
    with open("index.html", 'w') as file:
        file.write(html_content)
    print("create style.css")
    with open("style.css", 'w') as file:
        file.write(cssContent)
    print("Done.")

def create_folder(fol_name):
    os.makedirs(fol_name,exist_ok=True)
    folder_path = os.path.abspath(fol_name)
    os.chdir(folder_path)
    return folder_path
def main():
    print("Enter foldername")
    foldername=input(">>> ")
    folder_path=create_folder(foldername)
    make_files()
    subprocess.run("code .", shell=True,cwd=folder_path)
if __name__=="__main__":
    main()
