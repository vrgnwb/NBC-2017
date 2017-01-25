#### NOTE: USE ONLY SET SHARE PATH ,SHARE PERMISSION ,OWNERSHIP IN ACL SETTING
## Create  DISKS 
* NAS disks disk1 (normal shares)
* disk2 (Share Quota) 
* BIO disk3 ( ISCSI) . 

## 1. Share Creation  
* Create 5 shares on disk1 and 8 users 

### Shares:

1. Artwork_Ingest 
2. Raw_data 
3. Final_data 
4. Final_edit 
5. Editor

### Users:

1. artwork 
2. admin 
3. editor 
4. satypal 
5. nagendra 
6. umesh 
7. rahul 
8. trendra


|share/users| Artwork_Ingest | Raw_data  |  Final_data |   Final_edit  |Editor|
| :------- | ----: | :---: |:------:  | :-----:|:-----:|
| admin    | RW    | RW    | RW       | RW     | RW    |
| artwork  | RW    | R     | RW       | R      | R     |
| editor   | R     | R     | RW       | RW     | RW    |
| satypal  | R     | R     | X        | R      | RW    |
| nagendra | X     | R     | R        | RW     | RW    |
| umesh    | X     | R     | X        | RW     | RW    |
| rahul    | RW    | RW    | RW       | RW     | RW    |
| trendra  | RW    | RW    | RW       | RW     | R     |

R—Read only
RW—Read write both

* Take a screenshot of dispalying all users  and shares upload in git

  - user.png
  - share.png

* login as  admin and create admin directory in all share and show property of admin folder in all share by right click and upload the image in git.

  - artwork_ingest.png 
  - raw_data.png 
  - final_data.png 
  - final_edit.png 
  - editor.png

## 2. Access Restrictions  
* Create a share netweb on disk1 Give ownership to admin.

* Create two directory in netweb FBD and delhi 
* rahul can do  
  - Read write in delhi.
  - Read only on FBD .
* umesh can do 
  - Read write on FBD.  
  - Read Only on delhi.

* take screenshot of rahul access  delhi share name it 
  - rahul_delhi.png
* take a screenshot of failure access of FBD share name  it
  - rahul_fbd.png

* set the limit for each user 10 GB.
* Login as rahul and  copy 15 GB file ; `error should be occured` take screen shot upload as 
  - rahul_limit.png

## 3. IP Risrictions  
* Create a share final, deny this share by specific IP .`( mentiond in instructions sheet )`
* login with unrestricted IP and create a folder  .  take screen shot and  uplaod as
  - access_ip.png
* login with restricted IP .`Error Should Occure` . Take the screen shot and  upload as 
  - deny_ip.png

## 4. ISCSI 
* Create ISCSI Target 
* Add  disk3 to Target 
* Access it on windows with the specific initiator .
  - In windows Take screenshot of Manage disk showing that disk upload image as `iscsi_disk.png`

## 5. NFS
* On disk1 create a nfs share and mount it on linux system using nfs.
* Run command `df -h` keep the  output in `nfs_mount.md` file and  upload

## 6. FTP
* Configure a FTP share for Public aceess on disk1. (use share name NTIPL)
* Take the  screenshot and uplaod ftp_public.png
* Configure another share "tyrone", grant read wirte access to "admin"
* Take the screen shot of  ftp client and upload ftp_user.png

## 7. ISCSI LUN Masking
* Riscrict the Target which created  on Qestion 4  for  windows only access ( by giving the access to windows initiator only )
* Access the  same target  on Linux system . Copy the error messsage  in iscsi_lun_masking.md and upload 


## 8. Recyclebin , Auditing
* Enable  Recycling and auditing ( open file, delete file, create dir, RM dir) for final_data ( which created on question 1) .
* copy the files  in to the sahre . 
* Delete the uploaded  files  and  restore them from  Recycle bin .Take the screenshot "recycle.png" and  upload 
* Download the  audit.log and  messages.log  copy them  in to audit_log.md  and  upload 


## 9. Share Quota
* Create Share FIT on disk2 and allow the admin with full permision 
* Set  the share Quota for 10GB.
* Copy 15 GB data on this folder. `Error SHould occure`. Take the  screen shot of error to project_quota.png and  upload.

# Bonus Questions:
## 10. ADS Authentication 
* Connect ADS Server with FS2 .( ADS details  given in  instructons sheet)
* Create a share ADS_TEST give permission to peg user from ADS server on this share. 

