# ma
Experiment source code

1. 根据下列指导，生成truffle项目，并将contract拷贝到相应文件夹

http://baijiahao.baidu.com/s?id=1596709950693500556&wfr=spider&for=pc

2. 根据指导生成Java类 

指导：

http://wangxiaoming.com/blog/2018/01/22/HPB-41-ETH-3j-Smart/

工具：

https://github.com/web3j/web3j/releases/tag/v3.2.0

```shell
$ web3j truffle generate --javaTypes ./HVDAuditor.json -o  . -p com.tts.ma.contract.ct
$ web3j truffle generate --javaTypes ./Register.json -o  . -p com.tts.ma.contract.ct

```

```bash
# win
$ geth -datadir "%cd%\chain" init genesis.json
$ geth -datadir "%cd%\chain" console
$ geth -targetgaslimit 4294967295 -rpc -rpcaddr "127.0.0.1" -rpcport "8545" -port "30301" -rpcapi "eth,web3,personal" -networkid 2018 -identity 2018 -nodiscover -maxpeers 5 -datadir "%cd%\chain" -unlock 0 -rpccorsdomain "*" -mine console
```

1. 部署网络

2. 初始化网络节点, 并创建用户

```bash
geth -datadir "%cd%\chain" init genesis.json

personal.newAccount("root");
```

3. 将生成的用户文件名，到程序

4. 启动网络 

```bash
geth -targetgaslimit 4294967295 -rpc -rpcaddr "127.0.0.1" -rpcport "8545" -port "30301" -rpcapi "eth,web3,personal" -networkid 2018 -identity 2018 -nodiscover -maxpeers 5 -datadir "%cd%\chain" -unlock 0 -rpccorsdomain "*" -mine console
```

5. 监控

```bash
geth monitor chain/inserts/AvgRate01Min chain/inserts/AvgRate05Min chain/inserts/AvgRate15Min chain/inserts/MeanRate chain/inserts/Overall chain/inserts/Percentiles/20 chain/inserts/Percentiles/5 chain/inserts/Percentiles/50 chain/inserts/Percentiles/80 chain/inserts/Percentiles/95


geth monitor [--attach=api-endpoint] metric1 metric2 ... metricN
```