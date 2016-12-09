let getSubnet = abbr=>
{
	let alphabet = 'abcdefghijklmnopqrstuvwxyz';

	return abbr.length > 3?
		"0.0" :
		abbr.split('').map(c=>('00000'+(alphabet.indexOf(c.toLowerCase())+1).toString(2)).slice(-5)).join('').match(/.{1,8}/g).map(oct=>Number.parseInt(oct,2)).join('.')
}

console.log(getSubnet(process.argv[2]))