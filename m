From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 20 Apr 2018 13:22:28 -0700 (PDT)
Subject: [PATCH v6 01/16] initrd: Add weakly-linked generic
 free_initrd_mem.
In-Reply-To: <87tvs8rcrr.fsf@xps13.shealevy.com>
Message-ID: <mhng-72f2db2a-5505-4736-b39b-66b85db4d21c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 18 Apr 2018 04:10:16 PDT (-0700), shea at shealevy.com wrote:
> Hi all,
>
> Shea Levy <shea@shealevy.com> writes:
>
>> This function is effectively identical across 14 architectures, and
>> the generic implementation is small enough to be negligible in the
>> architectures that do override it. Many of the remaining divergent
>> implementations can be included in the common code path in future,
>> further reducing code duplication and sharing improvements between
>> architectures.
>>
>> Series boot-tested on RISC-V (which now uses the generic
>> implementation) and x86_64 (which doesn't).
>>
>> v6: Add information about build/run testing.
>> v5: Add more complete commit messages.
>> v4: Use weak symbols instead of Kconfig.
>> v3: Make the generic path opt-out instead of opt-in.
>> v2: Mark generic free_initrd_mem __init.
>>
>> Signed-off-by: Shea Levy <shea@shealevy.com>
>> ---
>>  init/initramfs.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/init/initramfs.c b/init/initramfs.c
>> index 7e99a0038942..c8fe150f958a 100644
>> --- a/init/initramfs.c
>> +++ b/init/initramfs.c
>> @@ -526,6 +526,11 @@ extern unsigned long __initramfs_size;
>>  #include <linux/initrd.h>
>>  #include <linux/kexec.h>
>>  
>> +void __init __weak free_initrd_mem(unsigned long start, unsigned long end)
>> +{
>> +       free_reserved_area((void *)start, (void *)end, -1, "initrd");
>> +}
>> +
>>  static void __init free_initrd(void)
>>  {
>>  #ifdef CONFIG_KEXEC_CORE
>> -- 
>> 2.16.2
>
> This series has been quiet for a few weeks other than picking up some
> arch-specific acks. What is the next step here?

I'm not sure.  I don't really think it's sane for the RISC-V tree because it 
touches so many architectures -- I haven't looked closely, though.  IIRC 
there's a slight behavior change to the RISC-V port, which I'd be OK taking 
through my tree (and then obviously the RISC-V cleanup as well, unless it goes 
in as a whole patch set).

For the IRQ cleanup I currently have in flight

* Add the generic support
* Move every arch over (RISC-V is in, the rest aren't yet)
* Clean up a bit now that everyone is generic

That lets all the arch-specific patches go in parallel, but can be a bit of a 
headache to manage.

I'm adding Arnd and Olof, as they know a lot more about Linux than I do.  
Here's the top-level of the v4 patch set: https://lkml.org/lkml/2018/3/28/744
