Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41961C64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 17:40:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8327620671
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 17:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKSeiI+P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="hZNzo16n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8327620671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gtasg2QDn0E9UsUaI5N2Nj6Fq5PByICMuCOnorV3jFU=; b=RKSeiI+PukDoQxFtFaKcYYBk8
	EuKRmxAhyyNFxnl4pMb7iyEmnQ6/p0jeAC6QzwXjTuJwxt/w/CqGCKkT15q18IBlJMXcKfSxWSOW0
	WDHajVL1kw0sDsK8o483sI9Kc6NUChmADK50UvdfTfym4QI8+vJbadJN4D8zHe3jvdbfBpU0l4Ybv
	9azj0WkIoLuflJugIqKWtecmml6/JrNOef53DaLDpEezoUYzeBmbO2mkftQkzc2QO1i+HjyczeDLL
	4P5JOmPojshIA+xMNKsvr9+am1slT1+UhZZkXC4GtgXcFybfo218zbzhj79afUudnxPTg+7bHz0Zp
	QMWREsuYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk9dO-0002RE-My; Tue, 01 Dec 2020 17:40:14 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk9dM-0002QY-0z
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 17:40:13 +0000
Received: by mail-io1-xd41.google.com with SMTP id p187so1739472iod.4
 for <linux-riscv@lists.infradead.org>; Tue, 01 Dec 2020 09:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XiLF9iUNIwDaWMQtXQaKkY+tZEpQvvpyLNxVDyovonA=;
 b=hZNzo16nWOC4KVX4x9Wh+sslGMHm5hu8OLLiImUhnW6rzsx52gpZ4ibBqho87bOJq1
 kFCVw7yxB2castPy/RQJlF73omcuYKnMPM41T68BHftcdAkgyIcAcOdXw7jdaLGpOznB
 19mPjxnz2cTYSoPPPHWqb9gICjA7uzhAlkjQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XiLF9iUNIwDaWMQtXQaKkY+tZEpQvvpyLNxVDyovonA=;
 b=A50mPhVAFaZsZdgFf6bdtj/1Ryp51DOJkVU8MS0EIlFomcGWTq9e+LiqoLf9bjw7Vb
 1iLx5+AzGavKUXppZmQ71cECydrD+8UQd+L/3rZ6FOR3nqFBCyj4yRAkC3Cf4TuAVeLk
 783qKSJImirGTzvZIW0YGchCMnjLtM6h3YjuEQ9WFYaeCAxGEIbl4kSra5PC7OdnR0YG
 jmdaitdEwme5IeumF7Qdk5uSgEZuBkQ3fq1HAn8tgC+lX59sGfqz6YJOGAg25yRoA9d0
 nA6s0yRyf447XVeBsFw7LNXtSVVAqQynXOd2/mftXV3nXtmaOhpjtx+GFtrG08twJJ7l
 LkcQ==
X-Gm-Message-State: AOAM531yT0vsCF2aHzncdzGX2+GD0wcqVRQ5WhCE6XrD1u/OjlFkTSBo
 eIjX0swHsLBDtah5dYlioqBguypVoRV7bQGTZauw
X-Google-Smtp-Source: ABdhPJyOvT5kGpUkZa4ri3As3AwouMrNVFKBHhP6Cxpb3OnwFpGSfH2P/FFwuvvflu34RLIkVMSxYr7Mx2vcZPZs07E=
X-Received: by 2002:a02:3b26:: with SMTP id c38mr3560165jaa.114.1606844409177; 
 Tue, 01 Dec 2020 09:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20201201090023.2852-1-vitaly.wool@konsulko.com>
In-Reply-To: <20201201090023.2852-1-vitaly.wool@konsulko.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 1 Dec 2020 09:40:02 -0800
Message-ID: <CAOnJCU+=UX4t1peZVymzuSvFS+xJFYVFJMX5ZB1-azDxyvrJsw@mail.gmail.com>
Subject: Re: [PATCH] riscv: toggle mmu_enabled flag in a precise manner
To: vitaly.wool@konsulko.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_124012_227723_41C6387B 
X-CRM114-Status: GOOD (  21.89  )
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

