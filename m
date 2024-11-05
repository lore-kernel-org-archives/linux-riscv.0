Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3104FD2B926
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 13:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Quumm7elmSG21H6jvizWS1+cwWkvCGTLMrUVKxh8P84=; b=vXAuZJC1h+a1lb
	5r8QvFDYpo0HDILV10x32ircKctg+BXlrzHCGn0ueblo+jxCy4TwT7OevMxGF+On2WeHxvKyomou3
	3ny3B6DybSp2rEfFoBmqL/eNEZtqBF4qlV+jY/6KsQPvG/66K4pPwWo7zcgbseTeWRmL5bNIghOad
	dJd/G7lslU51jSpEVI25e9kM4hCqNkPb4IMo246IGWIri0hARzmAQEsoWgHBrS4E5M9rUINcVHxAm
	x2Nw7jBP45CKKizsHQ/j5y2fs41gOEMCadER9eRrrvzDmctYVayq+g6pQ8S/tYt3h7MPORbuYmYrz
	haWXyJMbgqgM7RV8zEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JYD-0000000H7HS-2ynC;
	Tue, 05 Nov 2024 13:24:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JYA-0000000H7Gz-3yb2
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 13:24:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0AEEC0004;
	Tue,  5 Nov 2024 13:24:47 +0000 (UTC)
Message-ID: <4aceb7ac-08fa-486f-a4cc-0bca16968deb@ghiti.fr>
Date: Tue, 5 Nov 2024 14:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH V4 3/3] riscv: mm: Add uffd write-protect support
Content-Language: en-US
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20240830011101.3189522-1-zhangchunyan@iscas.ac.cn>
 <20240830011101.3189522-4-zhangchunyan@iscas.ac.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240830011101.3189522-4-zhangchunyan@iscas.ac.cn>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_052451_288670_136CEC2B 
X-CRM114-Status: GOOD (  21.60  )
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

On 30/08/2024 03:11, Chunyan Zhang wrote:
> Reuse PTE bit(9) to do uffd-wp tracking and make it mutually exclusive
> with soft-dirty and DEVMAP which all use this PTE bit.
>
> Additionally for tracking the uffd-wp state as a PTE swap bit,
> we use swap entry pte bit(4) which is also used by swap
> soft-dirty tracking.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   arch/riscv/Kconfig                    |  7 +++
>   arch/riscv/include/asm/pgtable-bits.h | 13 ++++++
>   arch/riscv/include/asm/pgtable.h      | 66 ++++++++++++++++++++++++++-
>   3 files changed, 85 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f1460fc01cd4..aa595a5ed4b8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -971,6 +971,13 @@ config RISCV_HAS_SOFT_DIRTY
>   	help
>   	  The PTE bit(9) is used for soft-dirty tracking.
>   
> +config RISCV_HAS_USERFAULTFD_WP
> +	bool "userfaultfd write protection"
> +	select HAVE_ARCH_USERFAULTFD_WP
> +	depends on USERFAULTFD
> +	help
> +	  The PTE bit(9) is used for userfaultfd write-protected
> +	  tracking.
>   endchoice
>   
>   endmenu # "Kernel features"
> diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> index c6d51fe9fc6f..7de16141c049 100644
> --- a/arch/riscv/include/asm/pgtable-bits.h
> +++ b/arch/riscv/include/asm/pgtable-bits.h
> @@ -38,6 +38,19 @@
>   #define _PAGE_SWP_SOFT_DIRTY	0
>   #endif /* CONFIG_MEM_SOFT_DIRTY */
>   
> +#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
> +/*
> + * CONFIG_HAVE_ARCH_USERFAULTFD_WP is mutually exclusive with
> + * HAVE_ARCH_SOFT_DIRTY so we can use the same bit for uffd-wp
> + * and soft-dirty tracking.
> + */
> +#define _PAGE_UFFD_WP		(1 << 9) /* RSW: 0x2 for uffd-wp tracking */
> +#define _PAGE_SWP_UFFD_WP	_PAGE_USER
> +#else
> +#define _PAGE_UFFD_WP		0
> +#define _PAGE_SWP_UFFD_WP	0
> +#endif
> +
>   #define _PAGE_TABLE     _PAGE_PRESENT
>   
>   /*
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index d41507919ef2..6ce4c9ba862a 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -417,6 +417,38 @@ static inline pte_t pte_wrprotect(pte_t pte)
>   	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
>   }
>   
> +#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
> +static inline int pte_uffd_wp(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_UFFD_WP;
> +}
> +
> +static inline pte_t pte_mkuffd_wp(pte_t pte)
> +{
> +	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_UFFD_WP));
> +}
> +
> +static inline pte_t pte_clear_uffd_wp(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~(_PAGE_UFFD_WP));
> +}
> +
> +static inline int pte_swp_uffd_wp(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_SWP_UFFD_WP;
> +}
> +
> +static inline pte_t pte_swp_mkuffd_wp(pte_t pte)
> +{
> +	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_SWP_UFFD_WP));
> +}


Weird to wrprotect a swap entry here, given x86/arm64 don't do that, you 
should remove it.


> +
> +static inline pte_t pte_swp_clear_uffd_wp(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~(_PAGE_SWP_UFFD_WP));
> +}
> +#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
> +
>   /* static inline pte_t pte_mkread(pte_t pte) */
>   
>   static inline pte_t pte_mkwrite_novma(pte_t pte)
> @@ -783,6 +815,38 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
>   	return pte_pmd(pte_mkdevmap(pmd_pte(pmd)));
>   }
>   
> +#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
> +static inline int pmd_uffd_wp(pmd_t pmd)
> +{
> +	return pte_uffd_wp(pmd_pte(pmd));
> +}
> +
> +static inline pmd_t pmd_mkuffd_wp(pmd_t pmd)
> +{
> +	return pte_pmd(pte_mkuffd_wp(pmd_pte(pmd)));
> +}
> +
> +static inline pmd_t pmd_clear_uffd_wp(pmd_t pmd)
> +{
> +	return pte_pmd(pte_clear_uffd_wp(pmd_pte(pmd)));
> +}
> +
> +static inline int pmd_swp_uffd_wp(pmd_t pmd)
> +{
> +	return pte_swp_uffd_wp(pmd_pte(pmd));
> +}
> +
> +static inline pmd_t pmd_swp_mkuffd_wp(pmd_t pmd)
> +{
> +	return pte_pmd(pte_swp_mkuffd_wp(pmd_pte(pmd)));
> +}
> +
> +static inline pmd_t pmd_swp_clear_uffd_wp(pmd_t pmd)
> +{
> +	return pte_pmd(pte_swp_clear_uffd_wp(pmd_pte(pmd)));
> +}
> +#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
> +
>   #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>   static inline int pmd_soft_dirty(pmd_t pmd)
>   {
> @@ -907,7 +971,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>    * Format of swap PTE:
>    *	bit            0:	_PAGE_PRESENT (zero)
>    *	bit       1 to 3:       _PAGE_LEAF (zero)
> - *	bit	       4:	_PAGE_SWP_SOFT_DIRTY
> + *	bit	       4:	_PAGE_SWP_SOFT_DIRTY or _PAGE_SWP_UFFD_WP
>    *	bit            5:	_PAGE_PROT_NONE (zero)
>    *	bit            6:	exclusive marker
>    *	bits      7 to 11:	swap type

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
