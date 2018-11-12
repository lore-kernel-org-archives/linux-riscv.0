From: mick@ics.forth.gr (Nick Kossifidis)
Date: Mon, 12 Nov 2018 06:33:49 +0200
Subject: SBI extension proposal v2
In-Reply-To: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
Message-ID: <11ad3063d779721695f0ac775bc114c1@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hello Atish,

???? 2018-11-10 04:42, Atish Patra ??????:
> Hi,
> I have updated the proposal based on feedback received on previous
> version. This version has a better scalable SBI Function ID
> numbering scheme. I have adopted markdown formatting for github docs.
> 
> If you prefer a github interface, it's available here as well.
> 
> https://github.com/riscv/riscv-sbi-doc/pull/12
> 
> Looking forward to your feedback.
> 
> Regards,
> Atish
> ------------------------------------------------------------------------
> 
> ## Introduction:
> This is a proposal to make SBI a flexible and extensible interface.
> It is based on the foundation policy of RISC-V i.e. modularity and
> openness. The proposal tries to introduces very few new mandatory SBI
> Functions, that are absolutely required to maintain backward
> compatibility. Everything else is optional so that it remains an open
> standard yet robust.
> 
> The current RISC-V SBI only defines a few mandatory functions such as
> inter-processor interrupts (IPI) interface, reprogramming timer, serial
> console, and memory barrier instructions. The existing SBI 
> documentation
> can be found here [1]. Many important functionalities such as power
> management/cpu-hotplug are not yet defined due to difficulties in
> accommodating modifications without breaking the backward compatibility
> with the current interface.
> 
> The proposed design is inspired by Power State Coordination Interface
> (PSCI) from ARM world. However, it adds only two new mandatory SBI
> calls providing version information and supported Functions, unlike
> PSCI where a significant number of functions are mandatory. The
> version of the existing SBI will be defined as a minimum version(0.1)
> which will always be backward compatible. Similarly, any Linux kernel
> with a newer feature will fall back if an older version of SBI does
> not support the updated capabilities. Both the operating system and
> SEE can be implemented to be two way backward compatible.
> 

Let's remove any references to Linux, it can be misleading since
this is supposed to be used by every OS.

> ## SBI Calling Conventions (TODO)
> There are some suggestions[3] to distinguish between SBI function
> return value and SBI calling sequence return value. Here are the few
> possible discussed ideas.
> 
> 1. Return a single value, but values in the range {-511, -1} are
> considered errors, whereas return values in the range {0, 2^XLEN-512}
> are considered success.
> 

I'm thinking about compatibility between a 64bit firmware and a 32bit
supervisor and vice-versa. If we report back values that can't fit
within 32bits, this is going to break things.

> 2. Every SBI function call may return the following structure
> ```
> struct valerr {
>   long value;
>   long error;
> };
> ```
> According to the RISC-V ABI spec[4], both a0 & a1 registers can be
> used for function return values.
> 

This makes sense, however let's allow for this to be extensible,
there may be SBI calls that want to return something more, there
may also be SBI calls that are asynchronous so it's a good idea I
think to also include the function id there. Also please let's use
typed integers instead. How about something like this:

struct sbi_report {
  uint32_t status;
  uint32_t value;
  uint32_t function_id;
  uint8_t has_payload;
  uint16_t payload_size;
  /* 1 byte hole */
  void payload[];
};

> 3. Introduce an extra argument that can return error by reference.
> ```
> /* Returns the CPU that was started.
>  * @err indicates an error ID if one occurred, otherwise 0.
>  * @err can be NULL if no error detection is required.
> */
> int start_cpu(int cpu_num,..., Error *err);
> ```
> Both approaches (2 & 3) will work, but there will be two versions of
> existing SBI functions to maintain the compatibility.
> 

If we keep the first field of sbi_report as the status code then
3 is equivalent to 2. If you just want to get the status/error code
you cast the pointer to uint32_t* instead of struct sbi_report*.

My vote goes for (1 || 2 with the mods above), meaning that I
believe we should support both, 1 for simple functions that
just want to return a value and 2 for more complex functions
that want to also return a payload or that distinguish the
return value from an error code. Alternatively I'd go with
just 2 with the mods above, since it covers both cases.

> ## SBI Functions:
> 
> A SBI function is an individual feature that SBI interface provides to
> supervisor mode from machine mode. Each function ID is assigned as per
> below section.
> 

