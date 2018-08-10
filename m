From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 09 Aug 2018 18:50:42 -0700 (PDT)
Subject: FW: [PATCH v2] RISC-V: Add the directive for alignment of stvec's
 value
In-Reply-To: <CA+ZOyajyOfjZh8tQB4reAka3s+tqXachY4hiAtpA4Bb67x58AQ@mail.gmail.com>
Message-ID: <mhng-0cd89708-476d-4cd0-81a2-8ba5d18114ee@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 09 Aug 2018 17:37:39 PDT (-0700), zongbox at gmail.com wrote:
>> Subject: [PATCH v2] RISC-V: Add the directive for alignment of stvec's value
>>
>> The stvec's value must be 4 byte alignment by specification definition.
>> These directives avoid to stvec be set the non-alignment value.
>>
>> Signed-off-by: Zong Li <zong@andestech.com>
>> ---
>>  arch/riscv/kernel/head.S | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S index 3b6293f..11066d5 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -94,6 +94,7 @@ relocate:
>>         or a0, a0, a1
>>         sfence.vma
>>         csrw sptbr, a0
>> +.align 2
>>  1:
>>         /* Set trap vector to spin forever to help debug */
>>         la a0, .Lsecondary_park
>> @@ -143,6 +144,7 @@ relocate:
>>         tail smp_callin
>>  #endif
>>
>> +.align 2
>>  .Lsecondary_park:
>>         /* We lack SMP support or have too many harts, so park this hart */
>>         wfi

Thanks, this got lost in the shuffle somewhere.  It's in for-next now.
