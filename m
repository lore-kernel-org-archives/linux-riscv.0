Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82163C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Nov 2021 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKIyC9X8aD4H8jE8s1cvjuAbryQ8PpbSUYOl/vNBmqc=; b=QsBWJdUAkBKmKG
	tIP4O0Ugl9GxIByLmS2ifm8xFh8LGfGn2zIgiqb+E9z8OnitZLA4cocaEsNhKIPt6E6WOicgIeRjr
	YCgIgmAkGfsducfaCzwfcH4NLy1zIdJ0NVxNz2AGvmnhdr57/ocsUp9Pad94C0OTfetxQz73Yq6fE
	hGWgfoIgXUxkK5SyfenpZgLI4f+Tlo9t4/eEOISvsueBblvM9Tcv5N3bG4U+KyT3P5VBxx9dm4yoJ
	0RqJAOaDyHRownkwPzfvMf4uoIDOTvHAvw/jMjBmCOgde87BluhRH3arBTQ5ejL7recD+hHrpGy1j
	vy2EB3EnrKtSDFvRCSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moj6e-00DPvs-BY; Sun, 21 Nov 2021 09:25:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moj61-00DPiX-Kn; Sun, 21 Nov 2021 09:25:16 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HxlL54wMbz1DHyG;
 Sun, 21 Nov 2021 17:22:37 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:05 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:04 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <dennis@kernel.org>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <tj@kernel.org>, <gregkh@linuxfoundation.org>, <cl@linux.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
 <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <davem@davemloft.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <sparclinux@vger.kernel.org>,
 <x86@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH RFC 1/4] mm: percpu: Generalize percpu related config
Date: Sun, 21 Nov 2021 17:35:54 +0800
Message-ID: <20211121093557.139034-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_012514_063809_01866F9D 
X-CRM114-Status: GOOD (  10.19  )
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

The HAVE_SETUP_PER_CPU_AREA/NEED_PER_CPU_EMBED_FIRST_CHUNK/
NEED_PER_CPU_PAGE_FIRST_CHUNK/USE_PERCPU_NUMA_NODE_ID configs,
which has duplicate definitions on platforms that subscribe it.

Move them into mm, drop these redundant definitions and instead
just select it on applicable platforms.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm64/Kconfig   | 20 ++++----------------
 arch/ia64/Kconfig    |  9 ++-------
 arch/mips/Kconfig    | 10 ++--------
 arch/powerpc/Kconfig | 17 ++++-------------
 arch/riscv/Kconfig   | 10 ++--------
 arch/sparc/Kconfig   | 12 +++---------
 arch/x86/Kconfig     | 17 ++++-------------
 mm/Kconfig           | 12 ++++++++++++
 8 files changed, 33 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c4207cf9bb17..4ff73299f8a9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1135,6 +1135,10 @@ config NUMA
 	select GENERIC_ARCH_NUMA
 	select ACPI_NUMA if ACPI
 	select OF_NUMA
+	select HAVE_SETUP_PER_CPU_AREA
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK
+	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -1151,22 +1155,6 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y
-	depends on NUMA
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y
-	depends on NUMA
-
-config NEED_PER_CPU_PAGE_FIRST_CHUNK
-	def_bool y
-	depends on NUMA
-
 source "kernel/Kconfig.hz"
 
 config ARCH_SPARSEMEM_ENABLE
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 1e33666fa679..703952819e10 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -32,6 +32,7 @@ config IA64
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_DYNAMIC_FTRACE if (!ITANIUM)
 	select HAVE_FUNCTION_TRACER
+	select HAVE_SETUP_PER_CPU_AREA
 	select TTY
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_VIRT_CPU_ACCOUNTING
@@ -88,9 +89,6 @@ config GENERIC_CALIBRATE_DELAY
 	bool
 	default y
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y
-
 config DMI
 	bool
 	default y
@@ -292,6 +290,7 @@ config NUMA
 	bool "NUMA support"
 	depends on !FLATMEM
 	select SMP
+	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
 	  Access).  This option is for configuring high-end multiprocessor
@@ -311,10 +310,6 @@ config HAVE_ARCH_NODEDATA_EXTENSION
 	def_bool y
 	depends on NUMA
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
 config HAVE_MEMORYLESS_NODES
 	def_bool NUMA
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index de60ad190057..c106a2080877 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2666,6 +2666,8 @@ config NUMA
 	bool "NUMA Support"
 	depends on SYS_SUPPORTS_NUMA
 	select SMP
+	select HAVE_SETUP_PER_CPU_AREA
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	help
 	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
 	  Access).  This option improves performance on systems with more
