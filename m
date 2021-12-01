Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369CDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 05:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdLlWSumq8F7nuiOdIavbo/cY/pYa14L2SIdyGYNbAc=; b=flFcvvOtHC8blD
	TihKQxJRMaOADsICwYbMsrSRb6wOus2HofoiMLvcFmTb6TGcYAWdo8WcQA5wtcSLcDZJavjZ0VwGc
	QTTZ/d8BE6GpigjXoIBzhOOk67itOr68aK3zuGFj5ewmdCS0vYAp7d480EQBPv34NYNgDYuaPcFWK
	yg/rTsw2HbHB/AGSEV9At76eEit60sNvsRIprEldDN513BmBwFCzgbsNkqdAatbzZzftVifcp8pH+
	ijYvtbhH7j600+yoHg7HiPauxgsjS2xxf2WRdTOdHXCaprycX3Gtd/okPNAb/zMW/fp3xxQDF1nTM
	iZ6kd2v+/WsXgltW2nJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msHoS-007Uks-Rd; Wed, 01 Dec 2021 05:05:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msHoP-007UkX-Ph
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 05:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638335143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MwCfqhU+GYQqI6C1UAmflLNQ3JyOiEXqpkRzFgrISQ=;
 b=FSZpvvlP1XPVEiblboLo74DtX/nLv6zOeQGRqJyMKXyftN8dHRrISZ4OvKH8AfjJzHnWn2
 iSMH2NiZQ4UJtXSV8PCUo0g8Q/Q0lJcBN69JSerCHCGk+yKkMfG9Pnqy78CWqP5Q3ZdEwB
 quoOYW/YfymYgMleVwGjwK+IpzyNlkI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-BXJuR7IJN_WcxVb0_IOR9g-1; Wed, 01 Dec 2021 00:05:37 -0500
X-MC-Unique: BXJuR7IJN_WcxVb0_IOR9g-1
Received: by mail-ed1-f72.google.com with SMTP id
 i19-20020a05640242d300b003e7d13ebeedso19042019edc.7
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 21:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+MwCfqhU+GYQqI6C1UAmflLNQ3JyOiEXqpkRzFgrISQ=;
 b=4Hw5fdYs9TPRY2I3cp2bkZuAI8JFUvkoegCf+Sy7kOPEibYJjT7bmHb582X8/ZnPlp
 w2O9DWVpp0Dl/Qqgmvoa8NQdXWQFf+PnXA9ulAW0v4w4SFYmBYnQ3Y1D7qeN7JCm0tMY
 bnW8VWWk9tCS5teDc93RGefksVvBaKaBIhuEe/pm4bnrf5rIJSUmHtAgrzNIBy3UpIGM
 r/F+IfNAHNr/It+ehz3KBRMmBzo7KuXYdkiXSlLrR+dkLEehS/iMK4HVdrlVCCqXaa72
 bYS1WiWvj4kOT2GF5XqkMgskZsoG8h9arNotzK9Leah0C0du+S7OTl9xpcIAWpDoDt/+
 6aEw==
X-Gm-Message-State: AOAM533y/eaCV6TlEzgd4TQkO2WTs62x5ljYi/X94t40Wp6/+OIiNe4T
 jQlxCXOXGcAXOkg8dRhP+bHtTcCGNWvhCxqXz/2jZ933tdfZ/Y50Weq79Fky/wHezf907ExcxwW
 ElsFUZmcmEw+EB6AAeVnOVtVXX18gpATqBPJJzjL4jexO
X-Received: by 2002:a05:6402:b64:: with SMTP id
 cb4mr5125703edb.325.1638335136539; 
 Tue, 30 Nov 2021 21:05:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn+POs/MelOnh4jI+ygLN4vHU3RLUJQGf92GCNgl9XC2Rm0JmCtkLOfdB8CqHKp4U39XTFKXJOPjeaq7eb5YU=
