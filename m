From: atish.patra@wdc.com (Atish Patra)
Date: Wed, 31 Oct 2018 13:37:31 -0700
Subject: SBI extension proposal
In-Reply-To: <CAK-hmcSTg=AbXfDwx-O-8WuMsaVbJXP7Jd7HYoFh3jDJHGZ2iQ@mail.gmail.com>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CAK-hmcQeiGa3BwnzEVB_dyhFiC7rXHFN-wTsJomg-jAo7a+v3Q@mail.gmail.com>
 <CAK-hmcSTg=AbXfDwx-O-8WuMsaVbJXP7Jd7HYoFh3jDJHGZ2iQ@mail.gmail.com>
Message-ID: <cf729ca1-3ad0-8fe8-5cfa-d09d6c28d831@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 10/31/18 12:11 PM, Olof Johansson wrote:
> One more try, this time in plain text.
> 
> On Wed, Oct 31, 2018 at 12:01 PM Olof Johansson
> <olof.johansson@gmail.com> wrote:
>>
>> Hi,
>>
>> On Wed, Oct 31, 2018 at 11:23 AM Atish Patra <atish.patra@wdc.com> wrote:
>>>
>>> Here is a proposal to make SBI a flexible and extensible interface.
>>> It is based on the foundation policy of RISC-V i.e. modularity and
>>> openness. It is designed in such a way that it introduces very few new
>>> mandatory SBI APIs that are absolutely required to maintain backward
>>> compatibility. Everything else is optional so that it remains an open
>>> standard yet robust.
>>
>>
>> Thanks for starting this discussion.
>>
>>>
>>> 1. Introduction:
>>> ----------------
>>> The current RISC-V SBI only defines a few mandatory functions such as
>>> inter-processor interrupts (IPI) interface, reprogramming timer, serial
>>> console and memory barrier instructions. The existing SBI documentation
>>> can be found here [1]. Many important functionalities such as power
>>> management/cpu-hotplug are not yet defined due to difficulties in
>>> accommodating modifications without breaking the backward compatibility
>>> with the current interface.
>>>
>>> Its design is inspired by Power State Coordination Interface (PSCI) from
>>> ARM world. However, it adds only two new mandatory SBI calls providing
>>> version information and supported APIs, unlike PSCI where a significant
>>> number of functions are mandatory. The version of the existing SBI will
>>> be defined as a minimum version(0.1) which will always be backward
>>> compatible. Similarly, any Linux kernel with newer feature will fall
>>> back if an older version of SBI does not support the updated
>>> capabilities. Both the operating system and SEE can be implemented to be
>>> two way backward compatible.
>>
>>
>> To clarify: There is no way a kernel can request an older version of the SBI, but with backwards compatibility that shouldn't be required.
>>

Thanks for the additional clarification.
>>> 2. New functions:
>>> -----------------
>>
>>
>> These should have their API numbers specified by each function, including aliases between 0.1 and 0.2.
>>
Sure. I will update the doc in markdown format with a comparison between
0.1 and 0.2

>>>
>>>
>>> -- u32 sbi_get_version(void):
>>>
>>> Returns the current SBI version implemented by the firmware.
>>> version: uint32: Bits[31:16] Major Version
>>>                Bits[15:0] Minor Version
>>>
>>> The existing SBI version can be 0.1. The proposed version will be at 0.2
>>> A different major version may indicate possible incompatible functions.
>>> A different minor version must be compatible with each other even if
>>> they have a higher number of features.
>>>
>>> -- u32 sbi_check_api(unsigned long start_api_id, unsigned long count):
>>>
>>> Accepts a start_api_id as an argument and returns if start_api_id to
>>>
>>> (start_api_id + count - 1) are supported or not.
>>> The API numbering scheme is described in section 3.
>>>
>>> A count is introduced so that a range of APIs can be checked at one SBI
>>> call to minimize the M-mode traps.
>>
>>
>> This will quickly fall back to a one-by-one probe if one of the early count IDs are unavailable. It's likely to mostly be done at boot time anyway, and the number of functions will be relatively limited. It's also possible we'll have a sparse numbering scheme in the future. Returning a 32-bit bitmap starting at start_api_id might be a more flexible approach.
>>

