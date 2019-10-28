import { createTest, destroyVM } from '../util';
import OtherColor from 'packages/other-color';

describe('OtherColor', () => {
  let vm;
  afterEach(() => {
    destroyVM(vm);
  });

  it('create', () => {
    vm = createTest(OtherColor, true);
    expect(vm.$el).to.exist;
  });
});

