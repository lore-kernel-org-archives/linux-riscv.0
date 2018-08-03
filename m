From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 02 Aug 2018 18:58:28 -0700 (PDT)
Subject: [PATCH] riscv: remove unnecessary of_platform_populate call
In-Reply-To: <CAL_JsqJKwtxDck67QHrZSKKrEXt-ERxH6W0srdw2H5A24CdSKA@mail.gmail.com>
Message-ID: <mhng-3bfbca5d-24d1-4d39-a84b-d1b0ec6708aa@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 09 Jul 2018 08:50:05 PDT (-0700), robh at kernel.org wrote:
> On Tue, Jun 19, 2018 at 3:41 PM Rob Herring <robh@kernel.org> wrote:
>>
>> The DT core will call of_platform_default_populate, so it is not
>> necessary for arch specific code to call it unless there are custom
>> match entries, auxdata or parent device. Neither of those apply here, so
>> remove the call.
>>
>> Cc: Palmer Dabbelt <palmer@sifive.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv at lists.infradead.org
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>  arch/riscv/kernel/setup.c | 5 -----
>>  1 file changed, 5 deletions(-)
>
> Ping?

Sorry for not saying anything, I don't have a good scheme for automatically 
tracking patches as they flow through my tree and my inbox is a bit backed up.  
This landed as part of b19b9282093588e73401f9d4981310a8de975f7d.

Thanks for the fix!

>>
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index ee44a48faf79..f0d2070866d4 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -220,8 +220,3 @@ void __init setup_arch(char **cmdline_p)
>>         riscv_fill_hwcap();
>>  }
>>
>> -static int __init riscv_device_init(void)
>> -{
>> -       return of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
>> -}
>> -subsys_initcall_sync(riscv_device_init);
