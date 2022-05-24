Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AF9C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoLIo2xRahxY5kSO6spMyjn13fywfQ67kRjxnQ7aUsI=; b=sg12ldyzmHQzvx
	cAo4cX5Rudv6CSFd+HzEFCpKnPKDZE+qnzvxE8ZcEwU4Ts8XcSPpp0XWms7tVk+wyX87VcyFnmyDJ
	CfcFRIDQ0/7d6iwzOl+4mt3b9SogKg4IiMIVOU1vnGP3sb/dr6FqmhEp6Sdtw/Vawslrj/5n88dW4
	3If4v8sZeeXgKe11qBDVaJEhn3ckRjl1x7rhF89KmO+cXbq2qS8Pnyj5yGwbfxZC74LagG7Rg8Ce6
	NBsuyup3QC1bVxZ+HsRn/EGGZfECoAbDkjPaacmyxm24jIfF6oXWFdyTZDGRSwuJAm3HOG21+hpqd
	uzywIBka2xfI8nRPV8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWxt-008ZSw-28; Tue, 24 May 2022 16:00:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWxk-008ZNn-9L
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 16:00:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id x12so2106798wrg.2
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VRLSoZSHCkxc2UzIq6kIdQTeKjiN69uSLUYCFhB5UMk=;
 b=54W4QF3FKhM1Dvfh3sc0c8WPn6H+25YdgK0Ji2BJMg8e4g1lzE1e9XftuLQoOYHI2P
 3HBxLmrZNNmSFGHdZRcIl0giSx1SI7YmRWi7ezzwtvH4Lusjai4gfBWX1GmVrd9jfR+9
 dECF5jp+uHvxVukSEcL5m35myVzxmCkLEyJWVk7/0xFqVJnO00GQKnDmfMbCyjLUWB+5
 6nZ4zgUYkSYeopNdcAJsDn4fGCfIB7vomsHgaioXh/AUwNH0M/IXSQ0V4rU82Ys82S6R
 vwjqi+4KzNm7+Pv/J5H58JkXD9pUE+Ukm3AZxVi2evR25ixM2xaNGz60UFiX3gAMpIiM
 nB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VRLSoZSHCkxc2UzIq6kIdQTeKjiN69uSLUYCFhB5UMk=;
 b=uiJoFP82pOEhRETCDlb5/FKIwsHrix8/+818QqudHHi5jPgzCOZh14H5pZnx1FDPz2
 Xctfe8ge+/P3v7Fk6aghp4OUWxzNNTEhE+3lVPyxpCvJpoecXxcfNQC1PAiXVRbTYyg8
 h+LYTPc6NH+DQPPfD8dMPixLqlYtcmmJr5vB1IcjIaWl5keFoNO/FgzRWqI2P3ZPy26d
 JNrySLhkXOKHIbjPvNWfbi+jdXOS9/8lBVa5JELCm0IT4NZEblx2BQGvJgAl/piZq24O
 gHfyQMK5Y/JNVj8Lr6jbqbookvPpsxdCGaLvs2r+yXAdqev1FEsSl3X0VQ+uGj6Ogem7
 W1/Q==
X-Gm-Message-State: AOAM532nPnNJudyd2CZmh8qtCv1d2dPznadpinxa2XlrNv5tbGxZReht
 QpJdtzUsz6JZz0l8izNZEHjhL5mHsCrjOPDRsJv1Aw==
X-Google-Smtp-Source: ABdhPJwbI7WwiyjzZiCOCDcNaKDfJxl8n6wWO41kpIHQS5KADu5PWdH2YOz8Ww2C3nI09M5IEXIEeY54HaN3aKp5tpE=
X-Received: by 2002:adf:ce05:0:b0:20f:fa26:b888 with SMTP id
 p5-20020adfce05000000b0020ffa26b888mr1392560wrn.346.1653408045551; Tue, 24
 May 2022 09:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220519155918.3882-1-jszhang@kernel.org>
 <20220519155918.3882-3-jszhang@kernel.org>
 <CAAhSdy1qUukKxSBiVeHNGo84qqf-O54-Mx574VTQwb3LGF-pPg@mail.gmail.com>
 <Yoz5juajva8ld7TE@xhacker>
