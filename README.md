Sinple Internet radio stream player for Termux/Other Linx                        

I developed this because Android "helpfully" kept killing my radio stream 
apps. Plays nicely with Termux. 
                                                                       
Uses whiptail for menuing - should be installed by default                            Uses mpv for playing the media                                          

Installation:  
1. Download and copy to a location of your choice;
2. Make sure the path for "bash" is correct for your system

Usage: 
radio.sh for continuous play or                                  
radio.sh n  where 'n' is the number of minutes to play for. E,g radio.sh 45
   plays your chosen stream for 45 minutex

I've included a couple of streams to get you going. When adding your 
own, please note the picky whiptail menu format needs to be preserved.
 
Ctl-C will end the current stream and bring you back to the menu

Works for me; YMMV ;)
