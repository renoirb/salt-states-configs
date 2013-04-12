include:
  - lang.python.python-libs

nodejs:
   cmd.wait:
    - name: /usr/bin/add-apt-repository -y ppa:chris-lea/node.js
    - unless: apt-key list | grep chrislea
    - require:
      - pkg: python-software-properties
   pkg:
    - installed
    - refresh: True
    - names:
      - nodejs
      - npm
    - unless: node -v 2>/dev/null
    - require:
      - cmd: nodejs
