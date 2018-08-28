From: schwab@linux-m68k.org (Andreas Schwab)
Date: Tue, 28 Aug 2018 23:46:09 +0200
Subject: [PATCH] riscv: Drop setup_initrd
In-Reply-To: <20180828212505.GA24238@roeck-us.net> (Guenter Roeck's message of
 "Tue, 28 Aug 2018 14:25:05 -0700")
References: <1533874300-17656-1-git-send-email-linux@roeck-us.net>
 <mhng-7faee2bb-ee3e-48d1-a016-782ebbbb903d@palmer-si-x1c4>
 <20180828212505.GA24238@roeck-us.net>
Message-ID: <87mut6b1we.fsf@igel.home>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Aug 28 2018, Guenter Roeck <linux@roeck-us.net> wrote:

> On Tue, Aug 28, 2018 at 01:10:20PM -0700, Palmer Dabbelt wrote:
>> On Thu, 09 Aug 2018 21:11:40 PDT (-0700), linux at roeck-us.net wrote:
>> >setup_initrd() does not appear to serve a practical purpose other than
>> >preventing qemu boots with "-initrd" parameter, so let's drop it.
>> >
>> >Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> >---
>> > arch/riscv/kernel/setup.c | 39 ---------------------------------------
>> > 1 file changed, 39 deletions(-)
>> >
>> >diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> >index 2e56af3281f8..579f58a42974 100644
>> >--- a/arch/riscv/kernel/setup.c
>> >+++ b/arch/riscv/kernel/setup.c
>> >@@ -82,41 +82,6 @@ EXPORT_SYMBOL(empty_zero_page);
>> > /* The lucky hart to first increment this variable will boot the other cores */
>> > atomic_t hart_lottery;
>> >
>> >-#ifdef CONFIG_BLK_DEV_INITRD
>> >-static void __init setup_initrd(void)
>> >-{
>> >-	extern char __initramfs_start[];
>> >-	extern unsigned long __initramfs_size;
>> >-	unsigned long size;
>> >-
>> >-	if (__initramfs_size > 0) {
>> >-		initrd_start = (unsigned long)(&__initramfs_start);
>> >-		initrd_end = initrd_start + __initramfs_size;
>> >-	}
>
> The underlying problem is probably that __initramfs_size == 512 even
> if there is no embedded initrd. Result is that initrd_start and initrd_end
> are always overwritten, even if provided and even if there is no embedded
> initrd. Result is that initrd_start and initrd_end are always overwritten,
> and -initrd from the qemu command line is always ignored.
>
> A less invasive fix than mine would be
>
> -	if (__initramfs_size > 0) {
> +	if (__initramfs_size > 0 && !initrd_start) {
>
> Any chance you can test that with your setup ?

You should just delete the last four lines above.  They serve no purpose.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
