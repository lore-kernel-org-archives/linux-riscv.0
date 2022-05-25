Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F4AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Vlj10fYaNPsbyR30+2XDWePxJ+Rx+EPaBN/M8NxcrQ=; b=Sid8DfV9rUnbOb
	48UkENOhY1Ki0cMxvRv0ylWviktC2jHgJ6b67xfnrsS4pw/KynNhVHK8+qq0hS6OgkD5kNAe/jh9q
	QOiGWmiAuQmfGN8GCp2K77wEAnCn6LGsM0hjak+oU5mJDWeN0+LCEKloUwUL0nwyzc4MfCrK+Bv7i
	hy+PYJAzwwzwk6T9Fe7wWqiF1lqIMm35lOvXYSK5PrEtrT1ae5BhAjhYHG6z1FDQUTSQJsAOP/vmn
	Td7NiYLifwfw8Y10kESo6JQLWk3ic/FDtuEVM1/sjcAap4mK/QUjNMjaKNWp3qgcuXMLZzEr+dGHy
	yMyhvvkXyECJwPgo1htw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsq4-00BZQe-ER; Wed, 25 May 2022 15:22:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsq3-00BZQA-7U
	for linux-riscv@bombadil.infradead.org; Wed, 25 May 2022 15:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JolMnjk/zrwx2vvFNknPfrUxJ7RkuEw9PzoHAvEqJjk=; b=akN2T4oc7zZfJGdkAmEfL32N5V
	0kChYuTOPM6+W2IKSqPncWgMS1zO/EaEO74LOnO3OHkhcIaICsi1xkrXulTYCAW1HEeLcSlJXnIHE
	afJuVS9u+yD2wK6wVOGrpWCTzUFodKFCn7cnOznfr+BdnnnmM8ncN1s9oOSM2ZgZ5/9wdK2LJOMCw
	1GyR6Pf0yYYDOVIi10exzVpn42UkZJ+28aIa5R/FpGVDuODSdWlyL4pBr/UIStcA7hpQfLpwCkK6X
	yczzPMpJv35BcBbjn6f/1Aio5F5/v63ic4DazXgHOQagQMxS0V8waU86NeZDh6DPWB9i4btVzRuBv
	T4LYgnrg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntspw-001dpz-Gq
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:22:16 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1ntspm-0006gP-1A; Wed, 25 May 2022 17:22:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH 08/12] riscv: Fix accessing pfn bits in PTEs for non-32bit variants
Date: Wed, 25 May 2022 17:22:00 +0200
Message-ID: <2545779.7s5MMGUR32@diego>
In-Reply-To: <CA+zEjCuckDpweE9YEep26ZcX3xqh8QszXNq8BY-hPpQkQnRdjQ@mail.gmail.com>
References: <20220511192921.2223629-1-heiko@sntech.de> <20220511192921.2223629-9-heiko@sntech.de> <CA+zEjCuckDpweE9YEep26ZcX3xqh8QszXNq8BY-hPpQkQnRdjQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_162212_899492_D0A5AEEC 
X-CRM114-Status: GOOD (  35.96  )
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

Hi Alexandre,

