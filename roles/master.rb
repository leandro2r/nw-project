name 'master'
description 'Master Role'

run_list 'recipe[docker]',
         'recipe[nw]'

override_attributes(
  'nw' => {
    'swarm' => 'init',
    'swarm_init' => '11.12.13.14'
  }
)
