Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79307C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 04:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41jWqkGjxSBFDpJneGRDOtHnuCTY9tER7LacL8iBHck=; b=rH+CSwBWuohT/u
	9HdpAPav1c+TKgSZVm8AE+V7RRc9Dzmyhz0/Hg7drRc4D4FNkxUilwR+iVsfGIQQLEWb9cYzPHjSe
	OcllFUqCa4Q0DCGvkU5lb8gZTk46DJ43RStVJQ38BJMJTK0GxoUOQBwKH8KwL+0Fs25Xd06yhTiB+
	WZ+VavgPdEoWjH6saPtruokaYcnt8fKiBKP1/tT/O2BkL2iwB6dXoBaql9uRn0XNWKLYDYNA8W0UY
	grhq5g72t6rid5/+Wah8IlL6Lcz2n8vm92te1dVv6wD1YZ+CRc3a1NIZUGRoymmjyE5AKJki51LLI
	gJLmtt0AQ9DN5m1zalvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZmuM-000eoP-UO; Thu, 31 Mar 2022 04:59:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZmuJ-000enm-PL
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 04:59:41 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so1564582pjb.4
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 21:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hTYTSPjKmzj+vmHdHXYX/HkA6CH3798g482prT8jYOE=;
 b=MATa/EhuSiC9n3rxQZYaexkAJx1IL7RS74xROe1UGfyh9/+YHkY19RkVlXFU07jDNZ
 B5WYTcQ+0j5Kuoo4IdmLNGorMPNy0UQzPZhO5l8cZ46kGKbSNU87AVO1dX1buGQpUNS2
 kjnkeBT/Flc5LEWtnUnIjiUUB6IdCRicUXktQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hTYTSPjKmzj+vmHdHXYX/HkA6CH3798g482prT8jYOE=;
 b=QND6Tl63iQByK+Y8jnCt45C2SWEpoJG6m2SkM4B6FCiezsWLTiWUp6GYzEwuFy/N5o
 yWeQ5anZKiuiLvMGuN700Dze/xK95hUXdLkP3Rd7OKdCsTSaks0zXfTaNmXtKEnHtBNK
 aajrJ/L4pkqZK8fkKxvOTeWar0xQM55EabjfTEAJWSPUD74ECpE3Dbih3EHAWUEKkMe2
 E1EaFh1iyz6/nL1aVEUCWPit7oKnW1eKOV/lH4PPKSh2FTb0uL291hS9dIQ0hBVNDlOD
 oFT2Erxrwns5d6SkVnB64s1sQXioupmMlD+fbrHBVWC5jrjOua+FYxaXUkGyKQyMbDiU
 AZdA==
X-Gm-Message-State: AOAM531xKbKYeHhjG8BHtjhiBb9d/hh6KrlNjSaONQID0dyezhljrJ5w
 AIlmBUdQUZuSV3O+SmUuPwMTDg==
X-Google-Smtp-Source: ABdhPJw1+av0IyouZw0UTvETMJ5/EYcy0Xubc+iK03x43onqNQ6IIiYW18l9Dvy8z/Jtsv1yJKQF3Q==
X-Received: by 2002:a17:902:db0f:b0:154:665e:af75 with SMTP id
 m15-20020a170902db0f00b00154665eaf75mr39355836plx.147.1648702778027; 
 Wed, 30 Mar 2022 21:59:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a637204000000b00398522203a2sm10728411pgc.80.2022.03.30.21.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 21:59:37 -0700 (PDT)
Date: Wed, 30 Mar 2022 21:59:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 peterz@infradead.org, jszhang@kernel.org, geert@linux-m68k.org,
 mark.rutland@arm.com, chenhuang5@huawei.com,
 linux-riscv@lists.infradead.org, wangkefeng.wang@huawei.com,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv: Rename "sp_in_global" to "current_stack_pointer"
