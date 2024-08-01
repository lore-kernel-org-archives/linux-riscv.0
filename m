Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945B4C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAxW9b3vtTqI9P0xovNVAu7blJjfn/QQJ4sXCLW+qQ4=; b=RVowCMbeOXtcMH
	TPmE3LqjsaiWUHdIPN9zKNTiEAkJCwdHyyTzvefLHaHkoVwCvO6NtOiIk44S2cQn8hbozYsR9fOEg
	pbaS/zWA5M3aw+oZbWJQH2odC5QuUUVD990gt2fipjGfIMONx8tFE1CDqWoWR6tasV7O+J4fwmj75
	hYF8YPC5pswKmzuYUMv0AL+sg2FhirAVjp3+NF7upF9ouNoPtFh2tRV4r9fB5MmeTZY5gJZXIasIy
	3zlMSTH0P9MBVbZtjrvvE6sF/fvNytwPilHGDyN+etEHBjYW7tvYgusQ8peROuomJr1QpPBkANVZW
	tvWtMQ1BgE3zn1DkXL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZxgi-00000009pIL-3tLL;
	Fri, 02 Aug 2024 19:11:40 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQL5-00000004Bev-3yfx
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 07:35:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74F541C0006;
	Thu,  1 Aug 2024 07:35:01 +0000 (UTC)
Message-ID: <5c715c23-ac44-49fd-b386-bdf226a56c8f@ghiti.fr>
Date: Thu, 1 Aug 2024 09:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
To: Charlie Jenkins <charlie@rivosinc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
References: <20240731162159.9235-2-palmer@rivosinc.com>
 <Zqrj3Snhh3mJdU/a@ghost>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Zqrj3Snhh3mJdU/a@ghost>
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_003508_312655_8143A762 
X-CRM114-Status: GOOD (  24.03  )
X-Mailman-Approved-At: Fri, 02 Aug 2024 12:11:39 -0700
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Charlie,

On 01/08/2024 03:24, Charlie Jenkins wrote:
> On Wed, Jul 31, 2024 at 09:22:00AM -0700, Palmer Dabbelt wrote:
>> I recently ended up with a warning on some compilers along the lines of
>>
>>        CC      kernel/resource.o
>>      In file included from include/linux/ioport.h:16,
>>                       from kernel/resource.c:15:
>>      kernel/resource.c: In function 'gfr_start':
>>      include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
>>         49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>>            |                                     ^
>>      include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
>>         52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>>            |         ^~~~~~~~~~~~~~~~~
>>      include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
>>        161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>>            |                           ^~~~~~~~~~
>>      kernel/resource.c:1829:23: note: in expansion of macro 'min_t'
>>       1829 |                 end = min_t(resource_size_t, base->end,
>>            |                       ^~~~~
>>      kernel/resource.c: In function 'gfr_continue':
>>      include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
>>         49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>>            |                                     ^
>>      include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
>>         52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>>            |         ^~~~~~~~~~~~~~~~~
>>      include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
>>        161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>>            |                           ^~~~~~~~~~
>>      kernel/resource.c:1847:24: note: in expansion of macro 'min_t'
>>       1847 |                addr <= min_t(resource_size_t, base->end,
>>            |                        ^~~~~
>>      cc1: all warnings being treated as errors
>>
>> which looks like a real problem: our phys_addr_t is only 32 bits now, so
>> having 34-bit masks is just going to result in overflows.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> This is sort of a v2 of
>> https://lore.kernel.org/r/20240729151652.15063-2-palmer@rivosinc.com,
>> but I think that was just bogus.
>> ---
>>   arch/riscv/include/asm/sparsemem.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
>> index 63acaecc3374..2f901a410586 100644
>> --- a/arch/riscv/include/asm/sparsemem.h
>> +++ b/arch/riscv/include/asm/sparsemem.h
>> @@ -7,7 +7,7 @@
>>   #ifdef CONFIG_64BIT
>>   #define MAX_PHYSMEM_BITS	56
>>   #else
>> -#define MAX_PHYSMEM_BITS	34
> I was trying to figure out why this was set to 34. It looks like that
> comes from this patch (which heavily changed over the course of review)
> [1] and the following text:
>
> "On the Sifive hardware this allows us to provide struct pages for
> the lower I/O TileLink address ranges, the 32-bit and 34-bit DRAM areas
> and 172GB of 240GB of the high I/O TileLink region. Once we progress to
> Sv48 we should be able to cover all the available memory regions."
>
> Seems like the max should be 32 though so:
>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>
> Link: https://lore.kernel.org/all/20190327213643.23789-4-logang@deltatee.com/ [1]


Actually sv32 supports 34-bit of physical address because of the PTE 
format which allows for 22-bits of PPN, so we should in theory set 
MAX_PHYSMEM_BITS to 34. Then it would work with CONFIG_PHYS_ADDR_T_64BIT 
enabled, but @Palmer told me that it breaks something and then it was 
disabled (I don 't have time to look into that). But even if that 
worked, we are not currently not implementing HIGHMEM so we cannot 
access all the memory anyway (and I think HIGHMEM was deprecated some 
time ago).

So, as long as someone tackles the above, I agree with this patch:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>
>
>> +#define MAX_PHYSMEM_BITS	32
>>   #endif /* CONFIG_64BIT */
>>   #define SECTION_SIZE_BITS	27
>>   #endif /* CONFIG_SPARSEMEM */
>> -- 
>> 2.45.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
