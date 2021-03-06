<?php
/*
This file is part of iCE Hrm.

iCE Hrm is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

iCE Hrm is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with iCE Hrm. If not, see <http://www.gnu.org/licenses/>.

------------------------------------------------------------------

Original work Copyright (c) 2012 [Gamonoid Media Pvt. Ltd]  
Developer: Thilina Hasantha (thilina.hasantha[at]gmail.com / facebook.com/thilinah)
 */
 
$moduleName = 'leaves';
define('MODULE_PATH',dirname(__FILE__));
include APP_BASE_PATH.'header.php';
include APP_BASE_PATH.'modulejslibs.inc.php';
?><div class="span9">
			  
	<ul class="nav nav-tabs" id="modTab" style="margin-bottom:0px;margin-left:5px;border-bottom: none;">
		<li class="active"><a id="tabEmployeeLeave" href="#tabPageEmployeeLeave">Leaves Taken</a></li>
		<li><a id="tabEmployeeLeaveSubordinate" href="#tabPageEmployeeLeaveSubordinate">Subordinate Leaves</a></li>
		<li><a id="tabEmployeeLeavePending" href="#tabPageEmployeeLeavePending">Pending Leaves</a></li>
		<li><a id="tabEmployeeLeaveApproved" href="#tabPageEmployeeLeaveApproved">Approved Leaves</a></li>
		<li><a id="tabEmployeeLeaveCancelled" href="#tabPageEmployeeLeaveCancelled">Cancelled Leaves</a></li>
		<li><a id="tabEmployeeLeaveRejected" href="#tabPageEmployeeLeaveRejected">Rejected Leaves</a></li>
	</ul>
	 
	<div class="tab-content">
		<div class="tab-pane active" id="tabPageEmployeeLeave">
			<div id="EmployeeLeave" class="reviewBlock" data-content="List" style="padding-left:5px;">
		
			</div>
			<div id="EmployeeLeaveForm" class="reviewBlock" data-content="Form" style="padding-left:5px;display:none;">
		
			</div>
		</div>
		<div class="tab-pane active" id="tabPageEmployeeLeaveSubordinate">
			<div id="EmployeeLeaveSubordinate" class="reviewBlock" data-content="List" style="padding-left:5px;">
		
			</div>
			<div id="EmployeeLeaveSubordinateForm" class="reviewBlock" data-content="Form" style="padding-left:5px;display:none;">
		
			</div>
		</div>
		<div class="tab-pane" id="tabPageEmployeeLeavePending">
			<div id="EmployeeLeavePending" class="reviewBlock" data-content="List" style="padding-left:5px;">
		
			</div>
			<div id="EmployeeLeavePendingForm" class="reviewBlock" data-content="Form" style="padding-left:5px;display:none;">
		
			</div>
		</div>
		<div class="tab-pane" id="tabPageEmployeeLeaveApproved">
			<div id="EmployeeLeaveApproved" class="reviewBlock" data-content="List" style="padding-left:5px;">
		
			</div>
			<div id="EmployeeLeaveApprovedForm" class="reviewBlock" data-content="Form" style="padding-left:5px;display:none;">
		
			</div>
		</div>
		<div class="tab-pane" id="tabPageEmployeeLeaveRejected">
			<div id="EmployeeLeaveRejected" class="reviewBlock" data-content="List" style="padding-left:5px;">
		
			</div>
			<div id="EmployeeLeaveRejectedForm" class="reviewBlock" data-content="Form" style="padding-left:5px;display:none;">
		
			</div>
		</div>
		<div class="tab-pane" id="tabPageEmployeeLeaveCancelled">
			<div id="EmployeeLeaveCancelled" class="reviewBlock" data-content="List" style="padding-left:5px;">
		
			</div>
			<div id="EmployeeLeaveCancelledForm" class="reviewBlock" data-content="Form" style="padding-left:5px;display:none;">
		
			</div>
		</div>
		
	</div>

</div>
<!--<script>
var modJsList = new Array();

modJsList['tabEmployeeLeave'] = new EmployeeLeaveAdapter('EmployeeLeave','EmployeeLeave');
modJsList['tabEmployeeLeave'].setShowAddNew(true);
modJsList['tabEmployeeLeave'].setShowSave(false);
modJsList['tabEmployeeLeave'].setShowDelete(true);
modJsList['tabEmployeeLeave'].setShowEdit(false);

var modJs = modJsList['tabEmployeeLeave'];

</script>-->
<script>
var modJsList = new Array();

modJsList['tabEmployeeLeave'] = new EmployeeLeaveAdapter('EmployeeLeave');
modJsList['tabEmployeeLeaveSubordinate'] = new EmployeeLeaveAdapter('EmployeeLeave');
modJsList['tabEmployeeLeavePending'] = new EmployeeLeaveAdapter('EmployeeLeave','EmployeeLeavePending',{"leave_status":2});
modJsList['tabEmployeeLeavePending'].setShowAddNew(false);
modJsList['tabEmployeeLeavePending'].setShowEdit(false);
modJsList['tabEmployeeLeavePending'].setShowDelete(false);
modJsList['tabEmployeeLeaveApproved'] = new EmployeeLeaveAdapter('EmployeeLeave','EmployeeLeaveApproved',{"leave_status":1});
modJsList['tabEmployeeLeaveApproved'].setShowAddNew(false);
modJsList['tabEmployeeLeaveApproved'].setShowEdit(false);
modJsList['tabEmployeeLeaveApproved'].setShowDelete(false);
modJsList['tabEmployeeLeaveCancelled'] = new EmployeeLeaveAdapter('EmployeeLeave','EmployeeLeaveCancelled',{"leave_status":4});
modJsList['tabEmployeeLeaveCancelled'].setShowAddNew(false);
modJsList['tabEmployeeLeaveCancelled'].setShowEdit(false);
modJsList['tabEmployeeLeaveCancelled'].setShowDelete(false);
modJsList['tabEmployeeLeaveRejected'] = new EmployeeLeaveAdapter('EmployeeLeave','EmployeeLeaveRejected',{"leave_status":3});
modJsList['tabEmployeeLeaveRejected'].setShowAddNew(false);
modJsList['tabEmployeeLeaveRejected'].setShowEdit(false);
modJsList['tabEmployeeLeaveRejected'].setShowDelete(false);




<?php if(isset($modulePermissions['perm']['Add Leave']) && $modulePermissions['perm']['Add Leave'] == "No"){?>
modJsList['tabEmployeeLeave'].setShowAddNew(false);
<?php }?>
<?php if(isset($modulePermissions['perm']['Delete Leave']) && $modulePermissions['perm']['Delete Leave'] == "No"){?>
modJsList['tabEmployeeLeave'].setShowDelete(false);
<?php }?>
modJsList['tabEmployeeLeave'].setShowEdit(false);
//<?php if(isset($modulePermissions['perm']['Edit Leave']) && $modulePermissions['perm']['Edit Leave'] == "No"){?>
//modJsList['tabEmployeeLeave'].setShowEdit(false);
//<?php }?>

var modJs = modJsList['tabEmployeeLeave'];

</script>
<?php include APP_BASE_PATH.'footer.php';?>      