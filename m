From: darius@bluespec.com (Darius Rad)
Date: Wed, 13 Jun 2018 12:49:49 -0400
Subject: On Supporting no-FPU machines
In-Reply-To: <CAK8P3a1F0zYX_v6KDkO-DT9+Ud13Vmt9aWa7vF=K1AHJxVMp8g@mail.gmail.com>
References: <20180613062653.GA14518@andestech.com>
 <20180613063217.GA12182@infradead.org>
 <CAK8P3a1bC1PgkV6n=HkSB7EnbEWGZYUo8CsDWtUh-xoLWg+rpA@mail.gmail.com>
 <20180613072012.GA5293@infradead.org> <20180613072044.GA3064@infradead.org>
 <CAK8P3a1F0zYX_v6KDkO-DT9+Ud13Vmt9aWa7vF=K1AHJxVMp8g@mail.gmail.com>
Message-ID: <ab7149dd-1bcb-b000-b990-08fd48cfee21@bluespec.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 06/13/2018 08:29 AM, Arnd Bergmann wrote:
> On Wed, Jun 13, 2018 at 9:20 AM, Christoph Hellwig <hch@infradead.org> wrote:
>> On Wed, Jun 13, 2018 at 12:20:12AM -0700, Christoph Hellwig wrote:
>>> On Wed, Jun 13, 2018 at 08:47:00AM +0200, Arnd Bergmann wrote:
>>>>> A separate CONFIG_FPU to not build the FPU code sounds fine to me
>>>>> as long as it defaults to on.
>>>>
>>>> If we do this, that option must also take care to disable the FPU hardware
>>>> if it exists. Otherwise you might run into the situation of having a system
>>>> intended to run without FPU access but a task uses FPU registers anyway
>>>> (e.g. because the compiler decides it is faster that way on the
>>>> microarchitecture it is optimizing for) and we fail to save/restore the FPU
>>>> state between task switches.
>>>
>>> I'm not sure we can force this.  It would require a write to misa,
>>> which requires M-mode privileges.
> 
> That also means we can't have lazy save/restore of the FPU context,
> trapping on the first access to an FPU register from a user space
> task before swapping out the previous task's state, right?
> 

The FS field of the sstatus register, available in supervisor mode,
should be sufficient for lazy context save/restore.  The FS field could
also serve to prevent use of the FPU with a kernel compiled without
support for one.

>> [send too early]
>>
>> Instead we should just refuse to boot a !CONFIG_FPU kernel on a system
>> with a FPU.
> 
> Sure, that would work.
> 
>           Arnd
> 
