Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEBAC64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 20:27:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B74AB206E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 20:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BvPjEg8j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="DbcESuPR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B74AB206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eunnaD2UZ1+QZov8/eaYB5XdsAxKUPXr58x+7KiRD2c=; b=BvPjEg8jx70yd0ocM9CA4W6Jt
	sgDWXfUSte5QgrxoipLI79M7VSh44u1wUoXoywz/9BxNUUkBjnG+JtOMDSkEHU0I58JamlmiOpQ8t
	CPJbKELg6RY5ulvgRpOXI0mPQHB/YAaS5qD0uve1mqGMB4C3Uummvj6+JppGHPzUXXqFAcqWBXPdD
	InD9IMK9b/0W+5BixnsSh3yfdIuY1oRkoNe9/0NqzCdBjMHjsFrExdcg2MKIe1PDVD/FAZml7ON+s
	9Y13KySoOQOBL8LXFT0AEgim7jaWIGPZLqluCQnl0jjGunj4sco8UbVCX/1WdaGBCrELFHS+C5YvH
	yBY7AHUUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCFT-0005rY-IQ; Tue, 01 Dec 2020 20:27:43 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCFQ-0005r2-Sp
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 20:27:42 +0000
Received: by mail-lj1-x242.google.com with SMTP id 142so5228149ljj.10
 for <linux-riscv@lists.infradead.org>; Tue, 01 Dec 2020 12:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xW31zfOrhabWlu5deT3c2Y+pb/DW1jxAoipejrSHzyI=;
 b=DbcESuPRp2oUA7x9x7VPnM8MvfK9HQHLV88Em1fhaC5OF6D13CIetPYecBdhmGTzs+
 B39nNIvFGxV3ISEpNYo0SAObRZNqR9LXuXUV9w4Il8eVnVltzGc+obCKb6BCJlPwh4c2
 iSiUcdLLNksFX/tSU1Bzr1xb6whrWhRFfeaNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xW31zfOrhabWlu5deT3c2Y+pb/DW1jxAoipejrSHzyI=;
 b=KkYUsfPi/Uiwysiz4Mda+m6vTz+O0ClSLzZoVTJw8Me74Oxj7rgegQC+ioAk2k7dyD
 Dos9CsEkRUzvnGeslQlJLYBgz1ERNn/T8Rz06KyfBqjYMn79iz/ymXeCNOzd9/rJc5vw
 bmbiP2UFtcHRA4jwTKQLE9Nx47GfzdHVjUW7qAR0FQejUSpfOSYaTb8SwwpcAY80Kf4A
 wu3uW+sL4jYYd0CuVTgC1R/z6dDq8q0iQflWFB8YsuDpLZBqa9RcMO1SiyQwAPTI9ZJd
 0pGhX8M02d2lUfEBGpQQumTDH237NEDM3tI7Ky26TJb2WPY3Srfx+H0LKrDYOPeDNGJJ
 pQiQ==
X-Gm-Message-State: AOAM531OvnW66gj/qqU3g5eXH8nA53ZoG7RCvtgrKtogghDJ29UwSRjs
 ml7rPhVOMSNRLxoPRxbYVte9EF9N1v18xOm0PK9qWg==
X-Google-Smtp-Source: ABdhPJw7wUToVTctgGd745M5/vh3LFJOKnnoxoGPvYtN/SRvMwK36jGijc0UQN6zz8inoAl+mNntTPJPmugzl2wzrBk=
X-Received: by 2002:a05:651c:239:: with SMTP id
 z25mr2013178ljn.15.1606854458295; 
 Tue, 01 Dec 2020 12:27:38 -0800 (PST)
MIME-Version: 1.0
References: <20201201090023.2852-1-vitaly.wool@konsulko.com>
 <CAOnJCU+=UX4t1peZVymzuSvFS+xJFYVFJMX5ZB1-azDxyvrJsw@mail.gmail.com>
