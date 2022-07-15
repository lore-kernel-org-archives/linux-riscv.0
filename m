Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD49C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFvhifZhGpcQ4xsuf27iLTzVUT8sO24erQW54n4KwIs=; b=mN2jasuxGcvh4O
	eA1ja3wYUbJ/GjDq4S6QhKuF9WTSOKC1Ti7pxxx/kKgQC7CJomeEaFnHzyhI++RxoL7MwSxiaXMqS
	f22XoeMp+DCzMdTtW/WEKCB0QwBNIAVLzWB9OVW2VgVSSqN08i7OMs9jnFpiD4/2W6Qu/5mmYb28i
	T1fFoK5eFvAZ7SPqMF2ZrTuFQrtjP+MJvqTffrtvQJq9wakLg0f7LQzOKdZ9Mpjg786eoBLiVW4t1
	hgblYVtt4m6HL9cX3Cyv513MXhF4HfsXNVOKPDXXUV1mVGWL3gj38MS5t+1kmbUYidWZ0uRMBBueu
	wuVcTPIgrOOrF65EHEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOhp-0090wv-Q1; Fri, 15 Jul 2022 17:02:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOhn-0090vP-3R
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 17:02:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 63BEFB82D22;
	Fri, 15 Jul 2022 17:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59449C34115;
	Fri, 15 Jul 2022 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657904536;
	bh=RneAB0zwL0Agua+ah8JJepJ4SyYzz9VQDMDzjZbNKm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewKkhklagPG8bQsRIeV3HeDAxKqJKsZpn4wuGiaNLGKmjYwWs6iDNwf6G+5acFVzZ
	 nG9wSPVDoxMoluF8DqomLr8B8IUG3RQQ6Oz9hiWwB3BwknxTNP3fNRKp/nkC8800Ec
	 JRL6S5V5HqPSR/bZCeSBObFRW5bTniT3msAfPWcsfSgYa7JuP9/SMvJ3y82TXydOEj
	 oyUYKn7QMBvzwH730YcR2yCM1u2Ivh/yeLSWEsISJp3z4Xc5OfHU6xBxGndI/maZOp
	 +a97+6bMd8Rypk9eK8NoDLIa+VD956MR8efgMH6NCPqf//Y+564ZNPQ6LG9vVfHLZ3
	 St0qO1l9uYHXA==
Date: Sat, 16 Jul 2022 00:53:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v5 2/2] riscv: turn pgtable_l4|[l5]_enabled to static key
 for RV64
Message-ID: <YtGbfmEl7/IkQxZp@xhacker>
References: <20220715134847.2190-1-jszhang@kernel.org>
 <20220715134847.2190-3-jszhang@kernel.org>
 <CAJM55Z8JCePV8YRheyrsO1qQie79NM_-w-cYbNaJy-HLOtPfrw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8JCePV8YRheyrsO1qQie79NM_-w-cYbNaJy-HLOtPfrw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_100219_472355_38FFB1DA 
X-CRM114-Status: GOOD (  24.84  )
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

