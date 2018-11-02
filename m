From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 2 Nov 2018 15:31:03 -0700
Subject: SBI extension proposal
In-Reply-To: <TU4PR8401MB09581F92A2F7C0C7FFFA190EFFCF0@TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CAK-hmcQeiGa3BwnzEVB_dyhFiC7rXHFN-wTsJomg-jAo7a+v3Q@mail.gmail.com>
 <CAK-hmcSTg=AbXfDwx-O-8WuMsaVbJXP7Jd7HYoFh3jDJHGZ2iQ@mail.gmail.com>
 <cf729ca1-3ad0-8fe8-5cfa-d09d6c28d831@wdc.com>
 <TU4PR8401MB09581F92A2F7C0C7FFFA190EFFCF0@TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM>
Message-ID: <7da86c7a-d06a-82ae-ef01-35efeeda7c3a@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 11/1/18 11:31 PM, Chang, Abner (HPS SW/FW Technologist) wrote:
> 
>>>>> -- int sbi_hart_up(unsigned long hartid, unsigned long start,
>>>>> unsigned long priv)
>>>>>
>>>>> Brings up "hartid" either during initial boot or after a
>>>>> sbi_hart_down SBI call.
>>>>>
>>>>> "start" points to a runtime-specified address where a hart can enter
>>>>> into supervisor mode. This must be a physical address.
>>>>>
>>>>> "priv" is a private data that caller can use to pass information
>>>>> about execution context.
>>>>>
>>>>> Return the appropriate SBI error code.
>>>>>
>>>>> -- int sbi_hart_suspend(u32 state, unsigned long resume_entry,
>>>>> unsigned long priv)
>>>>>
>>>>> Suspends the calling hart to a particular power state. Suspended
>>>>> hart will automatically wake-up based on some wakeup events at
>>>>> resume_entry physical address.
>>>>>
>>>>> "priv" is a private data that caller can use to pass information
>>>>> about execution context. The SBI implementation must save a copy so
>>>>> that caller can reuse while restoring hart from suspend.
>>>>>
>>>>> Return the appropriate SBI error code.
>>>>>
>>>>> -- int sbi_hart_down()
>>>>>
>>>>> It powers off the hart and will be used in cpu-hotplug.
>>>>> Only individual hart can remove itself from supervisor mode. It can
>>>>> be moved to normal state only by sbi_hart_up function.
>>>>>
>>>>> Return the appropriate SBI error code.
>>>>>
>>>>> -- u32 sbi_hart_state(unsigned long hartid)
>>>>>
>>>>> Returns the RISCV_POWER_STATE for a specific hartid. This will help
>>>>> make kexec like functionality more robust.
>>>>>
>>>>> -- void sbi_system_shutdown()
>>>>>
>>>>> Powers off the entire system.
>>>>
>>>>
>>>> This is a slightly weird one to put in SBI. There's usually other actions
>> needed for _system_ level shutdown, such as external power regulators.
>>>>
>>
>> This might be because of my limited knowledge on power management.
> In ACPI, it defines the register block to put processor into different levels of sleep mode (suspend mode). However, this requires additional power management controller or processor CSRs on RISC-V. If we don?t consider ACPI and H/W capabilities of power MGMT on RISC-V at this moment, then SBI for processor power management may be needed.
> My question is can SBI_hart_up () to execute "start" even the hart is not in Suspend or Down state? I am asking this because on UEFI we would like to have SBI for supervisor mode firmware to invoke functions provided by M-mode driver, just trying to leverage SBI_hart_up () for this intention. However, "Start" is defined as an address to entry into supervisor mode. We may need to add an additional parameter to this SBI which indicates the privilege to execute "Start" though.
> Forget this if this SBI is dedicated for processor power management. We can propose new SBI for above intention.
> 
int sbi_hart_up(unsigned long hartid, unsigned long start, unsigned
long priv)

It has already a opaque third parameter that can be used to address your 
case. Isn't it ?

>> We already have a system reset call in SBI & PSCI also had system shutdown
> Is system reset call defined in SBI spec as well? I don?t see this in Github.
> 
Sorry. I have made myself confused while writing. You are correct.


Regards,
Atish
>> function. As per my understanding, this API will provide a way to handle all
>> common suspend related operations on machine mode.
>> In case of virtual OS, it will not result in any external power regulations.
> 
> 
> 
> 
> 
> 
