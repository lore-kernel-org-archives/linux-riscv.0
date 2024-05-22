Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3921EC25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=c0y0KCuHCtRE2+/44lkaJqbrwnYv83tjmFCP3meYxUs=; b=wqq
	4RuCpzMW5WA1dOB4fH151KqMXsd0KDUzoBenEIoaphEpXu9FL1nIJLQZ/ra9TuxG4Tyx3CgWUW04k
	6g/ugpfXzfgcXIejOP/J8hiAlvLug9cirj5dRNrKHdd5N0TyG8oeMyBVG6vc2/NLjo+NQ/PvZlPe6
	BRLdY8cad9I+VRqbATajR1K+fyEP8dCM6svwzPWxhdEU/wbbRGl/1zxAYU2Mehj9SoviY8VXEZpjp
	gWX7f0ZQtNF6ONRqySfcnGhG+Q1nFL5WOXbs3DgS+TWwJlXFCwq6zlD6aGzfttwHDizuESAa3MH4X
	Nqykl0hD/JM4qn4BDhg64JvAnxOkHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9oax-00000003Ukn-0lxK;
	Wed, 22 May 2024 16:13:39 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9oat-00000003Ujc-1bFa
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:13:37 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so1008775a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716394410; x=1716999210; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvJV5ZGsuu7yjPkuizDv1ykHrklgDvGswJrEOm3kD5A=;
        b=ZswYbP+CtVjn70+kqVhdhzqyrbZUvnHdOuI0MFzGAcEQor2hsLd9ei2q202zDTVcuB
         lBY/5AKZPRZT8OBnKoFHYQukY3yPRukU6a+v/RnAOlE7xc2SVfu+bUKTTK98BqUmL4ph
         18k3H70dVRFso8HWliluJD1Le0Cy2JkVmTIlCKEeV2/XAvohuuo5iH+Uf1mlhj50ZzPV
         j3EvulNUW4d3iWgt9aNQb4PuvMcwfiAspvJB1eVKzTJHht5PZVjNZT+dGQZsYBhihbJS
         +yRf9QPcmtepsezyjAj0jv+rcBJxN7oRCzuxa37E6Et2mh4gv5r+YEe9r2Z8+X966y38
         zTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394410; x=1716999210;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvJV5ZGsuu7yjPkuizDv1ykHrklgDvGswJrEOm3kD5A=;
        b=veTskKxtK41GEQEpgj1QMuA8dazNCBRqo2gg9/zzPdfnB/WNHrTXQqQLl6IxgH8bV+
         E5DBriO1Yjw0nVAt3r2sQI09B+f21oVxdlBMCIlXvyit91fUCUQ3iwh76WwyQirlbNUF
         xAgdbbdOmMm3TjebNVWnzvo3b4U/fJU+7ahvoO7Rrwk9e+TcEP9RyNibWjTRyV1St22N
         ty8H3zwF/3L3kTjDNMrmNO8WkGhSZ0sCrzrbOMCe4VTiT3an7dYRjDfsMWNquz0MDtGj
         diDoMf7LAwpoA0bzYwmP4XzWcLKOOvisXGbNqtFegOeuABhHVpcKUpkUZHVQqbXxuqX7
         rjGA==
X-Gm-Message-State: AOJu0YyNb5O+iwPo7NpVC0fFUU+qub59YE5gBHpcdFeYVn2wkdnyQEHh
	+Cl7mZKSp+Ik5wXuyPIVwLVyt20EHaqug9b9hb2Jo5ZRkOKQulQTJzLLMSvI2gF5vCFkaFMJ/2R
	z
X-Google-Smtp-Source: AGHT+IGIo1wZlSPwwSu9xw5c4I51qpXk7ZOigKsyxWm6T8IDrvSKigUlmUGe9S6Z4XUSv7E8Tg4RbA==
X-Received: by 2002:a17:90a:5385:b0:2bd:9648:1fe with SMTP id 98e67ed59e1d1-2bd9f344e7cmr2642563a91.7.1716394409942;
        Wed, 22 May 2024 09:13:29 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bd9099a4afsm3665730a91.8.2024.05.22.09.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 09:13:28 -0700 (PDT)
