Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39BDC4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qWSe1qcg3OCwtGktFvlHb5gOfHV2WKUNCSHJ5dSD/tM=; b=0GJUCgAKjcUzYR
	A3G+58Ri+uRTMmw/mirzCTktCIMUbCUNKIdp5wn4bebbAAjFUaowXEiL/uIklufaWQ6DjuQ1YS/k+
	7jn+3ra+NcRTr2pjqSNxM7jsK2H5DPbIi6rkRJraZbcAXdUijCbrNIwEWNzCt27OcRM3B1+TXTp+E
	FVuURTKh5VQrEuaGu9tQoZTklSLwdVa79wkAmbXyfi50mWQZblCrmIABDKB+uIKg6GAwtNLC4sucU
	xY8Xgnoph0wR3mSw3WXbuJIzHxDv3GMODF6LhfCdnQ8yWIaud+XyHpBJEDwqSVmFBwuuTMcQpyMHW
	QJO1To/4vIU05jAnxAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15oh-00GZPf-1y; Fri, 02 Dec 2022 13:10:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15oe-00GZOS-5m
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 13:10:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BCFF7B8214F;
	Fri,  2 Dec 2022 13:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70648C433C1;
	Fri,  2 Dec 2022 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669986653;
	bh=/pq1o/nILySbnVJbKHYhf+1P2MhBApaLTBSFwpHWhrU=;
	h=From:To:Cc:Subject:Date:From;
	b=ql1QVf3CaZtN6npmc253DUauIx/WM5KRkFh10jSM9VqaLKClcSHF+s22Cx1wq4bcx
	 2dfXalw3Gkn/3ocycva1blDh2L83TA+NSGk3l51f7B52Nj8p3FbCDDeUkLyZXJoVwQ
	 k1w3SF6v3jttFQ0aSvxRR4pO7+f/K0ii7Rewos7q1xBXfPtXJxOgwD8QF2IPtGjnbM
	 xbE4zec7PIy6k1V5qKgmmBYXy2dgCMCxNYl/MYBwxLWFEMCY3wthb12jDtt46Fy3JQ
	 SgfNou6bMSvziWzem/ujvgdCkXbV9xAp1aUby5+pmc6lkSpO4kt67ejYWqwxmm9Lnj
	 zEKVZ4zSJjeQw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] RISC-V: re-order Kconfig selects alphanumerically
Date: Fri,  2 Dec 2022 13:10:35 +0000
Message-Id: <20221202131034.66674-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_051056_547254_EE6EFB79 
X-CRM114-Status: GOOD (  14.00  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Selects should be sorted alphanumerically, and were tidied up originally
by Palmer in commit e8c7ef7d5819 ("RISC-V: Sort select statements
alphanumerically") since then, things have gotten out of order again.
Fish RMK's original script out of commit b1b3f49ce460 ("ARM: config:
sort select statements alphanumerically") and do some spring cleaning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
The base for this is v6.1-rc7, but I cherry picked it onto linux-next
and that seemed to go through fine - I'll add the script to the PW
checks, but it likely doesn't make sense to do so until there are no
ordering "errors" in the branches it'll run the checks on.

v1 only did one movement, v2 does every one.

There's no difference in the generated .config from allmodconfig
before and after :)
---
 arch/riscv/Kconfig | 50 +++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fa78595a6089..0d7592ba7195 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -15,10 +15,11 @@ config RISCV
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
+	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CURRENT_STACK_POINTER
-	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
@@ -41,15 +42,15 @@ config RISCV
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
-	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
-	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
+	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if CPU_IDLE
 	select EDAC_SUPPORT
@@ -82,16 +83,16 @@ config RISCV
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
-	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
-	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
@@ -107,10 +108,9 @@ config RISCV
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
-	select HAVE_FUNCTION_ARG_ACCESS_API
+	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
-	select HAVE_RSEQ
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select MODULES_USE_ELF_RELA if MODULES
@@ -225,9 +225,9 @@ config LOCKDEP_SUPPORT
 config RISCV_DMA_NONCOHERENT
 	bool
 	select ARCH_HAS_DMA_PREP_COHERENT
-	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
-	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SETUP_DMA_OPS
+	select ARCH_HAS_SYNC_DMA_FOR_CPU
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select DMA_DIRECT_REMAP
 
 config AS_HAS_INSN
@@ -347,11 +347,11 @@ endchoice
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
 	depends on SMP && MMU
+	select ARCH_SUPPORTS_NUMA_BALANCING
 	select GENERIC_ARCH_NUMA
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select OF_NUMA
-	select ARCH_SUPPORTS_NUMA_BALANCING
 	select USE_PERCPU_NUMA_NODE_ID
-	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -396,8 +396,8 @@ config RISCV_ISA_SVPBMT
 	bool "SVPBMT extension support"
 	depends on 64BIT && MMU
 	depends on !XIP_KERNEL
-	select RISCV_ALTERNATIVE
 	default y
+	select RISCV_ALTERNATIVE
 	help
 	   Adds support to dynamically detect the presence of the SVPBMT
 	   ISA-extension (Supervisor-mode: page-based memory types) and
@@ -422,9 +422,9 @@ config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
 	depends on TOOLCHAIN_HAS_ZICBOM
 	depends on !XIP_KERNEL && MMU
-	select RISCV_DMA_NONCOHERENT
-	select RISCV_ALTERNATIVE
 	default y
+	select RISCV_ALTERNATIVE
+	select RISCV_DMA_NONCOHERENT
 	help
 	   Adds support to dynamically detect the presence of the ZICBOM
 	   extension (Cache Block Management Operations) and enable its
@@ -486,9 +486,9 @@ config RISCV_BOOT_SPINWAIT
 
 config KEXEC
 	bool "Kexec system call"
-	select KEXEC_CORE
-	select HOTPLUG_CPU if SMP
 	depends on MMU
+	select HOTPLUG_CPU if SMP
+	select KEXEC_CORE
 	help
 	  kexec is a system call that implements the ability to shutdown your
 	  current kernel, and to start another kernel. It is like a reboot
@@ -499,10 +499,10 @@ config KEXEC
 
 config KEXEC_FILE
 	bool "kexec file based systmem call"
+	depends on 64BIT
+	select HAVE_IMA_KEXEC if IMA
 	select KEXEC_CORE
 	select KEXEC_ELF
-	select HAVE_IMA_KEXEC if IMA
-	depends on 64BIT
 	help
 	  This is new version of kexec system call. This system call is
 	  file based and takes file descriptors as system call argument
@@ -591,15 +591,15 @@ config EFI_STUB
 config EFI
 	bool "UEFI runtime support"
 	depends on OF && !XIP_KERNEL
-	select LIBFDT
-	select UCS2_STRING
-	select EFI_PARAMS_FROM_FDT
-	select EFI_STUB
+	depends on MMU
+	default y
 	select EFI_GENERIC_STUB
+	select EFI_PARAMS_FROM_FDT
 	select EFI_RUNTIME_WRAPPERS
+	select EFI_STUB
+	select LIBFDT
 	select RISCV_ISA_C
-	depends on MMU
-	default y
+	select UCS2_STRING
 	help
 	  This option provides support for runtime services provided
 	  by UEFI firmware (such as non-volatile variables, realtime
@@ -678,8 +678,8 @@ config PORTABLE
 	bool
 	default !NONPORTABLE
 	select EFI
-	select OF
 	select MMU
+	select OF
 
 menu "Power management options"
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
