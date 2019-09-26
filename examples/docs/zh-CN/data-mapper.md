## DataMapper 数据映射

数据映射器，用于展示多列信息

### 基础用法

:::demo 在 data 中注入数据后，通过设置"column",在 columns 中用 prop 属性来对应对象中的键名即可填入数据，用 label 属性来定义列名。

```html
<el-data-mapper
  :data="data"
  :columns="columns"
  placeholder="-"
></el-data-mapper>
<script>
  export default {
    data() {
      return {
        data: {
          name: "韩梅梅",
          grade: "女",
          age: "18",
          adress: "中国广东省广州市海珠区大塘",
          birth: ""
        },
        columns: [
          {
            label: "姓名",
            prop: "name"
          },
          {
            label: "性别",
            prop: "grade"
          },
          {
            label: "年龄",
            prop: "age"
          },
          {
            label: "地址",
            prop: "adress"
          },
          {
            label: "生日",
            prop: "birth"
          }
        ]
      };
    }
  };
</script>
```

:::

### 设置 contentRows

:::demo 通过设置 contentRows，可以决定内容显示的最大行数，超出的内容用省略号...代替，同时鼠标 hover 时会有文字信息提示。

```html
<el-data-mapper
  :data="data"
  :columns="columns"
  placeholder="-"
  :contentRows="contentRows"
></el-data-mapper>
<script>
  export default {
    data() {
      return {
        contentRows: 2,
        data: {
          name: "韩梅梅",
          grade: "女",
          adress: "上海市普陀区金沙江路弄中国广东省广州市海珠区大塘地铁站"
        },
        columns: [
          {
            label: "姓名",
            prop: "name"
          },
          {
            label: "性别",
            prop: "grade"
          },
          {
            label: "地址",
            prop: "adress"
          }
        ]
      };
    }
  };
</script>
```

:::

### formatter

:::demo formatter 属性，用于格式化指定列的值，接受一个 Function，会传入三个参数：data、col、index，可以根据自己的需求进行处理。

```html
<el-data-mapper
  :data="data"
  :columns="columns"
  placeholder="-"
></el-data-mapper>
<script>
  export default {
    data() {
      return {
        data: {
          name: "韩梅梅",
          grade: "女",
          age: "18",
          adress: "中国广东省广州市海珠区大塘",
          year: "1998",
          month: "12"
        },
        columns: [
          {
            label: "姓名",
            prop: "name"
          },
          {
            label: "性别",
            prop: "grade"
          },
          {
            label: "年龄",
            prop: "age"
          },
          {
            label: "地址",
            prop: "adress"
          },
          {
            label: "生日",
            prop: "birth",
            formatter: (data, col, index) => {
              return data.year + "-" + data.month;
            }
          }
        ]
      };
    }
  };
</script>
```

:::

### Attributes

| 参数        | 说明                                          | 类型                     | 可选值 | 默认值 |
| ----------- | --------------------------------------------- | ------------------------ | ------ | ------ |
| data        | 数据                                          | object                   | —      | —      |
| columns     | 设置列                                        | array                    | —      | —      |
| formatter   | 用来格式化内容                                | function(data,col,index) | —      | —      |
| placeholder | 占位符                                        | string                   | —      | —      |
| contentRows | 内容显示的最大行数，超出的内容用省略号...代替 | number                   | —      | 1      |