In that case, does it make more sense to have an get_feature_list() like
API instead. This can return a bitmap of all features based on API set
id (Bit[31:24]).


>> Also, API numbers are 32-bit, but it takes unsigned long? Having fixed length types here would be useful, to avoid confusion with ILP32/LP64. Same goes for other functions.
>>

Yeah. It was a typo. I will change the API numbers to unsigned long as well.

>>> -- int sbi_hart_up(unsigned long hartid, unsigned long start, unsigned
>>> long priv)
>>>
>>> Brings up "hartid" either during initial boot or after a sbi_hart_down
>>> SBI call.
>>>
>>> "start" points to a runtime-specified address where a hart can enter
>>> into supervisor mode. This must be a physical address.
>>>
>>> "priv" is a private data that caller can use to pass information about
>>> execution context.
>>>
>>> Return the appropriate SBI error code.
>>>
>>> -- int sbi_hart_suspend(u32 state, unsigned long resume_entry, unsigned
>>> long priv)
>>>
>>> Suspends the calling hart to a particular power state. Suspended hart
>>> will automatically wake-up based on some wakeup events at resume_entry
>>> physical address.
>>>
>>> "priv" is a private data that caller can use to pass information about
>>> execution context. The SBI implementation must save a copy so that
>>> caller can reuse while restoring hart from suspend.
>>>
>>> Return the appropriate SBI error code.
>>>
>>> -- int sbi_hart_down()
>>>
>>> It powers off the hart and will be used in cpu-hotplug.
>>> Only individual hart can remove itself from supervisor mode. It can be
>>> moved to normal state only by sbi_hart_up function.
>>>
>>> Return the appropriate SBI error code.
>>>
>>> -- u32 sbi_hart_state(unsigned long hartid)
>>>
>>> Returns the RISCV_POWER_STATE for a specific hartid. This will help make
>>> kexec like functionality more robust.
>>>
>>> -- void sbi_system_shutdown()
>>>
>>> Powers off the entire system.
>>
>>
>> This is a slightly weird one to put in SBI. There's usually other actions needed for _system_ level shutdown, such as external power regulators.
>>

This might be because of my limited knowledge on power management.
We already have a system reset call in SBI & PSCI also had system 
shutdown function. As per my understanding, this API will provide a way
to handle all common suspend related operations on machine mode.
In case of virtual OS, it will not result in any external power regulations.

>>
>>> 3. SBI API ID numbering scheme:
>>> ------------------------------
>>> An API Set is a set of SBI APIs which collectively implement some
>>> kind of feature/functionality.
>>>
>>> Let's say SBI API ID is u32  then
>>> Bit[31:24] =  API Set Number
>>> Bit[23:0] = API Number within API Set
>>>
>>> Here are few API Sets for SBI v0.2:
>>> 1. Base APIs
>>> API Set Number: 0x0
>>> Description: Base APIs mandatory for any SBI version
>>>
>>> 2. HART PM APIs
>>> API Set Number: 0x1
>>> Description: Hart UP/Down/Suspend APIs for per-Hart
>>> power management
>>>
>>> 3. System PM APIs
>>> API Set Number; 0x2
>>> Description: System Shutdown/Reboot/Suspend for system-level
>>> power management
>>>
>>> 4. Vendor APIs
>>> API Set Number: 0xff
>>> Description: Vendor specific APIs.
>>> There is a possibility that different vendors can choose to assign same
>>> API numbers for different functionality. In that case, vendor specific
>>> strings in Device Tree can be used to verify if a specific API belongs
>>> to the intended vendor or not.
>>
>>
>> Yeah, having a binding for description of <function,version> to SBI API ID in DT will be needed, especially once "vendor" becomes fluid (projects migrating between vendors, mixing and matching, etc).
>>
>> Having long-lived vendor extensions are usually a bad idea, but it's also common to need a place to do custom support or to prove out next-generation API versions.
>>
>> How strict guidelines might we need/want here?
>>

