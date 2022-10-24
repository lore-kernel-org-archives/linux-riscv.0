Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7595C67871
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 19:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nu3Aywg2xtgA2hzOUF8LhG8vScZiEgKapyRMbm7xZXk=; b=VQIOP8Zrz12otI
	9XOC5qL5Nek7OA8g/rFSMKuf73x92YKq9/HfdS6sYUkepAbVcKmEBl7nvwQUm1wqRgR0kC9yPdJhS
	1CrXIBxm8KjIn+CP0W8SvdAUTR0VXAfdFdWhoCkZzF5DCZ/TAoIdqT6K4J/DQY1zVxN0Wrpu2dCDr
	UY/QxTuxE/Ox5Lxb4rxpYz2c+s/ETRNjeLGC5PcmQq1vjmZRhb+vgViOOKJEQK5iDHhrgU7XwNHWy
	iPCCAhPIjC/pE+2VfUO/C3aKOioSK3ewRoRec5OxdTbur8Fsc7qgHXhk63gRI+N3eKOd3FTBDZNgq
	z6uF0oB7+8wbOG/sEApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on3Ue-002pzj-DL; Mon, 24 Oct 2022 19:52:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on3Ub-002pyM-PU
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 19:52:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B96646157B;
	Mon, 24 Oct 2022 19:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A8BC433C1;
	Mon, 24 Oct 2022 19:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666641132;
	bh=lkkW65uC8FLtw8ZPu4UMr+BKPlIpPDImnPKWcWAQVgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OR7Wn4rSm/wnwJ1ZqtdnojYijuJs7jTNBg1kVq0NL4mto3/afBuYkva7gu66tDiX/
	 B8bGkSQulksZOEzv/o+/9aRN4Gto0pSGQtDUPD2T6vmk9oEUN68Qhq9qBJbQHrn0y5
	 rmbacobbp4UMXAeNlEY3ZiXi/jhDpVrhhBqK6Nig0gxnEO61qhaojqjC4iDplVe2B7
	 oGFxJsEH/QBxpLSxkvc6fskMtaPhdVanvgVMjHZq6BHaqGoXCvl2ZGRX3eYZXvaadd
	 bQMtAneBMV+a8Kq9HtKdx3DFulcwPX3GMojv7cPlJxB1WmLo+lN0wzELkCGizRmKSa
	 q0+E/DLvfxDWQ==
Date: Mon, 24 Oct 2022 20:52:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH v5 3/4] RISC-V: Implement arch specific PMEM APIs
Message-ID: <Y1bs50GXeUoTcv2V@spud>
References: <20221020075846.305576-1-apatel@ventanamicro.com>
 <20221020075846.305576-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020075846.305576-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_125213_927040_136EFFD4 
X-CRM114-Status: GOOD (  20.98  )
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

On Thu, Oct 20, 2022 at 01:28:45PM +0530, Anup Patel wrote:
> The NVDIMM PMEM driver expects arch specific APIs for cache maintenance
> and if arch does not provide these APIs then NVDIMM PMEM driver will
> always use MEMREMAP_WT to map persistent memory which in-turn maps as
> UC memory type defined by the RISC-V Svpbmt specification.
> 
> Now that the Svpbmt and Zicbom support is available in RISC-V kernel,
> we implement PMEM APIs using ALT_CMO_OP() macros so that the NVDIMM
> PMEM driver can use MEMREMAP_WB to map persistent memory.
> 
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
> index 6b48a3ae9843..025e2a1b1c60 100644
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

Hey Anup,
Might be a silly question - ARCH_HAS_PMEM_API is unconditionally enabled
right? It should therefore be okay to make this an obj-y?
Thanks
Conor.

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
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
