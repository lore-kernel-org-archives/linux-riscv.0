Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E8FC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmVYvVE1xVkhSuUob+uxiBBdALFgwwDqGn68OdJwgSI=; b=uqGQjwvA4M3pI/
	flM6lMmNzdG3tUTi5KYJEAKgUJffcBjQGN9jQfUd2IAib14BWWt7iAxtLno0RDt9eekvUAOtlIL9A
	h7vBitB7sJBAFo3/FcUhNzZIR1QdBLJxZTTYOtGo/rFXwQbF8U84nz/eaTUTgJ0WdmicNf2qi9fB6
	CxV+pSs7DCa1xg/EbtTFpjVZUpgxMtVZp58EXZQhrzkxUnCpX4D+kQItue6iQj3fAL31gJjmYP1g/
	U/9P+JNOyyJHm4ffzqt9WmshVUvcJssHfj/O4ALNj4EyQ7fKWItDpeNnAVfgFjmi/fxN3eOUVhZvi
	fzQ5ZnEiIxlKwKz1rysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jti-002kaH-Qh; Fri, 08 Jul 2022 09:03:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jte-002kYn-R0
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 09:03:37 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o9jtb-0003wf-It; Fri, 08 Jul 2022 11:03:31 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [RFC PATCH 3/4] riscv: pgtable: Move svpbmt into the common pgtable-bits.h
Date: Fri, 08 Jul 2022 11:03:30 +0200
Message-ID: <2118472.Icojqenx9y@diego>
In-Reply-To: <CAJF2gTSu==Odkn+k6o1c3Tgtb31hjPMM3O5QTfP26Sq=yik7BA@mail.gmail.com>
References: <20220705100523.1204595-1-guoren@kernel.org> <20220705100523.1204595-4-guoren@kernel.org> <CAJF2gTSu==Odkn+k6o1c3Tgtb31hjPMM3O5QTfP26Sq=yik7BA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_020335_117037_CC800D8F 
X-CRM114-Status: GOOD (  30.93  )
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

Hi Guo,

Am Freitag, 8. Juli 2022, 08:10:59 CEST schrieb Guo Ren:
> Sorry all, I forgot this part. If you want to try, please care:
> 
> diff --git a/arch/riscv/include/asm/errata_list.h
> b/arch/riscv/include/asm/errata_list.h
> index 47175d91773d..b252068bfd3a 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -46,7 +46,7 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma",
> SIFIVE_VENDOR_ID,      \
>   * _val is marked as "will be overwritten", so need to set it to 0
>   * in the default case.
>   */
> -#define ALT_SVPBMT_SHIFT 61
> +#define ALT_SVPBMT_SHIFT (__riscv_xlen-3)

I think using explicit bit definitions might be nicer for this and not
result in surprises in the future?

i.e. doing a 
#ifdef CONFIG_64BIT
#define ALT_SVPBMT_SHIFT 61
#else
...

similar to how the pgtable-xx.h gets included into pgtable.h

#ifdef CONFIG_64BIT
#include <asm/pgtable-64.h>
#else
#include <asm/pgtable-32.h>
#endif /* CONFIG_64BIT */


Heiko

