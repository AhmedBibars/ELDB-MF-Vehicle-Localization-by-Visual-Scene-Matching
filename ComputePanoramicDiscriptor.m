function[Discriptor]= ComputePanoramicDiscriptor(P_MLDB,Frame,ReducedFrameSize,RegionsMat,ComparisonVector)
GrayFrame=rgb2gray(Frame);%SkyBlackining(Frame);
ReducedFrame=imresize(GrayFrame,[ReducedFrameSize,4*ReducedFrameSize]);
NormFrame=LocalNormalize(ReducedFrame,8);
FrontDescriptor=P_MLDB(NormFrame(:,1:ReducedFrameSize),RegionsMat,ComparisonVector);
RearDescriptor=P_MLDB(NormFrame(:,ReducedFrameSize+1:2*ReducedFrameSize),RegionsMat,ComparisonVector);
Side1Descriptor=P_MLDB(NormFrame(:,2*ReducedFrameSize+1:3*ReducedFrameSize),RegionsMat,ComparisonVector);
Side2Descriptor=P_MLDB(NormFrame(:,3*ReducedFrameSize+1:4*ReducedFrameSize),RegionsMat,ComparisonVector);
Discriptor=[FrontDescriptor;RearDescriptor;Side1Descriptor;Side2Descriptor]';