Date: Wed, 22 May 2024 09:13:28 -0700 (PDT)
X-Google-Original-Date: Wed, 22 May 2024 09:13:24 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_091335_674272_AE5019C2 
X-CRM114-Status: GOOD (  22.94  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8144212452571900668=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8144212452571900668==
Content-Type: text/plain

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-mw1

for you to fetch changes up to 92cce91949a497a8a4615f9ba5813b03f7a1f1d5:

  riscv: defconfig: Enable CONFIG_CLK_SOPHGO_CV1800 (2024-05-13 14:26:34 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.10 Merge Window, Part 1

* Support for byte/half-word compare-and-exchange, emulated via LR/SC
  loops.
* Support for Rust.
* Support for Zihintpause in hwprobe.
* Support for the PR_RISCV_SET_ICACHE_FLUSH_CTX prctl().
* Support for lockless lockrefs.

----------------------------------------------------------------
This was really meant to be last week's PR, but due to a handful of small
issues.  There's a pair of driver build fixes that are already on the lists and
a report of a ftrace failure that might be triggered by the ftrace/AIA fix, but
seems like we're better off with these than without.  I've got a few other
smaller things queued up for Friday, but I figured it'd be best to get this
moving because there's a handful of merge conflicts.

This first one isn't showing up in a in-flight merge `git diff`, but it looks
pretty straight-forward

    diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
    index c9137710633a..4d1495ded2aa 100644
    --- a/Documentation/rust/arch-support.rst
    +++ b/Documentation/rust/arch-support.rst
    @@ -16,7 +16,8 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
     Architecture   Level of support  Constraints
     =============  ================  ==============================================
     ``arm64``      Maintained        Little Endian only.
    -``loongarch``  Maintained        \-
    +``loongarch``  Maintained        -
    +``riscv``      Maintained        ``riscv64`` only.
     ``um``         Maintained        ``x86_64`` only.
     ``x86``        Maintained        ``x86_64`` only.
     =============  ================  ==============================================

There's also one in the IMSIC driver where there's really no way for git to
pick up the conflict, as it's a far-away API change.  Here's my resolution,
Anup likes it as well
<https://lore.kernel.org/all/CAK9=C2UkTD0hYymjow-yHHfBDh4CtRv-G2BPt=ncstLRmpYgyg@mail.gmail.com/>:

    diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
    index 886418ec06cb..4fbb37074d29 100644
    --- a/drivers/irqchip/irq-riscv-imsic-early.c
    +++ b/drivers/irqchip/irq-riscv-imsic-early.c
    @@ -49,7 +49,7 @@ static int __init imsic_ipi_domain_init(void)
     		return virq < 0 ? virq : -ENOMEM;
     
     	/* Set vIRQ range */
    -	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
    +	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
     
     	/* Announce that IMSIC is providing IPIs */
     	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);

The rest show up pretty normally, so here's the regular merge diff output from
how I've resolved them:

    diff --cc arch/riscv/Makefile
    index 1e002d8003c5,321c057e2bdc..000000000000
    --- a/arch/riscv/Makefile
    +++ b/arch/riscv/Makefile
    @@@ -151,20 -166,9 +166,9 @@@ endi
      endif
      
      vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
     -vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vdso.so
     +vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
      
    - ifneq ($(CONFIG_XIP_KERNEL),y)
    - ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
    - KBUILD_IMAGE := $(boot)/loader.bin
    - else
    - ifeq ($(CONFIG_EFI_ZBOOT),)
    - KBUILD_IMAGE := $(boot)/Image.gz
    - else
    - KBUILD_IMAGE := $(boot)/vmlinuz.efi
    - endif
    - endif
    - endif
    - BOOT_TARGETS := Image Image.gz loader loader.bin xipImage vmlinuz.efi
    + BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader loader.bin xipImage vmlinuz.efi
      
      all:	$(notdir $(KBUILD_IMAGE))
      
    diff --cc include/uapi/linux/prctl.h
    index 713d28788df7,524d546d697b..000000000000
    --- a/include/uapi/linux/prctl.h
    +++ b/include/uapi/linux/prctl.h
    @@@ -306,20 -306,10 +306,26 @@@ struct prctl_mm_map 
      # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
      # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
      
    + #define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
    + # define PR_RISCV_CTX_SW_FENCEI_ON	0
    + # define PR_RISCV_CTX_SW_FENCEI_OFF	1
    + # define PR_RISCV_SCOPE_PER_PROCESS	0
    + # define PR_RISCV_SCOPE_PER_THREAD	1
    + 
     +/* PowerPC Dynamic Execution Control Register (DEXCR) controls */
     +#define PR_PPC_GET_DEXCR		72
     +#define PR_PPC_SET_DEXCR		73
     +/* DEXCR aspect to act on */
     +# define PR_PPC_DEXCR_SBHE		0 /* Speculative branch hint enable */
     +# define PR_PPC_DEXCR_IBRTPD		1 /* Indirect branch recurrent target prediction disable */
     +# define PR_PPC_DEXCR_SRAPD		2 /* Subroutine return address prediction disable */
     +# define PR_PPC_DEXCR_NPHIE		3 /* Non-privileged hash instruction enable */
     +/* Action to apply / return */
     +# define PR_PPC_DEXCR_CTRL_EDITABLE	 0x1 /* Aspect can be modified with PR_PPC_SET_DEXCR */
     +# define PR_PPC_DEXCR_CTRL_SET		 0x2 /* Set the aspect for this process */
     +# define PR_PPC_DEXCR_CTRL_CLEAR	 0x4 /* Clear the aspect for this process */
     +# define PR_PPC_DEXCR_CTRL_SET_ONEXEC	 0x8 /* Set the aspect on exec */
     +# define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
     +# define PR_PPC_DEXCR_CTRL_MASK		0x1f
     +
      #endif /* _LINUX_PRCTL_H */
    diff --cc kernel/sys.c
    index f9c95410278c,1b7bda0722ca..000000000000
    --- a/kernel/sys.c
    +++ b/kernel/sys.c
    @@@ -146,13 -146,10 +146,15 @@@
      #ifndef RISCV_V_GET_CONTROL
      # define RISCV_V_GET_CONTROL()		(-EINVAL)
      #endif
    + #ifndef RISCV_SET_ICACHE_FLUSH_CTX
    + # define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
    + #endif
     -
     +#ifndef PPC_GET_DEXCR_ASPECT
     +# define PPC_GET_DEXCR_ASPECT(a, b)	(-EINVAL)
     +#endif
     +#ifndef PPC_SET_DEXCR_ASPECT
     +# define PPC_SET_DEXCR_ASPECT(a, b, c)	(-EINVAL)
     +#endif
    - 
      /*
       * this is where the system-wide overflow UID and GID are defined, for
       * architectures that now have 32-bit UID/GID but didn't in the past


----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Remove superfluous smp_mb()
      riscv: Fix text patching when IPI are used

Charlie Jenkins (4):
      riscv: Remove unnecessary irqflags processor.h include
      riscv: Include riscv_set_icache_flush_ctx prctl
      documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
      cpumask: Add assign cpu

Clément Léger (2):
      riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code
      riscv: hwprobe: export Zihintpause ISA extension

Dawei Li (2):
      riscv: Remove redundant CONFIG_64BIT from pgtable_l{4,5}_enabled
      riscv: Annotate pgtable_l{4,5}_enabled with __ro_after_init

Inochi Amaoto (1):
      riscv: defconfig: Enable CONFIG_CLK_SOPHGO_CV1800

Jisheng Zhang (4):
      riscv: select ARCH_USE_CMPXCHG_LOCKREF
      riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}
      riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required
      riscv: select ARCH_HAS_FAST_MULTIPLIER

Leonardo Bras (5):
      riscv/cmpxchg: Deduplicate xchg() asm functions
      riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
      riscv/atomic.h : Deduplicate arch_atomic.*
      riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
      riscv/cmpxchg: Implement xchg for variables of size 1 and 2

Masahiro Yamada (2):
      riscv: merge two if-blocks for KBUILD_IMAGE
      export.h: remove include/asm-generic/export.h

Miguel Ojeda (1):
      RISC-V: enable building 64-bit kernels with rust support

Palmer Dabbelt (6):
      Merge patch series "Rework & improve riscv cmpxchg.h and atomic.h"
      Merge patch series "riscv: 64-bit NOMMU fixes and enhancements"
      Merge patch series "riscv: fix patching with IPI"
      Merge patch series "riscv: Create and document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl"
      Merge patch series "riscv: enable lockless lockref implementation"
      Merge patch series "riscv: ASID-related and UP-related TLB flush enhancements"

Samuel Holland (18):
      riscv: Fix TASK_SIZE on 64-bit NOMMU
      riscv: Fix loading 64-bit NOMMU kernels past the start of RAM
      riscv: Remove MMU dependency from Zbb and Zicboz
      riscv: Allow NOMMU kernels to run in S-mode
      riscv: Do not save the scratch CSR during suspend
      riscv: Flush the instruction cache during SMP bringup
      riscv: Factor out page table TLB synchronization
      riscv: Use IPIs for remote cache/TLB flushes by default
      riscv: mm: Broadcast kernel TLB flushes only when needed
      riscv: Only send remote fences when some other CPU is online
      riscv: mm: Combine the SMP and UP TLB flush code
      riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
      riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
      riscv: mm: Introduce cntx2asid/cntx2version helper macros
      riscv: mm: Use a fixed layout for the MM context ID
      riscv: mm: Make asid_bits a local variable
      riscv: mm: Preserve global TLB entries when switching contexts
      riscv: mm: Always use an ASID to flush mm contexts

Stafford Horne (1):
      riscv: Remove unused asm/signal.h file

Tanzir Hasan (1):
      riscv: remove unused header

Yangyu Chen (1):
      RISC-V: only flush icache when it has VM_EXEC set

 Documentation/arch/riscv/cmodx.rst    |  98 ++++++++
 Documentation/arch/riscv/hwprobe.rst  |   4 +
 Documentation/arch/riscv/index.rst    |   1 +
 Documentation/rust/arch-support.rst   |   1 +
 arch/riscv/Kconfig                    |  22 +-
 arch/riscv/Makefile                   |  26 ++-
 arch/riscv/configs/defconfig          |   1 +
 arch/riscv/errata/sifive/errata.c     |   5 +
 arch/riscv/include/asm/atomic.h       | 164 ++++++-------
 arch/riscv/include/asm/cache.h        |   2 +-
 arch/riscv/include/asm/cacheflush.h   |   7 +-
 arch/riscv/include/asm/cmpxchg.h      | 422 ++++++++++++----------------------
 arch/riscv/include/asm/errata_list.h  |  12 +-
 arch/riscv/include/asm/irqflags.h     |   1 -
 arch/riscv/include/asm/mmu.h          |   5 +
 arch/riscv/include/asm/page.h         |   2 +-
 arch/riscv/include/asm/patch.h        |   1 +
 arch/riscv/include/asm/pgalloc.h      |  32 ++-
 arch/riscv/include/asm/pgtable.h      |   2 +-
 arch/riscv/include/asm/processor.h    |  10 +
 arch/riscv/include/asm/sbi.h          |   4 +
 arch/riscv/include/asm/signal.h       |  12 -
 arch/riscv/include/asm/smp.h          |  15 +-
 arch/riscv/include/asm/suspend.h      |   1 -
 arch/riscv/include/asm/switch_to.h    |  23 ++
 arch/riscv/include/asm/tlbflush.h     |  52 ++---
 arch/riscv/include/uapi/asm/hwprobe.h |   1 +
 arch/riscv/kernel/ftrace.c            |  44 +++-
 arch/riscv/kernel/patch.c             |  17 +-
 arch/riscv/kernel/sbi-ipi.c           |  11 +-
 arch/riscv/kernel/smp.c               |  11 +-
 arch/riscv/kernel/smpboot.c           |   7 +-
 arch/riscv/kernel/suspend.c           |   3 +-
 arch/riscv/kernel/sys_hwprobe.c       |   1 +
 arch/riscv/kernel/sys_riscv.c         |   1 -
 arch/riscv/kernel/traps_misaligned.c  | 106 ++-------
 arch/riscv/mm/Makefile                |   5 +-
 arch/riscv/mm/cacheflush.c            | 120 +++++++++-
 arch/riscv/mm/context.c               |  42 ++--
 arch/riscv/mm/init.c                  |  22 +-
 arch/riscv/mm/tlbflush.c              |  75 ++----
 drivers/clocksource/timer-clint.c     |   2 +-
 include/asm-generic/export.h          |  11 -
 include/linux/cpumask.h               |  16 ++
 include/uapi/linux/prctl.h            |   6 +
 kernel/sys.c                          |   6 +
 scripts/generate_rust_target.rs       |   6 +
 47 files changed, 757 insertions(+), 681 deletions(-)
 create mode 100644 Documentation/arch/riscv/cmodx.rst
 delete mode 100644 arch/riscv/include/asm/signal.h
 delete mode 100644 include/asm-generic/export.h


--===============8144212452571900668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8144212452571900668==--
