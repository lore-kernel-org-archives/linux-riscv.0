Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14494C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tv8muKfaWXBEsXYKtrAwp/8iotdP7NPdflWMXt9APhg=; b=i3oRMOLAbooPyA
	rgaxfRVJNdyKPH8wg1FsA/r5D3XYpiA2q+07EPaVNklbOJhxmTLGKpo/spdWga/truFJJ/eZAwiPx
	cQlbBBCk5blRojoAGKcgNaLlopP/jGX2C4GbIxf8oX3TuVByGITaunE+FaOIjjAW2sNVIZKsctkpz
	C5Rn+zmpw1pZx7CoGVOY7KKaZhdlWwbkVYTpKZQls6BxuTyWAfecqLKahtmbPFOO2dMBWiYOEr+Lq
	iotWFH3Mpzqitc6wwhoBwvjkkGOl2AoMMFt/Uzfz7p9/0npya2CU1nBGFGCEFDk0za8MvlYkYQOiA
	QqTEj1k3brWIG1YUg1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTgEA-0000000ADOs-1LZf;
	Tue, 16 Jul 2024 11:20:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTgAY-0000000AB6S-3sTo;
	Tue, 16 Jul 2024 11:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 513AFCE0C68;
	Tue, 16 Jul 2024 11:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C776CC4AF0D;
	Tue, 16 Jul 2024 11:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128588;
	bh=J5LEqR4AoCvU/KZiQsAwdFPUPPx4+6cXxvN58f3qL14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRpLrrVgs49iPdPeTlsZTWXyagoaSsHx1E5C93i5+9P8SBlnn7Z12NbhmT4tPpRpJ
	 0zI+BO3Nppe5LLSfYA4/YJraT3JXfCwhgn8es8kezNFA5tq+VGZs0z3yKJaNH88eeY
	 ko/ZZr/J/iuMNP63MEa1Cz8SPM5bEZgddW3tOQDKBjZZ6IRrZzzrI/1IH19/F20lWd
	 U4anRDTclZV9ZpdtUMrjnLxeBd4fO7FcnGM+dt98tawWilGeWcPF4NK8RCMxjjkijt
	 61SQDh1+30pevGJ+NuacABT3RBSTFUm2AWNy8CJd82u176925JGY/GFFjGvjXBldU6
	 /v8D8XbcQ1KyQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH 14/17] mm: introduce numa_emulation
Date: Tue, 16 Jul 2024 14:13:43 +0300
Message-ID: <20240716111346.3676969-15-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716111346.3676969-1-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_041631_354289_48B4ECAC 
X-CRM114-Status: GOOD (  16.13  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Move numa_emulation codfrom arch/x86 to mm/numa_emulation.c

This code will be later reused by arch_numa.

No functional changes.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/Kconfig             |  8 --------
 arch/x86/include/asm/numa.h  | 12 ------------
 arch/x86/mm/Makefile         |  1 -
 arch/x86/mm/numa_internal.h  | 11 -----------
 include/linux/numa_memblks.h | 17 +++++++++++++++++
 mm/Kconfig                   |  8 ++++++++
 mm/Makefile                  |  1 +
 mm/numa_emulation.c          |  4 +---
 8 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index d8084f37157c..a42735c126fa 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1592,14 +1592,6 @@ config X86_64_ACPI_NUMA
 	help
 	  Enable ACPI SRAT based node topology detection.
 
-config NUMA_EMU
-	bool "NUMA emulation"
-	depends on NUMA
-	help
-	  Enable NUMA emulation. A flat machine will be split
-	  into virtual nodes when booted with "numa=fake=N", where N is the
-	  number of nodes. This is only useful for debugging.
-
 config NODES_SHIFT
 	int "Maximum NUMA Nodes (as a power of 2)" if !MAXSMP
 	range 1 10
diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index 6e9a50bf03d4..c6e232e3c303 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -67,16 +67,4 @@ static inline void init_gi_nodes(void)			{ }
 void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable);
 #endif
 
