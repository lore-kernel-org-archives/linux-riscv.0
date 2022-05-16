Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEA1C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdDInRhkYXo9QK4BNdAJkspOfQSpZ1LotHNpjoYbBVE=; b=bkeON2/8q3D43y
	ZGwoRqwaBO7YuzaomEcEYXiODJRNDx4ZBluVds1HDCm3Tr8NgjqhM4fmWriAd3nVdzOHgBjk2kqD2
	Z6d1yuBbchJhUGgqkN89X8LmBsjDHlI/PJRplydAlcQbXBxcO0cF7UfszWiubvbNhgSn0gN0eMaR3
	2sOq67zD7kFpm9jtKuxUH/5z79wLEMBqWjGubYODOpylWNtCk0j0+ihlqiHsx6iiqU2mNZ4S+CY30
	quPH7mUq5t/ZIXKjKEWY3re1lGj7w05PBWBZyR9AZV1+ohm8Ju0PHOgbRhpnxSc9bcOXyC2EW/3iP
	ELwIC60sFAq0G+z9omkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUe8-006HOF-QR; Mon, 16 May 2022 06:56:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUe5-006HMt-3X
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 06:55:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B23A46101E
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B66C36AFA
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652684154;
 bh=ZEiIsQW/xdZCNGKyMipIK7sSihuM30iDk3H5O2JkGuU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XtIpzHwy0SYPsR0fjERJ3J/lurpTrMK1/+PNNjyOs9cFQnCZfj+6KPhpWEvkpmHIF
 1BmBafXCszkbCAfUHwCFKDqW/xBFBifvo2AGnsX+WpJBJ6zL7NTrmCwtan1Y3cgk+O
 bmYDLnrYh8bAahHTYZ+nh4D+NJSZAXbA7npl0lU6Ey2YCNx7I7rlfs371hqQVrOvfq
 qFUoF8Q+WgUJrRnkqAUcT0DUGnG7/9pyVdVEdPFsqswxSr8mmBnfv4Rj/s+2sGT1FV
 S4MCtJFkr4PaBmRgg9tE2rTOMwcpwY1jRw1CR1xpzPvDpcp46GsFuJ9RBBMrNF+ve1
 yvHLZzxE9f+Jg==
Received: by mail-vs1-f48.google.com with SMTP id d22so14518781vsf.2
 for <linux-riscv@lists.infradead.org>; Sun, 15 May 2022 23:55:54 -0700 (PDT)
X-Gm-Message-State: AOAM530SjFVpCbZcZv8zXaDrho8Rxe++1wLa6cR7s8DTxqVZHtiCkEM7
 J8XL1RJaPjDNLqhIrIlhjNgVllT95r3NOOjc02I=
X-Google-Smtp-Source: ABdhPJyOridjdzqphYxtNwTtgU/gRgnYd2n9vN74u262RNhlcwhDQ2fTlx7tpjdq6VVHh7FjpB4fxNFrdP8EsMyO5fY=
X-Received: by 2002:a67:af01:0:b0:32d:3d57:cff with SMTP id
 v1-20020a67af01000000b0032d3d570cffmr5964993vsl.8.1652684153658; Sun, 15 May
 2022 23:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220511192921.2223629-1-heiko@sntech.de>
 <20220511192921.2223629-9-heiko@sntech.de>
