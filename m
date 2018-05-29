From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 28 May 2018 18:15:03 -0700
Subject: [PATCH v2 0/2] Fix timer initialization and Add support hotplug.
In-Reply-To: <e11c2853-acc6-a9b8-f8e0-9843c7af38ab@wdc.com>
References: <mhng-bca33b19-024e-4906-9dfe-2dc542d4d98c@palmer-si-x1c4>
 <e11c2853-acc6-a9b8-f8e0-9843c7af38ab@wdc.com>
Message-ID: <8634608d-e2ef-799f-bc80-ea6ab07a0f89@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 5/21/18 1:43 PM, Atish Patra wrote:
> On 5/18/18 5:37 PM, Palmer Dabbelt wrote:
>> On Wed, 09 May 2018 15:02:20 PDT (-0700), atish.patra at wdc.com wrote:
>>> The patch (1/2)fixes issues around timer initialization. This fix is
>>> required for CPU hotplug to work. That's why they are clubbed into one
>>> series. I can separate them if required.
>>>
>>> Changes from v1 to v2:
>>> 1. Removed compiler warnings about unused variables.
>>>
>>> Atish Patra (2):
>>>     RISCV: Register clocksource and events correctly
>>>     RISCV: Support cpu hotplug.
>>>
>>>    arch/riscv/Kconfig                | 11 ++++++-
>>>    arch/riscv/include/asm/csr.h      |  1 +
>>>    arch/riscv/include/asm/smp.h      |  9 ++++--
>>>    arch/riscv/kernel/head.S          | 12 +++++++
>>>    arch/riscv/kernel/process.c       |  7 +++++
>>>    arch/riscv/kernel/setup.c         | 17 ++++++++++
>>>    arch/riscv/kernel/smpboot.c       | 66 +++++++++++++++++++++++++++++++++++++--
>>>    arch/riscv/kernel/time.c          |  9 +-----
>>>    arch/riscv/kernel/traps.c         |  6 ++--
>>>    drivers/clocksource/riscv_timer.c | 44 +++++++++++++++++---------
>>>    include/linux/cpuhotplug.h        |  1 +
>>>    11 files changed, 150 insertions(+), 33 deletions(-)
>>
>> Sorry I'm a bit slow here: I was meaning to fix this up.  I think this patch
>> set was made against something like riscv-all, which has a bunch of additional
>> cruft in it.
> 
> Yeah. It is based on riscv-all because my changes also depend on initial
> timer patches.
> 
> Do you mind updating it to be against Linus' master?
> 
> I can do it. But my patches won't work without the initial timer
> patches. I am not sure how to proceed in that case.
> 
> Do you want only hotplug patch (2/2) or I can squash the entire
> wip-timer patches into couple of sane ones and post them to mailing list ?
> 

As per our discussion, these patches has to be part of wip-timer until
interrupt issues are straightened and ready for upstream. All the timer 
related patches will go on top of it.

> Regards,
> Atish
> 
>>
> 
> 
I was reviewing the base timer patches. I have a question about the patch.
clocksource: New RISC-V SBI timer driver (ea8ec64).

The riscv_timer.h has a well defined per hart timer explanation in the 
comment and following function declaration. However, I can't find any 
reference to following functions.

+void timer_riscv_init(int cpu_id,
+		      unsigned long riscv_timebase,
+		      int (*next_event)(unsigned long, struct clock_event_device *));
+
+void clocksource_riscv_init(unsigned long long (*rdtime)(struct 
clocksource *));

Are these redundant code or I missed something ?

If you agree with me, I can send a v3 removing these (will move the 
comment to riscv_timer.c).


Regards,
Atish
