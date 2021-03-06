%% housekeeping
close all
clc
%% rise the model
m=rise('lwz_model','solve_linear',true);

%% get the parameters

[p,priors]=create_parameters(true);

m=set(m,'parameters',p);

%% bring in the data

data=create_data();

%% estimate the model
clc
profile off
profile on
ms=estimate(m,'data',data,...
    'estim_priors',priors,...
    'kf_presample',3,...
    'kf_init_variance',10);
profile off
profile viewer

% 'optimizer','bee_gate','optimset',struct('MaxTime',30*60)