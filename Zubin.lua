-- FILENAME: Zubin.lua
-- CREATOR: angeld23
--[[ DESCRIPTION:
	Zubin
	Can be ran from anywhere, server script and local script both work
	Zubin
	Zubin
]]

--[[ DEPENDANCIES:
	Base64.lua by angeld23
		https://github.com/angeld23/roblox-misc/blob/main/Base64.lua
		Must be implemented as a ModuleScript in ReplicatedStorage named Base64
]]

local PIXEL_SIZE = 2
local OFFSET = Vector2.new(-PIXEL_SIZE * 64, -PIXEL_SIZE * 64)
local Base64 = require(game.ReplicatedStorage:WaitForChild("Base64"))

-- Zubin
local Zubin = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAABBBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBAAABBDDDECAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCBBCCDFHHGECAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABDEGHIJKKIFCBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCDFHLONJGEEFFECBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCEFDDDDGNQNFBDFHJIEBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABDGJHEFHFHOQMGEHGIJJGCBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCHLLIFGLKJOQNJKMGGJJIEBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABDKNMJGHMMLOQNLNNIHJJJFBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCJNMMKKMMMOQNLMNLKLLLFBBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCJNOPONMNMOQNIJMNNNNLFBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCJOQRQNNOMOQNFHMNNNOMEABBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCKOQSRONOMOROIJNONNOLEAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCJOQRRPONMORRNMOOOOOLEAAABBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCJOQRRPOMMNQPNNOOOPOLEAAABBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCJOQSQPNMMNONMNNOOOOLEAAABBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBCJOQRQONNNMMMMMMNNNNLEAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCIOQQPNNNNMLLMMMMNMMKEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABABGMPQPONNMKJKLLMMMMMJDBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAABEKPPPONNMKJJKLMMMMLICBBABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCHNPPONNMKKKLLMMMMLHCBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBFLOOONMLLLLLMMMMLKFBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBDINONMMLLLLLMMMLLIDBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBCFLMKKKLLLMLLLLKJFBAAABBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBDHKJJKLLLLLKJIIGCAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBDGHJKLLLLKKJGECBAAAAABBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBABDGIKLLLLKJJGCBAAAAAABBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBDGIKLLLLLKJGCBABCBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACEDBDGJKLLLLLLKGDBBFKGBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACHJECGIKKLLLLLKHFDDJRJBAABBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEOSKEGJKLLLLLKKJHGIRVNBABBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHTZTLIJLLKLLLLKKKNTZYRFBCBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACJTZaWLJKLLLLLLKJNWcbYVMGECAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADGGOUZdeVMHJLLLMNOPVdgcYXSQPKGDCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFOTQUYbfigYPNLLLMPWcgiifbXUYaXTPJEBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADIRceXYbdfjkidYRNLMTcikjjjfaXaddebVOIFCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACDGOWbihbbdegjlljidXUWflllkkjiecdffghebWQKGDCBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABGOWcdejiccdegjlmmnifglonnmlkjihfffghhhhgdXTNIFDBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEKScigcdjiedeegjlmnkbWZjonnmljiihhhhhhggghiheZTNIFCBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACIRagjidbejifeefhklmkaMJJUjnnmkjihiihhhhgggghhhfcXSMIECAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACGNWcfilicehiihgfgiklmfOCCCKdlmmkjiiiiiiihhgggggfffdbXSNIEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADLSXZdhllgehiiihhgijklkbIBBBETjmlkjjiiiiiiihgggggggggfdbXTOJEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCEGNXbcbejlighiiiiihiijkkiYHBBBEPdjkkkjjjjjjjjihggggghhgggfebXTMFCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCFMSXbccchlkihiiiijjiijjkkhZLCBBJWdhkkkkkjkkjjjihhhhhhhhhhhhfdbYSKEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFLVaccccfkmjhhiijjjjjjjjkkidTDACRfjkkkkkkkkkkkkjhhhhihhiiiihgedbXOGBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADGMUbeeddeimmihiijjjjjjjkkkjigWDADVkmmllllllllkkjjiiiiiiijjjiihfecaTKDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHPVbdefegilnliiijjjjjjjkkkkkjhVDACRinnmllmlllllkkjiiiiiiijjjjjihfedZSHBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEOXbdeffgiklljiiiijjjjjjjkkkkkjVDABKdmnmmlmmmmmllkkjjiiiiijjkkkjihgecYODAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACKVcdeffgilmljihiijjjjjkkkklllliTCABHYlnnmmmmmmmmmlkkjjiiiiijkkkkjihgecUHBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIUbeeffgilmmkihhijkkkkkkkkllllkcLBABGVkonmmmmmmmmmmllkjiiiiijkkkkjjihfdYMDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABGRadeffgikmmljiihihZYekkkkllllkhUEAABEQgnommmmmnnmmiaZejjjjjiijjkjjkjifeaSHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACNYcdefhikmnlkijjjkQZjIhlllllllkeOCBBCDMcnonmmmmmmmnRcjIgkkkkjiijjjkkkigecWKBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADScddegjklnnlkhWUVhNp6HflllllmlkdNCBCCDKcnonmmmmmmmnOt6HfkYUVgkjjjjkklihecYMCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGUdeefgjkmmmlkZQxOVOn4IgnmmmmnmkeODBDCCKdoonnnnnoonoPr4IhePyRSlkjiijlmjifbZPDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABKXdeffgjllmmlkaJZIXOn4IdedjjddkkWICAAAAJdmfdddefegifLs4FZcJZINdcchjjlmjjhbbUFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEPZefffhkllmmlkbLdJXPn4FSgfQHcZNRYcCPgeJGeWWjihdLfQGdUs6dfPJePdcfbNckmnjmkdcZLBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACJVcefffhklllmlkXU/UVPn3Q4022Go9JI7pO7y20HaSWov/pM/cD7oq/v7xU/f58w/gLkmnjnldcbQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADNaffffghllllmlkXU/TVPn2e/NS/TR/YX/Sc/QZ/QUiTFh9MK+bD5nr6Ei7Z+e5oB0uGimmkoldccVHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADOfiffggimmllmllYU/TVPn2g+LQ/XC2vu3Df/348RTpkP6pBN+bD5nr4Cf7a+e5mAyvGhmmkplecdaMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFRikffghjmnllmlkYU/TWPn2e/MR/WAk//lAe+VRbHUpTi9MHO+dE6nr5Dh7Z+e5mAyvGhlllpmecehTFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCIUjlfgijjnnllmlkXU/UVPp5R7wy4JNS//RAR9ty2JWiQ87ljO34s/os/s5zV/f7nA0xGhklkpmecelbIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACMZllggjkjnolmmllZMlLXRXhDQkiNNjLghEBBTnjMEdVQmlnmIOjfjWZjgiMJmRiWAdcHhkkkplfdfmeJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAERcmmhgjkjnolmnkkiTPTigSQYaSRamodRPJCCAAAAIdhTRQQQVaSRRRSRRRYVQRQRUPQZjkkmqkeefmhLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABKXemnhgijknommnjjklmmmmnoooooonnoojRCBBBBBJdnppooooooooooooonmmmlliikljjlnqieegmjPCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABNaemmighjkmpmmmijjjkllmmnnnnnnnnnniQCBBBBBLenonnnnnnnnnnnnnmllkkkiggjkjjmpqheegmmVEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABSdemnjfhjklolkkijjjkllmnnnnnnnnnoniQCAAAABNgnonnnnnnnnnnnnnmmlkjjieejkjkmppgefgnocIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADXffmnkfgjjkmjijijjjkllmnnnnnnnnnoniQCAAABCOgnonnnnnnnnnnnnnmlkjihgddjkjknqpgffhnphMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGaeemnlffkkjkihiijjiklmmnnnnnnnnnnojRCAAABCOhoponnnnnnnnnnnnmlkjigeccijjknqneefhnmfNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHademnlgfkljjigiiijikmlmnnnnnnnnnnojRCAABBCPhoponnnnnnnnnnnnmljihecbcijiknpkdffhnkeOBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHademnmhfkljiighiiihjllmmnnnnnnnnoojRCABBCCPhoponnnnnnnnnnnnmkjhfcbbcijiknnhdgfhmjdPBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHadelmmiekmihiffhiigjlmmmnnnnnnnnoojRCABBCCPhpponnnnnnnnnnnmmkigeccbchjilnngdhfhmjcQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABJaddkmlhejlihifeghggjlmmmnnnnnnnnnnjRCBBBCDPhoponnnnnnnnnnmmlkhfdcbbchjjmonfehfhmicRCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACNbddkllheilihhedefeglmmmmnnnnnnnnnnjRCBBBCDPhopoonnnnnnnmmlllkhecbbcdhjknonfegfhkhcSDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADObccikkhehkjihdcdedglmmmmmnnnnnnnnnjSCBBBBDPhppnonnnnnnmmlllkkiecbbeghjkmnldegehkhcTFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADObcbhkkhegjjihdcdedgllllmmmnmmmnnnniRCBBBBDPhopnnnnnnnmmmlllkkjgdbbeghjlmmidfgehjgcTFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACOacafkkhefhjjhcbdedillllmmmmmmmmmnnjRCBBBCDPgoonnnnnmmmmllllkkjifccbdfjllkheggfiifaTGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACOZdaejljffgiihcaccbhkkllllmmmmmmmnnjRCBBBCCPgoonnnnnmmmmlllkkkjjgebZYdilljhfgggiifaTIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADNYebeikkhffhhgcaaaahjjkllllllllllmmjRCBBBCDPgoonnnnnmmmmlllkkjiihfcYXeklkigfghhiidZUKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADNYebdikkigfghhcZZZahjjkkkllllllmmmmiRCBBBCCPgnonnnnnnnmllllkkjiihfbYZhkkkhffghhihcZUKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADNWecchkkjgfghgdbbZahjikkkklllllmmmmiQCABBCCPgnnnnnnnnnmllllkkjjhgdaYajlijgefghijicZUKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADOWedbgkkjhgfggeabZZgjijkkkkklllmmmmiQBABBCDOfnnnnnnnmmmllllkkkjheaYYajkhigefhiiihcYUKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEOVeebgkkkigfggfZYXZgjjkkkkkkklllmmmhPBABBCCOfnnmnnnmmmmlllllkkifaYYYbikhigfghiiihbYUKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBADOUeebgllkjhggggYWXZgjjkkkkkkklllmmmhQBABBCCOgmomnnnmmmmlllllkkhcYXXZcijiihghiihigaXTKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBAEOUdfbfllkkihgggYWXZhjjjjkkkkllllmmlhPBAABBCOfnnnnnmnmmllllllkkgaXXYadijihgghhhhhgaWTKBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBENTdfbfllkkjihhgYWXahjjjjklllllllmmlhPBAAABDOgnnnnnmnmmllllllkkfZXYYaeijhhhhhhhhhgZVTKBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBDLScfbfllkkjjjigYVXahjjjjklkkllllmmlhPBAAABDPfnonnnnnmmmlllllkjeZYYZbehjiihhihhhhfZWTKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAACIRbfcflkkkkjjigYVYagjjjjklllllllmllhPBAAABEPfnonnnnnnmlllllllibZZZabdgjiiihiiihheZXUKBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFQaecflkjjjjjigYVYagjjjjklllklllmllhQBAAABEPfnonnnnnnmmllllljfaZZabcdehjjiiiiiigcZaVLCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGPZeceijjjjjjhfYVYZfjjkkklllklllmllhQBAAABEPfnonnonnnnmmmlllicZZacccZbgijjjjjjigccdZNDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAEMRYfedehijjjjifXVYZdijkkkkllklllmllhQBAAAAEPfmonnonnnnmmmlllhcZZaccbUWehjjjkkjjihhhdQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABENUUahgccfikkkkifXWYYbgjkkkkllklllmllhQBAAAAEPfmnnnnnnnnmlllllhcaZacdaRTcgklllkkmmmmlgTGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHSXXcijggiklmlkieXXZZadhjjkkkkklllllliRCAAABEPemnnnnnonnmlllljfbaZacdbPNcjllmmmmopooniWJBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHTYafjkklmnnnmlifXYaZZbgjjkkkkllllllljSCAAABDOelnnnnnonmmlkkkhebZZacdbOKemnmmnnopppoljaOEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGTZdhjjlnnnooomjfYZbaZZdijkkjkklllmlljSDAAAADOdlmnnnnnnmmlkkjgbaZZbccaPQhnnmmnooppqnhhcRHBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGTafjjjlmnnooomjgabdbYYcijkkkkklllmlmkTDAAAADOdkmnnnnnnnllkkidaaZZbccbUVjnmmmnnmljigbaWQICAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGTafjjklmnoooonlieddbYXbgjjjkjklllmlmkTDAAAADOelnnnnnnnmllkjgcaaZabccbXXknmlmllhbWVVUQKJEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFSaeiklmnnooooonkgedcYWZfijjjjklllllmkTDAAAADOelnnnnnnnmlkjiebaaabccbbYYlomlkgbWTQQQQMFEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFSaceghhhijlnoonlheccaWYdijjjjkkllllmkTDABAADOelmnnnnmnmlkjgcaaaabbbbbYZkmjfdZTQQQPPOLDCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEOSTTTTSSSVZfknnmifcbbYYdijjjjjkklllmkTDAAAADOelmnnnnnnmlkifbaaabbbaaaZZfgZRQQQQQQPOOKCBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACFHIJKLMLLORWbgkljhcabaYchjjjjjkklllmkTDAAAACNdlmnonnnnmmkhecbbbbaaaaaZYXWOLPQQRRQONOLCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBCFILMNMMOQQSWbgiidZabZagjjjjjjkkllmkTDABAACNdknnnnnnmmlkhecbccbaaaabZWRMILPQQRRRONOLCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABACHKNOOONOPOOPRVbifaZaZagjjjjjjkkllljSDABAACNdkmnnnnnmmlkgdccccbaaaabaVOHEJOPQRRRPOOKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACIMOOPPPPPOONLJRfidaaYagjjjjjjjkklljSDABAACNdkmnnnnnmmljgdccdcbaaaaabYOFEJNOPQRQPNNKCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACINOPPPPPPOONJDIYigdbZZeijjjjkkkkkliRCAAAABMbkmnnnnmmmljfdccdcbaaaaadcNDEINOPPQQONNKDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHMOPPPPPPOONICETgigdaZchjjjjjkkkkkiRCAAAAAJZknnnnnmmmljfdddccbaaZabedNCDHMPPPPPOONKEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHMOPPPPPOOOMHCGUeggfdaaeijjjjkkkkkhPBAAAAAIYknnnnmmmlliedcccbaaaabdgeOBCGLOPPPPOONKFBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHMOPPPPPOOOMGCHTadghgcachjjjkkkkkkfOAAAAAAIYknnnmmmllkheccbbbaaabdfhfNBBEKNOOPPOONKFBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHMOPPPPPOOOLEDKSWbeghecbehjjkkkkkjfNAAAAAAIYknnmmlllkjgdcbbbbaaabehifOBBEJNOOPPPONKFBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHMOOOPPOOONJDHPUYccdffeccfijkkkkkjeNAAAAAAIYknnmmllkjigdcbbbbaaacfhifSEBEJNOPPPOONKFCBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABHMNOOPPOOONHDKTWbedcdghecdikkkkkkkdLAAAAAAIYknmmmllkjhfedbbbbaaadgiheVHBDKOPPPPOOMKFBABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIMNOPPOOONMHCJTWbfecbehgedhklllllkcJAAAAAAIZkmllllkkigfedcbbbbbcfijidUJBCJOPPPPOONKFBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIMNOOOOOONLHCIUXbfedaZafgfgjkllllkcIAAAAAAIYkmmmllkjhgfedccbbbcehjjhbTKCCJOOPPPOONKFBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACIMNNOOOOONKGBKWXbeeecZXbggfiklllkkcIAAAAAAIYjmmmllkigffeedccbbcgjkjhbTMECINNOPPOOMKFBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACJMNNNOOOONJFBKXXZdffgcZYacfikkkkkkcIABBBABHXjmmmlkjigfeeedddcdehkkjgbTNFCHMNNOPONMKFBBAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADJMNNNOOOOMJECLXXXbefgfcaZZdijkkkkkcIAABBABHWimmmmljigfeeeddeefhijjifbTOHCHMNNOOONMKFBBAABBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADJMNNNOOOOMIECMXWXadfggecbabfjkjkkkcIAABBAAGWhlmmmljigfeeeeeefhijjigebVPJDGLNNNONNMKFBBABBAAAAAAAAAAAAAAAAAA"

-- Zubin
for i = 0, #Zubin - 1 do
	-- Zubin
	local val = Base64.CharToNum(Zubin:sub(i + 1, i + 1)) / 63 -- Zubin
	local x = (i - 0) % 128
	local y = math.floor(i / 128)
	
	-- Zubin
	local part = Instance.new("Part", workspace)
	part.Size = Vector3.new(PIXEL_SIZE, 1, PIXEL_SIZE)
	part.Anchored = true
	part.Color = Color3.new(val, val, val)
	part.Position = Vector3.new(x * PIXEL_SIZE + OFFSET.X, 0.5, y * PIXEL_SIZE + OFFSET.Y)
end