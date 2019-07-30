name 'node'
description 'Node Role'

run_list 'role[master]'

override_attributes(
    'nw' => {
        'swarm' => 'join'
    }
)