@@ -2676,14 +2678,6 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y
-	depends on NUMA
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y
-	depends on NUMA
-
 config RELOCATABLE
 	bool "Relocatable kernel"
 	depends on SYS_SUPPORTS_RELOCATABLE
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index dea74d7717c0..8badd39854a0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -55,15 +55,6 @@ config ARCH_MMAP_RND_COMPAT_BITS_MIN
 	default 9 if PPC_16K_PAGES	#  9 = 23 (8MB) - 14 (16K)
 	default 11			# 11 = 23 (8MB) - 12 (4K)
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool PPC64
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y if PPC64
-
-config NEED_PER_CPU_PAGE_FIRST_CHUNK
-	def_bool y if PPC64
-
 config NR_IRQS
 	int "Number of virtual interrupt numbers"
 	range 32 1048576
@@ -240,6 +231,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
@@ -254,6 +246,8 @@ config PPC
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK	if PPC64
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
 	select NEED_SG_DMA_LENGTH
 	select OF
 	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
@@ -659,6 +653,7 @@ config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
 	depends on PPC64 && SMP
 	default y if PPC_PSERIES || PPC_POWERNV
+	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -672,10 +667,6 @@ config NODES_SHIFT
 	default "4"
 	depends on NUMA
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
 config HAVE_MEMORYLESS_NODES
 	def_bool y
 	depends on NUMA
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 821252b65f89..bf66bcbc5a39 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -334,6 +334,8 @@ config NUMA
 	select GENERIC_ARCH_NUMA
 	select OF_NUMA
 	select ARCH_SUPPORTS_NUMA_BALANCING
+	select USE_PERCPU_NUMA_NODE_ID
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -349,14 +351,6 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y
-	depends on NUMA
-
 config RISCV_ISA_C
 	bool "Emit compressed instructions when building Linux"
 	default y
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 66fc08646be5..a6765e0fe6a8 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -97,6 +97,9 @@ config SPARC64
 	select PCI_DOMAINS if PCI
 	select ARCH_HAS_GIGANTIC_PAGE
 	select HAVE_SOFTIRQ_ON_OWN_STACK
+	select HAVE_SETUP_PER_CPU_AREA
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
+	select NEED_PER_CPU_PAGE_FIRST_CHUUNK
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
@@ -123,15 +126,6 @@ config AUDIT_ARCH
 	bool
 	default y
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y if SPARC64
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y if SPARC64
-
-config NEED_PER_CPU_PAGE_FIRST_CHUNK
-	def_bool y if SPARC64
-
 config MMU
 	bool
 	default y
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7399327d1eff..ca120a1f5857 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -239,6 +239,7 @@ config X86
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if X86_64 && (UNWINDER_FRAME_POINTER || UNWINDER_ORC) && STACK_VALIDATION
 	select HAVE_FUNCTION_ARG_ACCESS_API
+	select HAVE_SETUP_PER_CPU_AREA
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if CC_HAS_SANE_STACKPROTECTOR
 	select HAVE_STACK_VALIDATION		if X86_64
@@ -252,6 +253,8 @@ config X86
 	select HAVE_GENERIC_VDSO
 	select HOTPLUG_SMT			if SMP
 	select IRQ_FORCED_THREADING
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select NEED_SG_DMA_LENGTH
 	select PCI_DOMAINS			if PCI
 	select PCI_LOCKLESS_CONFIG		if PCI
@@ -331,15 +334,6 @@ config ARCH_HAS_CPU_RELAX
 config ARCH_HAS_FILTER_PGPROT
 	def_bool y
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y
-
-config NEED_PER_CPU_PAGE_FIRST_CHUNK
-	def_bool y
-
 config ARCH_HIBERNATION_POSSIBLE
 	def_bool y
 
@@ -1557,6 +1551,7 @@ config NUMA
 	depends on SMP
 	depends on X86_64 || (X86_32 && HIGHMEM64G && X86_BIGSMP)
 	default y if X86_BIGSMP
+	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -2430,10 +2425,6 @@ config ARCH_HAS_ADD_PAGES
 config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	def_bool y
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
 menu "Power management and ACPI options"
 
 config ARCH_HIBERNATION_HEADER
diff --git a/mm/Kconfig b/mm/Kconfig
index 28edafc820ad..6bc5d780c51b 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -432,6 +432,18 @@ config NEED_PER_CPU_KM
 	bool
 	default y
 
+config NEED_PER_CPU_EMBED_FIRST_CHUNK
+	bool
+
+config NEED_PER_CPU_PAGE_FIRST_CHUNK
+	bool
+
+config USE_PERCPU_NUMA_NODE_ID
+	bool
+
+config HAVE_SETUP_PER_CPU_AREA
+	bool
+
 config CLEANCACHE
 	bool "Enable cleancache driver to cache clean pages if tmem is present"
 	help
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
