<?php
/**
 * Link         :   http://www.phpcorner.net
 * User         :   qingbing<780042175@qq.com>
 * Date         :   2019-03-19
 * Version      :   1.0
 */

namespace Tools;


use Abstracts\SingleTon;

class KeyValue extends SingleTon
{
    /**
     * 获取分组中所有的键值对
     * @param string $group
     * @param bool $withAll
     * @return array|mixed
     * @throws \Exception
     */
    public function data($group, $withAll = false)
    {
        $cacheKey = 'pf.key-value.setting.' . $group;
        if (null === ($data = \PF::app()->getCache()->get($cacheKey))) {
            $records = \PF::app()->getDb()->getFindBuilder()
                ->setTable('pub_key_value')
                ->setSelect('`key`,`value`')
                ->setWhere('`group`=:group AND `is_enable`=:is_enable')
                ->addParam(':group', $group)
                ->addParam(':is_enable', 1)
                ->setOrder('`sort_order` ASC')
                ->queryAll();
            $data = [
                '' => '全部',
            ];
            foreach ($records as $record) {
                $data[$record['key']] = $record['value'];
            }
            \PF::app()->getCache()->set($cacheKey, $data);
        }
        if (!$withAll) {
            unset($data['']);
        }
        return $data;
    }

    /**
     * 获取分组中某个键对应的值
     * @param string $group
     * @param string $key
     * @return mixed
     * @throws \Exception
     */
    public function value($group, $key)
    {
        $_data = $this->data($group);
        return isset($_data[$key]) ? $_data[$key] : $key;
    }
}