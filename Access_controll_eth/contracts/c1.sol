pragma solidity ^0.4.0;
//import "StringUtils.sol";
//import "github.com/ethereum/dapp-bin/blob/master/library/stringUtils.sol";
contract resident_visiting
{
    
     string public name;
     uint public qr_temp_dur;
     address public sender ;
    
    struct visitor
    {
        string name;
        string phone_num;
        string car_num;
        uint qr_code_expiration;
        string token;
        address resident_address;
        string email;
    }
    
    struct tracking
    {
        string name;
        string phone_num;
        string car_num;
        string location;
        string time;
        address locater;
        address resident;
    }
    
    struct worker
    {
        string name;
        string car_num;
        string qr_code_expiration;
        string token;
        string email;
        string job;
        string days_access;
    }
    
    mapping (uint => visitor) public visitor_struct;
    mapping (uint => tracking) public sec_tracking;
    mapping (uint => worker) public worker_struct;
    
    uint visitor_struct_count;
    uint cars_tracking;
    uint vis_worker;
    
    function init_worker(string _token , string _qr_code_expire,string _email,string _days_access,string _name,string car_num,string _job)
    {
        vis_worker++;
        worker_struct[vis_worker] = worker(_name,car_num,_qr_code_expire,_token,_email,_job,_days_access);
    }    
    
    function init_visiting(string _token , uint _qr_code_expire,string _email,string _phone_num,string _name,string car_num) public
    {
        visitor_struct_count++;
        address _res_address = msg.sender;
        visitor_struct[visitor_struct_count] = visitor(_name,_phone_num,car_num,_qr_code_expire,_token,_res_address,_email);
        
    }
    
    
    
    
    function auth(string _token) public returns(int)
    {
         for (uint i = 1; i <= visitor_struct_count;i++)
         {
            visitor temp = visitor_struct[i];
            string temp_token = temp.token;
            
            if(stringsEqual(temp_token,_token))
            {
                if(temp.qr_code_expiration != 0)
                {
                    visitor_struct[i].qr_code_expiration --;
                    return 1;
                }else
                {
                    return 0;
                }
            }
            
         }
         
         return 0;
    }
    
    function auth_worker(string _token) public returns(string,string)
    {
        for (uint i = 1; i <= vis_worker;i++)
         {
            worker temp = worker_struct[i];
            string temp_token = temp.token;
            
            if(stringsEqual(temp_token,_token))
            {
                return(temp.qr_code_expiration,temp.days_access);
            }
         }
         
         return ("NULL","NULL");
    }
    
    function edit_worker_access(string _email,string _duration,string _days) public returns(int)
    {
        for (uint i = 1; i <= vis_worker;i++)
         {
            worker temp = worker_struct[i];
            string temp_email = temp.email;
            
            if(stringsEqual(temp_email,_email))
            {
                worker_struct[i].qr_code_expiration = _duration;
                worker_struct[i].days_access = _days;
                return 1;
            }
         }
         
         return 0;
        
    }
    
    
    
      function auth_out(string _token) public returns(int)
    {
         for (uint i = 1; i <= visitor_struct_count;i++)
         {
            visitor temp = visitor_struct[i];
            string temp_token = temp.token;
            
            if(stringsEqual(temp_token,_token))
            {
                    return 1;
            }
            
         }
         
         return 0;
    }
    
    
    
    function track(string _car_num,string location , string time) public returns(int) // tracking function
    {
        // step 1 verfy car with visitor struct
        for(uint i = 1; i<= visitor_struct_count; i++)
        {
            visitor temp = visitor_struct[i]; // get visitor complete_data
            if(stringsEqual(temp.car_num,_car_num))
            {                                           // found | log
                cars_tracking++;
                string _name = temp.name;
                string _phone = temp.phone_num;
                address _locater_device = msg.sender;
                address _res_address = temp.resident_address;
                sec_tracking[cars_tracking] = tracking(_name,_phone,_car_num,location,time,_locater_device,_res_address);
                return 1;
            }
            
        }
        return 0;
        
    }
    
    function track_in_out(string _token,string _location,string _time) public returns (int)
    {
        for(uint i = 1; i<= visitor_struct_count; i++)
        {
            visitor temp = visitor_struct[i]; // get visitor complete_data
            if(stringsEqual(temp.token,_token))
            {                                           // found | log
                cars_tracking++;
                string _name = temp.name;
                string _phone = temp.phone_num;
                address _locater_device = msg.sender;
                address _res_address = temp.resident_address;
                sec_tracking[cars_tracking] = tracking(_name,_phone,'_car_num',_location,_time,_locater_device,_res_address);
                return 1;
            }
            
        }
        return 0;
        
    }
    
    
    // Security Building Functions
    
    function get_visitor_count() public returns (uint)
    {
        return visitor_struct_count;
    }
    
    function get_track_logs_count() public returns (uint)
    {
        return cars_tracking;
    }
    
    function get_visitor(uint _index) public returns(string,string,string,uint,string,address,string)
    {
        visitor temp = visitor_struct[_index];
        return (temp.name,temp.phone_num,temp.car_num,temp.qr_code_expiration,temp.token,temp.resident_address,temp.email);
    }
    
    function get_track(uint _index) public returns(string,string,string,string,string,address,address)
    {
        tracking temp = sec_tracking[_index];
        return (temp.name,temp.phone_num,temp.car_num,temp.location,temp.time,temp.locater,temp.resident);
    }
    //--------------------------
    
    
    /*function complete_data(string _token , string _name ,string _sex , string _card_number) public returns(int)
    {
        for (uint i = 1; i <= visitor_struct_count;i++)
         {
            visitor temp = visitor_struct[i];
            string temp_token = temp.token;
            
            if(stringsEqual(temp_token,_token))
            {
                visitor_struct[i].name = _name;
                visitor_struct[i].sex = _sex;
                visitor_struct[i].card_number = _card_number;
                return 1;
            }
            
         }
         
         return 0;
         
         // removed function
    }*/
    
    
    /*function test_data(string _token) public
    {
         for (uint i = 1; i <= visitor_struct_count;i++)
         {
            visitor temp = visitor_struct[i];
            string temp_token = temp.token;
            
            if(stringsEqual(temp_token,_token))
            {
                name = temp.name;
                qr_temp_dur = temp.qr_code_expiration;
                break;
            }
         }
        
    }
    
    
    function test_init() public
    {
        for (uint i = 1; i <= visitor_struct_count;i++)
        {
            visitor temp = visitor_struct[i];
            name = temp.name;
            sender = temp.resident_address;
            break;
        }
    }  */
    
    
    
    function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
		bytes storage a = bytes(_a);
		bytes memory b = bytes(_b);
		if (a.length != b.length)
			return false;
		// @todo unroll this loop
		for (uint i = 0; i < a.length; i ++)
			if (a[i] != b[i])
				return false;
		return true;
	}
    
    
    
    
    
    
    
    
    
    
}