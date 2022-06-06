import os

from jinja2 import Environment, FileSystemLoader

loader = FileSystemLoader(searchpath='./')
env = Environment(loader=loader)
TEMPLATE_FILE = 'profiles.yml'


def env_var(var):
    return os.getenv(var)


def as_text(var):
    return str(var)


env.globals['env_var'] = env_var
env.filters['as_text'] = as_text
template = env.get_template(TEMPLATE_FILE)
outputText = template.render()  # this is where to put args to the template renderer

# to save the results
with open(TEMPLATE_FILE, 'w') as fh:
    fh.write(outputText)
