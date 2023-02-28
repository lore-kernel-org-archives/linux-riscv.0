Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B262AC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FUxGzSKeA3R/IyADktOwivqq+CbT5psNXZzw9Lfb2p0=; b=Q4Jsk6Ov9U0apHG5DGuqTNhpEJ
	3baLZCGi6EO7iyShLY3UOcNWMhOb7+0J9wVT4gvj8zUk4ksxhRCJ13aQZTHDvOI6AuLLLmGDURxUn
	Ft/Jx5GDbqD22B3FGEfqk8wGgpPnsosn1ptCYVeNN53RPFtzEl4lT++CuT5vnEqa1eHZS6vJ2xogN
	uDeth5KycL5SXqFKS58SRG1qJf8vnivHYCXA0K9Gi1hZoeE/o6cmxaxCnXARVPa7T7RpPfFkz/bGZ
	A/ojPT0JBgHfRrMEbbvx6HsTZN1MbOP1f/JoRIfe8j6kqRiO/hT/tgHFpQDdsuW9LvYaSxauS+GpB
	MZQGRWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2Fl-00DgSq-2p; Tue, 28 Feb 2023 15:50:57 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2FZ-00DgNa-Ma
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:50:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so1883037pjn.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677599437;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UryJW0EuVY8u2sW6z9mCQGQjWTzi+ldNIkpQGB8+HtU=;
        b=B87Sz4AD1+v0XwCsrRoMpTHOfPGa5C2kWXfopmI+Go4uM/GlteH88Prr3xnOjgOBpK
         5TXEM23YJaNZ7g9EbVYCuK/JD08Tarh0thhlMnTFFyMOEygBOFNnHXUltVMCUsr+soSV
         N7JymoT7+eTk9L3hW6gd0jRYqCQJylQ1Sv9bK+MVkRTzPo6kpx2lySfN5ZcoLvOslGRO
         KPapypwptYDfTKoui/kxjkto9aXQEXnB0zNI2xnF9K9K1w6AMTAlsuNOBVAzoDOh6S9m
         XMeLlvUu7AtZRerpGExszQw24rKkktWNdf98ePl6noAkKeRplxZuYNOqKiII4Yi6n3n8
         TCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677599437;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UryJW0EuVY8u2sW6z9mCQGQjWTzi+ldNIkpQGB8+HtU=;
        b=ITjAY8/ZwhsA0kHkFXwkqOOf1rMrBCeR7WcAMm+eBxEe7G0RyPeYJyVM+NZfMmxOXk
         qiI3HhO1iZmtZ1KMfxir6kgJqVh2FzuZBSyH7gEAuSRqGG+DpAp86gV0/Dta3bdJzRk9
         yVKfXa/HJoXyRNYWxpGs2gcaZvvAfUNGtr13bzzxg45KGFZ8ZuvY8XnndrsEtREQUhXw
         buQ3QS7L1rEJWLkjiYRLFXblrRUSa/lOHLeyg55+RtZxHxuH0QtnF+6lHIpZ4VS0FPfD
         pkjAEK2NaC8pefSUNdBb1EBBjBhwYE6KTE7paVt0zRDPRzfCQd8SMCvIelW0Qx89veSO
         iu4Q==
X-Gm-Message-State: AO0yUKVIUsdwjeB38RgxQ8XQm15QU+m4ygU23A+Kg9z6otWP7mOo4YNe
	0IABUmk/9wN8XUMMrGjhF+45dg==
X-Google-Smtp-Source: AK7set80NPLuAAPSgZZsRqS35byB+8nywbDP9pe24Tyk+tjImkNZjMRv8vvzE4HsisyOpmumYVDG2Q==
X-Received: by 2002:a17:902:d2c7:b0:19c:fbdb:43cb with SMTP id n7-20020a170902d2c700b0019cfbdb43cbmr3953598plc.51.1677599436809;
        Tue, 28 Feb 2023 07:50:36 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902f7cc00b0019d1f42b00csm3612084plw.17.2023.02.28.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:50:36 -0800 (PST)
