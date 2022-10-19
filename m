Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CAFC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Shwzsc2hBg87wsXgP4zqkEtS0MHEU1Onnc9+Dk3LAMM=; b=HBkoKkR7a4h1aT
	FZw0CDTwD7zO0YS2AuDkSHn37/JI7glWn9JbsczeArWooJbAsRzIklnRzXu4qKWxmSAnssWnYdlHj
	99v1o8w3sjnYFQorWgGJHhdT4NjlCr4bz5brZKpzIstj1jzuq5aRhi/1TaG+MaEHV2NMeJrh5jpiq
	IG4UsOvO4euypitZ9l9F6ss7w2yA36kUS2JsXqbmHWJUfE6g+Asyqto2V4urVbTNChobbD7y02LLm
	NEeh64hfwIAiEXLFjCRjWwL1vDyd0dP/VvY+1NR7bvqKVb9a5Y9+3H/zV1UQ93peK2QaaH7D5dB7D
	9f4tBZK/cRey9SDsPFbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olAL7-002s6a-OA; Wed, 19 Oct 2022 14:46:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9v0-002jCA-1s
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 14:19:39 +0000
Received: from p508fdae2.dip0.t-ipconnect.de ([80.143.218.226] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ol9ux-0006Hx-9G; Wed, 19 Oct 2022 16:19:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH v4 2/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
Date: Wed, 19 Oct 2022 16:19:34 +0200
Message-ID: <13122510.uLZWGnKmhe@phil>
In-Reply-To: <20221019131128.237026-3-apatel@ventanamicro.com>
References: <20221019131128.237026-1-apatel@ventanamicro.com> <20221019131128.237026-3-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_071938_145035_44C67315 
X-CRM114-Status: GOOD (  17.13  )
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

Am Mittwoch, 19. Oktober 2022, 15:11:26 CEST schrieb Anup Patel:
> Currently, all flavors of ioremap_xyz() function maps to the generic
> ioremap() which means any ioremap_xyz() call will always map the
> target memory as IO using _PAGE_IOREMAP page attributes. This breaks
> ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
> remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
> page attributes.
> 
> To address above (just like other architectures), we implement RISC-V
> specific ioremap_cache() and ioremap_wc() which maps memory using page
> attributes as defined by the Svpbmt specification.
> 
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Wasn't there discussion around those functions in general in v2?

In any case, the patch doesn't break anything on qemu and d1, so

Tested-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  arch/riscv/include/asm/io.h      | 10 ++++++++++
>  arch/riscv/include/asm/pgtable.h |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 92080a227937..92a31e543388 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
>  #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
>  #endif
>  
> +#ifdef CONFIG_MMU
> +#define ioremap_wc(addr, size)		\
> +	ioremap_prot((addr), (size), _PAGE_IOREMAP_WC)
> +#endif
> +
>  #include <asm-generic/io.h>
>  
> +#ifdef CONFIG_MMU
> +#define ioremap_cache(addr, size)	\
> +	ioremap_prot((addr), (size), _PAGE_KERNEL)
> +#endif
> +
>  #endif /* _ASM_RISCV_IO_H */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..346b7c1a3eeb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -182,6 +182,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
>  #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
>  
>  #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
> +#define _PAGE_IOREMAP_WC	((_PAGE_KERNEL & ~_PAGE_MTMASK) | \
> +				 _PAGE_NOCACHE)
>  #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
>  
>  extern pgd_t swapper_pg_dir[];
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