Am Montag, 23. Mai 2022, 16:03:10 CEST schrieb Alexandre Ghiti:
> Hi Heiko,
> 
> On Wed, May 11, 2022 at 9:31 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > On rv32 the PFN part of PTEs is defined to use bits [xlen-1:10]
> > while on rv64 it is defined to use bits [53:10], leaving [63:54]
> > as reserved.
> >
> > With upcoming optional extensions like svpbmt these previously
> > reserved bits will get used so simply right-shifting the PTE
> > to get the PFN won't be enough.
> >
> > So introduce a _PAGE_PFN_MASK constant to mask the correct bits
> > for both rv32 and rv64 before shifting.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > ---
> >  arch/riscv/include/asm/pgtable-32.h   |  8 ++++++++
> >  arch/riscv/include/asm/pgtable-64.h   | 14 +++++++++++---
> >  arch/riscv/include/asm/pgtable-bits.h |  6 ------
> >  arch/riscv/include/asm/pgtable.h      |  8 +++++---
> >  4 files changed, 24 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> > index 5b2e79e5bfa5..e266a4fe7f43 100644
> > --- a/arch/riscv/include/asm/pgtable-32.h
> > +++ b/arch/riscv/include/asm/pgtable-32.h
> > @@ -7,6 +7,7 @@
> >  #define _ASM_RISCV_PGTABLE_32_H
> >
> >  #include <asm-generic/pgtable-nopmd.h>
> > +#include <linux/bits.h>
> >  #include <linux/const.h>
> >
> >  /* Size of region mapped by a page global directory */
> > @@ -16,4 +17,11 @@
> >
> >  #define MAX_POSSIBLE_PHYSMEM_BITS 34
> >
> > +/*
> > + * rv32 PTE format:
> > + * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > + *       PFN      reserved for SW   D   A   G   U   X   W   R   V
> > + */
> > +#define _PAGE_PFN_MASK  GENMASK(31, 10)
> > +
> >  #endif /* _ASM_RISCV_PGTABLE_32_H */
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > index 7e246e9f8d70..15f3ad5aee4f 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _ASM_RISCV_PGTABLE_64_H
> >  #define _ASM_RISCV_PGTABLE_64_H
> >
> > +#include <linux/bits.h>
> >  #include <linux/const.h>
> >
> >  extern bool pgtable_l4_enabled;
> > @@ -65,6 +66,13 @@ typedef struct {
> >
> >  #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
> >
> > +/*
> > + * rv64 PTE format:
> > + * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > + *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
> > + */
> > +#define _PAGE_PFN_MASK  GENMASK(53, 10)
> > +
> >  static inline int pud_present(pud_t pud)
> >  {
> >         return (pud_val(pud) & _PAGE_PRESENT);
> > @@ -108,12 +116,12 @@ static inline unsigned long _pud_pfn(pud_t pud)
> >
> >  static inline pmd_t *pud_pgtable(pud_t pud)
> >  {
> > -       return (pmd_t *)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
> > +       return (pmd_t *)pfn_to_virt(__page_val_to_pfn(pud_val(pud)));
> >  }
> >
> >  static inline struct page *pud_page(pud_t pud)
> >  {
> > -       return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
> > +       return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
> >  }
> >
> >  #define mm_p4d_folded  mm_p4d_folded
> > @@ -143,7 +151,7 @@ static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
> >
> >  static inline unsigned long _pmd_pfn(pmd_t pmd)
> >  {
> > -       return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
> > +       return __page_val_to_pfn(pmd_val(pmd));
> >  }
> >
> >  #define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
> > diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> > index a6b0c89824c2..e571fa954afc 100644
> > --- a/arch/riscv/include/asm/pgtable-bits.h
> > +++ b/arch/riscv/include/asm/pgtable-bits.h
> > @@ -6,12 +6,6 @@
> >  #ifndef _ASM_RISCV_PGTABLE_BITS_H
> >  #define _ASM_RISCV_PGTABLE_BITS_H
> >
> > -/*
> > - * PTE format:
> > - * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > - *       PFN      reserved for SW   D   A   G   U   X   W   R   V
> > - */
> > -
> >  #define _PAGE_ACCESSED_OFFSET 6
> >
> >  #define _PAGE_PRESENT   (1 << 0)
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 046b44225623..faba543e2b08 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -108,6 +108,8 @@
> >  #include <asm/tlbflush.h>
> >  #include <linux/mm_types.h>
> >
> > +#define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
> > +
> >  #ifdef CONFIG_64BIT
> >  #include <asm/pgtable-64.h>
> >  #else
> > @@ -261,12 +263,12 @@ static inline unsigned long _pgd_pfn(pgd_t pgd)
> >
> >  static inline struct page *pmd_page(pmd_t pmd)
> >  {
> > -       return pfn_to_page(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
> > +       return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
> >  }
> >
> >  static inline unsigned long pmd_page_vaddr(pmd_t pmd)
> >  {
> > -       return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
> > +       return (unsigned long)pfn_to_virt(__page_val_to_pfn(pmd_val(pmd)));
> >  }
> >
> >  static inline pte_t pmd_pte(pmd_t pmd)
> > @@ -282,7 +284,7 @@ static inline pte_t pud_pte(pud_t pud)
> >  /* Yields the page frame number (PFN) of a page table entry */
> >  static inline unsigned long pte_pfn(pte_t pte)
> >  {
> > -       return (pte_val(pte) >> _PAGE_PFN_SHIFT);
> > +       return __page_val_to_pfn(pte_val(pte));
> >  }
> >
> >  #define pte_page(x)     pfn_to_page(pte_pfn(x))
> > --
> > 2.35.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> I had this weird bug and it took some time to figure out that _pgd_pfn
> is missing the "& _PAGE_PFN_MASK" here.
> 
> And then I grepped _PAGE_PFN_SHIFT and saw that _pud_pfn, p4d_pgtable,
> __pmd_to_phys and stage2_pte_page_vaddr are also missing this mask. I
> agree that we need something similar to your helper __page_val_to_pfn
> (even if __page prefix is a bit weird to me) but I think we should go
> further: forbid the use of _PAGE_PFN_SHIFT and contain this in a
> single function that should be used to access the pfn minus the upper
> bits, that would avoid future oversights.
> 
> I can come up with something if needs be, up to you!

as you seem to be stuck in the topic already, you might be faster
than me with that I guess?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
