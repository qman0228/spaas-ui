import StatusSteps from './src/step';

/* istanbul ignore next */
StatusSteps.install = function(Vue) {
  Vue.component(StatusSteps.name, StatusSteps);
};

export default StatusSteps;