In-Reply-To: <CAOnJCU+=UX4t1peZVymzuSvFS+xJFYVFJMX5ZB1-azDxyvrJsw@mail.gmail.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Tue, 1 Dec 2020 21:27:27 +0100
Message-ID: <CAM4kBBLP2gSzwOEgYxJkrarE2_39Afu9-p8fQ2U_YVcq6WRh+Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: toggle mmu_enabled flag in a precise manner
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_152741_056806_8E1FA3D9 
X-CRM114-Status: GOOD (  25.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 6:40 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Dec 1, 2020 at 1:01 AM <vitaly.wool@konsulko.com> wrote:
> >
> > From: Vitaly Wool <vitaly.wool@konsulko.com>
> >
> > Cuurently mmu_enabled flag is set to true way later than the actual
> > MMU enablement takes place. This leads to hard-to-track races in
> > e. g. SBI earlycon initialization taking wrong path configuring
> > fixmap.
> >
>
> This code path is significantly changed in 5.10-rcX with UEFI series.
> https://patchwork.kernel.org/project/linux-riscv/patch/20200917223716.2300238-4-atish.patra@wdc.com/
>
> Can you check if you can still reproduce the issue you were seeing
> with the latest upstream kernel ?
> If yes, please share the steps to reproduce the issue.

No, I don't think I can reproduce it now, thanks!

~Vitaly

> > To fix that, move mmu_enabled toggling to head.S and rename it to
> > _mmu_enabled to avoid possible name clashes since it's not a static
> > variable any more.
> >
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > ---
> >  arch/riscv/kernel/head.S |  9 +++++++++
> >  arch/riscv/mm/init.c     | 13 +++++--------
> >  2 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index 0a4e81b8dc79..33cd57285be3 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -248,6 +248,10 @@ clear_bss_done:
> >         call relocate
> >  #endif /* CONFIG_MMU */
> >
> > +       la a0, _mmu_enabled
> > +       li a1, 1
> > +       sw a1, (a0)
> > +
> >         call setup_trap_vector
> >         /* Restore C environment */
> >         la tp, init_task
> > @@ -370,6 +374,11 @@ ENTRY(reset_regs)
> >  END(reset_regs)
> >  #endif /* CONFIG_RISCV_M_MODE */
> >
> > +.section ".data"
> > +       .global _mmu_enabled
> > +_mmu_enabled:
> > +       .word 0
> > +
> >  __PAGE_ALIGNED_BSS
> >         /* Empty zero page */
> >         .balign PAGE_SIZE
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 787c75f751a5..4038be635e25 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -211,7 +211,7 @@ EXPORT_SYMBOL(pfn_base);
> >  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >  pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> > -static bool mmu_enabled;
> > +extern bool _mmu_enabled;
> >
> >  #define MAX_EARLY_MAPPING_SIZE SZ_128M
> >
> > @@ -236,7 +236,7 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
> >
> >  static pte_t *__init get_pte_virt(phys_addr_t pa)
> >  {
> > -       if (mmu_enabled) {
> > +       if (_mmu_enabled) {
> >                 clear_fixmap(FIX_PTE);
> >                 return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
> >         } else {
> > @@ -250,7 +250,7 @@ static phys_addr_t __init alloc_pte(uintptr_t va)
> >          * We only create PMD or PGD early mappings so we
> >          * should never reach here with MMU disabled.
> >          */
> > -       BUG_ON(!mmu_enabled);
> > +       BUG_ON(!_mmu_enabled);
> >
> >         return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> >  }
> > @@ -281,7 +281,7 @@ pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
> >
> >  static pmd_t *__init get_pmd_virt(phys_addr_t pa)
> >  {
> > -       if (mmu_enabled) {
> > +       if (_mmu_enabled) {
> >                 clear_fixmap(FIX_PMD);
> >                 return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
> >         } else {
> > @@ -293,7 +293,7 @@ static phys_addr_t __init alloc_pmd(uintptr_t va)
> >  {
> >         uintptr_t pmd_num;
> >
> > -       if (mmu_enabled)
> > +       if (_mmu_enabled)
> >                 return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> >
> >         pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
> > @@ -467,9 +467,6 @@ static void __init setup_vm_final(void)
> >         phys_addr_t pa, start, end;
> >         struct memblock_region *reg;
> >
> > -       /* Set mmu_enabled flag */
> > -       mmu_enabled = true;
> > -
> >         /* Setup swapper PGD for fixmap */
> >         create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
> >                            __pa_symbol(fixmap_pgd_next),
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
