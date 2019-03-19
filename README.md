# pf-tools-key-value
## 描述
工具——键值对获取

## 注意事项
- 引用的主要小部件
    - qingbing/php-file-cache
    - qingbing/php-database
    - qingbing/php-application

## 使用方法
```php
// 获取分组中所有的键值对
var_dump(\Tools\KeyValue::getInstance()->data('access-mod'));
// 获取分组中所有的键值对（附加"全部"）
var_dump(\Tools\KeyValue::getInstance()->data('access-mod', true));
// 获取分组中具体键的值
var_dump(\Tools\KeyValue::getInstance()->value('access-mod', 'program'));

```

## ====== 异常代码集合 ======

异常代码格式：1039 - XXX - XX （组件编号 - 文件编号 - 代码内异常）
```
 - 无
 
```