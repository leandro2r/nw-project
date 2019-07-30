name 'node'
description 'Node Role'

run_list 'role[master]'

override_attributes(
    'nw' => {
        'swarm' => 'join',
        'swarm_init' => '11.12.13.14'
    }
)
