module Darknet
using Libdl

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("Darknet not installed properly, run `] build Darknet', restart Julia and try again")
end
include(depsjl_path)

# Module initialization function
function __init__()
    check_deps()
end

using CEnum

include("ctypes.jl")
export Ctm, Ctime_t, Cclock_t

include(joinpath(@__DIR__, "..", "gen", "libdarknet_common.jl"))
include(joinpath(@__DIR__, "..", "gen", "libdarknet_api.jl"))

include("testing.jl")

end # module Darknet