In-Reply-To: <Yoz5juajva8ld7TE@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 May 2022 21:30:34 +0530
Message-ID: <CAAhSdy0bP3N7iY-BdvELhHcRwpNu-wVCK05s_ycKOC+zH5eL=g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: turn pgtable_l4|[l5]_enabled to static key
 for RV64
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_090048_439724_CE1308C5 
X-CRM114-Status: GOOD (  31.27  )
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

On Tue, May 24, 2022 at 9:06 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Mon, May 23, 2022 at 09:32:46PM +0530, Anup Patel wrote:
> > On Thu, May 19, 2022 at 9:38 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > On a specific HW platform, pgtable_l4|[l5]_enabled won't change after
> > > boot, and the check sits at hot code path, this characteristic makes it
> > > suitable for optimization with static key.
> > >
> > > _pgtable_l4|[l5]_enabled is used very early during boot, even is used
> > > with MMU off, so the static key mechanism isn't ready. For this case,
> > > we use another static key _pgtable_lx_ready to indicate whether we
> > > have finalised pgtable_l4|[l5]_enabled or not, then fall back to
> > > _pgtable_l4|[l5]_enabled_early bool.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >
> > Overall, this patch looks good to me. Please fix the errors reported by
> > autobuilders.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Thank Anup. I sent the v4 two days ago
> https://lore.kernel.org/linux-riscv/20220521143456.2759-1-jszhang@kernel.org/T/#t

Sorry, I missed your v4.

