

const {expect} = require("chai");



describe(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();
    const MyToken = await ethers.getContractFactory("MyToken");
    Plus = await MyToken.deploy({
        // gasPrice:5000000001,
        // maxFeePerGas :300,
        // maxPriorityFeePerGas :10

    });
    console.log("address:",Plus.address);


})


describe("mint ", function () {

    it(" plusOk ", async function () {

    await Plus.setValue(1);
    console.log("setValue,ok");


    const  data=await Plus.getValue();
    await console.log(data)
    })

})




const { expect } = require("chai");

let bank;
let owner;
let addr1;
let addr2;
beforeEach(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();
    const Bank = await ethers.getContractFactory("Bank");
    bank = await Bank.deploy();
});

describe("recharge & withdraw", function () {
    it("recharge", async function () {
        await owner.sendTransaction({to: bank.address, value: ethers.utils.parseEther('10')})
        let user = await bank.getUser(owner.address);
        expect(ethers.utils.formatEther(user[0].amount.toString())).to.equal("10.0");
        expect(ethers.utils.formatEther(await bank.provider.getBalance(bank.address))).to.equal("10.0");
    });
    it("withdraw", async function () {
        await owner.sendTransaction({to: bank.address, value: ethers.utils.parseEther('10')})
        await bank.withdraw();
        expect(ethers.utils.formatEther(await bank.provider.getBalance(bank.address))).to.equal("0.0");
    });
});