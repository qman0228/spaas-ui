### input-icon组件 可清空

:::demo 使用`clearable`属性即可得到一个可清空的输入框

```html
<el-input-icon
  v-model="input"
  placeholder="请输入内容"
  @change="handleChange"
  clearable>
</el-input-icon>

<script>
  export default {
    data() {
      return {
        input: ''
      }
    },
    methods: {
      handleChange(event) {
        console.log(event);
      }
    }
  }
</script>
```
:::
### 自定义校验规则

这个例子中展示了如何使用自定义验证规则来完成密码的二次验证。

:::demo 本例还使用`status-icon`属性为输入框添加了表示校验结果的反馈图标。
```html
<el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
  <el-form-item label="密码" prop="pass">
    <el-input-icon type="password" v-model="ruleForm.pass" autocomplete="off"></el-input-icon>
  </el-form-item>
  <el-form-item label="确认密码" prop="checkPass">
    <el-input-icon type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input-icon>
  </el-form-item>
  <el-form-item label="年龄" prop="age">
    <el-input-icon @change="handleChange" v-model.number="ruleForm.age"></el-input-icon>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
    <el-button @click="resetForm('ruleForm')">重置</el-button>
  </el-form-item>
</el-form>
<script>
  export default {
    data() {
      var checkAge = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('年龄不能为空'));
        }
        setTimeout(() => {
          if (!Number.isInteger(value)) {
            callback(new Error('请输入数字值'));
          } else {
            if (value < 18) {
              callback(new Error('必须年满18岁'));
            } else {
              callback();
            }
          }
        }, 1000);
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.ruleForm.checkPass !== '') {
            this.$refs.ruleForm.validateField('checkPass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        ruleForm: {
          pass: '',
          checkPass: '',
          age: ''
        },
        rules: {
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ],
          age: [
            { validator: checkAge, trigger: 'blur' }
          ]
        }
      };
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            alert('submit!');
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      handleChange(event) {
        console.log(event);
      }
    }
  }
</script>
```
:::
### 用法参考
[Input 输入框](https://element.eleme.cn/#/zh-CN/component/input)
