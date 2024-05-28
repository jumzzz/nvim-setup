#!/usr/bin/env python3
import argparse
import json
import os

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--target-lang', default='', help='Target programming language (c/c++/rust).')
    args = parser.parse_args()
    return args

def make_dir_safe(target_dir):
    if os.path.isdir(target_dir):
        return
    os.mkdir(target_dir)

def dump_config(data):
    target_dir = '.dap-config/'
    make_dir_safe(target_dir)

    file_name = 'config.json'
    file_path = os.path.join(target_dir, file_name)

    with open(file_path, 'w') as config_file:
        json_str = json.dumps(data, indent=2)
        config_file.write(json_str)
        print(f'Configuration Save at file_path: {file_path}')
        print('')

def pretty_print_json(data):
    data_str = json.dumps(data, indent=2)
    print(data_str)
    print('')

def generate_config(target_lang='') -> dict:
    print('Target Language: ', target_lang)
    cwd = os.getcwd()
    project_name = os.path.basename(cwd)
    if target_lang == 'rust':
        program = os.path.join(cwd, 'target', 'debug', project_name)
        source_languages = ['rust']
    else:
        program = os.path.join(cwd, 'src', 'run')
        source_languages = []

    config_gen = {
        'target_lang' : target_lang,
        'config' : {
            'name'      : 'Launch file',
            'type'      : 'codelldb',
            'request'   : 'launch',
            'cwd'       : cwd,
            'program'   : program, 
            'args'      : [],
            'sourceLanguages' : source_languages,
        }
    }

    print('Config generated: ')
    pretty_print_json(config_gen)
    return config_gen


def main():
    args = get_args()
    dump_config(generate_config(args.target_lang))

if __name__ == '__main__':
    main()


