var Pollcat = artifacts.require("./Pollcat.sol");

function padToBytes32(n) {
    while (n.length < 66) {
        n =  n + '0';
    }
    return n;
}

contract('Pollcat', function(accounts) {
  it("should assert true", function(done) {
    Pollcat.deployed(); 
    assert.isTrue(true);
    done();
  });

  // Test case#2 Checks if calls to vote for coke resulst in a win
  it("should add a vote for pepsi", function () {
    // Get the deployed instance
    var pollcat;
    return Pollcat.deployed().then(function(instance){
      pollcat = instance;
      pollcat.vote(0);
      return pollcat.winnerName();
    }).then(function (name) {
    	console.log(name);
      	assert.equal(name, padToBytes32(web3.fromAscii("pepsi")), "Winner should be pepsi");
  });
});

});
