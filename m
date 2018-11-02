From: mick@ics.forth.gr (Nick Kossifidis)
Date: Fri, 02 Nov 2018 17:24:01 +0200
Subject: SBI extension proposal
In-Reply-To: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
Message-ID: <3245c74a8dc9f651cb07e382585fa311@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hello Atish and thanks for bringing this up,

???? 2018-10-31 20:23, Atish Patra ??????:
> Here is a proposal to make SBI a flexible and extensible interface.
> It is based on the foundation policy of RISC-V i.e. modularity and
> openness. It is designed in such a way that it introduces very few new
> mandatory SBI APIs that are absolutely required to maintain backward
> compatibility. Everything else is optional so that it remains an open
> standard yet robust.
> 
> 1. Introduction:
> ----------------
> The current RISC-V SBI only defines a few mandatory functions such as
> inter-processor interrupts (IPI) interface, reprogramming timer, serial
> console and memory barrier instructions. The existing SBI documentation
> can be found here [1]. Many important functionalities such as power
> management/cpu-hotplug are not yet defined due to difficulties in
> accommodating modifications without breaking the backward compatibility
> with the current interface.
> 
> Its design is inspired by Power State Coordination Interface (PSCI) 
> from
> ARM world. However, it adds only two new mandatory SBI calls providing
> version information and supported APIs, unlike PSCI where a significant
> number of functions are mandatory. The version of the existing SBI will
> be defined as a minimum version(0.1) which will always be backward
> compatible. Similarly, any Linux kernel with newer feature will fall
> back if an older version of SBI does not support the updated
> capabilities. Both the operating system and SEE can be implemented to
> be two way backward compatible.
> 
> 2. New functions:
> -----------------
> 
> -- u32 sbi_get_version(void):
> 
> Returns the current SBI version implemented by the firmware.
> version: uint32: Bits[31:16] Major Version
>              Bits[15:0] Minor Version
> 
> The existing SBI version can be 0.1. The proposed version will be at 
> 0.2
> A different major version may indicate possible incompatible functions.
> A different minor version must be compatible with each other even if
> they have a higher number of features.
> 
> -- u32 sbi_check_api(unsigned long start_api_id, unsigned long count):
> 
> Accepts a start_api_id as an argument and returns if start_api_id to
> (start_api_id + count - 1) are supported or not.
> The API numbering scheme is described in section 3.
> 
> A count is introduced so that a range of APIs can be checked at one SBI
> call to minimize the M-mode traps.
> 

Is this really needed ? We can determine the SBI version from 
sbi_get_version, why
include an SBI call to perform a check that can easily be performed by 
the caller
instead ?

> -- int sbi_hart_up(unsigned long hartid, unsigned long start, unsigned
> long priv)
> 
> Brings up "hartid" either during initial boot or after a sbi_hart_down
> SBI call.
> 
> "start" points to a runtime-specified address where a hart can enter
> into supervisor mode. This must be a physical address.
> 
> "priv" is a private data that caller can use to pass information about
> execution context.
> 
> Return the appropriate SBI error code.
> 
> -- int sbi_hart_suspend(u32 state, unsigned long resume_entry, unsigned
> long priv)
> 
> Suspends the calling hart to a particular power state. Suspended hart
> will automatically wake-up based on some wakeup events at resume_entry
> physical address.
> 
> "priv" is a private data that caller can use to pass information about
> execution context. The SBI implementation must save a copy so that
> caller can reuse while restoring hart from suspend.
> 
> Return the appropriate SBI error code.
> 
> -- int sbi_hart_down()
> 
> It powers off the hart and will be used in cpu-hotplug.
> Only individual hart can remove itself from supervisor mode. It can be
> moved to normal state only by sbi_hart_up function.
> 
> Return the appropriate SBI error code.
> 
> -- u32 sbi_hart_state(unsigned long hartid)
> 
> Returns the RISCV_POWER_STATE for a specific hartid. This will help 
> make
> kexec like functionality more robust.
> 

Instead of the above I believe it would be cleaner and simpler to have
an sbi_get_hart_state and an sbi_set_hart_state call. This way we can
better handle state transitions and, handle ON/OFF/STANDBY/RETENTION
and any other state we come up with, without adding extra sbi calls.

> -- void sbi_system_shutdown()
> 
> Powers off the entire system.
> 

Don't we already have that ? What's the difference between 
sbi_system_shutdown
and sbi_shutdown ? Does it make sense to use sbi_shutdown and leave the 
system
on with all the harts down ? Maybe we can just say that sbi_shutdown 
also
powers down the system and rename it to sbi_system_shutdown with the 
same
function ID.

