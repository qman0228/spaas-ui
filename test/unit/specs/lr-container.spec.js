import { createTest, destroyVM, createVue } from '../util';
import LrContainer from 'packages/lr-container';

describe('LrContainer', () => {
  let vm;
  afterEach(() => {
    destroyVM(vm);
  });

  it('create', () => {
    vm = createTest(LrContainer, true);
    expect(vm.$el).to.exist;
  });

  it('aside', () => {
    vm = createVue({
      template: `
        <el-lr-container aside-height="100px" aside-width="200px"></el-lr-container>
      `
    }, true);
    setTimeout(_ => {
      expect(vm.$el.querySelector('.el-lr-container-aside-content').style.height).to.equal('100px');
      expect(vm.$el.querySelector('.el-lr-container-aside-content').style.width).to.equal('200px');
    }, 10);
  });

  it('main', () => {
    vm = createVue({
      template: `
        <el-lr-container main-height="100px"></el-lr-container>
      `
    }, true);
    setTimeout(_ => {
      expect(vm.$el.querySelector('.el-lr-container-main-content').style.height).to.equal('100px');
    }, 10);
  });
});

