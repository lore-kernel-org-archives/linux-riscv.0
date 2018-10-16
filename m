From: linux@roeck-us.net (Guenter Roeck)
Date: Tue, 16 Oct 2018 06:18:49 -0700
Subject: [PATCH v8 3/5] Cleanup ISA string setting
In-Reply-To: <mhng-48e07863-dd56-4ef6-8342-aa19414bc1b8@palmer-si-x1c4>
References: <mhng-48e07863-dd56-4ef6-8342-aa19414bc1b8@palmer-si-x1c4>
Message-ID: <fc881ae2-4803-5859-f9c1-52f1a1381f6f@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 10/15/2018 03:34 PM, Palmer Dabbelt wrote:
> On Sun, 14 Oct 2018 16:46:40 PDT (-0700), alankao at andestech.com wrote:
>> Hi Guenter,
>>
>> On Sat, Oct 13, 2018 at 05:02:05PM -0700, Guenter Roeck wrote:
>>> Hi,
>>>
>>> With this patch in -next applied, I get the following error
>>> when building riscv:defconfig.
>>
>> I guess what you meant was this commit:
>> commit 0a5bee05fc67ce2044b8d91a18abbf14042da531
>>
>> The modification in Makefile was
>>
>> -endif
>> -
>> -KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
>> +# ISA string setting
>> +riscv-march-$(CONFIG_ARCH_RV32I)?????? := rv32im
>> +riscv-march-$(CONFIG_ARCH_RV64I)?????? := rv64im
>> +riscv-march-$(CONFIG_RISCV_ISA_A)????? := $(riscv-march-y)a
>> +riscv-march-y????????????????????????? := fd
>> +riscv-march-$(CONFIG_RISCV_ISA_C)????? := $(riscv-march-y)c
>>
>> and the ":= fd" line was wrong.? It should have been
>>
>> +riscv-march-y????????????????????????? := $(riscv-march-y)fd
>>
>>>
>>>
>>> What am I missing ? Does RISC-V now require a new non-upstream compiler ?
>>> Or a special version of make ? I am currently using GNU Make 4.1.
>>
>> So I sent the v8 to fix this problem.
>> Sorry for the inconvinience.
>>
>>>
>>> Thanks,
>>> Guenter
>>>
>>> ---
>>
>> And Palmer, it seems that the patch that causes this build error has been
>> pulled into linux-next.? Any idea how to fix that one?
> 
> If I run into the new version then I'll overwrite in in my for-next branch.? I don't see one, though...
> 

The series is on lore, lkml, and patchwork. Patchwork link to v8 of this patch:

https://lore.kernel.org/patchwork/patch/997407/

Guenter
