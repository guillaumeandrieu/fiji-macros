/*
 GA 2017 RGB stack to 1 image 
 Version 1.0
 */


macro "RGB stack to 1 image Action Tool - C000C111C222C333C444D35D36D37D38D39D3aD45D4aD55D65D75D85D95Da5Db5Dc5Dc6C444C555C666C777C888C999CaaaD13D14D15D16D17D18D23D28D33D43D53D63D73D83D93Da3Da4CaaaCbbbCcccCdddCeeeCfffD00D01D02D03D04D05D06D07D08D09D0aD0bD0cD0dD0eD0fD10D11D12D19D1aD1bD1cD1dD1eD1fD20D21D22D24D25D26D27D29D2aD2bD2cD2dD2eD2fD30D31D32D34D3bD3cD3dD3eD3fD40D41D42D44D46D47D48D49D4bD4cD4dD4eD4fD50D51D52D54D56D5dD5eD5fD60D61D62D64D66D68D69D6aD6bD6dD6eD6fD70D71D72D74D76D78D79D7aD7bD7dD7eD7fD80D81D82D84D86D88D89D8aD8bD8dD8eD8fD90D91D92D94D96D98D99D9aD9bD9dD9eD9fDa0Da1Da2Da6Da8Da9DaaDabDadDaeDafDb0Db1Db2Db3Db4Db6Db8Db9DbaDbbDbdDbeDbfDc0Dc1Dc2Dc3Dc4Dc8Dc9DcaDcbDcdDceDcfDd0Dd1Dd2Dd3Dd4Dd5Dd6Dd8Dd9DdaDdbDddDdeDdfDe0De1De2De3De4De5De6DedDeeDefDf0Df1Df2Df3Df4Df5Df6Df7Df8Df9DfaDfbDfcDfdDfeDff"{

//Open images

open();

dir = getDirectory("image"); 
  name=getTitle; 
  path = dir+name; 

run("Stack to Images");
selectWindow("Blue");
close();
selectWindow("Green");
close();
selectWindow("Red");
run("8-bit");
run("Grays");
saveAs("Tiff", path);
close();

}