Date: Tue, 28 Feb 2023 07:50:36 -0800 (PST)
X-Google-Original-Date: Tue, 28 Feb 2023 07:49:44 PST (-0800)
Subject: Re: [PATCH mm-unstable v1 19/26] riscv/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
In-Reply-To: <20230113171026.582290-20-david@redhat.com>
CC: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, hughd@google.com,
  jhubbard@nvidia.com, jgg@nvidia.com, rppt@linux.ibm.com, shy828301@gmail.com, vbabka@suse.cz,
  namit@vmware.com, aarcange@redhat.com, peterx@redhat.com, linux-mm@kvack.org, x86@kernel.org,
  linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
  loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
  openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
  sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, david@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: david@redhat.com
Message-ID: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_075045_792365_4E940D3B 
X-CRM114-Status: GOOD (  23.09  )
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

On Fri, 13 Jan 2023 09:10:19 PST (-0800), david@redhat.com wrote:
> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
> from the offset. This reduces the maximum swap space per file: on 32bit
> to 16 GiB (was 32 GiB).

Seems fine to me, I doubt anyone wants a huge pile of swap on rv32.

>
> Note that this bit does not conflict with swap PMDs and could also be used
> in swap PMD context later.
>
> While at it, mask the type in __swp_entry().
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/riscv/include/asm/pgtable-bits.h |  3 +++
>  arch/riscv/include/asm/pgtable.h      | 29 ++++++++++++++++++++++-----
>  2 files changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> index b9e13a8fe2b7..f896708e8331 100644
> --- a/arch/riscv/include/asm/pgtable-bits.h
> +++ b/arch/riscv/include/asm/pgtable-bits.h
> @@ -27,6 +27,9 @@
>   */
>  #define _PAGE_PROT_NONE _PAGE_GLOBAL
>
> +/* Used for swap PTEs only. */
> +#define _PAGE_SWP_EXCLUSIVE _PAGE_ACCESSED
> +
>  #define _PAGE_PFN_SHIFT 10
>
>  /*
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4eba9a98d0e3..03a4728db039 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -724,16 +724,18 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>
>  /*
> - * Encode and decode a swap entry
> + * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
> + * are !pte_none() && !pte_present().
>   *
>   * Format of swap PTE:
>   *	bit            0:	_PAGE_PRESENT (zero)
>   *	bit       1 to 3:       _PAGE_LEAF (zero)
>   *	bit            5:	_PAGE_PROT_NONE (zero)
> - *	bits      6 to 10:	swap type
> - *	bits 10 to XLEN-1:	swap offset
> + *	bit            6:	exclusive marker
> + *	bits      7 to 11:	swap type
> + *	bits 11 to XLEN-1:	swap offset
>   */
> -#define __SWP_TYPE_SHIFT	6
> +#define __SWP_TYPE_SHIFT	7
>  #define __SWP_TYPE_BITS		5
>  #define __SWP_TYPE_MASK		((1UL << __SWP_TYPE_BITS) - 1)
>  #define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
> @@ -744,11 +746,28 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  #define __swp_type(x)	(((x).val >> __SWP_TYPE_SHIFT) & __SWP_TYPE_MASK)
>  #define __swp_offset(x)	((x).val >> __SWP_OFFSET_SHIFT)
>  #define __swp_entry(type, offset) ((swp_entry_t) \
> -	{ ((type) << __SWP_TYPE_SHIFT) | ((offset) << __SWP_OFFSET_SHIFT) })
> +	{ (((type) & __SWP_TYPE_MASK) << __SWP_TYPE_SHIFT) | \
> +	  ((offset) << __SWP_OFFSET_SHIFT) })
>
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
>
> +#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> +static inline int pte_swp_exclusive(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> +}
> +
> +static inline pte_t pte_swp_mkexclusive(pte_t pte)
> +{
> +	return __pte(pte_val(pte) | _PAGE_SWP_EXCLUSIVE);
> +}
> +
> +static inline pte_t pte_swp_clear_exclusive(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~_PAGE_SWP_EXCLUSIVE);
> +}
> +
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>  #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
>  #define __swp_entry_to_pmd(swp) __pmd((swp).val)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
