module Basic

using Flux

export device, use_gpu
export PositionEmbedding
export Transformer, TransformerDecoder

device(x) = cpu(x)

function use_gpu(use::Bool)
    if use
        @eval using CuArrays
        @eval device(x) = gpu(x)
    else
        @eval device(x) = cpu(x)
    end
end

include("./position_embed.jl")
include("./mh_atten.jl")
include("./transformer.jl")



end