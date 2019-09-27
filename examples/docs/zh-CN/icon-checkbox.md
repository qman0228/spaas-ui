## icon-checkbox
新样式

`indeterminate` 属性用以表示 checkbox 的不确定状态，一般用于实现全选的效果

:::demo

```html
<template>
  <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
  <div style="margin: 15px 0;"></div>
  <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
    <el-icon-checkbox v-for="city in cities" :label="city" :key="city" @change="handleCheckbox">{{city}}</el-icon-checkbox>
  </el-checkbox-group>
</template>
<script>
  const cityOptions = ['上海', '北京', '广州', '深圳'];
  export default {
    data() {
      return {
        checkAll: false,
        checkedCities: ['上海', '北京'],
        cities: cityOptions,
        isIndeterminate: true
      };
    },
    methods: {
      handleCheckAllChange(val) {
        this.checkedCities = val ? cityOptions : [];
        this.isIndeterminate = false;
      },
      handleCheckedCitiesChange(value) {
        let checkedCount = value.length;
        this.checkAll = checkedCount === this.cities.length;
        this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length;
      },
      handleCheckbox(value, event) {
        console.log(value);
      }
    }
  };
</script>
```
:::

### 用法参考
[Checkbox 多选框](https://element.eleme.cn/#/zh-CN/component/checkbox)
