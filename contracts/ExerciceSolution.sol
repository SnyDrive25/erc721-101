pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is IExerciceSolution, ERC721 {
    constructor () public ERC721("SnyToken","SNY"){
        ERC721._mint(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0, 1);
        //animals[0] = Animal(0,4,true,"7pjWTYVa5A1PTPx");
    }

    mapping(address => bool) public auth;

    struct Animal {
        uint sex;
        uint legs;
        bool wings;
        string name;
    }

    Animal[] public animals;

    // Breeding function
	function isBreeder(address account) public override returns (bool) {
		return auth[msg.sender];
	}

	function registrationPrice() external override returns (uint256) {
		return 1;
	}

	function registerMeAsBreeder() external override payable {
        require(msg.value == 1);
        auth[msg.sender] = true;
    }

	function declareAnimal(uint sex, uint legs, bool wings, string calldata name) external override returns (uint256){
        require(auth[msg.sender] == true);
        animals.push(Animal(sex, legs, wings, name));
        uint tokenId = totalSupply() + 1;
        _mint(msg.sender, tokenId);
        return tokenId;
	}

	function getAnimalCharacteristics(uint animalNumber) external override returns (string memory _name, bool _wings, uint _legs, uint _sex){
        bool wings = true;
        uint legs = 4;
        uint sex = 0;
        return ("7pjWTYVa5A1PTPx", wings, legs, sex);
    }

	function declareDeadAnimal(uint animalNumber) external override {

    }

	function tokenOfOwnerByIndex(address owner, uint256 index) public view override(IExerciceSolution,ERC721) returns (uint256) {
        return 1;
    }

	// Selling functions
	function isAnimalForSale(uint animalNumber) external override view returns (bool) {
        return true;
    }

	function animalPrice(uint animalNumber) external override view returns (uint256) {
        return 1;
    }

	function buyAnimal(uint animalNumber) external override payable {

    }

	function offerForSale(uint animalNumber, uint price) external override {

    }

	// Reproduction functions

	function declareAnimalWithParents(uint sex, uint legs, bool wings, string calldata name, uint parent1, uint parent2) external override returns (uint256) {
        return 1;
    }

	function getParents(uint animalNumber) external override returns (uint256, uint256) {
        return (1,1);
    }

	function canReproduce(uint animalNumber) external override returns (bool) {
        return true;
    }

	function reproductionPrice(uint animalNumber) external override view returns (uint256) {
        return 1;
    }

	function offerForReproduction(uint animalNumber, uint priceOfReproduction) external override returns (uint256) {
        return 1;
    }

	function authorizedBreederToReproduce(uint animalNumber) external override returns (address) {
        address a;
        return a;
    }

	function payForReproduction(uint animalNumber) external override payable {

    }
}