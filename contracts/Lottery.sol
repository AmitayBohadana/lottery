// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Lottery {
    
    uint[6] winningNumbers;
    mapping(uint8 => address[]) playersByNumbers;

    enum LotteryState {Accepting, Finished}
    LotteryState state;
    
    function placeBet(uint8 number) public payable {
        require(number<=250);
        require(state == LotteryState.Accepting);
        require(msg.value == 0.001 ether);
        playersByNumbers[number].push(msg.sender);
    }

    function runLottery() public {
        winningNumbers[0] = 1;
        winningNumbers[1] = 3;
        winningNumbers[2] = 4;
        winningNumbers[3] = 5;
        winningNumbers[4] = 6;
        winningNumbers[5] = 7;
        payTheWinner();
    }

    function payTheWinner() private {
        address payable winnerAddress;
        address payable _winner = winnerAddress;
        _winner.transfer(address(this).balance);
    }

    function getWinnerAddress() private {

    }



}