X-Received: by 2002:a05:6402:b64:: with SMTP id
 cb4mr5125665edb.325.1638335136330; 
 Tue, 30 Nov 2021 21:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20211129014007.286478-1-wefu@redhat.com>
 <20211129014007.286478-3-wefu@redhat.com>
 <20211129213634.1fe31b10@xhacker>
In-Reply-To: <20211129213634.1fe31b10@xhacker>
From: Wei Fu <wefu@redhat.com>
Date: Wed, 1 Dec 2021 13:05:25 +0800
Message-ID: <CA+YCwKkSuvbZtCzuZvA_FaFrA9qDFTLJAdQO7K_gbP_Xs7QY3A@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] riscv: add RISC-V Svpbmt extension supports
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, atishp04@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>, 
 Liu Shaohua <liush@allwinnertech.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_210546_021191_74C659F1 
X-CRM114-Status: GOOD (  38.03  )
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

Hi, Jisheng Zhang,

On Mon, Nov 29, 2021 at 9:44 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Mon, 29 Nov 2021 09:40:07 +0800
> wefu@redhat.com wrote:
>
> > From: Wei Fu <wefu@redhat.com>
> >
> > This patch follows the standard pure RISC-V Svpbmt extension in
> > privilege spec to solve the non-coherent SOC dma synchronization
> > issues.
> >
> > Here is the svpbmt PTE format:
> > | 63 | 62-61 | 60-8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> >   N     MT     RSW    D   A   G   U   X   W   R   V
> >         ^
> >
> > Of the Reserved bits [63:54] in a leaf PTE, the high bit is already
> > allocated (as the N bit), so bits [62:61] are used as the MT (aka
> > MemType) field. This field specifies one of three memory types that
> > are close equivalents (or equivalent in effect) to the three main x86
> > and ARMv8 memory types - as shown in the following table.
> >
> > RISC-V
> > Encoding &
> > MemType     RISC-V Description
> > ----------  ------------------------------------------------
> > 00 - PMA    Normal Cacheable, No change to implied PMA memory type
> > 01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
> > 10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
> > 11 - Rsvd   Reserved for future standard use
> >
> > The standard protection_map[] needn't be modified because the "PMA"
> > type keeps the highest bits zero. And the whole modification is
> > limited in the arch/riscv/* and using a global variable
> > (__svpbmt) as _PAGE_MASK/IO/NOCACHE for pgprot_noncached
> > (&writecombine) in pgtable.h. We also add _PAGE_CHG_MASK to filter
> > PFN than before.
> >
> > Enable it in devicetree - (Add "riscv,svpbmt" in the mmu of cpu node)
> >  - mmu:
> >      riscv,svpmbt
> >
> > Signed-off-by: Wei Fu <wefu@redhat.com>
> > Co-developed-by: Liu Shaohua <liush@allwinnertech.com>
> > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > Co-developed-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Drew Fustini <drew@beagleboard.org>
> > Cc: Wei Fu <wefu@redhat.com>
> > Cc: Wei Wu <lazyparser@gmail.com>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Daniel Lustig <dlustig@nvidia.com>
> > Cc: Greg Favor <gfavor@ventanamicro.com>
> > Cc: Andrea Mondelli <andrea.mondelli@huawei.com>
> > Cc: Jonathan Behrens <behrensj@mit.edu>
> > Cc: Xinhaoqu (Freddie) <xinhaoqu@huawei.com>
> > Cc: Bill Huffman <huffman@cadence.com>
> > Cc: Nick Kossifidis <mick@ics.forth.gr>
> > Cc: Allen Baum <allen.baum@esperantotech.com>
> > Cc: Josh Scheid <jscheid@ventanamicro.com>
> > Cc: Richard Trauben <rtrauben@gmail.com>
> > ---
> >  arch/riscv/include/asm/fixmap.h       |  2 +-
> >  arch/riscv/include/asm/pgtable-64.h   | 21 ++++++++++++---
> >  arch/riscv/include/asm/pgtable-bits.h | 39 +++++++++++++++++++++++++--
> >  arch/riscv/include/asm/pgtable.h      | 39 ++++++++++++++++++++-------
> >  arch/riscv/kernel/cpufeature.c        | 35 ++++++++++++++++++++++++
> >  arch/riscv/mm/init.c                  |  5 ++++
> >  6 files changed, 126 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> > index 54cbf07fb4e9..5acd99d08e74 100644
> > --- a/arch/riscv/include/asm/fixmap.h
> > +++ b/arch/riscv/include/asm/fixmap.h
> > @@ -43,7 +43,7 @@ enum fixed_addresses {
> >       __end_of_fixed_addresses
> >  };
> >
> > -#define FIXMAP_PAGE_IO               PAGE_KERNEL
> > +#define FIXMAP_PAGE_IO               PAGE_IOREMAP
> >
> >  #define __early_set_fixmap   __set_fixmap
> >
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > index 228261aa9628..16d251282b1d 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -59,14 +59,29 @@ static inline void pud_clear(pud_t *pudp)
> >       set_pud(pudp, __pud(0));
> >  }
> >
> > +static inline unsigned long _chg_of_pmd(pmd_t pmd)
> > +{
> > +     return (pmd_val(pmd) & _PAGE_CHG_MASK);
> > +}
> > +
> > +static inline unsigned long _chg_of_pud(pud_t pud)
> > +{
> > +     return (pud_val(pud) & _PAGE_CHG_MASK);
> > +}
> > +
> > +static inline unsigned long _chg_of_pte(pte_t pte)
> > +{
> > +     return (pte_val(pte) & _PAGE_CHG_MASK);
> > +}
> > +
> >  static inline pmd_t *pud_pgtable(pud_t pud)
> >  {
> > -     return (pmd_t *)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
> > +     return (pmd_t *)pfn_to_virt(_chg_of_pud(pud) >> _PAGE_PFN_SHIFT);
> >  }
> >
> >  static inline struct page *pud_page(pud_t pud)
> >  {
> > -     return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
> > +     return pfn_to_page(_chg_of_pud(pud) >> _PAGE_PFN_SHIFT);
> >  }
> >
> >  static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
> > @@ -76,7 +91,7 @@ static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
> >
> >  static inline unsigned long _pmd_pfn(pmd_t pmd)
> >  {
> > -     return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
> > +     return _chg_of_pmd(pmd) >> _PAGE_PFN_SHIFT;
> >  }
> >
> >  #define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
> > diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> > index 2ee413912926..e5b0fce4ddc5 100644
> > --- a/arch/riscv/include/asm/pgtable-bits.h
> > +++ b/arch/riscv/include/asm/pgtable-bits.h
> > @@ -7,7 +7,7 @@
> >  #define _ASM_RISCV_PGTABLE_BITS_H
> >
> >  /*
> > - * PTE format:
> > + * rv32 PTE format:
> >   * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> >   *       PFN      reserved for SW   D   A   G   U   X   W   R   V
> >   */
> > @@ -24,6 +24,40 @@
> >  #define _PAGE_DIRTY     (1 << 7)    /* Set by hardware on any write */
> >  #define _PAGE_SOFT      (1 << 8)    /* Reserved for software */
> >
> > +#if !defined(__ASSEMBLY__) && defined(CONFIG_64BIT)
> > +/*
> > + * rv64 PTE format:
> > + * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > + *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
> > + * [62:61] Memory Type definitions:
> > + *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
> > + *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
> > + *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
> > + *  11 - Rsvd   Reserved for future standard use
> > + */
> > +#define _SVPBMT_PMA          0UL
> > +#define _SVPBMT_NC           (1UL << 61)
> > +#define _SVPBMT_IO           (1UL << 62)
> > +#define _SVPBMT_MASK         (_SVPBMT_NC | _SVPBMT_IO)
> > +
> > +extern struct __svpbmt_struct {
> > +     unsigned long mask;
> > +     unsigned long pma;
> > +     unsigned long nocache;
> > +     unsigned long io;
> > +} __svpbmt __cacheline_aligned;
> > +
> > +#define _PAGE_MASK           __svpbmt.mask
> > +#define _PAGE_PMA            __svpbmt.pma
> > +#define _PAGE_NOCACHE                __svpbmt.nocache
> > +#define _PAGE_IO             __svpbmt.io
> > +#else
> > +#define _PAGE_MASK           0
> > +#define _PAGE_PMA            0
> > +#define _PAGE_NOCACHE                0
> > +#define _PAGE_IO             0
> > +#endif /* !__ASSEMBLY__ && CONFIG_64BIT */
> > +
> >  #define _PAGE_SPECIAL   _PAGE_SOFT
> >  #define _PAGE_TABLE     _PAGE_PRESENT
> >
> > @@ -38,7 +72,8 @@
> >  /* Set of bits to preserve across pte_modify() */
> >  #define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |       \
> >                                         _PAGE_WRITE | _PAGE_EXEC |    \
> > -                                       _PAGE_USER | _PAGE_GLOBAL))
> > +                                       _PAGE_USER | _PAGE_GLOBAL |   \
> > +                                       _PAGE_MASK))
> >  /*
> >   * when all of R/W/X are zero, the PTE is a pointer to the next level
> >   * of the page table; otherwise, it is a leaf PTE.
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index bf204e7c1f74..0f7a6541015f 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -138,7 +138,8 @@
> >                               | _PAGE_PRESENT \
> >                               | _PAGE_ACCESSED \
> >                               | _PAGE_DIRTY \
> > -                             | _PAGE_GLOBAL)
> > +                             | _PAGE_GLOBAL \
> > +                             | _PAGE_PMA)
> >
> >  #define PAGE_KERNEL          __pgprot(_PAGE_KERNEL)
> >  #define PAGE_KERNEL_READ     __pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
> > @@ -148,11 +149,9 @@
> >
> >  #define PAGE_TABLE           __pgprot(_PAGE_TABLE)
> >
> > -/*
> > - * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
> > - * change the properties of memory regions.
> > - */
> > -#define _PAGE_IOREMAP _PAGE_KERNEL
> > +#define _PAGE_IOREMAP        ((_PAGE_KERNEL & ~_PAGE_MASK) | _PAGE_IO)
> > +
> > +#define PAGE_IOREMAP         __pgprot(_PAGE_IOREMAP)
> >
> >  extern pgd_t swapper_pg_dir[];
> >
> > @@ -232,12 +231,12 @@ static inline unsigned long _pgd_pfn(pgd_t pgd)
> >
> >  static inline struct page *pmd_page(pmd_t pmd)
> >  {
> > -     return pfn_to_page(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
> > +     return pfn_to_page(_chg_of_pmd(pmd) >> _PAGE_PFN_SHIFT);
> >  }
> >
> >  static inline unsigned long pmd_page_vaddr(pmd_t pmd)
> >  {
> > -     return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
> > +     return (unsigned long)pfn_to_virt(_chg_of_pmd(pmd) >> _PAGE_PFN_SHIFT);
> >  }
> >
> >  static inline pte_t pmd_pte(pmd_t pmd)
> > @@ -253,7 +252,7 @@ static inline pte_t pud_pte(pud_t pud)
> >  /* Yields the page frame number (PFN) of a page table entry */
> >  static inline unsigned long pte_pfn(pte_t pte)
> >  {
> > -     return (pte_val(pte) >> _PAGE_PFN_SHIFT);
> > +     return (_chg_of_pte(pte) >> _PAGE_PFN_SHIFT);
> >  }
> >
> >  #define pte_page(x)     pfn_to_page(pte_pfn(x))
> > @@ -492,6 +491,28 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
> >       return ptep_test_and_clear_young(vma, address, ptep);
> >  }
> >
> > +#define pgprot_noncached pgprot_noncached
> > +static inline pgprot_t pgprot_noncached(pgprot_t _prot)
> > +{
> > +     unsigned long prot = pgprot_val(_prot);
> > +
> > +     prot &= ~_PAGE_MASK;
> > +     prot |= _PAGE_IO;
> > +
> > +     return __pgprot(prot);
> > +}
> > +
> > +#define pgprot_writecombine pgprot_writecombine
> > +static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
> > +{
> > +     unsigned long prot = pgprot_val(_prot);
> > +
> > +     prot &= ~_PAGE_MASK;
> > +     prot |= _PAGE_NOCACHE;
> > +
> > +     return __pgprot(prot);
> > +}
> > +
> >  /*
> >   * THP functions
> >   */
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index d959d207a40d..fa7480cb8b87 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -8,6 +8,7 @@
> >
> >  #include <linux/bitmap.h>
> >  #include <linux/of.h>
> > +#include <linux/pgtable.h>
> >  #include <asm/processor.h>
> >  #include <asm/hwcap.h>
> >  #include <asm/smp.h>
> > @@ -59,6 +60,38 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
> >  }
> >  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> >
> > +static void __init mmu_supports_svpbmt(void)
> > +{
> > +#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
>
> IIRC, Christoph suggested a CONFIG_RISCV_SVPBMT when reviewing v3. What
> about that idea?

Yes, sorry for missing it, yes, I think we can have something like this

config ARCH_HAS_RISCV_SVPBMT
bool
default n

any platform which needs this support, can just

select ARCH_HAS_RISCV_SVPBMT

and which is the best name? ARCH_HAS_RISCV_SVPBMT or just ARCH_HAS_SVPBMT ?

>
> > +     struct device_node *node;
> > +     const char *str;
> > +
> > +     for_each_of_cpu_node(node) {
> > +             if (of_property_read_string(node, "mmu-type", &str))
> > +                     continue;
> > +
> > +             if (!strncmp(str + 6, "none", 4))
> > +                     continue;
> > +
> > +             if (of_property_read_string(node, "mmu", &str))
> > +                     continue;
> > +
> > +             if (strncmp(str + 6, "svpmbt", 6))
> > +                     continue;
> > +     }
> > +
> > +     __svpbmt.pma            = _SVPBMT_PMA;
> > +     __svpbmt.nocache        = _SVPBMT_NC;
> > +     __svpbmt.io             = _SVPBMT_IO;
> > +     __svpbmt.mask           = _SVPBMT_MASK;
> > +#endif
> > +}
> > +
> > +static void __init mmu_supports(void)
>
> can we remove this function currently? Instead, directly call
> mmu_supports_svpbmt()?
>
> > +{
> > +     mmu_supports_svpbmt();
> > +}
> > +
> >  void __init riscv_fill_hwcap(void)
> >  {
> >       struct device_node *node;
> > @@ -67,6 +100,8 @@ void __init riscv_fill_hwcap(void)
> >       size_t i, j, isa_len;
> >       static unsigned long isa2hwcap[256] = {0};
> >
> > +     mmu_supports();
> > +
> >       isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
> >       isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
> >       isa2hwcap['a'] = isa2hwcap['A'] = COMPAT_HWCAP_ISA_A;
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 24b2b8044602..e4e658165ee1 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -854,3 +854,8 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
> >       return vmemmap_populate_basepages(start, end, node, NULL);
> >  }
> >  #endif
> > +
> > +#if defined(CONFIG_64BIT)
> > +struct __svpbmt_struct __svpbmt __ro_after_init;
>
> Added the structure for all RV64 including NOMMU case and those platforms
> which doen't want SVPBMT at all, I believe Christoph's CONFIG_RISCV_SVPBMT
> suggestion can solve this problem.

see ARCH_HAS_RISCV_SVPBMT above . :-)

>
> > +EXPORT_SYMBOL(__svpbmt);
> > +#endif
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
