function [F,Fu,Fx] = F_Fu_Fx(u,x,p,discretizationMethod,isMEnabled) %#codegen
    if coder.target('MATLAB') % Simulation
        [F,Fu,Fx] = OCP_F_Fu_Fx(u,x,p,discretizationMethod,isMEnabled);
    else % Code generation
        [xDim,unused] = size(x);
        [uDim,unused] = size(u);
        [pDim,unused] = size(p);
        F = zeros(xDim,1);
        Fu = zeros(xDim,uDim);
        Fx = zeros(xDim,xDim);
        if pDim == 0
            coder.ceval('OCP_F_Fu_Fx',...
                          u,...
                          x,...
                          coder.wref(F),...
                          coder.wref(Fu),...
                          coder.wref(Fx));
        else
            coder.ceval('OCP_F_Fu_Fx',...
              u,...
              x,...
              p,...
              coder.wref(F),...
              coder.wref(Fu),...
              coder.wref(Fx));
        end
    end
end