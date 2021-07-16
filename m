Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E186BC636C8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 02:23:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA19A613CF
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 02:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA19A613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7cnw30fEHL269mxhsZcoKT6UQ8d/XJo9LNnXW7BRUU=; b=pA9ek/eoIICKmT
	X6woRtOhmvlI3VhXsc3GD9WIUt2oQnqRp34J0laprbbg8amP4SOPmuo44UMKvrE13/5nxGgMdGzp2
	v+gv9YIT8Hy4urDvpOPqJcwxlOHKJUpgRrwutdGtiiIxpPn9jwLe4kNZmzqcL+h2oCgZE5s6HVeqH
	tc47uJ3eRdRya0Z7NrkBx43jlXoeKc0ghwj++0uodMk+j3fH0ECOrOH7DovbVjPqBE2qbRXyJtMLh
	nMfVQb9IhSOMunmAz1C2Fbfjj0Q7TBGDKxCDzaLm/ZNFaYdFeOiWr12Mu1OhrKmRW6KCVvvH4OybG
	VgP8exhn8eKHOrMiHX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4DUz-002u79-2c; Fri, 16 Jul 2021 02:22:45 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4DUw-002u6X-2T
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 02:22:43 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id r132so12390782yba.5
 for <linux-riscv@lists.infradead.org>; Thu, 15 Jul 2021 19:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HcGnhbgGNOyTIUDh5SucoyI65bVLgGCSLNQx1HGY7GY=;
 b=otqrJJIZByY9gd3geezqoyVsJMv/IvEZq8Js39EoGePHL4zZ2cHE9ToRjHVGUp2gWm
 tqiSpB8972dgJzF7QarpCka/+6FD5zesTleAYoRAA29Y2QFhoP34DSoV4phccxSMc/yS
 ft9iGcScr8JDLaWJ9IRN2Jas2jYL9zeTfNe4U9g1oiu5Zbrfam4POkGrBmg9Yn1tBPqZ
 E2pZcl6yP9vUX+ePV2kZDYXe0FBja8b/0Fs9ft42CanAjWLdvlI74TqkEFjeBLMZsPjn
 hh8k/ydAil66c/7sS0SV8kWBAtS7XPYCfo1OZPRToxqjHJfIJdAci5KdsngjzkpZOghZ
 wugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HcGnhbgGNOyTIUDh5SucoyI65bVLgGCSLNQx1HGY7GY=;
 b=ktIsVSvUh6/fqkUUhdq/raz0FeUKPiajmA8QUnzaozPSc42bSgPiUoF9+UXoMETf4m
 EM55Tk9Jm3KuQgZ0YqG3E1xa7aBDOW7FQZqMLjbrkk43IohDH5rpvAYYo8QyRgBsL0Os
 DFUXfkBM920gZGd0P3LD1V0u2vjWmVjR76TSaPskEggUxoq4XDLAy4er8MnIKVr6N9f2
 +ohNErfNaiC1pX269mN8TdxNd6/+hQaLYsIho0qDE9j456tSLP6/mgbiuMQZflefVGlv
 Kjv5VAMugM+dxQVAjrCCLKUVeJDbdQGBjraBwu9lS6tW4mamPmmcj24tveBDuBwqsp78
 pudw==
X-Gm-Message-State: AOAM531tDp8d6kiMdmnT1AQkSfDI1gr8WiX6LBtMS6mqUIiPNi5uC8x2
 0ez8VyfkQlOJdKLw0lriP7Wdy6rrWspzkJLkFvw=
X-Google-Smtp-Source: ABdhPJzsAioQ40CSJOi/XmSMDlA7Q5z9hpj1SgegYHELGXmn9X9rYg94iYbey9lKIOAoc5PngRWhjVNRR7dujx8REwg=
X-Received: by 2002:a25:b701:: with SMTP id t1mr9236770ybj.517.1626402160698; 
 Thu, 15 Jul 2021 19:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop>
In-Reply-To: <mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Jul 2021 10:22:28 +0800
Message-ID: <CAEUhbmX6QD+ncgUS8g5yQMm0A5aPAAHcmsfBty6eWupeut+SSA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 5.14 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_192242_166472_EC6A77D6 
X-CRM114-Status: GOOD (  26.03  )
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

Hi Palmer,

