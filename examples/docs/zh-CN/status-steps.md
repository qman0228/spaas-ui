## status-steps组件

### 简洁风格的步骤条
设置 `simple` 可应用简洁风格，该条件下 `align-center` / `description` / `direction` / `space` 都将失效。
设置了`simple`之后，设置`number`属性可以显示带数字带步骤条

:::demo
```html

<el-steps :active="active">
  <el-status-steps title="步骤 1"></el-status-steps>
  <el-status-steps title="步骤 2"></el-status-steps>
  <el-status-steps title="步骤 3"></el-status-steps>
</el-steps>

<el-steps :active="active" finish-status="success" simple style="margin-top: 20px">
  <el-status-steps title="步骤 1" number></el-status-steps>
  <el-status-steps title="步骤 2" number></el-status-steps>
  <el-status-steps title="步骤 3" number></el-status-steps>
</el-steps>
<el-button style="margin-top: 12px;" @click="next()">下一步</el-button>

<script>
  export default {
    data() {
      return {
        active: 1
      };
    },

    methods: {
      next() {
        if (this.active++ > 2) this.active = 0;
      }
    }
  }
</script>
```
:::
### 用法
若不设置`number`，用法参考[Steps 步骤条](https://element.eleme.cn/#/zh-CN/component/steps)
