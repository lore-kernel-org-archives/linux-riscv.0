Return-Path: <SRS0=Eoui=MW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C72C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 12:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A080460EE6
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 12:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A080460EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItxE+EpLS1jW3CeoE442WJtsyfxPHddS1wztKZVmtTY=; b=GBbB1glzQ0tOmkx4Fb+hR7916H
	VduMUE1j8C9/auq9TpXr/ZgkXEKfqnqTx+as911cafVwU5kl93zl4STrhDAMwMH26qvlBJQz44MAu
	RBqemr/gFvHvQkHgtNhddEx2et7kOY6fNBWpM/Beaqp4FKrNcPO5OU36KtBkUJ6lhuGvtevF0qFwq
	CpHMVeKJGcYnvI0BGl6gb9I+2mwWBNcUu+AkO1FHHGSluYNqCSOxPsNoq+yoxV0M5nQ9EZyuXUJBT
	ddo642RdlR7rMcoEpfOsCrPXCV1ERl5v0aLGg6j8U6SLubL+t1LnDkAtKswyahU7C5FsEKj9ebIvQ
	QyNXMWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9RKM-008VPm-9o; Fri, 30 Jul 2021 12:09:22 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9RKJ-008VOV-9o
 for linux-riscv@lists.infradead.org; Fri, 30 Jul 2021 12:09:20 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7C16C200008;
 Fri, 30 Jul 2021 12:09:10 +0000 (UTC)
Subject: Re: [PATCH v2] riscv: Add support to allocate gigantic hugepages
 using CMA
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: palmerdabbelt@google.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
References: <20210730013017.50651-1-wangkefeng.wang@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <09d4ec9c-c95a-c6c7-32b8-65822a8a2640@ghiti.fr>
Date: Fri, 30 Jul 2021 14:09:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210730013017.50651-1-wangkefeng.wang@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_050919_519573_AA97D7D9 
X-CRM114-Status: GOOD (  17.41  )
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

Le 30/07/2021 =E0 03:30, Kefeng Wang a =E9crit=A0:
> commit 9e953cda5cdf ("riscv: Introduce huge page support for32/64bit

"Commit"

> kernel") add support gigantic hugepage support for RV64.

"adds support for gigantic huge pages for RV64."

> =

> This patch add support to allocate gigantic hugepages using CMA by

"adds"

> specifying the hugetlb_cma=3D kernel parameter on RV64.
> =

> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2: don't disable hugepage support on RV32.
> =

>   arch/riscv/mm/init.c | 3 +++
>   1 file changed, 3 insertions(+)
> =

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a14bf3910eec..e547e53cddd2 100644
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
> @@ -216,6 +217,8 @@ static void __init setup_bootmem(void)
>   =

>   	early_init_fdt_scan_reserved_mem();
>   	dma_contiguous_reserve(dma32_phys_limit);
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
>   	memblock_allow_resize();
>   }
>   =

> =


Apart from the minor nits above, you can add:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