-#ifdef CONFIG_NUMA_EMU
-int numa_emu_cmdline(char *str);
-void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
-					unsigned int nr_emu_nids);
-u64 __init numa_emu_dma_end(void);
-#else /* CONFIG_NUMA_EMU */
-static inline int numa_emu_cmdline(char *str)
-{
-	return -EINVAL;
-}
-#endif /* CONFIG_NUMA_EMU */
-
 #endif	/* _ASM_X86_NUMA_H */
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 8d3a00e5c528..690fbf48e853 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -57,7 +57,6 @@ obj-$(CONFIG_MMIOTRACE_TEST)	+= testmmiotrace.o
 obj-$(CONFIG_NUMA)		+= numa.o numa_$(BITS).o
 obj-$(CONFIG_AMD_NUMA)		+= amdtopology.o
 obj-$(CONFIG_ACPI_NUMA)		+= srat.o
-obj-$(CONFIG_NUMA_EMU)		+= numa_emulation.o
 
 obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
 obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
diff --git a/arch/x86/mm/numa_internal.h b/arch/x86/mm/numa_internal.h
index 249e3aaeadce..11e1ff370c10 100644
--- a/arch/x86/mm/numa_internal.h
+++ b/arch/x86/mm/numa_internal.h
@@ -7,15 +7,4 @@
 
 void __init x86_numa_init(void);
 
-struct numa_meminfo;
-
-#ifdef CONFIG_NUMA_EMU
-void __init numa_emulation(struct numa_meminfo *numa_meminfo,
-			   int numa_dist_cnt);
-#else
-static inline void numa_emulation(struct numa_meminfo *numa_meminfo,
-				  int numa_dist_cnt)
-{ }
-#endif
-
 #endif	/* __X86_MM_NUMA_INTERNAL_H */
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 968a590535ac..f81f98678074 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -34,6 +34,23 @@ int __init numa_register_meminfo(struct numa_meminfo *mi);
 void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
 				       const struct numa_meminfo *mi);
 
+#ifdef CONFIG_NUMA_EMU
+int numa_emu_cmdline(char *str);
+void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
+					unsigned int nr_emu_nids);
+u64 __init numa_emu_dma_end(void);
+void __init numa_emulation(struct numa_meminfo *numa_meminfo,
+			   int numa_dist_cnt);
+#else
+static inline void numa_emulation(struct numa_meminfo *numa_meminfo,
+				  int numa_dist_cnt)
+{ }
+static inline int numa_emu_cmdline(char *str)
+{
+	return -EINVAL;
+}
+#endif /* CONFIG_NUMA_EMU */
+
 #endif /* CONFIG_NUMA_MEMBLKS */
 
 #endif	/* __NUMA_MEMBLKS_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index 15c6efbaa1df..ae58eecdefdc 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1252,6 +1252,14 @@ config EXECMEM
 config NUMA_MEMBLKS
 	bool
 
+config NUMA_EMU
+	bool "NUMA emulation"
+	depends on NUMA_MEMBLKS
+	help
+	  Enable NUMA emulation. A flat machine will be split
+	  into virtual nodes when booted with "numa=fake=N", where N is the
+	  number of nodes. This is only useful for debugging.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 17bc4013a2c5..d5b1b30f76e3 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -141,3 +141,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
+obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
diff --git a/mm/numa_emulation.c b/mm/numa_emulation.c
index 33610026b7a3..031fb9961bf7 100644
--- a/mm/numa_emulation.c
+++ b/mm/numa_emulation.c
@@ -7,9 +7,7 @@
 #include <linux/topology.h>
 #include <linux/memblock.h>
 #include <linux/numa_memblks.h>
-#include <asm/dma.h>
-
-#include "numa_internal.h"
+#include <asm/numa.h>
 
 #define FAKE_NODE_MIN_SIZE	((u64)32 << 20)
 #define FAKE_NODE_MIN_HASH_MASK	(~(FAKE_NODE_MIN_SIZE - 1UL))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
