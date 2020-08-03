Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D765C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 00:56:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32D54206DA
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 00:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wxJUPARm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="bUhTRe00"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32D54206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TrroHV5cTjEA5UFCt+i+qOuXuCQoqcFwohfvU/unZ5E=; b=wxJUPARmpzbcPk4uW5BwncWGf
	57SKUtFcnyTF9VVpq1CDBDQ/dRMQ/bGzqhyeVTmGRxyEXPY1l1I9+HyldR/qoPJHCNq6VH2ITD2FY
	k6VjmX4LFHwS4WP/zs4nPsSh0lkZyfZbOtcwlDrvG1QZs9KX1G30T3CUCFTr0DKj/G9Pl5tYes0kV
	29VPAoAhBsbsDHql1Oi06amVpmpgSP2mc6XtEs5hjiPXPlaPGZiPEB1r64iErrVi6bDw9C07sdbUM
	rjYZqXS0eorAYkyXrpqcclmbel8sQ777UfQnAod27RBo+vZ/ydAois4yykhqLonTUKR3PEw6KwUBQ
	p/ZgnZ8xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Olw-0005vI-6I; Mon, 03 Aug 2020 00:56:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Olt-0005ur-9c
 for linux-riscv@lists.infradead.org; Mon, 03 Aug 2020 00:56:10 +0000
Received: by mail-wm1-x342.google.com with SMTP id f18so10074462wmc.0
 for <linux-riscv@lists.infradead.org>; Sun, 02 Aug 2020 17:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qA9bDintsX+Q8EZBsWXG8WyNthgYr4MQz6oX72nqeb4=;
 b=bUhTRe00vl7YOj8vqszaVuYsqcGVtq4DWER9dXy7rlC3kFF0pxTrJv0z7uKhlLx1n/
 2QNetlweCDeGLxidh+Da/Qus8uH1mT7dG0lFKz8upAfveGSn3heQjtetDloOW0O4m3uM
 oIU7PriaJA2KZpeYqThrrU/9Ijd0NI2SCmKy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qA9bDintsX+Q8EZBsWXG8WyNthgYr4MQz6oX72nqeb4=;
 b=eCrsa67pMcBgEEGdSUY2/WskzxoMMxq6dnjkCVxcyKCYSnt/KDLaceVZZ7qNptHxgG
 UNw+AVkJcCL/DiDKFvQmAwJddSjFlbJsvjLLc+eHOPlaeTHrCStl5XbT36W9run7KEDT
 k1K54swHwdcA0W91SMerh0tds/A1/9xIJyVO3+ytJboZNAJ4NwGGKaJ/HtUa6SVZPlX/
 Gyj74tXiohjaP87Ki4ACWHr7ATdDaSJiHWoZolxLtMyN3yQRp/IITaYC/KxkndsjJSdo
 kRhwoZGBigFmYGX82GhQdEreyM6uchFudk4aOx78HIt8B4spsErwRP9/DAAFHSvlQxAt
 9pqQ==
X-Gm-Message-State: AOAM530rzejtoT5p68Zn1Gjtxkx7t1YRy2z1nSmqwKGVb788wiG6fJ+X
 saQtpQ/fjryRjVzMWLqbxkxCQukD7LRAEBhfHdys
X-Google-Smtp-Source: ABdhPJyZ9W0Sd5f+gz87BrUQixHmSIdajqs0OlOU63PvYe+Ij4HULq8odDDUpG4V4tjANgSr5cQ98FxcLG7BYnqOw38=
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr236689wmh.55.1596416166182;
 Sun, 02 Aug 2020 17:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200729233635.14406-1-atish.patra@wdc.com>
 <20200729233635.14406-4-atish.patra@wdc.com>
 <20200730091440.GA534153@kernel.org>