On Fri, Jul 9, 2021 at 10:54 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> The following changes since commit 8a4102a0cf07cc76a18f373f6b49485258cc6af4:
>
>   riscv: mm: Fix W+X mappings at boot (2021-06-01 21:15:09 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-mw0
>
> for you to fetch changes up to 1958e5aef5098e28b7d6e6a2972649901ebecace:
>
>   riscv: xip: Fix duplicate included asm/pgtable.h (2021-07-06 16:17:40 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 5.14 Merge Window, Part 1
>
> In addition to We have a handful of new features for 5.14:
>
> * Support for transparent huge pages.
> * Support for generic PCI resources mapping.
> * Support for the mem= kernel parameter.
> * Support for KFENCE.
> * A handful of fixes to avoid W+X mappings in the kernel.
> * Support for VMAP_STACK based overflow detection.
> * An optimized copy_{to,from}_user.
> ----------------------------------------------------------------
> There are some Kconfig merge conflicts.  They should be pretty
> straight-forward, but we do have a symbol out of order -- I thought I had a
> script to check for that, but I guess it doesn't work.  I just sent out a patch
> to fix it up.
>
> diff --cc arch/riscv/Kconfig
> index 3590eb76000e,469a70bd8da6..d36f3c5029fd
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@@ -60,12 -61,11 +61,12 @@@ config RISC
>         select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>         select HANDLE_DOMAIN_IRQ
>         select HAVE_ARCH_AUDITSYSCALL
> -       select HAVE_ARCH_JUMP_LABEL
> -       select HAVE_ARCH_JUMP_LABEL_RELATIVE
> +       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> +       select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>         select HAVE_ARCH_KASAN if MMU && 64BIT
>         select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
>  +      select HAVE_ARCH_KFENCE if MMU && 64BIT
> -       select HAVE_ARCH_KGDB
> +       select HAVE_ARCH_KGDB if !XIP_KERNEL
>         select HAVE_ARCH_KGDB_QXFER_PKT
>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>         select HAVE_ARCH_SECCOMP_FILTER
> @@@ -81,11 -80,9 +82,14 @@@
>         select HAVE_GCC_PLUGINS
>         select HAVE_GENERIC_VDSO if MMU && 64BIT
>         select HAVE_IRQ_TIME_ACCOUNTING
>  +      select HAVE_KPROBES
>  +      select HAVE_KPROBES_ON_FTRACE
>  +      select HAVE_KRETPROBES
> +       select HAVE_KPROBES if !XIP_KERNEL
> +       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> +       select HAVE_KRETPROBES if !XIP_KERNEL
>  +      select HAVE_MOVE_PMD
>  +      select HAVE_MOVE_PUD
>         select HAVE_PCI
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_REGS
> @@@ -108,7 -104,7 +112,8 @@@
>         select SYSCTL_EXCEPTION_TRACE
>         select THREAD_INFO_IN_TASK
>         select UACCESS_MEMCPY if !MMU
>  +      select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
> +       select ZONE_DMA32 if 64BIT
>
>   config ARCH_MMAP_RND_BITS_MIN
>         default 18 if 64BIT
> ----------------------------------------------------------------
> Akira Tsukamoto (1):
>       riscv: __asm_copy_to-from_user: Optimize unaligned memory access and pipeline stall
>
> Alexandre Ghiti (6):
>       riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
>       riscv: Simplify xip and !xip kernel address conversion macros
>       riscv: Introduce set_kernel_memory helper
>       riscv: Map the kernel with correct permissions the first time
>       riscv: Introduce structure that group all variables regarding kernel mapping
>       riscv: Fix PTDUMP output now BPF region moved back to module region
>
> Bixuan Cui (1):
>       riscv: fix build error when CONFIG_SMP is disabled
>
> Christoph Hellwig (1):
>       riscv: pass the mm_struct to __sbi_tlb_flush_range
>
> Guo Ren (3):
>       riscv: Use global mappings for kernel pages
>       riscv: Cleanup unused functions
>       riscv: add ASID-based tlbflushing methods
>
> Jeff Xie (1):
>       riscv: ptrace: add argn syntax
>
> Jiapeng Chong (1):
>       riscv: xip: Fix duplicate included asm/pgtable.h
>
> Jisheng Zhang (7):
>       riscv: mremap speedup - enable HAVE_MOVE_PUD and HAVE_MOVE_PMD
>       riscv: mm: Remove setup_zero_page()
>       riscv: Optimize switch_mm by passing "cpu" to flush_icache_deferred()
>       riscv: Turn has_fpu into a static key if FPU=y
>       riscv: kprobes: Remove redundant kprobe_step_ctx
>       riscv: Add __init section marker to some functions again
>       riscv: mm: init: Consolidate vars, functions
>
> Kefeng Wang (5):
>       riscv: Move setup_bootmem into paging_init
>       riscv: mm: Drop redundant _sdata and _edata declaration
>       riscv: mm: Use better bitmap_zalloc()
>       riscv: Only initialize swiotlb when necessary
>       riscv: Add mem kernel parameter support

This patch should not be merged as it mixed two things into one patch,
as discussed here:
http://lists.infradead.org/pipermail/linux-riscv/2021-July/007486.html

You remained silent on my "ping", sigh ...

>
> Liu Shixin (1):
>       riscv: Enable KFENCE for riscv64
>
> Nanyong Sun (5):
>       riscv: mm: add _PAGE_LEAF macro
>       riscv: mm: make pmd_bad() check leaf condition
>       riscv: mm: add param stride for __sbi_tlb_flush_range
>       riscv: mm: add THP support on 64-bit
>       riscv: mm: fix build errors caused by mk_pmd()
>
> Palmer Dabbelt (2):
>       RISC-V: Use asm-generic for {in,out}{bwlq}
>       Merge branch 'riscv-wx-mappings' into for-next
>
> Randy Dunlap (1):
>       riscv: TRANSPARENT_HUGEPAGE: depends on MMU
>
> Stanislaw Kardach (1):
>       riscv: enable generic PCI resource mapping
>
> Tong Tiangen (1):
>       riscv: add VMAP_STACK overflow detection
>
> Vitaly Wool (1):
>       riscv: fix typo in init.c

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