Message-ID: <202203302159.8FA7A6C@keescook>
References: <mhng-00315cbb-3685-4918-8ea0-539cda5fbc36@palmer-ri-x1c9>
 <mhng-82a6e73b-c0b7-4625-8a79-ed481f8b2cf1@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-82a6e73b-c0b7-4625-8a79-ed481f8b2cf1@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_215940_049441_1B953D89 
X-CRM114-Status: GOOD (  34.07  )
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

On Wed, Mar 30, 2022 at 04:12:18PM -0700, Palmer Dabbelt wrote:
> On Tue, 22 Mar 2022 19:16:28 PDT (-0700), Palmer Dabbelt wrote:
> > On Wed, 23 Feb 2022 22:04:11 PST (-0800), keescook@chromium.org wrote:
> >> To follow the existing per-arch conventions, rename "sp_in_global" to
> >> "current_stack_pointer". This will let it be used in non-arch places
> >> (like HARDENED_USERCOPY).
> >>
> >> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> >> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >> Cc: Albert Ou <aou@eecs.berkeley.edu>
> >> Cc: Peter Zijlstra <peterz@infradead.org>
> >> Cc: Jisheng Zhang <jszhang@kernel.org>
> >> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Chen Huang <chenhuang5@huawei.com>
> >> Cc: linux-riscv@lists.infradead.org
> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> >> ---
> >>  arch/riscv/Kconfig               | 1 +
> >>  arch/riscv/include/asm/current.h | 2 ++
> >>  arch/riscv/kernel/stacktrace.c   | 4 +---
> >>  3 files changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index 5adcbd9b5e88..b120c32697af 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -16,6 +16,7 @@ config RISCV
> >>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> >>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> >>  	select ARCH_HAS_BINFMT_FLAT
> >> +	select ARCH_HAS_CURRENT_STACK_POINTER
> >>  	select ARCH_HAS_DEBUG_VM_PGTABLE
> >>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> >>  	select ARCH_HAS_DEBUG_WX
> >> diff --git a/arch/riscv/include/asm/current.h b/arch/riscv/include/asm/current.h
> >> index 1de233d8e8de..21774d868c65 100644
> >> --- a/arch/riscv/include/asm/current.h
> >> +++ b/arch/riscv/include/asm/current.h
> >> @@ -33,6 +33,8 @@ static __always_inline struct task_struct *get_current(void)
> >>
> >>  #define current get_current()
> >>
> >> +register unsigned long current_stack_pointer __asm__("sp");
> >> +
> >>  #endif /* __ASSEMBLY__ */
> >>
> >>  #endif /* _ASM_RISCV_CURRENT_H */
> >> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> >> index 201ee206fb57..278380e2e956 100644
> >> --- a/arch/riscv/kernel/stacktrace.c
> >> +++ b/arch/riscv/kernel/stacktrace.c
> >> @@ -14,8 +14,6 @@
> >>
> >>  #include <asm/stacktrace.h>
> >>
> >> -register unsigned long sp_in_global __asm__("sp");
> >> -
> >>  #ifdef CONFIG_FRAME_POINTER
> >>
> >>  void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
> >> @@ -77,7 +75,7 @@ void notrace walk_stackframe(struct task_struct *task,
> >>  		sp = user_stack_pointer(regs);
> >>  		pc = instruction_pointer(regs);
> >>  	} else if (task == NULL || task == current) {
> >> -		sp = sp_in_global;
> >> +		sp = current_stack_pointer;
> >>  		pc = (unsigned long)walk_stackframe;
> >>  	} else {
> >>  		/* task blocked in __switch_to */
> >
> > Sorry to be slow on this one.  This looks good, but another use of
> > sp_in_global snuck into fixes and I don't merge fixes into for-next so
> > that makes this a bit of a headache.
> >
> > There's a bunch of stuff in flight, so I'm going to hold off on this
> > until after my first week's merge window PR.  I intend on merging the
> > following, which is at palmer/riscv-sp for now (I'll probably just
> > cherry-pick that, I usually start basing stuff on Linus' merge of my PR
> > and just cherry-pick in single patches).
> >
> >    commit 7c4f6bb6fb352cfa6028191c2888356b9157a332
> >    gpg: Signature made Tue 22 Mar 2022 11:12:19 AM PDT
> >    gpg:                using RSA key 2B3C3747446843B24A943A7A2E1319F35FBB1889
> >    gpg:                issuer "palmer@dabbelt.com"
> >    gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
> >    gpg:                 aka "Palmer Dabbelt <palmer@rivosinc.com>" [ultimate]
> >    Author: Kees Cook <keescook@chromium.org>
> >    Date:   Wed Feb 23 22:04:11 2022 -0800
> >
> >        riscv: Rename "sp_in_global" to "current_stack_pointer"
> >
> >        To follow the existing per-arch conventions, rename "sp_in_global" to
> >        "current_stack_pointer". This will let it be used in non-arch places
> >        (like HARDENED_USERCOPY).
> >
> >        Signed-off-by: Kees Cook <keescook@chromium.org>
> >        Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >
> >    diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >    index 5adcbd9b5e88..b120c32697af 100644
> >    --- a/arch/riscv/Kconfig
> >    +++ b/arch/riscv/Kconfig
> >    @@ -16,6 +16,7 @@ config RISCV
> >     	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> >     	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> >     	select ARCH_HAS_BINFMT_FLAT
> >    +	select ARCH_HAS_CURRENT_STACK_POINTER
> >     	select ARCH_HAS_DEBUG_VM_PGTABLE
> >     	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> >     	select ARCH_HAS_DEBUG_WX
> >    diff --git a/arch/riscv/include/asm/current.h b/arch/riscv/include/asm/current.h
> >    index 1de233d8e8de..21774d868c65 100644
> >    --- a/arch/riscv/include/asm/current.h
> >    +++ b/arch/riscv/include/asm/current.h
> >    @@ -33,6 +33,8 @@ static __always_inline struct task_struct *get_current(void)
> >
> >     #define current get_current()
> >
> >    +register unsigned long current_stack_pointer __asm__("sp");
> >    +
> >     #endif /* __ASSEMBLY__ */
> >
> >     #endif /* _ASM_RISCV_CURRENT_H */
> >    diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> >    index 14d2b53ec322..08d11a53f39e 100644
> >    --- a/arch/riscv/kernel/stacktrace.c
> >    +++ b/arch/riscv/kernel/stacktrace.c
> >    @@ -14,8 +14,6 @@
> >
> >     #include <asm/stacktrace.h>
> >
> >    -register unsigned long sp_in_global __asm__("sp");
> >    -
> >     #ifdef CONFIG_FRAME_POINTER
> >
> >     void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
> >    @@ -30,7 +28,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
> >     		pc = instruction_pointer(regs);
> >     	} else if (task == NULL || task == current) {
> >     		fp = (unsigned long)__builtin_frame_address(0);
> >    -		sp = sp_in_global;
> >    +		sp = current_stack_pointer;
> >     		pc = (unsigned long)walk_stackframe;
> >     	} else {
> >     		/* task blocked in __switch_to */
> >    @@ -78,7 +76,7 @@ void notrace walk_stackframe(struct task_struct *task,
> >     		sp = user_stack_pointer(regs);
> >     		pc = instruction_pointer(regs);
> >     	} else if (task == NULL || task == current) {
> >    -		sp = sp_in_global;
> >    +		sp = current_stack_pointer;
> >     		pc = (unsigned long)walk_stackframe;
> >     	} else {
> >     		/* task blocked in __switch_to */
> >
> > Thanks!
> 
> Thanks, this is on for-next.  I put HARDENED_USERCOPY=y test in for SLAB 
> and SLUB, not sure if there's anything else that's interesting to test 
> (we're missing some bits needed for STACKLEAK).

Excellent; thank you!

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
