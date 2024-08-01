Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147C0C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zb5wROekNd1hBXVit/ZYqPjZ/0nYqXe4Dx1XXMBzx58=; b=tuK0FmApsknCze
	/SJOeS5t8HgKWxmbkjDgEVqqkz77gZQCzZNv1gNngbX9HD8QWf9UYbaN9wuiO1D+TOZPO+dToWM3I
	PZ2wxiUWm/G5YBfEfxQDV31MDJgq53nVg4isZn482QlqRUKRMLsqPg24mRdZJ9q2vu7Qb0jSB2e3q
	zBXXon3fSSJyoLgPNJpxRJoQ4oCNAbgmx4TAfnQDCE+K8Sq4ks4lpytsgh6567ZcuhQnHuxK4ivbM
	nQVfmGKmVrs9RAlXYQnjehFjMTOlwTZWbKYuHG7L0Hj3hG4UzHtekovJRyhcea4sMa+1xpabrG8JV
	wS5EqNEparhs3xvPGx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP3P-00000003tgg-2TM4;
	Thu, 01 Aug 2024 06:12:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP0g-00000003ryk-20dK;
	Thu, 01 Aug 2024 06:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A149B61B43;
	Thu,  1 Aug 2024 06:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FA4C4AF0D;
	Thu,  1 Aug 2024 06:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722492597;
	bh=r+zUcEDoxtqvT8BU/VmlycxtHktOTZUPU96MGvM/m8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jS8CwM2HVacHd88SFDPtwS0+oYW3iYC3FGtk8UqItF2w5da1ERg0blF0k9sJIq5gO
	 j+49LhbnKA5MHqV4Fgt2ytbHPvmsT/0zZqHsz/HcWK7tqRzK7FnDQWR65QvIGxzpV6
	 IgOZkkRBg6DhUMfwbNJ/Kpf+yEo/Uq9WJtCbSDiQBMnlyq0A8Zzjp1qrR3NlDQfr++
	 AKmQzG7nVd2IbIbt/+lnbQ9V4sB35D21NuC4UdRz8suodH6nNMsYTL+jbG3gGXHsfj
	 1TulkgepHvXzaSOM7uuBbCwqnItrZwuJ2WR603WAEBN9R5dOB6tCA2yzZTE3wfWcrf
	 jOWVtDodBbVmw==
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
	x86@kernel.org
Subject: [PATCH v3 06/26] MIPS: loongson64: drop HAVE_ARCH_NODEDATA_EXTENSION
Date: Thu,  1 Aug 2024 09:08:06 +0300
Message-ID: <20240801060826.559858-7-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_230958_803888_721AFC8D 
X-CRM114-Status: GOOD (  11.28  )
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

Commit f8f9f21c7848 ("MIPS: Fix build error for loongson64 and
sgi-ip27") added HAVE_ARCH_NODEDATA_EXTENSION to loongson64 to silence a
compilation error that happened because loongson64 didn't define array
of pg_data_t as node_data like most other architectures did.

After rename of __node_data to node_data arch_alloc_nodedata() and
HAVE_ARCH_NODEDATA_EXTENSION can be dropped from loongson64.

Since it was the only user of HAVE_ARCH_NODEDATA_EXTENSION config option
also remove this option from arch/mips/Kconfig.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/Kconfig           |  4 ----
 arch/mips/loongson64/numa.c | 10 ----------
 2 files changed, 14 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ea5f3c3c31f6..43da6d596e2b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -502,7 +502,6 @@ config MACH_LOONGSON64
 	select USE_OF
 	select BUILTIN_DTB
 	select PCI_HOST_GENERIC
-	select HAVE_ARCH_NODEDATA_EXTENSION if NUMA
 	help
 	  This enables the support of Loongson-2/3 family of machines.
 
@@ -2612,9 +2611,6 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
-config HAVE_ARCH_NODEDATA_EXTENSION
-	bool
-
 config RELOCATABLE
 	bool "Relocatable kernel"
 	depends on SYS_SUPPORTS_RELOCATABLE
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index b50ce28d2741..64fcfaa885b6 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -198,13 +198,3 @@ void __init prom_init_numa_memory(void)
 	pr_info("CP0_PageGrain: CP0 5.1 (0x%x)\n", read_c0_pagegrain());
 	prom_meminit();
 }
-
-pg_data_t * __init arch_alloc_nodedata(int nid)
-{
-	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
-}
-
-void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
-{
-	node_data[nid] = pgdat;
-}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
