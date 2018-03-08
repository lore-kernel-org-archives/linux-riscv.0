From: shea@shealevy.com (Shea Levy)
Date: Thu, 08 Mar 2018 14:14:52 -0500
Subject: [PATCH] riscv: Implement free_initrd_mem.
In-Reply-To: <mhng-96c45513-b898-42bc-af9e-f24d9909f489@palmer-si-x1c4>
References: <mhng-96c45513-b898-42bc-af9e-f24d9909f489@palmer-si-x1c4>
Message-ID: <87efkuv0pf.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

Palmer Dabbelt <palmer@sifive.com> writes:

> On Tue, 20 Feb 2018 05:50:43 PST (-0800), shea at shealevy.com wrote:
>> Signed-off-by: Shea Levy <shea@shealevy.com>
>> ---
>>  arch/riscv/mm/init.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index c77df8142be2..1c832b541e95 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -66,5 +66,11 @@ void free_initmem(void)
>>  #ifdef CONFIG_BLK_DEV_INITRD
>>  void free_initrd_mem(unsigned long start, unsigned long end)
>>  {
>> +	if (start == initrd_start)
>> +		start = round_down(start, PAGE_SIZE);
>> +	if (end == initrd_end)
>> +		end = round_up(end, PAGE_SIZE);
>> +
>> +	free_reserved_area((void *)start, (void *)end, -1, "initrd");
>>  }
>>  #endif /* CONFIG_BLK_DEV_INITRD */
>
> It looks like everyone is doing something slightly different here:
>
> * arm64 doesn't round to a page size, and has keep_initrd.
> * arm calls poison_init_mem(), and has keep_initrd.
> * sparc64 doesn't round, and doesn't have a keep_initrd.
> * mips doesn't round, and doesn't have a keep_initrd.
> * x86 rounds end to a page size but not start, and doesn't have a keep_initrd.
>
> It feels like this should be something generic.  I'm adding linux-kernel to see 
> what people think.

Should I try to whip up something generic?

Thanks,
Shea
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180308/74bf8d50/attachment.sig>
