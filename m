From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 28 Aug 2018 17:09:04 -0700 (PDT)
Subject: [PATCH] riscv: Drop setup_initrd
In-Reply-To: <20180828221238.GA6605@roeck-us.net>
Message-ID: <mhng-fadb4889-1082-4cef-a4a6-8faf828c4528@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 28 Aug 2018 15:12:38 PDT (-0700), linux at roeck-us.net wrote:
> On Tue, Aug 28, 2018 at 03:03:00PM -0700, Palmer Dabbelt wrote:
>> On Tue, 28 Aug 2018 14:59:59 PDT (-0700), linux at roeck-us.net wrote:
>> >On Tue, Aug 28, 2018 at 11:46:09PM +0200, Andreas Schwab wrote:
>> >>On Aug 28 2018, Guenter Roeck <linux@roeck-us.net> wrote:
>> >>
>> >>> On Tue, Aug 28, 2018 at 01:10:20PM -0700, Palmer Dabbelt wrote:
>> >>>> On Thu, 09 Aug 2018 21:11:40 PDT (-0700), linux at roeck-us.net wrote:
>> >>>> >setup_initrd() does not appear to serve a practical purpose other than
>> >>>> >preventing qemu boots with "-initrd" parameter, so let's drop it.
>> >>>> >
>> >>>> >Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> >>>> >---
>> >>>> > arch/riscv/kernel/setup.c | 39 ---------------------------------------
>> >>>> > 1 file changed, 39 deletions(-)
>> >>>> >
>> >>>> >diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> >>>> >index 2e56af3281f8..579f58a42974 100644
>> >>>> >--- a/arch/riscv/kernel/setup.c
>> >>>> >+++ b/arch/riscv/kernel/setup.c
>> >>>> >@@ -82,41 +82,6 @@ EXPORT_SYMBOL(empty_zero_page);
>> >>>> > /* The lucky hart to first increment this variable will boot the other cores */
>> >>>> > atomic_t hart_lottery;
>> >>>> >
>> >>>> >-#ifdef CONFIG_BLK_DEV_INITRD
>> >>>> >-static void __init setup_initrd(void)
>> >>>> >-{
>> >>>> >-	extern char __initramfs_start[];
>> >>>> >-	extern unsigned long __initramfs_size;
>> >>>> >-	unsigned long size;
>> >>>> >-
>> >>>> >-	if (__initramfs_size > 0) {
>> >>>> >-		initrd_start = (unsigned long)(&__initramfs_start);
>> >>>> >-		initrd_end = initrd_start + __initramfs_size;
>> >>>> >-	}
>> >>>
>> >>> The underlying problem is probably that __initramfs_size == 512 even
>> >>> if there is no embedded initrd. Result is that initrd_start and initrd_end
>> >>> are always overwritten, even if provided and even if there is no embedded
>> >>> initrd. Result is that initrd_start and initrd_end are always overwritten,
>> >>> and -initrd from the qemu command line is always ignored.
>> >>>
>> >>> A less invasive fix than mine would be
>> >>>
>> >>> -	if (__initramfs_size > 0) {
>> >>> +	if (__initramfs_size > 0 && !initrd_start) {
>> >>>
>> >>> Any chance you can test that with your setup ?
>> >>
>> >>You should just delete the last four lines above.  They serve no purpose.
>> >>
>> >
>> >You mean the entire if() statement plus the variable declarations ?
>> >
>> >That works for me, for both embedded initrd and initrd specified with
>> >-initrd option, but we still need someone to test if it works for
>> >Palmer's use case, ie with vmlinux (and possibly initrd) embedded in
>> >bbl.
>>
>> This still boots my Fedora images
>>
>>    diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>>    index db20dc630e7e..aee603123030 100644
>>    --- a/arch/riscv/kernel/setup.c
>>    +++ b/arch/riscv/kernel/setup.c
>>    @@ -85,15 +85,8 @@ atomic_t hart_lottery;
>>     #ifdef CONFIG_BLK_DEV_INITRD
>>     static void __init setup_initrd(void)
>>     {
>>    -	extern char __initramfs_start[];
>>    -	extern unsigned long __initramfs_size;
>>     	unsigned long size;
>>    -	if (__initramfs_size > 0) {
>>    -		initrd_start = (unsigned long)(&__initramfs_start);
>>    -		initrd_end = initrd_start + __initramfs_size;
>>    -	}
>>    -
>>     	if (initrd_start >= initrd_end) {
>>     		printk(KERN_INFO "initrd not found or empty");
>>     		goto disable;
>>
>> but I have not tried an integrated initramfs.
>
> I tested the above both with external initrd and with integrated
> initramfs; both work for me.
>
> Should I resend my patch, using the above, or do you want to create
> a patch yourself ?

You should send one, then it'll go through my regular pre-PR testing flow to 
make sure it works on my end.  I just never trust these inline patches to be 
exact, even if it's unlikely there's any confusion on a patch this simple (at 
least, mechanically simple -- I'm afraid I still don't understand why the logic 
is incorrect).
