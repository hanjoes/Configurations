# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Currently only supports Linux environment.
# Note: This file must be run under "Configuration"
# folder.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

import os

ROOT = ''

if __name__ == '__main__':
    if os.path.basename(ROOT) != "Configurations":
        print('The script is not in "Configurations" folder, aborting.')
        os._exit(-1)

    # initialize prompt script - neat-prompt

    
