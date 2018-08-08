# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Currently only supports Linux environment.
# Note: This file must be run under "Configuration"
# folder.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

import os

ROOT = ''
PROMPT_SCRIPT = 'neat-prompt'

if __name__ == '__main__':
    ROOT = os.path.dirname(os.path.realpath(__file__))
    if os.path.basename(ROOT) != "Configurations":
        print('The script is not in "Configurations" folder, aborting.')
        os._exit(-1)


    # initialize prompt script - neat-prompt
    ps_path = ROOT + "/" + PROMPT_SCRIPT
    if not os.path.exists(ps_path):
        _download_prompt_script()

    # work environment should be a superset of the personal
    # environment (for now unless we have permission issues).
    # work environments:
    # 1. 
    # 2. ???
    # 3. ???

    # check and link/unlink resource files (bashrc, vimrc, emacs
    # init files).

    # emacs

    # vim

    # bash

def _setup_work_environment_1():
    pass


def _setup_work_environment_2():
    pass


def _download_prompt_script():
    '''
    Downloads the prompt script.
    '''
    print('downloading....')
    pass
