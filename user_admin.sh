#!/usr/bin/bash

select var in add_user delete_user_keep_data delete_user_with_data show_user_details enable_user disable_user add_group add_user_to_group delete_user_from_group Exit 
do         
	case $var in
	        add_user )                          
				read -p "Enter User Name: " name
				check=`id $name 2>/dev/null`
				if [ -z $check 2> /dev/null ]
				then
				     useradd $name
					echo User added
				else
				    echo User Exist!!!
				fi                          
			;;                 
			delete_user_keep_data )
			    read -p "Enter User You want To delete and Keep data: " name
				check=`id $name 2>/dev/null`
				if [ -z $check 2> /dev/null ]
				then
					echo "Can't Delete Not Exist User"
				else                                
					userdel $name 2> /dev/null
					echo Deleted
				fi
			;;                 
			delete_user_with_data )
			    read -p "Enter User You want To delete with data : " name
				check=`id $name 2>/dev/null`
				if [ -z $check 2> /dev/null ]
				then                                 
					echo "Can't Delete Not Exist User"
				else                                 
					userdel -r $name 2> /dev/null                                 
					echo Deleted                         
				fi                          
			;;                 
			show_user_details )
			    read -p "Enter User To Show Details: " name 
				check=`id $name 2>/dev/null`                          
				if [ -z $check 2> /dev/null ]                          
				then                                 
					echo User NOT Exist!!!                         
				else                                 
					pinky -l $name
					chage -l $name                         
				fi                        
			;;                 
			enable_user )
			    read -p "Enter User Name to Enable Account: " name
				check=`id $name 2>/dev/null`
				if [ -z $check 2> /dev/null ]
				then                                 
					echo User Not Exist!                         
				else                                 
					isLocked=`passwd --status $name | cut -d" " -f2`
					if [ $isLocked = "PS" ]
					then      
						echo Account already Enabled!
					else                                         
						usermod -U $name
						echo Account Enabled Successfully
					fi
				fi                         
			;;                 
			disable_user )	                
				read -p "Enter User Name to disable Account: " name
				check=`id $name 2>/dev/null`
				if [ -z $check 2> /dev/null ]
				then
					echo User Not Exist!
				else                                 
					isLocked=`passwd --status $name | cut -d" " -f2`
					if [ $isLocked = "LK" ]
					then
					    echo Account already Locked!
					else
					    usermod -L $name
						echo Account Locked Successfully
					fi
				fi                         
			;;                  
			add_group )
			    read -p "Enter Group Name: " name
				if ! [ $(getent group $name) ]
				then                                 
					groupadd $name
					echo Group added
				else
				    echo Group Exist!!!
				fi                          
			;;                 
			add_user_to_group )
			    read -p "Enter User Name you want to add to group: " name
				read -p "Enter Group Name you want to add user in it: " gname
				check=`id $name 2>/dev/null` 
				if [ -z $check 2> /dev/null ]
				then  
			        echo User Not Exist!!!  
				else
				    if [ $(getent group $gname) ]
					then           
					    isUserInGroup=`awk -F : -v  g=$gname  '{ if($1==g) {gsub(","," ",$4); print $4 }}' /etc/group | grep -w $name `
						if [[ -z $isUserInGroup ]]
						then
						    usermod -aG $gname $name
							echo Added user: $name to group $gname successfully
						else
						    echo User already Exist in group!!!
						fi                                  
					else                         
						#NOT EXIST
						echo Group Not Exist!!!
					fi                         
				fi                          
			;;                 
			delete_user_from_group )
			    read -p "Enter User Name you want to delete from group: " name
				read -p "Enter Group Name you want to delete user from it:" gname
				check=`id $name 2>/dev/null`
				if [ -z $check 2> /dev/null ]
				then
				    echo User Not Exist!!!
				else
				    if [ $(getent group $gname) ]
					then
					    isUserInGroup=`awk -F : -v  g=$gname  '{ if($1==g) {gsub(","," ",$4); print $4 }}' /etc/group | grep -w $name `
						if [[ -n $isUserInGroup ]]
						then
						    gpasswd -d $name $gname
							echo Delete user: $name from group $gname successfully
						else                              
						    echo User already not Exist in group!!!
						fi
					else
					    #NOT EXIST
						echo Group Not Exist!!!
					fi                         
				fi                           
			;;
			Exit )    break ;;                            
	    		*) 	  echo Enter Valid Input from 1 to 10!!!;;          
	esac 
done 
