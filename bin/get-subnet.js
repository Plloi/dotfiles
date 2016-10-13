let getSubnet = abbr=>
{
	let alphabet = 'abcdefghijklmnopqrstuvwxyz';

	if (abbr.length > 3)
		return "0.0"

	return abbr.split('').map(c=>('00000'+(alphabet.indexOf(c.toLowerCase())+1).toString(2)).slice(-5)).join('').match(/.{1,8}/g).map(oct=>Number.parseInt(oct,2))
}