On Tue, Dec 1, 2020 at 1:01 AM <vitaly.wool@konsulko.com> wrote:
>
> From: Vitaly Wool <vitaly.wool@konsulko.com>
>
> Cuurently mmu_enabled flag is set to true way later than the actual
> MMU enablement takes place. This leads to hard-to-track races in
> e. g. SBI earlycon initialization taking wrong path configuring
> fixmap.
>

This code path is significantly changed in 5.10-rcX with UEFI series.
https://patchwork.kernel.org/project/linux-riscv/patch/20200917223716.2300238-4-atish.patra@wdc.com/

Can you check if you can still reproduce the issue you were seeing
with the latest upstream kernel ?
If yes, please share the steps to reproduce the issue.

> To fix that, move mmu_enabled toggling to head.S and rename it to
> _mmu_enabled to avoid possible name clashes since it's not a static
> variable any more.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  arch/riscv/kernel/head.S |  9 +++++++++
>  arch/riscv/mm/init.c     | 13 +++++--------
>  2 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 0a4e81b8dc79..33cd57285be3 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -248,6 +248,10 @@ clear_bss_done:
>         call relocate
>  #endif /* CONFIG_MMU */
>
> +       la a0, _mmu_enabled
> +       li a1, 1
> +       sw a1, (a0)
> +
>         call setup_trap_vector
>         /* Restore C environment */
>         la tp, init_task
> @@ -370,6 +374,11 @@ ENTRY(reset_regs)
>  END(reset_regs)
>  #endif /* CONFIG_RISCV_M_MODE */
>
> +.section ".data"
> +       .global _mmu_enabled
> +_mmu_enabled:
> +       .word 0
> +
>  __PAGE_ALIGNED_BSS
>         /* Empty zero page */
>         .balign PAGE_SIZE
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 787c75f751a5..4038be635e25 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -211,7 +211,7 @@ EXPORT_SYMBOL(pfn_base);
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> -static bool mmu_enabled;
> +extern bool _mmu_enabled;
>
>  #define MAX_EARLY_MAPPING_SIZE SZ_128M
>
> @@ -236,7 +236,7 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>
>  static pte_t *__init get_pte_virt(phys_addr_t pa)
>  {
> -       if (mmu_enabled) {
> +       if (_mmu_enabled) {
>                 clear_fixmap(FIX_PTE);
>                 return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
>         } else {
> @@ -250,7 +250,7 @@ static phys_addr_t __init alloc_pte(uintptr_t va)
>          * We only create PMD or PGD early mappings so we
>          * should never reach here with MMU disabled.
>          */
> -       BUG_ON(!mmu_enabled);
> +       BUG_ON(!_mmu_enabled);
>
>         return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>  }
> @@ -281,7 +281,7 @@ pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
>
>  static pmd_t *__init get_pmd_virt(phys_addr_t pa)
>  {
> -       if (mmu_enabled) {
> +       if (_mmu_enabled) {
>                 clear_fixmap(FIX_PMD);
>                 return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
>         } else {
> @@ -293,7 +293,7 @@ static phys_addr_t __init alloc_pmd(uintptr_t va)
>  {
>         uintptr_t pmd_num;
>
> -       if (mmu_enabled)
> +       if (_mmu_enabled)
>                 return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>
>         pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
> @@ -467,9 +467,6 @@ static void __init setup_vm_final(void)
>         phys_addr_t pa, start, end;
>         struct memblock_region *reg;
>
> -       /* Set mmu_enabled flag */
> -       mmu_enabled = true;
> -
>         /* Setup swapper PGD for fixmap */
>         create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
>                            __pa_symbol(fixmap_pgd_next),
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
