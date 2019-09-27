<template>
  <el-input
          ref="ElInput"
          class="el-input-icon"
          v-model="inputValue"
          v-on="$listeners"
          v-bind="$attrs">
    <template v-for="(value, key) in $slots" :slot="key">
      <slot :name="key"></slot>
    </template>
  </el-input>
</template>
<script>
  import ElInput from '../../input';
  export default {
    name: 'ElInputIcon',
    components: {
      ElInput
    },
    props: {
      value: ''
    },
    data() {
      return {
        input: '',
        select: ''
      };
    },
    computed: {
      inputValue: {
        get: function() {
          return this.value;
        },
        set: function(v) {
          this.input = v;
        }
      }
    },
    methods: {}
  };
</script>