Do you mean guidelines for managing different vendor specific APIs ?
Vendor specific static strings in SBI are not encouraged. I currently 
don't see any other methods than DT as you described. Any other possible 
approach is fine. But, I fear if we don't make the guidelines strict, 
insanity may prevail as different vendors choose to manage it in their 
own way. Any downside on mandating the guidelines?


>>
>>> 4. Return error code Table:
>>> ---------------------------
>>>
>>> Here are the SBI return error codes defined.
>>>
>>>         SBI_SUCCESS           0
>>>         SBI_NOT_SUPPORTED    -1
>>>         SBI_INVALID_PARAM    -2
>>>         SBI_DENIED           -3
>>>         SBI_INVALID_ADDRESS  -4
>>>
>>> A mapping function between SBI error code & Linux error code should be
>>> provided.
>>
>>
>> This isn't Linux-specific, and what Linux maps it to is sort of out of scope for this spec.
>>
Agreed. I will remove this statement.

>> (There's no generic "failed" return code, or -EAGAIN equivalent?)
>>

Correct. I will add it.

>>> 5. Power State
>>> --------------
>>>
>>> A RISC-V core can exist in any of the following power states.
>>>
>>> enum RISCV_POWER_STATE {
>>>          //Powered up & operational.
>>>          RISCV_HART_ON              =  0,
>>>          //Powered up but at reduced energy consumption. WFI instruction
>>> can be used to achieve this state.
>>>          RISCV_HART_STANDBY        =   1,
>>>          //Deeper low power state. No reset required but higher wakeup
>>> latency.
>>>          RISCV_HART_RETENTION       =  2,
>>>          //Powered off. Reset of the core required after power restore.
>>>          RISCV_HART_OFF             =  3
>>> }
>>
>>
>> If this table changes, we'd need a new SBI version covering the new numbers. That's probably OK -- a future version can introduce a separate power state numbering scheme if needed too.
>>
>>> TODO:
>>> Any other power management related features or state?
>>
>>
>> We probably also need system-level power state reporting at some point, and non-HART components (caches, memory, etc).  Likely aligned with platform specs, once those start to show up.
>>

Sure.

>>> 6. Implementation
>>> -------------------
>>> Currently, SBI is implemented as a part of BBL. There is a different SBI
>>> implementation available in coreboot as well.
>>>
>>> Alternatively, a separate open BSD/MIT licensed SBI project can be
>>> created which can be used by anybody to avoid these kind of SBI
>>> fragmentation in future. This project can generate both a firmware
>>> binary (to executed directly in M mode) or a static library that can be
>>> used by different boot loaders. It will also help individual boot
>>> loaders to either work from M or S mode without a separate SBI
>>> implementation.
>>
>>
>> Strong +1 on providing a shared place for a reference implementation that different code bases can import, and a place for vendors to upstream their vendor-specific pieces if needed.
>>

Great. Thank you for reviewing the proposal.

Regards,
Atish
>>> This proposal is far from perfect and absolutely any suggestion is
>>> welcome. Obviously, there are many other functionalities that can be
>>> added or removed from this proposal. However, I just wanted to start
>>> with something that is an incremental change at best to kick off the
>>> discussion. The aim here is initiate a discussion that can lead to a
>>> robust SBI specification.
>>>
>>> Looking forward to discuss other ideas as well or any feedback on this
>>> proposal.
>>>
>>> Reference:
>>> -----------
>>> [1]
>>> http://infocenter.arm.com/help/topic/com.arm.doc.den0022d/Power_State_Coordination_Interface_PDD_v1_1_DEN0022D.pdf
>>> [2] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.md
>>>
>>
>>
>> -Olof
> 
