#!/system/bin/sh
# Created By Ryanaepple

SCREEN_ON()    << # >>>>>>> See cat /sys/power/wait_for_fb_wake for status (awake)
{                <<< # Comand like if > fi or do > done
echo "768" > /proc/sys/kernel/random/read_wakeup_threshold  < # >>>>>> parameter value tweak when sceen on to reduce lag ( Value can edit up to 4096 by large pool_size,at High cost of batt)
echo "256" > /proc/sys/kernel/random/write_wakeup_threshold < # >>>>>> parameter value tweak when sceen on to reduce lag  ( Value can edit up to 4096 by large pool_size,at High cost of batt)
}
SCREEN_OFF()   << # >>>>>>> See cat /sys/power/wait_for_fb_sleep for status (sleep)
{                 <<<< # Comand like if > fi or do > done
echo "256" > /proc/sys/kernel/random/read_wakeup_threshold  << # >>>>>> parameter value tweak when sceen off to optimized batt
echo "128" > /proc/sys/kernel/random/write_wakeup_threshold << # >>>>>> parameter value tweak when sceen off to optimized batt
}
(while [ 1 ]; 
do
	cat /sys/power/wait_for_fb_wake; << # >>>>>> parameter tweak when screen on/ awake
	SCREEN_ON;

	cat /sys/power/wait_for_fb_sleep; << # >>>>>> parameter tweak when screen off/sleep
	SCREEN_OFF;
done &);
