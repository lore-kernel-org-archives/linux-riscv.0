Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD04ECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 15:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MnL7a41KbrMAuZ/oE5MOrbF+Ql+K/krn789tgtl9cs=; b=RvndHjKrWm1jOC
	xYLy2NYBpy1cb0te94ioqYCvHfCecikxXMCRGiwMu5OpDvCntUCHltrF50UMWpZXgNQ6FRqOafic7
	iVceruE9aTvFEuO3bZ5Nx8Wuye1RwGrfkDvTf5OpNqDjn5zJOb4rrz3xCvitCnHqp/MGVyi46kdnh
	27oM5Dh50QVW6pWBJPKP66H0WmGAjyN3H8fJ/psT4HLjvNQX7zzIVDlIAOcmsrVzBAgagLs2/P4tv
	24MwP6SKL7w2cWfFnX79y/wE2y7rvbY1E+zu7YGTtk/9kjxb4jU3fvuXcK9som7vJDZNwbTHH3R2B
	NIxVTcCFbVT7qGf60Hqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmHT-00Cv1Y-Mk; Thu, 01 Sep 2022 15:38:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmHR-00Cv0m-21
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 15:38:58 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oTmHO-0005mr-3g; Thu, 01 Sep 2022 17:38:54 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH v2 3/4] RISC-V: Implement arch specific PMEM APIs
Date: Thu, 01 Sep 2022 17:38:53 +0200
Message-ID: <13199249.VsHLxoZxqI@diego>
In-Reply-To: <20220830044642.566769-4-apatel@ventanamicro.com>
References: <20220830044642.566769-1-apatel@ventanamicro.com> <20220830044642.566769-4-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_083857_129779_FF75F280 
X-CRM114-Status: GOOD (  20.55  )
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

Hi Anup,

Am Dienstag, 30. August 2022, 06:46:41 CEST schrieb Anup Patel:
> The NVDIMM PMEM driver expects arch specific APIs for cache maintenance
> and if arch does not provide these APIs then NVDIMM PMEM driver will
> always use MEMREMAP_WT to map persistent memory which in-turn maps as
> UC memory type defined by the RISC-V Svpbmt specification.
> 
> Now that the Svpbmt and Zicbom support is available in RISC-V kernel,
> we implement PMEM APIs using ALT_CMO_OP() macros so that the NVDIMM
> PMEM driver can use MEMREMAP_WB to map persistent memory.

Zicbom is detected at runtime, though that kconfig setting changes the
behaviour for the memremap-type at compile-time. So what happens on
systems not using zicbom (or another cmo-variant) ?


Heiko

> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/Kconfig     |  1 +
>  arch/riscv/mm/Makefile |  1 +
>  arch/riscv/mm/pmem.c   | 21 +++++++++++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 arch/riscv/mm/pmem.c
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0ebd8da388d8..37d6370d29c3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -25,6 +25,7 @@ config RISCV
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_MMIOWB
> +	select ARCH_HAS_PMEM_API
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_SET_DIRECT_MAP if MMU
>  	select ARCH_HAS_SET_MEMORY if MMU
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index d76aabf4b94d..3b368e547f83 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -31,3 +31,4 @@ endif
>  
>  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
>  obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
> +obj-$(CONFIG_ARCH_HAS_PMEM_API) += pmem.o
> diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
> new file mode 100644
> index 000000000000..089df92ae876
> --- /dev/null
> +++ b/arch/riscv/mm/pmem.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022 Ventana Micro Systems Inc.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/libnvdimm.h>
> +
> +#include <asm/cacheflush.h>
> +
> +void arch_wb_cache_pmem(void *addr, size_t size)
> +{
> +	ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
> +}
> +EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
> +
> +void arch_invalidate_pmem(void *addr, size_t size)
> +{
> +	ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
> +}
> +EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