On Fri, Jul 15, 2022 at 05:04:38PM +0200, Emil Renner Berthing wrote:
> On Fri, 15 Jul 2022 at 15:59, Jisheng Zhang <jszhang@kernel.org> wrote:
> > On a specific HW platform, pgtable_l4|[l5]_enabled won't change after
> > boot, and the check sits at hot code path, this characteristic makes it
> > suitable for optimization with static key.
> >
> > _pgtable_l4|[l5]_enabled is used very early during boot, even is used
> > with MMU off, so the static key mechanism isn't ready. For this case,
> > we use another static key _pgtable_lx_ready to indicate whether we
> > have finalised pgtable_l4|[l5]_enabled or not, then fall back to
> > _pgtable_l4|[l5]_enabled_early bool.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > ---
> >  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
> >  arch/riscv/include/asm/pgtable-32.h |  3 ++
> >  arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
> >  arch/riscv/include/asm/pgtable.h    |  5 +--
> >  arch/riscv/kernel/cpu.c             |  4 +-
> >  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
> >  arch/riscv/mm/kasan_init.c          | 16 ++++----
> >  7 files changed, 103 insertions(+), 65 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> > index 947f23d7b6af..0280eeb4756f 100644
> > --- a/arch/riscv/include/asm/pgalloc.h
> > +++ b/arch/riscv/include/asm/pgalloc.h
> > @@ -41,7 +41,7 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
> >
> >  static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
> >  {
> > -       if (pgtable_l4_enabled) {
> > +       if (pgtable_l4_enabled()) {
> >                 unsigned long pfn = virt_to_pfn(pud);
> >
> >                 set_p4d(p4d, __p4d((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
> > @@ -51,7 +51,7 @@ static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
> >  static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d,
> >                                      pud_t *pud)
> >  {
> > -       if (pgtable_l4_enabled) {
> > +       if (pgtable_l4_enabled()) {
> >                 unsigned long pfn = virt_to_pfn(pud);
> >
> >                 set_p4d_safe(p4d,
> > @@ -61,7 +61,7 @@ static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d,
> >
> >  static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
> >  {
> > -       if (pgtable_l5_enabled) {
> > +       if (pgtable_l5_enabled()) {
> >                 unsigned long pfn = virt_to_pfn(p4d);
> >
> >                 set_pgd(pgd, __pgd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
> > @@ -71,7 +71,7 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
> >  static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
> >                                      p4d_t *p4d)
> >  {
> > -       if (pgtable_l5_enabled) {
> > +       if (pgtable_l5_enabled()) {
> >                 unsigned long pfn = virt_to_pfn(p4d);
> >
> >                 set_pgd_safe(pgd,
> > @@ -82,7 +82,7 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
> >  #define pud_alloc_one pud_alloc_one
> >  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
> >  {
> > -       if (pgtable_l4_enabled)
> > +       if (pgtable_l4_enabled())
> >                 return __pud_alloc_one(mm, addr);
> >
> >         return NULL;
> > @@ -91,7 +91,7 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
> >  #define pud_free pud_free
> >  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
> >  {
> > -       if (pgtable_l4_enabled)
> > +       if (pgtable_l4_enabled())
> >                 __pud_free(mm, pud);
> >  }
> >
> > @@ -100,7 +100,7 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
> >  #define p4d_alloc_one p4d_alloc_one
> >  static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
> >  {
> > -       if (pgtable_l5_enabled) {
> > +       if (pgtable_l5_enabled()) {
> >                 gfp_t gfp = GFP_PGTABLE_USER;
> >
> >                 if (mm == &init_mm)
> > @@ -120,7 +120,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
> >  #define p4d_free p4d_free
> >  static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
> >  {
> > -       if (pgtable_l5_enabled)
> > +       if (pgtable_l5_enabled())
> >                 __p4d_free(mm, p4d);
> >  }
> >
> > diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> > index 59ba1fbaf784..1ef52079179a 100644
> > --- a/arch/riscv/include/asm/pgtable-32.h
> > +++ b/arch/riscv/include/asm/pgtable-32.h
> > @@ -17,6 +17,9 @@
> >
> >  #define MAX_POSSIBLE_PHYSMEM_BITS 34
> >
> > +#define pgtable_l5_enabled() 0
> > +#define pgtable_l4_enabled() 0
> > +
> >  /*
> >   * rv32 PTE format:
> >   * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > index 5c2aba5efbd0..edfff00d8ca3 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -8,18 +8,38 @@
> >
> >  #include <linux/bits.h>
> >  #include <linux/const.h>
> > +#include <linux/jump_label.h>
> >  #include <asm/errata_list.h>
> >
> > -extern bool pgtable_l4_enabled;
> > -extern bool pgtable_l5_enabled;
> > +extern bool _pgtable_l5_enabled_early;
> > +extern bool _pgtable_l4_enabled_early;
> > +extern struct static_key_false _pgtable_l5_enabled;
> > +extern struct static_key_false _pgtable_l4_enabled;
> > +extern struct static_key_false _pgtable_lx_ready;
> 
> It amounts to the same, but I wonder if we ought to use the
> DECLARE_STATIC_KEY_FALSE macro here.

Thanks for the hint, will send out a newer version soon. Before
that, I will wait a bit for other review feedbacks.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
