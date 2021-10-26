

# daoDapp
DAO的管理及币值兑换的应用程序 

## src/componets 组件
- CreateDao.js : Dao 的管理，包括注册、创建OS、发行token 及logo的更改。
- daoConnect.js : 连接钱包及接口的初始化
- daoList.js : Dao 列表
- daoSelect.js : DAO下拉选择组件 
- daoSelectWindow.js : 币值兑换 dao 选择窗口组件 
- header.js : 菜单
- IADD_swap.js : 币值兑换
- tips.js : 提示窗口
- footer.js : 网页脚注

## src/interface 接口
###### commulate.js
###### ERC20s.js
###### IADD.js
###### logo.js
###### register.js
###### utoken.js
接口的初始化：
```
new 接口名称(_web3,_selectAccount);
_web3： 连接以太坊的中间件， 如web3 或ethers, 
_selectAccount: 钱包的用户ID

```

## src/locals 语言 
###### daodapp.zh-CN.js ： 中文

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




