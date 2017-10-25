# disable-middle-click.rb
Disables middle click emulation for ELAN touchpads with libinput. This script is super niche and probably wont be of much value to many people, but I'm going to put it up here on the off chance it comes in handy for anyone else. The reason I wrote this is that the IDs for both the touchpad and the middle click property change on reboot, so there's no quick BASH one liner you can throw in a script. I wrote this in Ruby instead of BASH because I know it better.

### Requirements
* Ruby
* X
* ELAN touchpad
* libinput

### Usage
1. Clone this repo 
```bash
  $ git clone https://github.com/adamrdrew/disable-middle-click.git 
```
2. Make the script executable
```bash
  $ chmod a+x disable-middle-click.rb
```
3. Run the script or put it in your startup applications list


