Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25407CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 06:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtZbuZ6FyFOiM2HncB5wiX9jczmjoMdYwdau0wW60js=; b=wxVYDnVU7n+L5S
	vwVKYjccs4dCTE5Q/YoxdxRVjGNC9YcZ7jVdk95Ydmus9HKZi7tsKjoGcY3yiW+yOnV4gAPLWD/47
	Bf+Bj5ILAxZHI2Xx6AxaHcIwS739Qus9R/6eoMibXc6wry0TDJMkvJ/1nTtrHGlZHh4IS8bQryBUc
	+36zRG300SxTA+ryK8uqo9JdbVG5SIdLMS06O04gl44wPnZKiYrGcAMJnL1ti5kGkdK+jvE8OiNSs
	ZeQnvZA23DnL1MNzkeDuYT9/Kel6DWRgL2RpuT8oGt4xzjoXszHFIrqem6ZwUz4h7Iri7UOXYaDXw
	cSQHF3F2oZuyhbCnL9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un9xt-000000047Vs-1Qfh;
	Sat, 16 Aug 2025 06:00:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un9xo-000000047V5-2r1m
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 06:00:26 +0000
Received: from [192.168.0.104] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowACXhalVHqBor2xLDA--.44359S2;
	Sat, 16 Aug 2025 13:59:50 +0800 (CST)
Message-ID: <e1ba7227-161c-4411-9e29-eedbf8351c01@iscas.ac.cn>
Date: Sat, 16 Aug 2025 13:59:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: Add common csr_read_num() and csr_write_num()
 functions
To: Anup Patel <apatel@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Len Brown <lenb@kernel.org>, Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250815161406.76370-1-apatel@ventanamicro.com>
 <20250815161406.76370-3-apatel@ventanamicro.com>
 <89865f17-f405-445a-874d-9361fe247bfe@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <89865f17-f405-445a-874d-9361fe247bfe@iscas.ac.cn>
X-CM-TRANSID: qwCowACXhalVHqBor2xLDA--.44359S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1xuFy8ZFWruF4DtF1xAFb_yoW7AFy5pr
	WjkFZ0kr48Jr42934a9wn8Jry5X3ZYgrWUK34xX34fZr4Utry5Gry0ga4YqryDWFWkJ3s8
	uF1q9w1fC3s8trDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_230025_089947_426D6B23 