> 3. SBI API ID numbering scheme:
> ------------------------------
> An API Set is a set of SBI APIs which collectively implement some
> kind of feature/functionality.
> 
> Let's say SBI API ID is u32  then
> Bit[31:24] =  API Set Number
> Bit[23:0] = API Number within API Set
> 
> Here are few API Sets for SBI v0.2:
> 1. Base APIs
> API Set Number: 0x0
> Description: Base APIs mandatory for any SBI version
> 
> 2. HART PM APIs
> API Set Number: 0x1
> Description: Hart UP/Down/Suspend APIs for per-Hart
> power management
> 
> 3. System PM APIs
> API Set Number; 0x2
> Description: System Shutdown/Reboot/Suspend for system-level
> power management
> 
> 4. Vendor APIs
> API Set Number: 0xff
> Description: Vendor specific APIs.
> There is a possibility that different vendors can choose to assign
> same API numbers for different functionality. In that case, vendor
> specific strings in Device Tree can be used to verify if a specific
> API belongs to the intended vendor or not.
> 

I understand the rationale behind this but I believe it's better to
call them services or functions instead of APIs, they are not sets
of APIs the way I see it. Also since we are moving that path why call
it SBI and restrict it only to be used by the supervisor ? I'd love to
have another category for the secure monitor calls for example,
but on the software architecture that we are discussing on the TEE
group, such calls can also originate from U mode or HS/HU modes.
The same goes for vendor specific calls, there are lots of use case
scenarios where vendors would like to be able to call their stuff
from U mode for example (e.g. a user space library talking to a
smart card directly).

I suggest we rename it from SBI to something more generic that is not
defined by who is calling it but by what we are calling, which in this
case is the firmware (FBI?). Since you mentioned ARM, in their case
the ABI used for PSCI is the Secure Monitor Call (which is the 
alternative
to what is defined on the first paragraph of the SBI document), but it
has the same limitation. According to the documentation if an SMC comes
from a user application, we get an undefined exception. We can do better 
!


> 4. Return error code Table:
> ---------------------------
> 
> Here are the SBI return error codes defined.
> 
>       SBI_SUCCESS           0
>       SBI_NOT_SUPPORTED    -1
>       SBI_INVALID_PARAM    -2
>       SBI_DENIED           -3
>       SBI_INVALID_ADDRESS  -4
> 
> A mapping function between SBI error code & Linux error code should be
> provided.
> 

I believe it should be up to the OS to translate the SBI error codes to 
its
native ones.

> 5. Power State
> --------------
> 
> A RISC-V core can exist in any of the following power states.
> 
> enum RISCV_POWER_STATE {
>        //Powered up & operational.
>        RISCV_HART_ON              =  0,
>        //Powered up but at reduced energy consumption. WFI instruction
> can be used to achieve this state.
>        RISCV_HART_STANDBY        =   1,
>        //Deeper low power state. No reset required but higher wakeup
> latency.
>        RISCV_HART_RETENTION       =  2,
>        //Powered off. Reset of the core required after power restore.
>        RISCV_HART_OFF             =  3
> }
> 
> TODO:
> Any other power management related features or state?
> 

How about LOCKSTEP ? We could have a way of declaring a hart as a 
"mirror" of another
hart (https://en.wikipedia.org/wiki/Lockstep_(computing)). We can have 
an extra argument
on sbi_get/set_state when the LOCKSTEP state is used, that will get/set 
the hart that
this hart is mirroring.

> 6. Implementation
> -------------------
> Currently, SBI is implemented as a part of BBL. There is a different
> SBI implementation available in coreboot as well.
> 
> Alternatively, a separate open BSD/MIT licensed SBI project can be
> created which can be used by anybody to avoid these kind of SBI
> fragmentation in future. This project can generate both a firmware
> binary (to executed directly in M mode) or a static library that can
> be used by different boot loaders. It will also help individual boot
> loaders to either work from M or S mode without a separate SBI
> implementation.
> 

Why implement this at the boot loader level ? This is more like a 
firmware interface
than something that belongs to the bootloader. The bootloader should use 
this interface
not provide it. Also this is something that belongs to the M mode, a 
bootloader
should belong to the S mode, running the bootloader in M mode is not 
right from
a security point of view. We can provide something like "RISC-V Firmware 
Services"
that's code running on M mode after the first stage boot loader/BootROM 
and let
bootloaders use it without having to implement it. ARM does the same 
with their
ARM Trusted Firmware, their BL31 (Secure Monitor) gets loaded after the 
FSBL and
it then loads (on EL2, the equivalent to our S mode) the bootloader.

> This proposal is far from perfect and absolutely any suggestion is
> welcome. Obviously, there are many other functionalities that can be
> added or removed from this proposal. However, I just wanted to start
> with something that is an incremental change at best to kick off the
> discussion. The aim here is initiate a discussion that can lead to a
> robust SBI specification.
> 
> Looking forward to discuss other ideas as well or any feedback on this 
> proposal.
> 
> Reference:
> -----------
> [1]
> http://infocenter.arm.com/help/topic/com.arm.doc.den0022d/Power_State_Coordination_Interface_PDD_v1_1_DEN0022D.pdf
> [2] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.md
> 
> 
> Regards,
> Atish
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
