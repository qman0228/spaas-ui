import ElLoadingButton from './src/main';

/* istanbul ignore next */
ElLoadingButton.install = function(Vue) {
  Vue.component(ElLoadingButton.name, ElLoadingButton);
};

export default ElLoadingButton;
