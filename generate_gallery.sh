#!/bin/bash

cat << EOF > generate_index.py
import os

image_extensions = ('.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp')
images = [f for f in os.listdir('.') if f.lower().endswith(image_extensions)]

with open('index.html', 'w') as f:
    f.write('<html><body>\\n')
    for img in images:
        f.write(f'<div style="display:inline-block;margin:10px;">')
        f.write(f'<a href="{img}"><img src="{img}" style="width:200px;height:auto;"><br>{img}</a>')
        f.write('</div>\\n')
    f.write('</body></html>')
EOF

python3 generate_index.py
