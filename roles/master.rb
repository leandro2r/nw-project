name 'master'
description 'Master Role'

run_list 'recipe[docker]',
         'recipe[nw]'

override_attributes(
    'nw' => {
        'swarm' => 'master',
        'swarm_init' => '10.11.12.51'
    }
)
