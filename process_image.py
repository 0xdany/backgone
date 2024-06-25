# process_image.py
import sys
from rembg import remove

def remove_background(input_path, output_path):
    with open(input_path, 'rb') as input_file:
        input_data = input_file.read()
        output_data = remove(input_data)
        with open(output_path, 'wb') as output_file:
            output_file.write(output_data)

if __name__ == "__main__":
    input_path = sys.argv[1]
    output_path = sys.argv[2]
    remove_background(input_path, output_path)
