From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 3 Apr 2018 15:39:58 -0700
Subject: [RFC PR] RISC-V changes for 4.17
In-Reply-To: <mhng-ff37b27e-2f4d-42fb-b899-db173507adae@palmer-si-x1c4>
References: <mhng-ff37b27e-2f4d-42fb-b899-db173507adae@palmer-si-x1c4>
Message-ID: <8a287a52-9efd-9263-de9e-a706f282ff98@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 4/3/18 11:34 AM, Palmer Dabbelt wrote:
> I'd just go with riscv-all: it contains all the patches here as wall as the
> extra drivers.  It's automatically generated from the other trees, so it should
> be pretty straight-forward to check and see that everything in here is in
> there.  This will, of course, all be fixed when we actually manage to get
> enough drivers to boot upstream :).
> 

Fair enough. Ftrace support looks solid. Nothing failed. Few(kprobe & 
histogram) are unsupported which is fine.

Here is the detailed report:

# ./ftracetest -v
=== Ftrace unit tests ===
[1] Basic trace file check	[PASS]
[2] Basic test for tracers      [PASS]
[3] Basic trace clock test	[PASS]
[4] Basic event tracing check	[PASS]
[5] event tracing - enable/disable with event level files	[PASS]
[6] event tracing - restricts events based on pid	[PASS]
[7] event tracing - enable/disable with subsystem level files	[PASS]
[8] event tracing - enable/disable with top level files	[PASS]
[9] ftrace - function graph filters with stack tracer	[PASS]
[10] ftrace - function graph filters	[PASS]
[11] ftrace - function glob filters	[PASS]
[12] ftrace - function pid filters	[PASS]
[13] ftrace - test for function event triggers	[PASS]
[14] ftrace - function profiler with function tracing	[PASS]
[15] ftrace - test reading of set_ftrace_filter	[PASS]
[16] ftrace - test for function traceon/off triggers	[PASS]
[17] Test creation and deletion of trace instances while setting an 
event	[PASS]
[18] Test creation and deletion of trace instances	[PASS]
[19] Kprobe dynamic event - adding and removing	[UNSUPPORTED]
[20] Kprobe dynamic event - busy event check	[UNSUPPORTED]
[21] Kprobe dynamic event with arguments	[UNSUPPORTED]
[22] Kprobe event string type argument	[UNSUPPORTED]
[23] Kprobe event argument syntax	[UNSUPPORTED]
[24] Kprobes event arguments with types	[UNSUPPORTED]
[25] Kprobe event auto/manual naming	[UNSUPPORTED]
[26] Kprobe dynamic event with function tracer	[UNSUPPORTED]
[27] Kprobe dynamic event - probing module	[UNSUPPORTED]
[28] Kretprobe dynamic event with arguments	[UNSUPPORTED]
[29] Kretprobe dynamic event with maxactive	[UNSUPPORTED]
[30] Register/unregister many kprobe events	[UNSUPPORTED]
[31] Kprobe events - probe points	[UNSUPPORTED]
[32] event trigger - test event enable/disable trigger	[PASS]
[33] event trigger - test trigger filter	[PASS]
[34] event trigger - test histogram modifiers	[UNSUPPORTED]
[35] event trigger - test histogram trigger	[UNSUPPORTED]
[36] event trigger - test multiple histogram triggers	[UNSUPPORTED]
[37] event trigger - test snapshot-trigger	[UNSUPPORTED]
[38] event trigger - test stacktrace-trigger	[PASS]
[39] event trigger - test traceon/off trigger	[PASS]
[40] (instance)  Basic test for tracers	[PASS]
[41] (instance)  Basic trace clock test	[PASS]
[42] (instance)  event tracing - enable/disable with event level files 
[PASS]
[43] (instance)  event tracing - restricts events based on pid	[PASS]
[44] (instance)  event tracing - enable/disable with subsystem level 
files	[PASS]
[45] (instance)  ftrace - test for function event triggers	[PASS]
[46] (instance)  ftrace - test for function traceon/off triggers	[PASS]
[47] (instance)  event trigger - test event enable/disable trigger	[PASS]
[48] (instance)  event trigger - test trigger filter	[PASS]
[49] (instance)  event trigger - test histogram modifiers	[UNSUPPORTED]
[50] (instance)  event trigger - test histogram trigger	[UNSUPPORTED]
[51] (instance)  event trigger - test multiple histogram triggers 
[UNSUPPORTED]