X-CRM114-Status: GOOD (  17.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 8/16/25 12:24, Vivian Wang wrote:
> On 8/16/25 00:14, Anup Patel wrote:
>> In RISC-V, there is no CSR read/write instruction which takes CSR
>> number via register so add common csr_read_num() and csr_write_num()
>> functions which allow accessing certain CSRs by passing CSR number
>> as parameter. These common functions will be first used by the
>> ACPI CPPC driver and RISC-V PMU driver.
>>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> ---
>>  arch/riscv/include/asm/csr.h |   3 +
>>  arch/riscv/kernel/Makefile   |   1 +
>>  arch/riscv/kernel/csr.c      | 177 +++++++++++++++++++++++++++++++++++
>>  drivers/acpi/riscv/cppc.c    |  17 ++--
>>  drivers/perf/riscv_pmu.c     |  43 +--------
>>  5 files changed, 189 insertions(+), 52 deletions(-)
>>  create mode 100644 arch/riscv/kernel/csr.c
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index 6fed42e37705..1540626b3540 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>> @@ -575,6 +575,9 @@
>>  			      : "memory");			\
>>  })
>>
>> +extern unsigned long csr_read_num(unsigned long csr_num, int *out_err);
>> +extern void csr_write_num(unsigned long csr_num, unsigned long val, int *out_err);
>> +
>>  #endif /* __ASSEMBLY__ */
>>
>>  #endif /* _ASM_RISCV_CSR_H */
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index c7b542573407..0a75e20bde18 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -50,6 +50,7 @@ obj-y	+= soc.o
>>  obj-$(CONFIG_RISCV_ALTERNATIVE) += alternative.o
>>  obj-y	+= cpu.o
>>  obj-y	+= cpufeature.o
>> +obj-y	+= csr.o
>>  obj-y	+= entry.o
>>  obj-y	+= irq.o
>>  obj-y	+= process.o
>> diff --git a/arch/riscv/kernel/csr.c b/arch/riscv/kernel/csr.c
>> new file mode 100644
>> index 000000000000..f7de45bb597c
>> --- /dev/null
>> +++ b/arch/riscv/kernel/csr.c
>> @@ -0,0 +1,177 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025 Ventana Micro Systems Inc.
>> + */
>> +
>> +#define pr_fmt(fmt) "riscv: " fmt
>> +#include <linux/err.h>
>> +#include <linux/export.h>
>> +#include <linux/printk.h>
>> +#include <linux/types.h>
>> +#include <asm/csr.h>
>> +
>> +#define CSR_CUSTOM0_U_RW_BASE		0x800
>> +#define CSR_CUSTOM0_U_RW_COUNT		0x100
>> +
>> +#define CSR_CUSTOM1_U_RO_BASE		0xCC0
>> +#define CSR_CUSTOM1_U_RO_COUNT		0x040
>> +
>> +#define CSR_CUSTOM2_S_RW_BASE		0x5C0
>> +#define CSR_CUSTOM2_S_RW_COUNT		0x040
>> +
>> +#define CSR_CUSTOM3_S_RW_BASE		0x9C0
>> +#define CSR_CUSTOM3_S_RW_COUNT		0x040
>> +
>> +#define CSR_CUSTOM4_S_RO_BASE		0xDC0
>> +#define CSR_CUSTOM4_S_RO_COUNT		0x040
>> +
>> +#define CSR_CUSTOM5_HS_RW_BASE		0x6C0
>> +#define CSR_CUSTOM5_HS_RW_COUNT		0x040
>> +
>> +#define CSR_CUSTOM6_HS_RW_BASE		0xAC0
>> +#define CSR_CUSTOM6_HS_RW_COUNT		0x040
>> +
>> +#define CSR_CUSTOM7_HS_RO_BASE		0xEC0
>> +#define CSR_CUSTOM7_HS_RO_COUNT		0x040
>> +
>> +#define CSR_CUSTOM8_M_RW_BASE		0x7C0
>> +#define CSR_CUSTOM8_M_RW_COUNT		0x040
>> +
>> +#define CSR_CUSTOM9_M_RW_BASE		0xBC0
>> +#define CSR_CUSTOM9_M_RW_COUNT		0x040
>> +
>> +#define CSR_CUSTOM10_M_RO_BASE		0xFC0
>> +#define CSR_CUSTOM10_M_RO_COUNT		0x040
>> +
>> +unsigned long csr_read_num(unsigned long csr_num, int *out_err)
>> +{
>> +#define switchcase_csr_read(__csr_num)				\
>> +	case (__csr_num):					\
>> +		return csr_read(__csr_num)
>> +#define switchcase_csr_read_2(__csr_num)			\
>> +	switchcase_csr_read(__csr_num + 0);			\
>> +	switchcase_csr_read(__csr_num + 1)
>> +#define switchcase_csr_read_4(__csr_num)			\
>> +	switchcase_csr_read_2(__csr_num + 0);			\
>> +	switchcase_csr_read_2(__csr_num + 2)
>> +#define switchcase_csr_read_8(__csr_num)			\
>> +	switchcase_csr_read_4(__csr_num + 0);			\
>> +	switchcase_csr_read_4(__csr_num + 4)
>> +#define switchcase_csr_read_16(__csr_num)			\
>> +	switchcase_csr_read_8(__csr_num + 0);			\
>> +	switchcase_csr_read_8(__csr_num + 8)
>> +#define switchcase_csr_read_32(__csr_num)			\
>> +	switchcase_csr_read_16(__csr_num + 0);			\
>> +	switchcase_csr_read_16(__csr_num + 16)
>> +#define switchcase_csr_read_64(__csr_num)			\
>> +	switchcase_csr_read_32(__csr_num + 0);			\
>> +	switchcase_csr_read_32(__csr_num + 32)
>> +#define switchcase_csr_read_128(__csr_num)			\
>> +	switchcase_csr_read_64(__csr_num + 0);			\
>> +	switchcase_csr_read_64(__csr_num + 64)
>> +#define switchcase_csr_read_256(__csr_num)			\
>> +	switchcase_csr_read_128(__csr_num + 0);			\
>> +	switchcase_csr_read_128(__csr_num + 128)
>> +
> That's... a bit horrendous.
>
> Since we know that each inner case is quite simple, can we just do our
> own jump table for that? Each case can be one csrr/csrw and one jal
> (possibly pad to 8 bytes), and we can just jump to
> label + (csr_num - range_start) * 8. See bottom of this message for an
> untested prototype.
>
> Vivian "dramforever" Wang
>
> UNTESTED prototype:

I want to make it clear by the way that I *don't* think the details are
right with this code. Please do fix stuff like macro parameter parens
and formatting if *anyone* is trying to use this code.

Vivian "dramforever" Wang

> #define CSR_CYCLE 0xc00
> #define CSR_CYCLEH 0xc80
>
> /* Force expand argument if macro */
> #define str(_x) #_x
>
> unsigned long csr_read_num(long csr_num)
> {
>
> [...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