As I mentioned on the previous version of your proposal
I'd like to be able to call these functions from U and
HS/HU modes as well. I think having a limitation for
accessing M mode only from S mode is wrong.

> #### SBI Function ID numbering scheme:
> A Function Set is a group of SBI functions which collectively
> implement similar kind of feature/functionality. The function ID
> numbering scheme need to be scalable in the future. At the same time,
> function validation check should be as quick as possible. Keeping
> these two requirements in mind, a hybrid function ID scheme is
> proposed.
> 
> SBI Function ID is u32 type.
> 
> ```
> 31            24                        0
> -----------------------------------------
> |O|            |                        |
> -----------------------------------------
> Function Set   | Function Type          |
> ```
> Bit[31]    =  ID overflow bit
> 
> Bit[30:24] =  Function Set
> 
> Bit[23:0]  =  Function Type within Function Set
> 
> The Function set is Bits [31:24] describing both function set number
> and overflow bit. In the beginning, the overflow bit should be set to
> **zero** and the function Type per function set can be assigned by
> left shifting 1 bit at a time. The overflow bit can be set to one
> **only** when we need to allocate more than 24 functions per function
> set in future. Setting the overflow bit will indicate an integer
> function type scheme. Thus, there will more than enough function IDs
> available to use in the future. Refer appendix 1 for examples.
> 
> Here are few Function Sets for SBI v0.2:
> 
> | Function Set         | Value  | Description       |
> | -------------------  |:------:| 
> :--------------------------------------------|
> | Base Functions       | 0x00   | Base Functions mandatory for any SBI 
> version |
> | HART PM Functions    | 0x01   | Hart UP/Down/Suspend Functions for
> per-Hart power management|
> | System PM Functions  | 0x02   | System Shutdown/Reboot/Suspend for
> system-level power management|
> | Vendor Functions     | 0x7f   | Vendor specific Functions|
> 
> N.B. There is a possibility that different vendors can choose to
> assign the same function numbers for different functionality. That's
> why vendor specific strings in Device Tree/ACPI or any other hardware
> description document can be used to verify if a specific Function
> belongs to the intended vendor or not.
> 
> # SBI Function List in both SBI v0.2 and v0.1
> 
> |Function Type              | Function Set      | ID(v0.2)     |ID 
> (v0.1)  |
> |---------------------------| 
> ------------------|:------------:|:---------:|
> | sbi_set_timer             | Base              | 0x00 000000  |0       
>    |
> | sbi_console_putchar       | Base              | 0x00 000001  |1       
>    |
> | sbi_console_getchar       | Base              | 0x00 000002  |2       
>    |
> | sbi_clear_ipi             | Base              | 0x00 000004  |3       
>    |
> | sbi_send_ipi              | Base              | 0x00 000008  |4       
>    |
> | sbi_remote_fence_i        | Base              | 0x00 000010  |5       
>    |
> | sbi_remote_sfence_vma     | Base              | 0x00 000020  |6       
>    |
> | sbi_remote_sfence_vma_asid| Base              | 0x00 000040  |7       
>    |
> | sbi_shutdown              | System PM         | 0x02 000000  |8       
>    |
> | sbi_system_reset          | System PM         | 0x02 000001  |-       
>    |
> | sbi_get_version           | Base              | 0x00 000080  |-       
>    |
> | sbi_get_function_mask     | Base              | 0x00 000100  |-       
>    |
> | sbi_get_function_count    | Base              | 0x00 000200  |-       
>    |
> | sbi_hart_up               | Hart PM           | 0x01 000000  |-       
>    |
> | sbi_hart_down             | Hart PM           | 0x01 000001  |-       
>    |
> | sbi_hart_suspend          | Hart PM           | 0x01 000002  |-       
>    |
> | sbi_hart_state            | Hart PM           | 0x01 000004  |-       
>    |
> 

While I agree with the concept of categorizing functions, I think the
implementation is a bit complicated. We can just have function id
ranges instead of wasting a byte for encoding a category within the
function id. Also this approach will be backwards compatible with the
function ids we already have on current SBI.