# of passed:  31
# of failed:  0
# of unresolved:  0
# of untested:  0
# of unsupported:  20
# of xfailed:  0
# of undefined(test bug):  0

Note: I was getting a lot of rcu stalls probably because of QEMU?s 
speed. Increasing the rcu stall timeout to 300 helped.

Regards,
Atish


> On Tue, 03 Apr 2018 00:22:13 PDT (-0700), Atish.Patra at wdc.com wrote:
>> Hi Palmer,
>> A bit off-topic question:
>> What is the best way to boot/test riscv-linux tree with freedom-u-sdk setup ?
>> The tag riscv-for-linus-4.17-mw0 in riscv-linux repo doesn't boot with qemu in freedom-u-sdk setup.
>> I verified that riscv-all from github boots fine. So I tried cherry-picking the missing changes from riscv-linux to riscv-all branch. It still failed to boot.
>>
>> It might be a my work space specific issue but couldn't identify what's causing it hang.
>>
>> kernel hangs during the boot after:
>> [    0.000000] usbcore: registered new interface driver usb-storage
>> [    0.000000] usbcore: registered new interface driver usbhid
>> [    0.000000] usbhid: USB HID core driver
>> [    0.000000] NET: Registered protocol family 17
>> [    0.000000] Freeing unused kernel memory: 7976K
>> [    0.000000] This architecture does not have kernel memory protection.
>>
>> Regards,
>> Atish
>>
>>
>>> On Apr 2, 2018, at 8:58 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
>>>
>>> Here's the PR I'm planning on submitting to Linus for the first half of the
>>> 4.17 merge window.  Unless anyone knows of any problems I'll submit the PR on
>>> Wednesday morning.  I haven't given this a much testing as I probably should
>>> have, so please go give things a shot!
>>>
>>> I don't want to take any new code for Wednesday, but I'm planning on taking the
>>> perf stuff for next week if some small issues iron themselves out.
>>>
>>> Thanks to everyone for all the help!
>>>
>>>     The following changes since commit 0adb32858b0bddf4ada5f364a84ed60b196dbcda:
>>>
>>>       Linux 4.16 (2018-04-01 14:20:27 -0700)
>>>
>>>     are available in the Git repository at:
>>>
>>>       git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.17-mw0
>>>
>>>     for you to fetch changes up to 7a8e7da42250138adf202ba2596ef7f68651060a:
>>>
>>>       RISC-V: Fixes to module loading (2018-04-02 20:43:14 -0700)
>>>
>>>     ----------------------------------------------------------------
>>>     RISC-V changes for 4.17
>>>
>>>     This tag contains the new features we'd like to incorporate into the
>>>     RISC-V port for 4.17.  We might have a bit more stuff land later in the
>>>     merge window, but I wanted to get this out earlier just so everyone can
>>>     see where we currently stand.
>>>
>>>     A short summary of the changes is:
>>>
>>>     * We've added support for dynamic ftrace on RISC-V targets.
>>>     * There have been a handful of cleanups to our atomic and locking
>>>       routines.  They now more closely match the released RISC-V memory
>>>       model draft.
>>>     * Our module loading support has been cleaned up and is now enabled by
>>>       default, despite some limitations still existing.
>>>
>>>     There's more information in the merge commits for each patch set.
>>>
>>>     ----------------------------------------------------------------
>>>     Alan Kao (6):
>>>           riscv/ftrace: Add RECORD_MCOUNT support
>>>           riscv/ftrace: Add dynamic function tracer support
>>>           riscv/ftrace: Add dynamic function graph tracer support
>>>           riscv/ftrace: Add ARCH_SUPPORTS_FTRACE_OPS support
>>>           riscv/ftrace: Add DYNAMIC_FTRACE_WITH_REGS support
>>>           riscv/ftrace: Add HAVE_FUNCTION_GRAPH_RET_ADDR_PTR support
>>>
>>>     Andrea Parri (3):
>>>           riscv/barrier: Define __smp_{store_release,load_acquire}
>>>           riscv/spinlock: Strengthen implementations with fences
>>>           riscv/atomic: Strengthen implementations with fences
>>>
>>>     Palmer Dabbelt (3):
>>>           RISC-V: Add dynamic ftrace support for RISC-V platforms
>>>           RISC-V: Assorted memory model fixes
>>>           RISC-V: Fixes to module loading
>>>
>>>     Zong Li (11):
>>>           RISC-V: Add sections of PLT and GOT for kernel module
>>>           RISC-V: Add section of GOT.PLT for kernel module
>>>           RISC-V: Support GOT_HI20/CALL_PLT relocation type in kernel module
>>>           RISC-V: Support CALL relocation type in kernel module
>>>           RISC-V: Support HI20/LO12_I/LO12_S relocation type in kernel module
>>>           RISC-V: Support RVC_BRANCH/JUMP relocation type in kernel modulewq
>>>           RISC-V: Support ALIGN relocation type in kernel module
>>>           RISC-V: Support ADD32 relocation type in kernel module
>>>           RISC-V: Support SUB32 relocation type in kernel module
>>>           RISC-V: Enable module support in defconfig
>>>           RISC-V: Add definition of relocation types
>>>
>>>      arch/riscv/Kconfig                  |   8 +
>>>      arch/riscv/Makefile                 |   8 +
>>>      arch/riscv/configs/defconfig        |   2 +
>>>      arch/riscv/include/asm/atomic.h     | 417 +++++++++++++++++++++++-------------
>>>      arch/riscv/include/asm/barrier.h    |  15 ++
>>>      arch/riscv/include/asm/cmpxchg.h    | 391 +++++++++++++++++++++++++++------
>>>      arch/riscv/include/asm/fence.h      |  12 ++
>>>      arch/riscv/include/asm/ftrace.h     |  56 +++++
>>>      arch/riscv/include/asm/module.h     | 113 ++++++++++
>>>      arch/riscv/include/asm/spinlock.h   |  29 +--
>>>      arch/riscv/include/uapi/asm/elf.h   |   7 +
>>>      arch/riscv/kernel/Makefile          |   6 +-
>>>      arch/riscv/kernel/ftrace.c          | 175 ++++++++++++++-
>>>      arch/riscv/kernel/mcount-dyn.S      | 239 +++++++++++++++++++++
>>>      arch/riscv/kernel/mcount.S          |  22 +-
>>>      arch/riscv/kernel/module-sections.c | 156 ++++++++++++++
>>>      arch/riscv/kernel/module.c          | 179 +++++++++++++++-
>>>      arch/riscv/kernel/module.lds        |   8 +
>>>      arch/riscv/kernel/stacktrace.c      |   6 +
>>>      scripts/recordmcount.pl             |   5 +
>>>      20 files changed, 1601 insertions(+), 253 deletions(-)
>>>      create mode 100644 arch/riscv/include/asm/fence.h
>>>      create mode 100644 arch/riscv/include/asm/module.h
>>>      create mode 100644 arch/riscv/kernel/mcount-dyn.S
>>>      create mode 100644 arch/riscv/kernel/module-sections.c
>>>      create mode 100644 arch/riscv/kernel/module.lds
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