I have provided Reviewed-by to your v4 as well.

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> > > ---
> > >  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
> > >  arch/riscv/include/asm/pgtable-32.h |  3 ++
> > >  arch/riscv/include/asm/pgtable-64.h | 59 +++++++++++++++++---------
> > >  arch/riscv/include/asm/pgtable.h    |  5 +--
> > >  arch/riscv/kernel/cpu.c             |  4 +-
> > >  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
> > >  arch/riscv/mm/kasan_init.c          | 16 ++++----
> > >  7 files changed, 102 insertions(+), 65 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> > > index 947f23d7b6af..0280eeb4756f 100644
> > > --- a/arch/riscv/include/asm/pgalloc.h
> > > +++ b/arch/riscv/include/asm/pgalloc.h
> > > @@ -41,7 +41,7 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
> > >
> > >  static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
> > >  {
> > > -       if (pgtable_l4_enabled) {
> > > +       if (pgtable_l4_enabled()) {
> > >                 unsigned long pfn = virt_to_pfn(pud);
> > >
> > >                 set_p4d(p4d, __p4d((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
> > > @@ -51,7 +51,7 @@ static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
> > >  static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d,
> > >                                      pud_t *pud)
> > >  {
> > > -       if (pgtable_l4_enabled) {
> > > +       if (pgtable_l4_enabled()) {
> > >                 unsigned long pfn = virt_to_pfn(pud);
> > >
> > >                 set_p4d_safe(p4d,
> > > @@ -61,7 +61,7 @@ static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d,
> > >
> > >  static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
> > >  {
> > > -       if (pgtable_l5_enabled) {
> > > +       if (pgtable_l5_enabled()) {
> > >                 unsigned long pfn = virt_to_pfn(p4d);
> > >
> > >                 set_pgd(pgd, __pgd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
> > > @@ -71,7 +71,7 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
> > >  static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
> > >                                      p4d_t *p4d)
> > >  {
> > > -       if (pgtable_l5_enabled) {
> > > +       if (pgtable_l5_enabled()) {
> > >                 unsigned long pfn = virt_to_pfn(p4d);
> > >
> > >                 set_pgd_safe(pgd,
> > > @@ -82,7 +82,7 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
> > >  #define pud_alloc_one pud_alloc_one
> > >  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 return __pud_alloc_one(mm, addr);
> > >
> > >         return NULL;
> > > @@ -91,7 +91,7 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
> > >  #define pud_free pud_free
> > >  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 __pud_free(mm, pud);
> > >  }
> > >
> > > @@ -100,7 +100,7 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
> > >  #define p4d_alloc_one p4d_alloc_one
> > >  static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
> > >  {
> > > -       if (pgtable_l5_enabled) {
> > > +       if (pgtable_l5_enabled()) {
> > >                 gfp_t gfp = GFP_PGTABLE_USER;
> > >
> > >                 if (mm == &init_mm)
> > > @@ -120,7 +120,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
> > >  #define p4d_free p4d_free
> > >  static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 __p4d_free(mm, p4d);
> > >  }
> > >
> > > diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> > > index 5b2e79e5bfa5..8af36d76b70d 100644
> > > --- a/arch/riscv/include/asm/pgtable-32.h
> > > +++ b/arch/riscv/include/asm/pgtable-32.h
> > > @@ -16,4 +16,7 @@
> > >
> > >  #define MAX_POSSIBLE_PHYSMEM_BITS 34
> > >
> > > +#define pgtable_l5_enabled() 0
> > > +#define pgtable_l4_enabled() 0
> > > +
> > >  #endif /* _ASM_RISCV_PGTABLE_32_H */
> > > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > > index 7e246e9f8d70..c56bbeacd369 100644
> > > --- a/arch/riscv/include/asm/pgtable-64.h
> > > +++ b/arch/riscv/include/asm/pgtable-64.h
> > > @@ -8,16 +8,35 @@
> > >
> > >  #include <linux/const.h>
> > >
> > > -extern bool pgtable_l4_enabled;
> > > -extern bool pgtable_l5_enabled;
> > > +extern bool _pgtable_l5_enabled_early;
> > > +extern bool _pgtable_l4_enabled_early;
> > > +extern struct static_key_false _pgtable_l5_enabled;
> > > +extern struct static_key_false _pgtable_l4_enabled;
> > > +extern struct static_key_false _pgtable_lx_ready;
> > > +
> > > +static __always_inline bool pgtable_l5_enabled(void)
> > > +{
> > > +       if (static_branch_likely(&_pgtable_lx_ready))
> > > +               return static_branch_likely(&_pgtable_l5_enabled);
> > > +       else
> > > +               return _pgtable_l5_enabled_early;
> > > +}
> > > +
> > > +static __always_inline bool pgtable_l4_enabled(void)
> > > +{
> > > +       if (static_branch_likely(&_pgtable_lx_ready))
> > > +               return static_branch_likely(&_pgtable_l4_enabled);
> > > +       else
> > > +               return _pgtable_l4_enabled_early;
> > > +}
> > >
> > >  #define PGDIR_SHIFT_L3  30
> > >  #define PGDIR_SHIFT_L4  39
> > >  #define PGDIR_SHIFT_L5  48
> > >  #define PGDIR_SIZE_L3   (_AC(1, UL) << PGDIR_SHIFT_L3)
> > >
> > > -#define PGDIR_SHIFT     (pgtable_l5_enabled ? PGDIR_SHIFT_L5 : \
> > > -               (pgtable_l4_enabled ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3))
> > > +#define PGDIR_SHIFT     (pgtable_l5_enabled() ? PGDIR_SHIFT_L5 : \
> > > +               (pgtable_l4_enabled() ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3))
> > >  /* Size of region mapped by a page global directory */
> > >  #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
> > >  #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
> > > @@ -119,7 +138,7 @@ static inline struct page *pud_page(pud_t pud)
> > >  #define mm_p4d_folded  mm_p4d_folded
> > >  static inline bool mm_p4d_folded(struct mm_struct *mm)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 return false;
> > >
> > >         return true;
> > > @@ -128,7 +147,7 @@ static inline bool mm_p4d_folded(struct mm_struct *mm)
> > >  #define mm_pud_folded  mm_pud_folded
> > >  static inline bool mm_pud_folded(struct mm_struct *mm)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 return false;
> > >
> > >         return true;
> > > @@ -159,7 +178,7 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
> > >
> > >  static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 *p4dp = p4d;
> > >         else
> > >                 set_pud((pud_t *)p4dp, (pud_t){ p4d_val(p4d) });
> > > @@ -167,7 +186,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
> > >
> > >  static inline int p4d_none(p4d_t p4d)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 return (p4d_val(p4d) == 0);
> > >
> > >         return 0;
> > > @@ -175,7 +194,7 @@ static inline int p4d_none(p4d_t p4d)
> > >
> > >  static inline int p4d_present(p4d_t p4d)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 return (p4d_val(p4d) & _PAGE_PRESENT);
> > >
> > >         return 1;
> > > @@ -183,7 +202,7 @@ static inline int p4d_present(p4d_t p4d)
> > >
> > >  static inline int p4d_bad(p4d_t p4d)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 return !p4d_present(p4d);
> > >
> > >         return 0;
> > > @@ -191,7 +210,7 @@ static inline int p4d_bad(p4d_t p4d)
> > >
> > >  static inline void p4d_clear(p4d_t *p4d)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 set_p4d(p4d, __p4d(0));
> > >  }
> > >
> > > @@ -207,7 +226,7 @@ static inline unsigned long _p4d_pfn(p4d_t p4d)
> > >
> > >  static inline pud_t *p4d_pgtable(p4d_t p4d)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> > >
> > >         return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
> > > @@ -224,7 +243,7 @@ static inline struct page *p4d_page(p4d_t p4d)
> > >  #define pud_offset pud_offset
> > >  static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
> > >  {
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 return p4d_pgtable(*p4d) + pud_index(address);
> > >
> > >         return (pud_t *)p4d;
> > > @@ -232,7 +251,7 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
> > >
> > >  static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 *pgdp = pgd;
> > >         else
> > >                 set_p4d((p4d_t *)pgdp, (p4d_t){ pgd_val(pgd) });
> > > @@ -240,7 +259,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
> > >
> > >  static inline int pgd_none(pgd_t pgd)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 return (pgd_val(pgd) == 0);
> > >
> > >         return 0;
> > > @@ -248,7 +267,7 @@ static inline int pgd_none(pgd_t pgd)
> > >
> > >  static inline int pgd_present(pgd_t pgd)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 return (pgd_val(pgd) & _PAGE_PRESENT);
> > >
> > >         return 1;
> > > @@ -256,7 +275,7 @@ static inline int pgd_present(pgd_t pgd)
> > >
> > >  static inline int pgd_bad(pgd_t pgd)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 return !pgd_present(pgd);
> > >
> > >         return 0;
> > > @@ -264,13 +283,13 @@ static inline int pgd_bad(pgd_t pgd)
> > >
> > >  static inline void pgd_clear(pgd_t *pgd)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 set_pgd(pgd, __pgd(0));
> > >  }
> > >
> > >  static inline p4d_t *pgd_pgtable(pgd_t pgd)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 return (p4d_t *)pfn_to_virt(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> > >
> > >         return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
> > > @@ -288,7 +307,7 @@ static inline struct page *pgd_page(pgd_t pgd)
> > >  #define p4d_offset p4d_offset
> > >  static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
> > >  {
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 return pgd_pgtable(*pgd) + p4d_index(address);
> > >
> > >         return (p4d_t *)pgd;
> > > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > > index 046b44225623..ae01a9b83ac4 100644
> > > --- a/arch/riscv/include/asm/pgtable.h
> > > +++ b/arch/riscv/include/asm/pgtable.h
> > > @@ -63,8 +63,8 @@
> > >   * position vmemmap directly below the VMALLOC region.
> > >   */
> > >  #ifdef CONFIG_64BIT
> > > -#define VA_BITS                (pgtable_l5_enabled ? \
> > > -                               57 : (pgtable_l4_enabled ? 48 : 39))
> > > +#define VA_BITS                (pgtable_l5_enabled() ? \
> > > +                               57 : (pgtable_l4_enabled() ? 48 : 39))
> > >  #else
> > >  #define VA_BITS                32
> > >  #endif
> > > @@ -738,7 +738,6 @@ extern uintptr_t _dtb_early_pa;
> > >  #define dtb_early_pa   _dtb_early_pa
> > >  #endif /* CONFIG_XIP_KERNEL */
> > >  extern u64 satp_mode;
> > > -extern bool pgtable_l4_enabled;
> > >
> > >  void paging_init(void);
> > >  void misc_mem_init(void);
> > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > index ccb617791e56..29bb0ef75248 100644
> > > --- a/arch/riscv/kernel/cpu.c
> > > +++ b/arch/riscv/kernel/cpu.c
> > > @@ -141,9 +141,9 @@ static void print_mmu(struct seq_file *f)
> > >  #if defined(CONFIG_32BIT)
> > >         strncpy(sv_type, "sv32", 5);
> > >  #elif defined(CONFIG_64BIT)
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 strncpy(sv_type, "sv57", 5);
> > > -       else if (pgtable_l4_enabled)
> > > +       else if (pgtable_l4_enabled())
> > >                 strncpy(sv_type, "sv48", 5);
> > >         else
> > >                 strncpy(sv_type, "sv39", 5);
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index 05ed641a1134..42c79388e6fd 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -44,10 +44,16 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
> > >  #endif
> > >  EXPORT_SYMBOL(satp_mode);
> > >
> > > -bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
> > > -bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
> > > -EXPORT_SYMBOL(pgtable_l4_enabled);
> > > -EXPORT_SYMBOL(pgtable_l5_enabled);
> > > +DEFINE_STATIC_KEY_FALSE(_pgtable_l4_enabled);
> > > +DEFINE_STATIC_KEY_FALSE(_pgtable_l5_enabled);
> > > +DEFINE_STATIC_KEY_FALSE(_pgtable_lx_ready);
> > > +EXPORT_SYMBOL(_pgtable_l4_enabled);
> > > +EXPORT_SYMBOL(_pgtable_l5_enabled);
> > > +EXPORT_SYMBOL(_pgtable_lx_ready);
> > > +bool _pgtable_l4_enabled_early = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
> > > +bool _pgtable_l5_enabled_early = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
> > > +EXPORT_SYMBOL(_pgtable_l4_enabled_early);
> > > +EXPORT_SYMBOL(_pgtable_l5_enabled_early);
> > >
> > >  phys_addr_t phys_ram_base __ro_after_init;
> > >  EXPORT_SYMBOL(phys_ram_base);
> > > @@ -555,26 +561,26 @@ static void __init create_p4d_mapping(p4d_t *p4dp,
> > >  }
> > >
> > >  #define pgd_next_t             p4d_t
> > > -#define alloc_pgd_next(__va)   (pgtable_l5_enabled ?                   \
> > > -               pt_ops.alloc_p4d(__va) : (pgtable_l4_enabled ?          \
> > > +#define alloc_pgd_next(__va)   (pgtable_l5_enabled() ?                 \
> > > +               pt_ops.alloc_p4d(__va) : (pgtable_l4_enabled() ?        \
> > >                 pt_ops.alloc_pud(__va) : pt_ops.alloc_pmd(__va)))
> > > -#define get_pgd_next_virt(__pa)        (pgtable_l5_enabled ?                   \
> > > -               pt_ops.get_p4d_virt(__pa) : (pgd_next_t *)(pgtable_l4_enabled ? \
> > > +#define get_pgd_next_virt(__pa)        (pgtable_l5_enabled() ?                 \
> > > +               pt_ops.get_p4d_virt(__pa) : (pgd_next_t *)(pgtable_l4_enabled() ?       \
> > >                 pt_ops.get_pud_virt(__pa) : (pud_t *)pt_ops.get_pmd_virt(__pa)))
> > >  #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)     \
> > > -                               (pgtable_l5_enabled ?                   \
> > > +                               (pgtable_l5_enabled() ?                 \
> > >                 create_p4d_mapping(__nextp, __va, __pa, __sz, __prot) : \
> > > -                               (pgtable_l4_enabled ?                   \
> > > +                               (pgtable_l4_enabled() ?                 \
> > >                 create_pud_mapping((pud_t *)__nextp, __va, __pa, __sz, __prot) :        \
> > >                 create_pmd_mapping((pmd_t *)__nextp, __va, __pa, __sz, __prot)))
> > > -#define fixmap_pgd_next                (pgtable_l5_enabled ?                   \
> > > -               (uintptr_t)fixmap_p4d : (pgtable_l4_enabled ?           \
> > > +#define fixmap_pgd_next                (pgtable_l5_enabled() ?                 \
> > > +               (uintptr_t)fixmap_p4d : (pgtable_l4_enabled() ?         \
> > >                 (uintptr_t)fixmap_pud : (uintptr_t)fixmap_pmd))
> > > -#define trampoline_pgd_next    (pgtable_l5_enabled ?                   \
> > > -               (uintptr_t)trampoline_p4d : (pgtable_l4_enabled ?       \
> > > +#define trampoline_pgd_next    (pgtable_l5_enabled() ?                 \
> > > +               (uintptr_t)trampoline_p4d : (pgtable_l4_enabled() ?     \
> > >                 (uintptr_t)trampoline_pud : (uintptr_t)trampoline_pmd))
> > > -#define early_dtb_pgd_next     (pgtable_l5_enabled ?                   \
> > > -               (uintptr_t)early_dtb_p4d : (pgtable_l4_enabled ?        \
> > > +#define early_dtb_pgd_next     (pgtable_l5_enabled() ?                 \
> > > +               (uintptr_t)early_dtb_p4d : (pgtable_l4_enabled() ?      \
> > >                 (uintptr_t)early_dtb_pud : (uintptr_t)early_dtb_pmd))
> > >  #else
> > >  #define pgd_next_t             pte_t
> > > @@ -680,14 +686,14 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
> > >  #ifdef CONFIG_64BIT
> > >  static void __init disable_pgtable_l5(void)
> > >  {
> > > -       pgtable_l5_enabled = false;
> > > +       _pgtable_l5_enabled_early = false;
> > >         kernel_map.page_offset = PAGE_OFFSET_L4;
> > >         satp_mode = SATP_MODE_48;
> > >  }
> > >
> > >  static void __init disable_pgtable_l4(void)
> > >  {
> > > -       pgtable_l4_enabled = false;
> > > +       _pgtable_l4_enabled_early = false;
> > >         kernel_map.page_offset = PAGE_OFFSET_L3;
> > >         satp_mode = SATP_MODE_39;
> > >  }
> > > @@ -816,11 +822,11 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
> > >                            PGDIR_SIZE,
> > >                            IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
> > >
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 create_p4d_mapping(early_dtb_p4d, DTB_EARLY_BASE_VA,
> > >                                    (uintptr_t)early_dtb_pud, P4D_SIZE, PAGE_TABLE);
> > >
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 create_pud_mapping(early_dtb_pud, DTB_EARLY_BASE_VA,
> > >                                    (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
> > >
> > > @@ -961,11 +967,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> > >
> > >  #ifndef __PAGETABLE_PMD_FOLDED
> > >         /* Setup fixmap P4D and PUD */
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 create_p4d_mapping(fixmap_p4d, FIXADDR_START,
> > >                                    (uintptr_t)fixmap_pud, P4D_SIZE, PAGE_TABLE);
> > >         /* Setup fixmap PUD and PMD */
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 create_pud_mapping(fixmap_pud, FIXADDR_START,
> > >                                    (uintptr_t)fixmap_pmd, PUD_SIZE, PAGE_TABLE);
> > >         create_pmd_mapping(fixmap_pmd, FIXADDR_START,
> > > @@ -973,10 +979,10 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> > >         /* Setup trampoline PGD and PMD */
> > >         create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
> > >                            trampoline_pgd_next, PGDIR_SIZE, PAGE_TABLE);
> > > -       if (pgtable_l5_enabled)
> > > +       if (pgtable_l5_enabled())
> > >                 create_p4d_mapping(trampoline_p4d, kernel_map.virt_addr,
> > >                                    (uintptr_t)trampoline_pud, P4D_SIZE, PAGE_TABLE);
> > > -       if (pgtable_l4_enabled)
> > > +       if (pgtable_l4_enabled())
> > >                 create_pud_mapping(trampoline_pud, kernel_map.virt_addr,
> > >                                    (uintptr_t)trampoline_pmd, PUD_SIZE, PAGE_TABLE);
> > >  #ifdef CONFIG_XIP_KERNEL
> > > @@ -1165,8 +1171,18 @@ static void __init reserve_crashkernel(void)
> > >         crashk_res.end = crash_base + crash_size - 1;
> > >  }
> > >
> > > +static void __init riscv_finalise_pgtable_lx(void)
> > > +{
> > > +       if (_pgtable_l5_enabled_early)
> > > +               static_branch_enable(&_pgtable_l5_enabled);
> > > +       if (_pgtable_l4_enabled_early)
> > > +               static_branch_enable(&_pgtable_l4_enabled);
> > > +       static_branch_enable(&_pgtable_lx_ready);
> > > +}
> > > +
> > >  void __init paging_init(void)
> > >  {
> > > +       riscv_finalise_pgtable_lx();
> > >         setup_bootmem();
> > >         setup_vm_final();
> > >  }
> > > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> > > index a22e418dbd82..356044498e8a 100644
> > > --- a/arch/riscv/mm/kasan_init.c
> > > +++ b/arch/riscv/mm/kasan_init.c
> > > @@ -209,15 +209,15 @@ static void __init kasan_populate_p4d(pgd_t *pgd,
> > >                 set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(base_p4d)), PAGE_TABLE));
> > >  }
> > >
> > > -#define kasan_early_shadow_pgd_next                    (pgtable_l5_enabled ?   \
> > > +#define kasan_early_shadow_pgd_next                    (pgtable_l5_enabled() ? \
> > >                                 (uintptr_t)kasan_early_shadow_p4d :             \
> > > -                                                       (pgtable_l4_enabled ?   \
> > > +                                                       (pgtable_l4_enabled() ? \
> > >                                 (uintptr_t)kasan_early_shadow_pud :             \
> > >                                 (uintptr_t)kasan_early_shadow_pmd))
> > >  #define kasan_populate_pgd_next(pgdp, vaddr, next, early)                      \
> > > -               (pgtable_l5_enabled ?                                           \
> > > +               (pgtable_l5_enabled() ?                                         \
> > >                 kasan_populate_p4d(pgdp, vaddr, next, early) :                  \
> > > -               (pgtable_l4_enabled ?                                           \
> > > +               (pgtable_l4_enabled() ?                                         \
> > >                         kasan_populate_pud(pgdp, vaddr, next, early) :          \
> > >                         kasan_populate_pmd((pud_t *)pgdp, vaddr, next)))
> > >
> > > @@ -274,7 +274,7 @@ asmlinkage void __init kasan_early_init(void)
> > >                                 (__pa((uintptr_t)kasan_early_shadow_pte)),
> > >                                 PAGE_TABLE));
> > >
> > > -       if (pgtable_l4_enabled) {
> > > +       if (pgtable_l4_enabled()) {
> > >                 for (i = 0; i < PTRS_PER_PUD; ++i)
> > >                         set_pud(kasan_early_shadow_pud + i,
> > >                                 pfn_pud(PFN_DOWN
> > > @@ -282,7 +282,7 @@ asmlinkage void __init kasan_early_init(void)
> > >                                         PAGE_TABLE));
> > >         }
> > >
> > > -       if (pgtable_l5_enabled) {
> > > +       if (pgtable_l5_enabled()) {
> > >                 for (i = 0; i < PTRS_PER_P4D; ++i)
> > >                         set_p4d(kasan_early_shadow_p4d + i,
> > >                                 pfn_p4d(PFN_DOWN
> > > @@ -393,9 +393,9 @@ static void __init kasan_shallow_populate_p4d(pgd_t *pgdp,
> > >  }
> > >
> > >  #define kasan_shallow_populate_pgd_next(pgdp, vaddr, next)                     \
> > > -               (pgtable_l5_enabled ?                                           \
> > > +               (pgtable_l5_enabled() ?                                         \
> > >                 kasan_shallow_populate_p4d(pgdp, vaddr, next) :                 \
> > > -               (pgtable_l4_enabled ?                                           \
> > > +               (pgtable_l4_enabled() ?                                         \
> > >                 kasan_shallow_populate_pud(pgdp, vaddr, next) :                 \
> > >                 kasan_shallow_populate_pmd(pgdp, vaddr, next)))
> > >
> > > --
> > > 2.34.1
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
