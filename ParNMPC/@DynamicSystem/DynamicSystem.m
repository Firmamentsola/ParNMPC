classdef DynamicSystem < handle
   properties
      dim % dimension - sturct
      u % symbolic variable
      x % symbolic variable
      p % symbolic variable
      f % symbolic function
      M % symbolic function
      isMEnabled = false; % enable dot x = inv(M)*f
   end
   methods
      function plant = DynamicSystem(uDim,...
                                     xDim,...
                                     pDim)
          % init dim
          plant.dim.u = uDim;
          plant.dim.x = xDim;
          plant.dim.p = pDim;
          % create symVar
          plant.u = sym('u',[plant.dim.u,1]);
          plant.x = sym('x',[plant.dim.x,1]);
          plant.p = sym('p',[plant.dim.p,1]);
      end
      setf(plant,f)
      setM(plant,M)
      varargout = setStateName(plant,varargin)
      varargout = setInputName(plant,varargin)
      varargout = setParameterName(plant,varargin)
      codeGen(plant)
   end
end