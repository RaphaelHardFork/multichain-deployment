/* eslint-disable comma-dangle */
/* eslint-disable no-unused-vars */
const { expect } = require('chai')
const { ethers } = require('hardhat')

// some tests: https://github.com/RaphaelHardFork/ico-hardhat

const CONTRACT_NAME = 'ICO'
const SUPPLY = ethers.utils.parseEther('37000')
const ADDRESS_ZERO = ethers.constants.AddressZero

describe('Contract', function () {
  let MCDT, mcdt, ICO, ico, dev, owner, buyer1, buyer2

  beforeEach(async function () {
    ;[dev, owner, buyer1, buyer2] = await ethers.getSigners()
    MCDT = await ethers.getContractFactory('MultiChainDeploymentToken')
    mcdt = await MCDT.connect(owner).deploy(SUPPLY)
    await mcdt.deployed()

    ICO = await ethers.getContractFactory(CONTRACT_NAME)
    ico = await ICO.connect(dev).deploy(mcdt.address, owner.address, 1000)
    await ico.deployed()

    await mcdt.connect(owner).approve(ico.address, SUPPLY)
  })

  describe('Deployment', function () {
    it('should transfer the supply to the owner', async function () {
      expect(await mcdt.balanceOf(owner.address)).to.equal(SUPPLY)
    })
  })

  describe('interact with the ICO', async function () {
    console.log(SUPPLY.toString())
    let buyTokenCall
    beforeEach(async function () {
      buyTokenCall = await ico
        .connect(buyer1)
        .buyToken({ value: ethers.utils.parseEther('1') })
    })
    it('should transfer tokens from owner to buyer', async function () {
      expect(await mcdt.balanceOf(buyer1.address)).to.equal(
        ethers.utils.parseEther('1000')
      )
    })

    it('should decrease the token balance of the owner', async function () {
      expect(await mcdt.balanceOf(owner.address)).to.equal(
        SUPPLY.sub(ethers.utils.parseEther('1000'))
      )
    })

    it('should decrease the remaining supply in sale', async function () {
      expect(await ico.remainingSupply()).to.equal(
        SUPPLY.sub(ethers.utils.parseEther('1000'))
      )
    })

    it('should emit a TokenBought event', async function () {
      expect(buyTokenCall)
        .to.emit(ico, 'TokenBought')
        .withArgs(buyer1.address, ethers.utils.parseEther('1000'))
    })
  })
})
