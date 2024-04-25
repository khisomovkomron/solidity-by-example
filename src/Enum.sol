// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract Enum{

    enums Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled

    Status public status;

    function get() public view returns(Status){
        return status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    function reset() public {
        delete status;
    }
    }
}