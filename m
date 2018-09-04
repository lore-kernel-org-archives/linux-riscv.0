From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 4 Sep 2018 11:08:35 -0700
Subject: [PATCH v2 3/3] RISC-V: Support cpu hotplug.
In-Reply-To: <20180831061859.GC19292@infradead.org>
References: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
 <1535445370-19004-4-git-send-email-atish.patra@wdc.com>
 <20180831061859.GC19292@infradead.org>
Message-ID: <0d439b9d-b3d0-7d2c-117b-abb37adf769c@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 8/30/18 11:19 PM, Christoph Hellwig wrote:
>> +#else
>> +static inline bool can_hotplug_cpu(void) { return 0; }
>> +static inline void arch_send_call_wakeup_ipi(int cpu) { }
> 
> Please use normal coding style for these stubs.

Done.
> 
>>   #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
>> +#define get_scause(cause)	(cause & ~INTERRUPT_CAUSE_FLAG)
> 
> I think this helper is misleading - the cause includes the interrupt
> flag.  I'd rather open code this in the other place as well.
> 

ok. Done.

>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index d7c6ca7c..cb209139 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -42,6 +42,13 @@ void arch_cpu_idle(void)
>>   	local_irq_enable();
>>   }
>>   
>> +#ifdef CONFIG_HOTPLUG_CPU
>> +void arch_cpu_idle_dead(void)
>> +{
>> +	cpu_play_dead();
>> +}
>> +#endif
> 
> I wonder if it might be worth to introduce a small
> arch/riscv/kernel/cpu-hotplug.c file for the various CONFIG_HOTPLUG_CPU
> only functions.
> 

I have kept it here to match all other arch. Same goes for all hotplug 
functions in smpboot.c

I can move them to a separate file if you think that provides better 
code readability and structure.


Regards,
Atish 		
