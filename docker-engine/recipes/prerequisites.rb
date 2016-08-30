
#
# Ensure the kernal is okay with docker
if node['kernel']['release'].scan(/^[0-9]*\.[0-9]*/).first.to_f < 3.8
  fail "Unable to install Docker-Engine. Your Kernel must be >= 3.8."
end

