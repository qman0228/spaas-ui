<script>
  import bus from '../../bus';
  import { tintColor } from '../../color.js';
  import { ACTION_USER_CONFIG_UPDATE } from '../../components/theme/constant.js';
  const varMap = {
    'primary': '$--color-primary',
    'success': '$--color-success',
    'warning': '$--color-warning',
    'danger': '$--color-danger',
    'info': '$--color-info',
    'white': '$--color-white',
    'black': '$--color-black',
    'textPrimary': '$--color-text-primary',
    'textRegular': '$--color-text-regular',
    'textSecondary': '$--color-text-secondary',
    'textPlaceholder': '$--color-text-placeholder',
    'borderBase': '$--border-color-base',
    'borderLight': '$--border-color-light',
    'borderLighter': '$--border-color-lighter',
    'borderExtraLight': '$--border-color-extra-light'
  };
  const original = {
    primary: '#5D81F9',
    success: '#02C5E2',
    warning: '#F5A623',
    danger: '#E24156',
    info: '#6A6E7B',
    white: '#FFFFFF',
    black: '#000000',
    textPrimary: '#2D303B',
    textRegular: '#575962',
    textSecondary: '#818389',
    textPlaceholder: '#9CA6C7',
    borderBase: '#E4E8F3', // CAD1E8
    borderLight: '#E1E5F0', // CAD1E8
    borderLighter: '#CAD1E8', // EBEEF5
    borderExtraLight: '#F2F6FC'
  }
  export default {
    created() {
      bus.$on(ACTION_USER_CONFIG_UPDATE, this.setGlobal);
    },
    mounted() {
      this.setGlobal();
    },
    methods: {
      tintColor(color, tint) {
        return tintColor(color, tint);
      },
      setGlobal() {
        if (window.userThemeConfig) {
          this.global = window.userThemeConfig.global;
        }
      }
    },
    data() {
      return {
        global: {},
        primary: '',
        success: '',
        warning: '',
        danger: '',
        info: '',
        white: '',
        black: '',
        textPrimary: '',
        textRegular: '',
        textSecondary: '',
        textPlaceholder: '',
        borderBase: '',
        borderLight: '',
        borderLighter: '',
        borderExtraLight: ''
      }
    },
    watch: {
      global: {
        immediate: true,
        handler(value) {
          Object.keys(original).forEach((o) => {
            if (value[varMap[o]]) {
              this[o] = value[varMap[o]]
            } else {
              this[o] = original[o]
            }
          });
        }
      }
    },
  }
</script>

## 其他颜色
用于提高视觉效果的辅佐颜色

<el-row :gutter="12">
  <el-col :span="8" :md="{span: 8}" :sm="{span: 12}" :xs="{span: 12}" :style="{ marginBottom: '50px'}">
    <div :style="{display: 'flex', alignItems: 'center', justifyContent: 'space-between'}">
      <div class="value" :style="{ marginRight: '30px', width: '70px', height: '70px', lineHeight: '70px', background: '#975FE4',borderRadius: '100%' }"></div>
      <div>
        <div :style="{color: '#000000'}">紫色</div>
        <div :style="{ color: '#999999' }">#975FE4 / 151-95-228</div>
      </div>
    </div>
  </el-col>
  
  <el-col :span="8" :md="{span: 8}" :sm="{span: 12}" :xs="{span: 12}" :style="{ marginBottom: '50px'}">
    <div :style="{display: 'flex', alignItems: 'center', justifyContent: 'space-between'}">
          <div class="value" :style="{ marginRight: '30px', width: '70px', height: '70px', lineHeight: '70px', background: '#36CBCB',borderRadius: '100%' }"></div>
          <div>
            <div :style="{color: '#000000'}">宝绿色</div>
            <div :style="{ color: '#999999' }">#36CBCB / 54-203-203</div>
          </div>
        </div>
  </el-col>
  
  <el-col :span="8" :md="{span: 8}" :sm="{span: 12}" :xs="{span: 12}" :style="{ marginBottom: '50px'}">
      <div :style="{display: 'flex', alignItems: 'center', justifyContent: 'space-between'}">
        <div class="value" :style="{ marginRight: '30px', width: '70px', height: '70px', lineHeight: '70px', background: '#F2637B',borderRadius: '100%' }"></div>
        <div>
          <div :style="{color: '#000000'}">粉色</div>
          <div :style="{ color: '#999999' }">#F2637B / 242-99-123</div>
        </div>
      </div>
  </el-col>
    
  <el-col :span="8" :md="{span: 8}" :sm="{span: 12}" :xs="{span: 12}" :style="{ marginBottom: '50px'}">
      <div :style="{display: 'flex', alignItems: 'center', justifyContent: 'space-between'}">
        <div class="value" :style="{ marginRight: '30px', width: '70px', height: '70px', lineHeight: '70px', background: '#F5A623',borderRadius: '100%' }"></div>
        <div>
          <div :style="{color: '#000000'}">橙黄色</div>
          <div :style="{ color: '#999999' }">#F5A623 / 245-166-35</div>
        </div>
      </div>
  </el-col>
    
  <el-col :span="8" :md="{span: 8}" :sm="{span: 12}" :xs="{span: 12}" :style="{ marginBottom: '50px'}">
      <div :style="{display: 'flex', alignItems: 'center', justifyContent: 'space-between'}">
        <div class="value" :style="{ marginRight: '30px', width: '70px', height: '70px', lineHeight: '70px', background: '#818389',borderRadius: '100%' }"></div>
        <div>
          <div :style="{color: '#000000'}">灰色</div>
          <div :style="{ color: '#999999' }">#818389 / 129-131-13</div>
        </div>
      </div>
  </el-col>
  
</el-row>