>  #ifdef CONFIG_ERRATA_THEAD_PBMT
>  #define ALT_THEAD_PBMT_SHIFT 59
> 
> On Tue, Jul 5, 2022 at 6:05 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This patch is preparation for rv32 svpbmt, which only moves the svpbmt
> > bits definitions into the standard header and no other functionality
> > modification. Here is the list of modification:
> >  - Change u64 to ulong of riscv_page_nocache/mtmask/io functions
> >  - Using __riscv_xlen instead of 64
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/include/asm/pgtable-32.h   | 16 --------
> >  arch/riscv/include/asm/pgtable-64.h   | 55 ---------------------------
> >  arch/riscv/include/asm/pgtable-bits.h | 53 ++++++++++++++++++++++++++
> >  arch/riscv/include/asm/pgtable.h      |  5 +++
> >  4 files changed, 58 insertions(+), 71 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> > index 59ba1fbaf784..63b023bd4845 100644
> > --- a/arch/riscv/include/asm/pgtable-32.h
> > +++ b/arch/riscv/include/asm/pgtable-32.h
> > @@ -7,8 +7,6 @@
> >  #define _ASM_RISCV_PGTABLE_32_H
> >
> >  #include <asm-generic/pgtable-nopmd.h>
> > -#include <linux/bits.h>
> > -#include <linux/const.h>
> >
> >  /* Size of region mapped by a page global directory */
> >  #define PGDIR_SHIFT     22
> > @@ -17,20 +15,6 @@
> >
> >  #define MAX_POSSIBLE_PHYSMEM_BITS 34
> >
> > -/*
> > - * rv32 PTE format:
> > - * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > - *       PFN      reserved for SW   D   A   G   U   X   W   R   V
> > - */
> >  #define _PAGE_PFN_MASK  GENMASK(31, 10)
> >
> > -#define _PAGE_NOCACHE          0
> > -#define _PAGE_IO               0
> > -#define _PAGE_MTMASK           0
> > -
> > -/* Set of bits to preserve across pte_modify() */
> > -#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ | \
> > -                                         _PAGE_WRITE | _PAGE_EXEC |    \
> > -                                         _PAGE_USER | _PAGE_GLOBAL))
> > -
> >  #endif /* _ASM_RISCV_PGTABLE_32_H */
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > index 5c2aba5efbd0..3263b910e7d2 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -6,10 +6,6 @@
> >  #ifndef _ASM_RISCV_PGTABLE_64_H
> >  #define _ASM_RISCV_PGTABLE_64_H
> >
> > -#include <linux/bits.h>
> > -#include <linux/const.h>
> > -#include <asm/errata_list.h>
> > -
> >  extern bool pgtable_l4_enabled;
> >  extern bool pgtable_l5_enabled;
> >
> > @@ -67,25 +63,8 @@ typedef struct {
> >
> >  #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
> >
> > -/*
> > - * rv64 PTE format:
> > - * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > - *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
> > - */
> >  #define _PAGE_PFN_MASK  GENMASK(53, 10)
> >
> > -/*
> > - * [62:61] Svpbmt Memory Type definitions:
> > - *
> > - *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
> > - *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
> > - *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
> > - *  11 - Rsvd   Reserved for future standard use
> > - */
> > -#define _PAGE_NOCACHE_SVPBMT   (1UL << 61)
> > -#define _PAGE_IO_SVPBMT                (1UL << 62)
> > -#define _PAGE_MTMASK_SVPBMT    (_PAGE_NOCACHE_SVPBMT | _PAGE_IO_SVPBMT)
> > -
> >  /*
> >   * [63:59] T-Head Memory Type definitions:
> >   *
> > @@ -98,40 +77,6 @@ typedef struct {
> >  #define _PAGE_IO_THEAD         (1UL << 63)
> >  #define _PAGE_MTMASK_THEAD     (_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
> >
> > -static inline u64 riscv_page_mtmask(void)
> > -{
> > -       u64 val;
> > -
> > -       ALT_SVPBMT(val, _PAGE_MTMASK);
> > -       return val;
> > -}
> > -
> > -static inline u64 riscv_page_nocache(void)
> > -{
> > -       u64 val;
> > -
> > -       ALT_SVPBMT(val, _PAGE_NOCACHE);
> > -       return val;
> > -}
> > -
> > -static inline u64 riscv_page_io(void)
> > -{
> > -       u64 val;
> > -
> > -       ALT_SVPBMT(val, _PAGE_IO);
> > -       return val;
> > -}
> > -
> > -#define _PAGE_NOCACHE          riscv_page_nocache()
> > -#define _PAGE_IO               riscv_page_io()
> > -#define _PAGE_MTMASK           riscv_page_mtmask()
> > -
> > -/* Set of bits to preserve across pte_modify() */
> > -#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ | \
> > -                                         _PAGE_WRITE | _PAGE_EXEC |    \
> > -                                         _PAGE_USER | _PAGE_GLOBAL |   \
> > -                                         _PAGE_MTMASK))
> > -
> >  static inline int pud_present(pud_t pud)
> >  {
> >         return (pud_val(pud) & _PAGE_PRESENT);
> > diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> > index b9e13a8fe2b7..414a0a919ef0 100644
> > --- a/arch/riscv/include/asm/pgtable-bits.h
> > +++ b/arch/riscv/include/asm/pgtable-bits.h
> > @@ -6,6 +6,11 @@
> >  #ifndef _ASM_RISCV_PGTABLE_BITS_H
> >  #define _ASM_RISCV_PGTABLE_BITS_H
> >
> > +/*
> > + * PTE format:
> > + * | XLEN-1 | XLEN-2 XLEN-3 | XLEN-4 10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > + *   N        MT[2]           RSV & PFN   reserved for SW   D   A   G   U   X   W   R   V
> > + */
> >  #define _PAGE_ACCESSED_OFFSET 6
> >
> >  #define _PAGE_PRESENT   (1 << 0)
> > @@ -18,6 +23,54 @@
> >  #define _PAGE_DIRTY     (1 << 7)    /* Set by hardware on any write */
> >  #define _PAGE_SOFT      (1 << 8)    /* Reserved for software */
> >
> > +#ifndef __ASSEMBLY__
> > +/*
> > + * [XLEN-2:XLEN-3] Svpbmt Memory Type definitions:
> > + *
> > + *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
> > + *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
> > + *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
> > + *  11 - Rsvd   Reserved for future standard use
> > + */
> > +#define _PAGE_NOCACHE_SVPBMT   (1UL << (__riscv_xlen-3))
> > +#define _PAGE_IO_SVPBMT                (1UL << (__riscv_xlen-2))
> > +#define _PAGE_MTMASK_SVPBMT    (_PAGE_NOCACHE_SVPBMT | _PAGE_IO_SVPBMT)
> > +
> > +static inline ulong riscv_page_mtmask(void)
> > +{
> > +       ulong val;
> > +
> > +       ALT_SVPBMT(val, _PAGE_MTMASK);
> > +       return val;
> > +}
> > +
> > +static inline ulong riscv_page_nocache(void)
> > +{
> > +       ulong val;
> > +
> > +       ALT_SVPBMT(val, _PAGE_NOCACHE);
> > +       return val;
> > +}
> > +
> > +static inline ulong riscv_page_io(void)
> > +{
> > +       ulong val;
> > +
> > +       ALT_SVPBMT(val, _PAGE_IO);
> > +       return val;
> > +}
> > +
> > +#define _PAGE_NOCACHE          riscv_page_nocache()
> > +#define _PAGE_IO               riscv_page_io()
> > +#define _PAGE_MTMASK           riscv_page_mtmask()
> > +
> > +/* Set of bits to preserve across pte_modify() */
> > +#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ | \
> > +                                         _PAGE_WRITE | _PAGE_EXEC |    \
> > +                                         _PAGE_USER | _PAGE_GLOBAL |   \
> > +                                         _PAGE_MTMASK))
> > +#endif
> > +
> >  #define _PAGE_SPECIAL   _PAGE_SOFT
> >  #define _PAGE_TABLE     _PAGE_PRESENT
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index edc68759b69d..5d5ba6513c14 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -8,7 +8,12 @@
> >
> >  #include <linux/mmzone.h>
> >  #include <linux/sizes.h>
> > +#ifndef __ASSEMBLY__
> > +#include <linux/bits.h>
> > +#include <linux/const.h>
> >
> > +#include <asm/errata_list.h>
> > +#endif
> >  #include <asm/pgtable-bits.h>
> >
> >  #ifndef CONFIG_MMU
> > --
> > 2.36.1
> >
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