In-Reply-To: <20200730091440.GA534153@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 2 Aug 2020 17:55:55 -0700
Message-ID: <CAOnJCUKS=QvQG5dBae96RD1CdevrXV+Jsfna2rfMWpw4Z=nDcw@mail.gmail.com>
Subject: Re: [RFT PATCH v4 3/9] RISC-V: Implement late mapping page table
 allocation functions
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_205609_386692_7D8F5853 
X-CRM114-Status: GOOD (  37.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
 Nick Hu <nickhu@andestech.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Yash Shah <yash.shah@sifive.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 30, 2020 at 2:14 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> Hi,
>
> On Wed, Jul 29, 2020 at 04:36:29PM -0700, Atish Patra wrote:
> > Currently, page table setup is done during setup_va_final where fixmap can
> > be used to create the temporary mappings. The physical frame is allocated
> > from memblock_alloc_* functions. However, this won't work if page table
> > mapping needs to be created for a different mm context (i.e. efi mm) at
> > a later point of time.
>
> TBH, I'm not very happy to see pte/pmd allocations, but I don't see a
> way to reuse the existing routines in this case.
>
> As a general wild idea, maybe it's worth using something like
>
> struct pt_alloc_ops {
>         pte_t *(*get_pte_virt)(phys_addr_t pa);
>         phys_addr_t (*alloc_pte)(uintptr_t va);
>         ...
> };
>
> and add there implementations: nommu, MMU early and MMU late.
>

Yeah. That will be much cleaner. Thanks. I will change it to have
function pointers
instead of if else blocks.

> Some more comments below.
>
> > Use generic kernel page allocation function & macros for any mapping
> > after setup_vm_final.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/mm/init.c | 29 ++++++++++++++++++++++++-----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 68c608a0e91f..cba03fec08c1 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -212,6 +212,7 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >  pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> >  static bool mmu_enabled;
> > +static bool late_mapping;
> >
> >  #define MAX_EARLY_MAPPING_SIZE       SZ_128M
> >
> > @@ -236,7 +237,9 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
> >
> >  static pte_t *__init get_pte_virt(phys_addr_t pa)
> >  {
> > -     if (mmu_enabled) {
> > +     if (late_mapping)
> > +             return (pte_t *) __va(pa);
> > +     else if (mmu_enabled) {
> >               clear_fixmap(FIX_PTE);
> >               return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
> >       } else {
> > @@ -246,13 +249,19 @@ static pte_t *__init get_pte_virt(phys_addr_t pa)
> >
> >  static phys_addr_t __init alloc_pte(uintptr_t va)
> >  {
> > +     unsigned long vaddr;
> >       /*
> >        * We only create PMD or PGD early mappings so we
> >        * should never reach here with MMU disabled.
> >        */
> >       BUG_ON(!mmu_enabled);
> > -
> > -     return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> > +     if (late_mapping) {
> > +             vaddr = __get_free_page(GFP_KERNEL);
> > +             if (!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)))
> > +                     BUG();
>
> Is BUG() here really necessary? If I understand correctly, this would be
> used to enable mappings for EFI runtime services, so we probably want to
> propagete the error to to caller and, if really necessary, BUG() there,
> don't we?
>

If __get_free_page is failing here, something is seriously wrong and
the system should panic.
But I agree with you that this should happen in the caller rather than
the callee.
We need to change the signature of each create_*_mapping function
in order to propagate the error to the caller. Do you see any issues with that ?
As it will affect page table allocation for all three cases, should we
consolidate all the BUG()
cases in caller only ?

> > +             return __pa(vaddr);
> > +     } else
> > +             return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> >  }
> >
> >  static void __init create_pte_mapping(pte_t *ptep,
> > @@ -281,7 +290,9 @@ pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
> >
> >  static pmd_t *__init get_pmd_virt(phys_addr_t pa)
> >  {
> > -     if (mmu_enabled) {
> > +     if (late_mapping)
> > +             return (pmd_t *) __va(pa);
> > +     else if (mmu_enabled) {
> >               clear_fixmap(FIX_PMD);
> >               return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
> >       } else {
> > @@ -292,8 +303,13 @@ static pmd_t *__init get_pmd_virt(phys_addr_t pa)
> >  static phys_addr_t __init alloc_pmd(uintptr_t va)
> >  {
> >       uintptr_t pmd_num;
> > +     unsigned long vaddr;
> >
> > -     if (mmu_enabled)
> > +     if (late_mapping) {
> > +             vaddr = __get_free_page(GFP_KERNEL);
> > +             BUG_ON(!vaddr);
> > +             return __pa(vaddr);
>
> Does nommu also need to allocate a page for pmd?
>

Not sure if I understand the question correctly. Before MMU is enabled,
we are using statically allocated early_pmd.

> > +     } else if (mmu_enabled)
> >               return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> >
> >       pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
> > @@ -533,6 +549,9 @@ static void __init setup_vm_final(void)
> >       /* Move to swapper page table */
> >       csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
> >       local_flush_tlb_all();
> > +
> > +     /* generic page allocation function must be used to setup page table */
> > +     late_mapping = true;
> >  }
> >  #else
> >  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> > --
> > 2.24.0
> >
>
> --
> Sincerely yours,
> Mike.



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
