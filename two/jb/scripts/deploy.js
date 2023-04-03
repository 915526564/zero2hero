
const hre = require("hardhat");

async function main() {


    let num2 = ethers.utils.parseUnits("100000000", "ether");
    const [owner] = await ethers.getSigners();


    const MyToken = await ethers.getContractFactory("MyToken");
    Plus = await MyToken.deploy();


   console.log("address:",Plus.address);


 await Plus.setBalance(1);
    console.log("setValue,ok");


    const  data=await Plus.balanceOf();
    await console.log(data)
    // await


}


// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

















