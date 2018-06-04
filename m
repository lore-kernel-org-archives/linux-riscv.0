From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 4 Jun 2018 15:34:59 -0700
Subject: [PATCH v2 0/2] Fix timer initialization and Add support hotplug.
In-Reply-To: <mhng-d859aa6f-89c8-4a07-81e6-330dfc23870d@palmer-si-x1c4>
References: <mhng-d859aa6f-89c8-4a07-81e6-330dfc23870d@palmer-si-x1c4>
Message-ID: <c319fbfd-d499-3c4c-c7ec-984ae07996e8@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 6/4/18 3:20 PM, Palmer Dabbelt wrote:
> On Mon, 28 May 2018 18:15:03 PDT (-0700), atish.patra at wdc.com wrote:
>> On 5/21/18 1:43 PM, Atish Patra wrote:
>>> On 5/18/18 5:37 PM, Palmer Dabbelt wrote:
>>>> On Wed, 09 May 2018 15:02:20 PDT (-0700), atish.patra at wdc.com wrote:
>>>>> The patch (1/2)fixes issues around timer initialization. This fix is
>>>>> required for CPU hotplug to work. That's why they are clubbed into one
>>>>> series. I can separate them if required.
>>>>>
>>>>> Changes from v1 to v2:
>>>>> 1. Removed compiler warnings about unused variables.
>>>>>
>>>>> Atish Patra (2):
>>>>>      RISCV: Register clocksource and events correctly
>>>>>      RISCV: Support cpu hotplug.
>>>>>
>>>>>     arch/riscv/Kconfig                | 11 ++++++-
>>>>>     arch/riscv/include/asm/csr.h      |  1 +
>>>>>     arch/riscv/include/asm/smp.h      |  9 ++++--
>>>>>     arch/riscv/kernel/head.S          | 12 +++++++
>>>>>     arch/riscv/kernel/process.c       |  7 +++++
>>>>>     arch/riscv/kernel/setup.c         | 17 ++++++++++
>>>>>     arch/riscv/kernel/smpboot.c       | 66 +++++++++++++++++++++++++++++++++++++--
>>>>>     arch/riscv/kernel/time.c          |  9 +-----
>>>>>     arch/riscv/kernel/traps.c         |  6 ++--
>>>>>     drivers/clocksource/riscv_timer.c | 44 +++++++++++++++++---------
>>>>>     include/linux/cpuhotplug.h        |  1 +
>>>>>     11 files changed, 150 insertions(+), 33 deletions(-)
>>>>
>>>> Sorry I'm a bit slow here: I was meaning to fix this up.  I think this patch
>>>> set was made against something like riscv-all, which has a bunch of additional
>>>> cruft in it.
>>>
>>> Yeah. It is based on riscv-all because my changes also depend on initial
>>> timer patches.
>>>
>>> Do you mind updating it to be against Linus' master?
>>>
>>> I can do it. But my patches won't work without the initial timer
>>> patches. I am not sure how to proceed in that case.
>>>
>>> Do you want only hotplug patch (2/2) or I can squash the entire
>>> wip-timer patches into couple of sane ones and post them to mailing list ?
>>>
>>
>> As per our discussion, these patches has to be part of wip-timer until
>> interrupt issues are straightened and ready for upstream. All the timer
>> related patches will go on top of it.
>>
>>> Regards,
>>> Atish
>>>
>>>>
>>>
>>>
>> I was reviewing the base timer patches. I have a question about the patch.
>> clocksource: New RISC-V SBI timer driver (ea8ec64).
>>
>> The riscv_timer.h has a well defined per hart timer explanation in the
>> comment and following function declaration. However, I can't find any
>> reference to following functions.
>>
>> +void timer_riscv_init(int cpu_id,
>> +		      unsigned long riscv_timebase,
>> +		      int (*next_event)(unsigned long, struct clock_event_device *));
>> +
>> +void clocksource_riscv_init(unsigned long long (*rdtime)(struct
>> clocksource *));
>>
>> Are these redundant code or I missed something ?
>>
>> If you agree with me, I can send a v3 removing these (will move the
>> comment to riscv_timer.c).
> 
> I see these in riscv_timer.c on my copy of wip-timer
> 
>      e56e8bd48eca (HEAD -> wip-timer, kernel.org-palmer/wip-timer) RISCV: Disable timer interrupt in handler to fix nohz.
>      2b030aa93236 RISCV: Support cpu hotplug.
>      1b35cd828f29 RISCV: Register clocksource and events correctly
>      30540340a51e riscv_timer: add support for sched_clock
>      d6ad991df6fa clocksource: RISC-V: Match up with the current DTS
>      c48b6c686f01 Revert "clocksource: riscv_timer: split boot and secondary cpu timer init"
>      baf107699d0f RISC-V: Support per-hart timebase-frequency
>      1e955d9ecfbe clocksource: riscv_timer: split boot and secondary cpu timer init
>      ea8ec6497122 clocksource: New RISC-V SBI timer driver
>      60cc43fc8884 (tag: v4.17-rc1, wip-cpu_hotplog) Linux 4.17-rc1
> 
> did I screw something up?

Nope. Sorry for not being clear enough.

+void timer_riscv_init(int cpu_id,
+		      unsigned long riscv_timebase,
+		      int (*next_event)(unsigned long, struct clock_event_device *));
+
+void clocksource_riscv_init(unsigned long long (*rdtime)(struct 
clocksource *));

I was asking about utility of above two functions added as a part of 
commit ea8ec6497122. I couldn't find any usage of these two.

Shall we remove them and move the comment in that file to riscv_timer.c ?

Regards,
Atish
