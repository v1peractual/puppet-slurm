# Fact: threadcountpercpu
#
# Purpose: Return the number of threads per core/cpu
#
# Rants: Nacho Barrientos <nacho.barrientos@cern.ch>
#
Facter.add('threadcountpercpu') do
  confine :kernel => :linux

  setcode do
    sockets = Facter.value(:physicalprocessorcount).to_i
    vcpus = Facter.value(:processorcount).to_i
    corespercpu = Facter.value(:corecountpercpu).to_i
    vcpus / (sockets * corespercpu)
  end
end
