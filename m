From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 20 Aug 2018 16:30:42 -0700 (PDT)
Subject: [PATCH v3 2/2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180814134027.GD28080@infradead.org>
Message-ID: <mhng-3e587858-d566-4fea-91ef-4537784358b0@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 14 Aug 2018 06:40:27 PDT (-0700), Christoph Hellwig wrote:
>> index 818655b0d535..690beb002d1d 100644
>> --- a/arch/riscv/include/uapi/asm/syscalls.h
>> +++ b/arch/riscv/include/uapi/asm/syscalls.h
>> @@ -1,10 +1,13 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> +// SPDX-License-Identifier: GPL-2.0
>
> /* ... */  is the right style SPDX tag for headers, so please keep it
> as-is.

Thanks, I didn't miss this one so I managed to fix it before the PR!
