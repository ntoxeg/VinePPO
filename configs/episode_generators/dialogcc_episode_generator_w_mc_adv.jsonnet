(import 'dialogcc_episode_generator.jsonnet') + {
    episode_generator+: {
        type: 'dialog_episode_generator_w_mc_advantages',
        max_step_for_value_estimation: 20,
    },
}