In-Reply-To: <20220511192921.2223629-9-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 16 May 2022 14:55:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQuO1o0PfqYAq5XwMsSEjO_Oda-otsNRdB36K9dhiYnwQ@mail.gmail.com>
Message-ID: <CAJF2gTQuO1o0PfqYAq5XwMsSEjO_Oda-otsNRdB36K9dhiYnwQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] riscv: Fix accessing pfn bits in PTEs for non-32bit
 variants
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 liush <liush@allwinnertech.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_235557_262564_FDB78134 
X-CRM114-Status: GOOD (  25.78  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Thu, May 12, 2022 at 3:29 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> On rv32 the PFN part of PTEs is defined to use bits [xlen-1:10]
> while on rv64 it is defined to use bits [53:10], leaving [63:54]
> as reserved.
>
> With upcoming optional extensions like svpbmt these previously
> reserved bits will get used so simply right-shifting the PTE
> to get the PFN won't be enough.
>
> So introduce a _PAGE_PFN_MASK constant to mask the correct bits
> for both rv32 and rv64 before shifting.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>  arch/riscv/include/asm/pgtable-32.h   |  8 ++++++++
>  arch/riscv/include/asm/pgtable-64.h   | 14 +++++++++++---
>  arch/riscv/include/asm/pgtable-bits.h |  6 ------
>  arch/riscv/include/asm/pgtable.h      |  8 +++++---
>  4 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index 5b2e79e5bfa5..e266a4fe7f43 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -7,6 +7,7 @@
>  #define _ASM_RISCV_PGTABLE_32_H
>
>  #include <asm-generic/pgtable-nopmd.h>
> +#include <linux/bits.h>
>  #include <linux/const.h>
>
>  /* Size of region mapped by a page global directory */
> @@ -16,4 +17,11 @@
>
>  #define MAX_POSSIBLE_PHYSMEM_BITS 34
>
> +/*
> + * rv32 PTE format:
> + * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> + *       PFN      reserved for SW   D   A   G   U   X   W   R   V
> + */
> +#define _PAGE_PFN_MASK  GENMASK(31, 10)
> +
>  #endif /* _ASM_RISCV_PGTABLE_32_H */
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 7e246e9f8d70..15f3ad5aee4f 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -6,6 +6,7 @@
>  #ifndef _ASM_RISCV_PGTABLE_64_H
>  #define _ASM_RISCV_PGTABLE_64_H
>
> +#include <linux/bits.h>
>  #include <linux/const.h>
>
>  extern bool pgtable_l4_enabled;
> @@ -65,6 +66,13 @@ typedef struct {
>
>  #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
>
> +/*
> + * rv64 PTE format:
> + * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> + *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
> + */
> +#define _PAGE_PFN_MASK  GENMASK(53, 10)
> +
>  static inline int pud_present(pud_t pud)
>  {
>         return (pud_val(pud) & _PAGE_PRESENT);
> @@ -108,12 +116,12 @@ static inline unsigned long _pud_pfn(pud_t pud)
>
>  static inline pmd_t *pud_pgtable(pud_t pud)
>  {
> -       return (pmd_t *)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
> +       return (pmd_t *)pfn_to_virt(__page_val_to_pfn(pud_val(pud)));
>  }
>
>  static inline struct page *pud_page(pud_t pud)
>  {
> -       return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
> +       return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
>  }
>
>  #define mm_p4d_folded  mm_p4d_folded
> @@ -143,7 +151,7 @@ static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
>
>  static inline unsigned long _pmd_pfn(pmd_t pmd)
>  {
> -       return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
> +       return __page_val_to_pfn(pmd_val(pmd));
>  }
>
>  #define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
> diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> index a6b0c89824c2..e571fa954afc 100644
> --- a/arch/riscv/include/asm/pgtable-bits.h
> +++ b/arch/riscv/include/asm/pgtable-bits.h
> @@ -6,12 +6,6 @@
>  #ifndef _ASM_RISCV_PGTABLE_BITS_H
>  #define _ASM_RISCV_PGTABLE_BITS_H
>
> -/*
> - * PTE format:
> - * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> - *       PFN      reserved for SW   D   A   G   U   X   W   R   V
> - */
> -
>  #define _PAGE_ACCESSED_OFFSET 6
>
>  #define _PAGE_PRESENT   (1 << 0)
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 046b44225623..faba543e2b08 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -108,6 +108,8 @@
>  #include <asm/tlbflush.h>
>  #include <linux/mm_types.h>
>
> +#define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
> +
>  #ifdef CONFIG_64BIT
>  #include <asm/pgtable-64.h>
>  #else
> @@ -261,12 +263,12 @@ static inline unsigned long _pgd_pfn(pgd_t pgd)
>
>  static inline struct page *pmd_page(pmd_t pmd)
>  {
> -       return pfn_to_page(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
> +       return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
>  }
>
>  static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  {
> -       return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
> +       return (unsigned long)pfn_to_virt(__page_val_to_pfn(pmd_val(pmd)));
>  }
>
>  static inline pte_t pmd_pte(pmd_t pmd)
> @@ -282,7 +284,7 @@ static inline pte_t pud_pte(pud_t pud)
>  /* Yields the page frame number (PFN) of a page table entry */
>  static inline unsigned long pte_pfn(pte_t pte)
>  {
> -       return (pte_val(pte) >> _PAGE_PFN_SHIFT);
> +       return __page_val_to_pfn(pte_val(pte));
>  }
>
>  #define pte_page(x)     pfn_to_page(pte_pfn(x))
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