Encoding function sets and a bitmask for functions, along with
the overflow bit on the function id seems overly complicated to me
and I don't see what we gain from this. We are wasting bits for
sets that may have only a few functions and need to support
overflow for sets that are larger than 24 functions which is not
that much, especially if you take vendor sets into account.
I understand that you want this bitmask for reporting back the list
of available functions per set but this can be done differently. For
example we can use introduce a function called sbi_call_check(uint32_t
function_id) and expect SBI_ERR_SUCCESS or SBI_ERR_NOT_SUPPORTED.

Also with regards to the DT/ACPI the hardware vendor doesn't always
imply firmware vendor. I think we should be more specific here.
Also needing a side channel to understand which vendor specific
function we are calling is suboptimal. We might want to call
a vendor specific SBI call for example before parsing DT or
ACPI.

I believe we should use GUIDs for vendor specific function calls
instead of function ids. Normally these are 128bit long (RFC 4122)
but we can get away with 64bits. Instead of allowing a range of
function ids for vendors, we can just specify one call to rule
them all, something like:

int sbi_vendor_call(uint32_t vfid_high, uint32_t vfid_low, void* arg)

under the hood this can be an SBI call e.g. with fid 0x10000000 that
takes 3 arguments (already supported), with the pointer on the 3rd
argument to point to a struct with the vendor call arguments on
call, and a pointer contain a struct sbi_report on return.

> #### Function Description
> 
> This section describes every newly introduced(in v0.2) function in
> details. Please refer to [1] for any v0.1 functions.
> 
> ```
> u32 sbi_get_version(void):
> ```
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
> ```
> u32 sbi_get_function_mask(u32 ftype)
> ```
> Given a function set type, it returns a bitmask of all functions IDs
> that are implemented for that function set.
> 
> ```
> u32 sbi_get_function_count(u32 ftype, u32 start_fid, unsigned long 
> count):
> ```
> 
> This is a **reserved** function that should only be used if overflow
> bit in SBI function ID is set.
> 
> Accepts a start_Function_id as an argument and returns if
> start_Function_id to (start_Function_id + count - 1) are supported or
> not.
> 
> A count can help in minimizing the number of the M-mode traps by
> checking a range of SBI functions together.
> 

As I mentioned above I thing this complicates things and forces a
suboptimal function id encoding. We can instead introduce something
like sbi_call_check() instead. As for the vendor calls, we can also
introduce:

int sbi_vendor_call_check(uint32_t vfid_high, uint32_t vfid_low);

Another reason I find sbi_vendor_call/sbi_vendor_call_check better
is because the function names follow the rest of the namespace scheme.
I'll come back to that later on.

> ```
> int sbi_hart_up(unsigned long hartid, unsigned long start, unsigned
> long priv)
> ```
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
> ```
> int sbi_hart_suspend(u32 state, unsigned long resume_entry, unsigned
> long priv)
> ```
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
> ```
> int sbi_hart_down()
> ```
> It powers off the hart and will be used in cpu-hotplug.
> Only individual hart can remove itself from supervisor mode. It can be
> moved to normal state only by sbi_hart_up function.
> 
> Return the appropriate SBI error code.
> 
> ```
> u32 sbi_hart_state(unsigned long hartid)
> ```
> Returns the RISCV_POWER_STATE for a specific hartid. This will help 
> make
> kexec like functionality more robust.
> 

I still think that it would be better to have sbi_hart_set_state and
sbi_hart_get_state instead of having different calls for different
states but I guess it's a matter of taste. Could we at least
use sbi_hart_get_state instead of sbi_hart_state to be consistent
with the rest of the calls that contain get/set on their name ?

> ```
> void sbi_system_reset(u32 reset_type)
> ```
> Reset the entire system.
> 

Could we please rename sbi_shutdown to sbi_system_shutdown so that
it's consistent with the _system_ namespace/category ?

> ## Return error code Table:
> Here are the SBI return error codes defined.
> 
> | Error Type               | Value  |
> | -------------------------|:------:|
> |  SBI_ERR_SUCCESS         |  0     |
> |  SBI_ERR_FAILURE         | -1     |
> |  SBI_ERR_NOT_SUPPORTED   | -2     |
> |  SBI_ERR_INVALID_PARAM   | -3     |
> |  SBI_ERR_DENIED          | -4     |
> |  SBI_ERR_INVALID_ADDRESS | -5     |
> 
> 

Since success is not error, could we call them status codes or just
return codes instead ?

Thank you for your time and effort on this !

Regards,
Nick
