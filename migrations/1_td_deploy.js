const ExerciceSolution = artifacts.require("ExerciceSolution");

const EvaluatorAdressSepolia1 = "0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0"
const EvaluatorAdressSepolia2 = "0xf84BA7aD45418F36A35dfD664445D6e5fbC4f2ab"

module.exports = function(deployer, network, accounts) {
	deployer.deploy(ExerciceSolution);//, EvaluatorAdressSepolia1, EvaluatorAdressSepolia2);
};

//0x884b7858811A357a411bfBe8c436d9dB62415C7b