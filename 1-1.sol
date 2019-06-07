pragma solidity ^0.5.0;

contract Lottery {

  /* ------ 宝くじ ------ */
  address payable[] private lotteries;

  /* ------ 宝くじの設定 ------ */
  uint private winningAmount;       // 当選額
  uint private maxSales = 10;       // 宝くじの販売数

  /* コンストラクタ */
  constructor(uint _winningAmount) public payable {
    winningAmount = _winningAmount * 1e18;
    require(msg.value >= winningAmount, "保有金額が不足しています。");
  }

  // 宝くじを購入
  function buy() public {
    lotteries.push(msg.sender);
  }

  // 抽選
  function decide(uint decidedIndex) public {
    address payable addr = lotteries[decidedIndex];
    addr.transfer(winningAmount);
  }
}
