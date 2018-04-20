From: shea@shealevy.com (Shea Levy)
Date: Fri, 20 Apr 2018 18:50:09 -0400
Subject: [PATCH v6 01/16] initrd: Add weakly-linked generic
 free_initrd_mem.
In-Reply-To: <mhng-72f2db2a-5505-4736-b39b-66b85db4d21c@palmer-si-x1c4>
References: <mhng-72f2db2a-5505-4736-b39b-66b85db4d21c@palmer-si-x1c4>
Message-ID: <87muxx1oim.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

Palmer Dabbelt <palmer@sifive.com> writes:

> On Wed, 18 Apr 2018 04:10:16 PDT (-0700), shea at shealevy.com wrote:
>> Hi all,
>>
>> Shea Levy <shea@shealevy.com> writes:
>>
>>> This function is effectively identical across 14 architectures, and
>>> the generic implementation is small enough to be negligible in the
>>> architectures that do override it. Many of the remaining divergent
>>> implementations can be included in the common code path in future,
>>> further reducing code duplication and sharing improvements between
>>> architectures.
>>>
>>> Series boot-tested on RISC-V (which now uses the generic
>>> implementation) and x86_64 (which doesn't).
>>>
>>> v6: Add information about build/run testing.
>>> v5: Add more complete commit messages.
>>> v4: Use weak symbols instead of Kconfig.
>>> v3: Make the generic path opt-out instead of opt-in.
>>> v2: Mark generic free_initrd_mem __init.
>>>
>>> Signed-off-by: Shea Levy <shea@shealevy.com>
>>> ---
>>>  init/initramfs.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/init/initramfs.c b/init/initramfs.c
>>> index 7e99a0038942..c8fe150f958a 100644
>>> --- a/init/initramfs.c
>>> +++ b/init/initramfs.c
>>> @@ -526,6 +526,11 @@ extern unsigned long __initramfs_size;
>>>  #include <linux/initrd.h>
>>>  #include <linux/kexec.h>
>>>  
>>> +void __init __weak free_initrd_mem(unsigned long start, unsigned long end)
>>> +{
>>> +       free_reserved_area((void *)start, (void *)end, -1, "initrd");
>>> +}
>>> +
>>>  static void __init free_initrd(void)
>>>  {
>>>  #ifdef CONFIG_KEXEC_CORE
>>> -- 
>>> 2.16.2
>>
>> This series has been quiet for a few weeks other than picking up some
>> arch-specific acks. What is the next step here?
>
> I'm not sure.  I don't really think it's sane for the RISC-V tree because it 
> touches so many architectures -- I haven't looked closely, though.

Yeah, I think that makes sense.

> IIRC 
> there's a slight behavior change to the RISC-V port, which I'd be OK taking 
> through my tree (and then obviously the RISC-V cleanup as well, unless it goes 
> in as a whole patch set).
>

So currently the behavior for RISC-V is changed by simply deleting the
arch-specific free_initrd_mem, which was a noop. Would you like me to
first submit a patch to have the arch-specific free_initrd_mem and then
change that in this series?

>
> For the IRQ cleanup I currently have in flight
>
> * Add the generic support
> * Move every arch over (RISC-V is in, the rest aren't yet)
> * Clean up a bit now that everyone is generic
>
> That lets all the arch-specific patches go in parallel, but can be a bit of a 
> headache to manage.

With the current series, the first patch could go in on its own and all
of the arch-specific patches can go in in parallel if we wanted to, but
beyond the above-suggested implementation of the RISC-V free_initrd_mem
there's no real reordering meaningful here.

>
> I'm adding Arnd and Olof, as they know a lot more about Linux than I do.  
> Here's the top-level of the v4 patch set: https://lkml.org/lkml/2018/3/28/744

And here's the top-level of v6, the latest: https://lkml.org/lkml/2018/4/1/50
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180420/c24e9473/attachment.sig>
