#!/usr/bin/bash

ClusterId=$1
ProcId=$2

echo "Loading enviromental variables from cvmfs.."
source /cvmfs/ship.cern.ch/SHiP-2021/latest/setUp.sh

export ALIBUILD_WORK_DIR=/afs/cern.ch/user/your user name/directory name
source  /afs/cern.ch/user/your user name/config.sh

echo "Loading enviromental variables for the inputs.."
export INPUTPATH=/eos/experiment/ship/user/your user name/ your directory name


RandIn=$INPUTPATH/oldAbove/"$( ls /eos/experiment/ship/user/your user name/ your directory name/Above | shuf -n 1 )"/gntp.0.gst.root

echo "Checking for the output data directory.."
if [  ! -d /eos/experiment/ship/user/your user name/ your directory name/above/"$ClusterId"."$ProcId" ]; then
  mkdir -p /eos/experiment/ship/user/your user name/ your directory name/above/"$ClusterId"."$ProcId"
fi

echo "Processing e-neutrino flavor in between energy range from 10GeV to 350GeV for generator CCDIS"

python /afs/cern.ch/user/your user name/sw/slc7_x86-64/FairShip/master-1/macro/run_simScript.py --Genie -f $RandIn -n 1465 -o /eos/experiment/ship/user/your user name/your directory name/above/"$ClusterId"."$ProcId" 

echo "Events in this range has been produced!"
