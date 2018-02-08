From: ulfalizer@gmail.com (Ulf Magnusson)
Date: Thu, 8 Feb 2018 23:10:01 +0100
Subject: [PATCH 06/20] riscv: Remove ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
 select
In-Reply-To: <mhng-2395f66f-11f6-4209-86b2-71482e5cf52b@palmer-si-x1c4>
References: <20180205012146.23981-7-ulfalizer@gmail.com>
 <mhng-2395f66f-11f6-4209-86b2-71482e5cf52b@palmer-si-x1c4>
Message-ID: <CAFkk2KQwjf0SRgNEmufKBU3FPozZYt1cNqNeAu6KT7jCXDH6QA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Feb 8, 2018 at 7:34 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> On Sun, 04 Feb 2018 17:21:18 PST (-0800), ulfalizer at gmail.com wrote:
>>
>> The ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE symbol was removed in
>> commit 51a021244b9d ("atomic64: no need for
>> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE").
>>
>> Remove the ARCH_HAS_ATOMIC64_DEC_IS_POSITIVE select from RISCV.
>>
>> Discovered with the
>>
>> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
>> script.
>>
>> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
>> ---
>>  arch/riscv/Kconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index b6722c246d9c..ff69c77b9e78 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -8,7 +8,6 @@ config RISCV
>>         select OF
>>         select OF_EARLY_FLATTREE
>>         select OF_IRQ
>> -       select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
>>         select ARCH_WANT_FRAME_POINTERS
>>         select CLONE_BACKWARDS
>>         select COMMON_CLK
>
>
> Thanks!
>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

I didn't have a particular tree in mind for these patches by the way,
so feel free to pull it in yourselves.

Cheers,
Ulf
