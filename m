From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 08 Jun 2018 15:33:36 -0700 (PDT)
Subject: [PATCH 3/3] riscv: fix __user annotation for __copy_user()
In-Reply-To: <20180607165131.5qx43o6f2siwyivj@ltop.local>
Message-ID: <mhng-d06d9c63-3188-4e2e-abe6-2f62e3b35d48@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 07 Jun 2018 09:51:33 PDT (-0700), luc.vanoostenryck at gmail.com wrote:
> On Thu, Jun 07, 2018 at 09:30:19AM -0700, Palmer Dabbelt wrote:
>>
>> I haven't compiled this, but I think it should work.  It's on the
>> fix-sparse branch of kernel.org/palmer/linux.git .
>
> It's essentially what I was thinking but I have some small remarks.
>
>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>> index 14b0b22fb578..0dbbbab05dac 100644
>> --- a/arch/riscv/include/asm/uaccess.h
>> +++ b/arch/riscv/include/asm/uaccess.h
>> @@ -392,19 +392,21 @@ do {								\
>> })
>>
>>
>> -extern unsigned long __must_check __copy_user(void __user *to,
>> +extern unsigned long __must_check __asm_copy_from_user_user(void *to,
>> 	const void __user *from, unsigned long n);
>> +extern unsigned long __must_check __asm_copy_to_user_user(void __user *to,
>> +	const void *from, unsigned long n);
>>
>> static inline unsigned long
>> raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>> {
>> -	return __copy_user(to, from, n);
>> +	return __asm_copy_from_user(to, from, n);
>> }
>>
>> static inline unsigned long
>> raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>> {
>> -	return __copy_user(to, from, n);
>> +	return __asm_copy_to_user(to, from, n);
>> }
>
> The asm function could have directly be named raw_copy_{to,from}_user()
> because the inline functions are just no-ops but it's very clear like so.
>
>> extern long strncpy_from_user(char *dest, const char __user *src, long count);
>> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
>> index 58fb2877c865..bd51e47ebd44 100644
>> --- a/arch/riscv/lib/uaccess.S
>> +++ b/arch/riscv/lib/uaccess.S
>> @@ -13,7 +13,15 @@ _epc:
>> 	.previous
>> 	.endm
>>
>> -ENTRY(__copy_user)
>> +/* __asm_copy_to_user and __asm_copy_from_user are actually the same function,
>> + * they're just provided as two different symbols to C code so sparse doesn't
>> + * yell about casting between two different address spaces. */
>> +.global __asm_copy_to_user
>> +.set __asm_copy_to_user,__asm_copy_tofrom_user
>> +.global __asm_copy_from_user
>> +.set __asm_copy_from_user,__asm_copy_tofrom_user
>> +
>> +ENTRY(__asm_copy_tofrom_user)
>
> I don't think that the size (as reported by objdump, for example) will
> be correct or even present for __asm_copy_to_user & __asm_copy_to_user.
>
> What can be done is:
> 	ENTRY(__asm_copy_to_user)
> 	ENTRY(__asm_copy_from_user)
>
> 	<function definition>
>
> 	ENDPROC(__asm_copy_to_user)
> 	ENDPROC(__asm_copy_from_user)
>
>
> Finally, the symbol table need also something like:
> diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
> index 551734248..1e8f8fa54 100644
> --- a/arch/riscv/kernel/riscv_ksyms.c
> +++ b/arch/riscv/kernel/riscv_ksyms.c
> @@ -13,6 +13,7 @@
>   * Assembly functions that may be used (directly or indirectly) by modules
>   */
>  EXPORT_SYMBOL(__clear_user);
> -EXPORT_SYMBOL(__copy_user);
> +EXPORT_SYMBOL(__asm_copy_to_user);
> +EXPORT_SYMBOL(__asm_copy_from_user);
>  EXPORT_SYMBOL(memset);
>  EXPORT_SYMBOL(memcpy);

Thanks.  Do you mind checking to make sure this works and submitting a patch?
