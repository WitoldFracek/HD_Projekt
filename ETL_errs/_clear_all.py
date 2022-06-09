from os import listdir
from os.path import isfile, join


def clear_file(path):
    ext = path.split('.')[-1]
    lines = 0
    if ext == 'py':
        return 0
    with open(path, 'r', encoding='utf-8') as file:
        lines = len(file.readlines())
    with open(path, 'w', encoding='utf-8') as file:
        print(f'{path}: {lines} lines deleted.')
    return lines

if __name__ == '__main__':
    files = [f for f in listdir('.') if isfile(join('.', f))]
    lines = 0
    for f in files:
        lines += clear_file(f)
    print(f'Total lines deleted: {lines}')
