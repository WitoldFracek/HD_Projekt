from os import listdir
from os.path import isfile, join
import sys


def clear_file(path, verbous=False):
    ext = path.split('.')[-1]
    lines = 0
    if ext != 'txt':
        return 0
    with open(path, 'r', encoding='utf-8') as file:
        lines = len(file.readlines())
    with open(path, 'w', encoding='utf-8') as file:
        if verbous:
            print(f'{path}: {lines} lines deleted.')
    return lines

if __name__ == '__main__':
    files = [f for f in listdir('.') if isfile(join('.', f))]
    lines = 0
    verbous = True if len(sys.argv) > 1 and sys.argv[1] == '-v' else False
    for f in files:
        lines += clear_file(f, verbous)
    print(f'Total lines deleted: {lines}')
