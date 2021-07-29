Return-Path: <SRS0=H4U1=MV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96EEC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 14:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A30760EBB
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 14:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A30760EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfaPd5TA4I2AQeqIHMH/Q2AXwRLusY7No+m44h4CW2w=; b=DNXW52gnyonUjJB2jHXEMDY6uX
	9O0lLjWZwOgZjoGLYAOuvrkWg6Y/2bHlDOUpmoukwLX6ezjbKZyZvgkjAOlXYADvvM0C5BDRdI713
	lpmC/Eohzw4PHZpPONWNn24Ik6ospQL4++FvpDlGMWkTkT726W07QRY7a0GA8/4m8qxOh5yxpH5Vu
	8MJbZPkxlWTmBuvJpSzdjuAoPlv5WbNkdirckNOx59NfKyyR1NyjjJq2Y3VMp/P2itXKtyUXM534x
	0LB0T5WbN6pr+thDZX+cOa3nKG1X0zhHgfpD/0kIPZvdyLLt3aMqLLqWjRnS66RkWcGxcn9i7cejJ
	kLDebNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m975A-004Y1I-Ds; Thu, 29 Jul 2021 14:32:20 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9756-004Y0Q-M6
 for linux-riscv@lists.infradead.org; Thu, 29 Jul 2021 14:32:18 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 033E120000C;
 Thu, 29 Jul 2021 14:32:07 +0000 (UTC)
Subject: Re: [PATCH] riscv: Add support to allocate gigantic hugepages using
 CMA
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: palmerdabbelt@google.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
References: <20210729062417.157133-1-wangkefeng.wang@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <0c8c5b9c-eb03-4d27-59e3-f544b0a96487@ghiti.fr>
Date: Thu, 29 Jul 2021 16:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729062417.157133-1-wangkefeng.wang@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_073216_897511_EC059DA1 
X-CRM114-Status: GOOD (  19.61  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Kefeng,

Le 29/07/2021 =E0 08:24, Kefeng Wang a =E9crit=A0:
> The RV32 only has at most 1GB memory(MAXPHYSMEM_1GB), so let's
> disable HUGETLBFS on RV32.

There is only one size of hugepages for RV32 which is 4MB, there isn't =

any gigantic hugepage of 1GB: there are only 2 levels of page table, a =

PGDIR represents 4MB and this is the only way to have a hugepage on =

RV32. So I think we should leave hugetlbfs available on RV32.

Thanks,

Alex

> And add support to allocate gigantic
> hugepages using CMA by specifying the hugetlb_cma=3D kernel parameter.
> =

> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/riscv/Kconfig   | 2 +-
>   arch/riscv/mm/init.c | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8fcceb8eda07..20a589605307 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -33,7 +33,7 @@ config RISCV
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>   	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> -	select ARCH_SUPPORTS_HUGETLBFS if MMU
> +	select ARCH_SUPPORTS_HUGETLBFS if MMU && 64BIT
>   	select ARCH_USE_MEMTEST
>   	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>   	select ARCH_WANT_FRAME_POINTERS
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a14bf3910eec..f2268402894b 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -19,6 +19,7 @@
>   #include <linux/set_memory.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/crash_dump.h>
> +#include <linux/hugetlb.h>
>   =

>   #include <asm/fixmap.h>
>   #include <asm/tlbflush.h>
> @@ -216,6 +217,7 @@ static void __init setup_bootmem(void)
>   =

>   	early_init_fdt_scan_reserved_mem();
>   	dma_contiguous_reserve(dma32_phys_limit);
> +	hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
>   	memblock_allow_resize();
>   }
>   =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
