!/bin/bash

# upgrade pip
RUN pip install --upgrade pip

# install selenium
RUN pip install selenium

CMD ["echo", "selenium.sh executed"]

echo "selenium-installed"
