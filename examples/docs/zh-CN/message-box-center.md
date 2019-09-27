## MessageBoxCenter 组件
### 消息提示

当用户进行操作时会被触发，该对话框中断用户操作，直到用户确认知晓后才可关闭。

:::demo 调用`$alert`方法即可打开消息提示，它模拟了系统的 `alert`，无法通过按下 ESC 或点击框外关闭。此例中接收了两个参数，`message`和`title`。值得一提的是，窗口被关闭后，它默认会返回一个`Promise`对象便于进行后续操作的处理。若不确定浏览器是否支持`Promise`，可自行引入第三方 polyfill 或像本例一样使用回调进行后续处理。
```html
<template>
  <el-button type="text" @click="open">点击打开 Message Box</el-button>
</template>

<script>
  export default {
    methods: {
      open() {
        this.$alertCenter('这是一段内容', '标题名称', {
          confirmButtonText: '确定',
          callback: action => {
            this.$message({
              type: 'info',
              message: `action: ${ action }`
            });
          }
        });
      }
    }
  }
</script>
```
:::

### 提交内容

当用户进行操作时会被触发，中断用户操作，提示用户进行输入的对话框。

:::demo 调用`$prompt`方法即可打开消息提示，它模拟了系统的 `prompt`。可以用`inputPattern`字段自己规定匹配模式，或者用`inputValidator`规定校验函数，可以返回`Boolean`或`String`，返回`false`或字符串时均表示校验未通过，同时返回的字符串相当于定义了`inputErrorMessage`字段。此外，可以用`inputPlaceholder`字段来定义输入框的占位符。

```html
<template>
  <el-button type="text" @click="open">点击打开 Message Box</el-button>
</template>

<script>
  export default {
    methods: {
      open() {
        this.$prompt('请输入邮箱', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputPattern: /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/,
          inputErrorMessage: '邮箱格式不正确'
        }).then(({ value }) => {
          this.$message({
            type: 'success',
            message: '你的邮箱是: ' + value
          });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '取消输入'
          });       
        });
      }
    }
  }
</script>
```
:::

### 自定义

可自定义配置不同内容。

:::demo 以上三个方法都是对`$msgbox`方法的再包装。本例直接调用`$msgbox`方法，使用了`showCancelButton`字段，用于显示取消按钮。另外可使用`cancelButtonClass`为其添加自定义样式，使用`cancelButtonText`来自定义按钮文本（Confirm 按钮也具有相同的字段，在文末的字段说明中有完整的字段列表）。此例还使用了`beforeClose`属性，它的值是一个方法，会在 MessageBox 的实例关闭前被调用，同时暂停实例的关闭。它有三个参数：`action`、实例本身和`done`方法。使用它能够在关闭前对实例进行一些操作，比如为确定按钮添加`loading`状态等；此时若需要关闭实例，可以调用`done`方法（若在`beforeClose`中没有调用`done`，则实例不会关闭）。

```html
<template>
  <el-button type="text" @click="open">点击打开 Message Box</el-button>
</template>

<script>
  export default {
    methods: {
      open() {
        const h = this.$createElement;
        this.$msgboxCenter({
          title: '消息',
          message: h('p', null, [
            h('span', null, '内容可以是 '),
            h('i', { style: 'color: teal' }, 'VNode')
          ]),
          showCancelButton: true,
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          beforeClose: (action, instance, done) => {
            if (action === 'confirm') {
              instance.confirmButtonLoading = true;
              instance.confirmButtonText = '执行中...';
              setTimeout(() => {
                done();
                setTimeout(() => {
                  instance.confirmButtonLoading = false;
                }, 300);
              }, 3000);
            } else {
              done();
            }
          }
        }).then(action => {
          this.$message({
            type: 'info',
            message: 'action: ' + action
          });
        });
      }
    }
  }
</script>
```
:::

### 全局方法

如果你完整引入了 Element，它会为 Vue.prototype 添加如下全局方法：$alert, $confirm。因此在 Vue instance 中可以采用本页面中的方式调用 `MessageBox`。调用参数为：
- `$alertCenter(message, title, options)` 或 `$alert(message, options)`
- `$confirmCenter(message, title, options)` 或 `$confirm(message, options)`

提示语居中显示，其他配置同[MessageBox 弹框](https://element.eleme.cn/#/zh-CN/component/message-box)
