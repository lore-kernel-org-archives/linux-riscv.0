From: shea@shealevy.com (Shea Levy)
Date: Thu, 29 Mar 2018 07:12:40 -0400
Subject: [PATCH v4 02/16] riscv: Use generic free_initrd_mem.
In-Reply-To: <7fa4f27c-d421-38cd-aa16-445b364ed9eb@linaro.org>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
 <20180328203659.18692-3-shea@shealevy.com>
 <7fa4f27c-d421-38cd-aa16-445b364ed9eb@linaro.org>
Message-ID: <87y3ibrv87.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Daniel Thompson <daniel.thompson@linaro.org> writes:

> On 28/03/18 21:36, Shea Levy wrote:
>> Signed-off-by: Shea Levy <shea@shealevy.com>
>> ---
>>   arch/riscv/mm/init.c | 6 ------
>>   1 file changed, 6 deletions(-)
>> 
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index c77df8142be2..36f83fe8a726 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -62,9 +62,3 @@ void free_initmem(void)
>>   {
>>   	free_initmem_default(0);
>>   }
>> -
>> -#ifdef CONFIG_BLK_DEV_INITRD
>> -void free_initrd_mem(unsigned long start, unsigned long end)
>> -{
>> -}
>> -#endif /* CONFIG_BLK_DEV_INITRD */
>
> This looks like a change of behavior since the weakly defined code does 
> not implement a nop.
>
> I'm not saying the change is wrong, but if this is a deliberate bug fix 
> then we need more than an empty commit message to explain what is 
> happening here.
>

Right, sorry, will re-send with a proper commit message here.

>
>
> Daniel.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180329/aed24f18/attachment.sig>
