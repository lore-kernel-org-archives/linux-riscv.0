Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FD1D2B921
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFQTfxn0P0Stdg8jJmRBgaWmE74Vxh04ew2S2Pph7Vg=; b=Y4F7XcNDtuE05l
	aXJa2NxW+vY8llNBFLP+uYVPYpGY9dQMiQC3F2K0hZtLAYHdqB7ffKwtEW/8nqxqJNsCP3sJpSnsU
	PHwcL1AqBreOI+72ufcGgJkhJWzXoQViGzQURPpZIUCRVUplLzDYK6Sth/u5pHFutuVrVpp8Jbm+e
	mD2kDUG02Rd8/yfvlbDSp8alkbnUeTHnwaJf3XLCmVGtXJG2dnqGT0kb1NkJK690V2AjDzcRvQbWA
	h+Ayinar1DQjk3hoPk0TxhLZ9AhukTZC9xy7x4FUqRxyyybp4lHQ8sX9wW5oyDcaEULwEH/pl1NO0
	hVAbTlAURsSBcYmL+JHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8J0z-0000000H22R-2oFI;
	Tue, 05 Nov 2024 12:50:33 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8IwQ-0000000H1W6-3ZS4
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 12:45:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BF05E000C;
	Tue,  5 Nov 2024 12:45:44 +0000 (UTC)
Message-ID: <bedac8d9-4ba4-427c-9323-edcdbd7876ee@ghiti.fr>
Date: Tue, 5 Nov 2024 13:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH V4 1/3] riscv: mm: Prepare for reusing PTE RSW
 bit(9)
Content-Language: en-US
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20240830011101.3189522-1-zhangchunyan@iscas.ac.cn>
 <20240830011101.3189522-2-zhangchunyan@iscas.ac.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240830011101.3189522-2-zhangchunyan@iscas.ac.cn>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_044551_058336_616D981A 
X-CRM114-Status: GOOD (  16.68  )
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

Hi Chunyan,

On 30/08/2024 03:10, Chunyan Zhang wrote:
> The PTE bit(9) on RISC-V is reserved for software, it is used by DEVMAP
> now which has to be disabled if we want to use bit(9) for other features,
> since there's no more free PTE bit on RISC-V now.
>
> So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
> the build condition of devmap definitions.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   arch/riscv/include/asm/pgtable-64.h   | 2 +-
>   arch/riscv/include/asm/pgtable-bits.h | 6 ++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 0897dd99ab8d..babb8d2b0f0b 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -398,7 +398,7 @@ static inline struct page *pgd_page(pgd_t pgd)
>   #define p4d_offset p4d_offset
>   p4d_t *p4d_offset(pgd_t *pgd, unsigned long address);
>   
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && defined(CONFIG_ARCH_HAS_PTE_DEVMAP)
>   static inline int pte_devmap(pte_t pte);
>   static inline pte_t pmd_pte(pmd_t pmd);
>   
> diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> index a8f5205cea54..5bcc73430829 100644
> --- a/arch/riscv/include/asm/pgtable-bits.h
> +++ b/arch/riscv/include/asm/pgtable-bits.h
> @@ -19,7 +19,13 @@
>   #define _PAGE_SOFT      (3 << 8)    /* Reserved for software */
>   
>   #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
> +
> +#ifdef CONFIG_ARCH_HAS_PTE_DEVMAP
>   #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
> +#else
> +#define _PAGE_DEVMAP	0
> +#endif /* CONFIG_ARCH_HAS_PTE_DEVMAP */
> +
>   #define _PAGE_TABLE     _PAGE_PRESENT
>   
>   /*


There is a small inconsistency in our code: pte_devmap() is protected by 
a #ifdef but pte_mkdevmap() is not, I guess that's why you had to define 
_PAGE_DEVMAP if !CONFIG_ARCH_HAS_PTE_DEVMAP.

I'd be in favor of removing the #ifdef around pte_devmap() too.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
