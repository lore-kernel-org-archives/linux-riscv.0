Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29984C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXb1BUbFNFkHEudDZyhvewQfdbJsuMCWu1WI3mfS1Pg=; b=jUlYHM2F1nE4M7
	1dQDwa8wcgWe5gb0rlqXB9Nf/2ExBQwukbQZM1NFYlkLtP8PmItl/XLrLbKzl18T2LTd1OK6L6dAs
	KkR/8daLKwenhLEJNvj9qfpNZ7ASFa8ucCb3Yl1LhDebdjbyLrtrcOcBFXrkK2Wn5jU7gz5NOqDjL
	FjOPtNjc+uQ1N4A5PXbCkvK9EUXZgIhBicbHejtRxUzH1rwl58YBO+ra/7PZnPVTRr/x90c8ggD6q
	AtcbrUAy16xzENZ2Gr/ulGWMJCgN++Um70EzaaDpM0ASUk/TGZ9eqjV1Zeyu4Go+A3RJ89h9hdM13
	9xQMv8qAUsJfjQPv1GuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbaXC-0000000469O-0zAu;
	Wed, 07 Aug 2024 06:52:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbaPf-000000042Lq-09sk;
	Wed, 07 Aug 2024 06:44:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE8E5CE0FCA;
	Wed,  7 Aug 2024 06:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDADC4AF0D;
	Wed,  7 Aug 2024 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723013083;
	bh=yGSuYKZLlLMiqFbedlBPLpAzRh3UdSHwetUs8HvKRLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqBflqCFwo48PEAMrdWsrQRxrw7fFfJMbr45ShyHQaQ8CSFQtVsFRcp7gph3jC5+a
	 uqfJaSVSedg02ztdanY4YO7bMgGFPyUpgX33biZCx3JNo2rw+V8hq/6j7//Pu/7p7X
	 vmpZitvUnMmfAXTLP2gBHFxJN0e2JWnBfkTHk3S1QVU5aSVdI3q/dhzRzj7ln+F6a3
	 cPgLIoezkRWO2ek2yALWDAlP5Qn/88+bPzmOepZLouNbO2T0xjdwO6V3kNMG3bKnoj
	 V6v3fFP8AWf/Q/KwgdFAefzUUaAJOQoOPlyG8f/XEgj6McFE6BzQnSNTQUBMsAp436
	 0520SFnp6im5Q==
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v4 16/26] x86/numa: numa_{add,remove}_cpu: make cpu parameter unsigned
Date: Wed,  7 Aug 2024 09:41:00 +0300
Message-ID: <20240807064110.1003856-17-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807064110.1003856-1-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_234447_447088_1D87873D 
X-CRM114-Status: GOOD (  12.49  )
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

CPU id cannot be negative.

Making it unsigned also aligns with declarations in
include/asm-generic/numa.h used by arm64 and riscv and allows sharing
numa emulation code with these architectures.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/include/asm/numa.h  | 10 +++++-----
 arch/x86/mm/numa.c           | 10 +++++-----
 arch/x86/mm/numa_emulation.c | 10 +++++-----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index b22c85c1ef18..6fa5ea925aac 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -54,20 +54,20 @@ static inline int numa_cpu_node(int cpu)
 extern void numa_set_node(int cpu, int node);
 extern void numa_clear_node(int cpu);
 extern void __init init_cpu_to_node(void);
-extern void numa_add_cpu(int cpu);
-extern void numa_remove_cpu(int cpu);
+extern void numa_add_cpu(unsigned int cpu);
+extern void numa_remove_cpu(unsigned int cpu);
 extern void init_gi_nodes(void);
 #else	/* CONFIG_NUMA */
 static inline void numa_set_node(int cpu, int node)	{ }
 static inline void numa_clear_node(int cpu)		{ }
 static inline void init_cpu_to_node(void)		{ }
-static inline void numa_add_cpu(int cpu)		{ }
-static inline void numa_remove_cpu(int cpu)		{ }
+static inline void numa_add_cpu(unsigned int cpu)	{ }
+static inline void numa_remove_cpu(unsigned int cpu)	{ }
 static inline void init_gi_nodes(void)			{ }
 #endif	/* CONFIG_NUMA */
 
 #ifdef CONFIG_DEBUG_PER_CPU_MAPS
-void debug_cpumask_set_cpu(int cpu, int node, bool enable);
+void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable);
 #endif
 
 #ifdef CONFIG_NUMA_EMU
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 2acf8d17b9b8..bf56f667fe0f 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -741,12 +741,12 @@ void __init init_cpu_to_node(void)
 #ifndef CONFIG_DEBUG_PER_CPU_MAPS
 
 # ifndef CONFIG_NUMA_EMU
-void numa_add_cpu(int cpu)
+void numa_add_cpu(unsigned int cpu)
 {
 	cpumask_set_cpu(cpu, node_to_cpumask_map[early_cpu_to_node(cpu)]);
 }
 
-void numa_remove_cpu(int cpu)
+void numa_remove_cpu(unsigned int cpu)
 {
 	cpumask_clear_cpu(cpu, node_to_cpumask_map[early_cpu_to_node(cpu)]);
 }
@@ -784,7 +784,7 @@ int early_cpu_to_node(int cpu)
 	return per_cpu(x86_cpu_to_node_map, cpu);
 }
 
-void debug_cpumask_set_cpu(int cpu, int node, bool enable)
+void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)
 {
 	struct cpumask *mask;
 
@@ -816,12 +816,12 @@ static void numa_set_cpumask(int cpu, bool enable)
 	debug_cpumask_set_cpu(cpu, early_cpu_to_node(cpu), enable);
 }
 
-void numa_add_cpu(int cpu)
+void numa_add_cpu(unsigned int cpu)
 {
 	numa_set_cpumask(cpu, true);
 }
 
-void numa_remove_cpu(int cpu)
+void numa_remove_cpu(unsigned int cpu)
 {
 	numa_set_cpumask(cpu, false);
 }
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index fb4814497446..235f8a4eb2fa 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -514,7 +514,7 @@ void __init numa_emulation(struct numa_meminfo *numa_meminfo, int numa_dist_cnt)
 }
 
 #ifndef CONFIG_DEBUG_PER_CPU_MAPS
-void numa_add_cpu(int cpu)
+void numa_add_cpu(unsigned int cpu)
 {
 	int physnid, nid;
 
@@ -532,7 +532,7 @@ void numa_add_cpu(int cpu)
 			cpumask_set_cpu(cpu, node_to_cpumask_map[nid]);
 }
 
-void numa_remove_cpu(int cpu)
+void numa_remove_cpu(unsigned int cpu)
 {
 	int i;
 
@@ -540,7 +540,7 @@ void numa_remove_cpu(int cpu)
 		cpumask_clear_cpu(cpu, node_to_cpumask_map[i]);
 }
 #else	/* !CONFIG_DEBUG_PER_CPU_MAPS */
-static void numa_set_cpumask(int cpu, bool enable)
+static void numa_set_cpumask(unsigned int cpu, bool enable)
 {
 	int nid, physnid;
 
@@ -560,12 +560,12 @@ static void numa_set_cpumask(int cpu, bool enable)
 	}
 }
 
-void numa_add_cpu(int cpu)
+void numa_add_cpu(unsigned int cpu)
 {
 	numa_set_cpumask(cpu, true);
 }
 
-void numa_remove_cpu(int cpu)
+void numa_remove_cpu(unsigned int cpu)
 {
 	numa_set_cpumask(cpu, false);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
