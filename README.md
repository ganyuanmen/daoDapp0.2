# daoDapp
### src/interface 接口 
###### IADD 兑换接口
```
{
// utoken 兑换成 token
/* 
 * @param {*} _mintoken :  最小兑换量 通过commulate 接口获取
 * @param {*} _token :  兑换量 (单位：wei)
 * @param {*} _id : token ID
 * @returns 
 */
 async NDAOToToken(_mintoken,_token,_id) 

//token 兑换成 utoken
/*
 * @param {*} _mintoken :  最小兑换量 通过commulate 接口获取
 * @param {*} _token :  兑换量 (单位：wei)
 * @param {*} _id : token ID
 * @returns 
 */
async TokenToNDAO(_mintoken,_token,_id) 

//token 兑换 token 
/*
 * @param {*} _mintoken1 : token1 最小兑换量 通过commulate 接口获取
 * @param {*} _mintoken2 : token2 最小兑换量 通过commulate 接口获取
 * @param {*} _token1 : 兑换量 (单位：wei)
 * @param {*} _id1 : token1 ID
 * @param {*} _id2 : token1 ID
 * @returns 
 */
async TokenToToken(_mintoken1,_mintoken2,_token,_id1,_id2) {
}

```
### src/componets 组件 
### src/locals 语言 
