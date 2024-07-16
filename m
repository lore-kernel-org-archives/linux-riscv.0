Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073F8C3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 11:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+pJov7/oVz6LcMjhPDqdMlgrdpTnaoWFxySusVmLSY=; b=rVm6bOX7FJK6ei
	RLHNqfTu5gkeMBoFFzTzHZ3bPZLOlXvzvzJlNcFmlkhEPLWPvNe1aFe09mtZ08UIkws2kglGgrn5O
	KVQkoSJ3zHLyuqCj9/ytCdp/7gvNAbjrSpZkjCGf3FrP5lVaRa90RtaQbextl9iklLlh0r5vQ41/p
	Bm/lnEjCVpOS02AlEVL+1hONBIAQAr++TRduItdcbpRqRBDNhYjE1wjTZpmV0fBqpll2xVP54JYzX
	8vOro/FpLfAMBvdVwTTldMCOAPt61hQzKhiLhX/QOleSgIODgskMvmPL7N8xyYht6shn/fNsQKfDv
	XZjjHhe1X0PGy7fuiqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTgCZ-0000000ACQz-1vlH;
	Tue, 16 Jul 2024 11:18:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTg9s-0000000AAcC-33NU;
	Tue, 16 Jul 2024 11:15:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F10CD6108C;
	Tue, 16 Jul 2024 11:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FC9C4AF0F;
	Tue, 16 Jul 2024 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128547;
	bh=ym0kawqEGV0FNmvOsYm3DWOKfdlDmSXOdSkjneozt3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aUg6c6D0pXxFYfxdCla0UlGGSb+fzaMJ98PhtEuPZ4xlpOrwMZNzxrunxPvcfDdc7
	 NXufJhNRBO67I6yVAwRrB24yf+HtAH8pnnvS0xcP/IRbHEWL7yqiHMbLPL3az/7dke
	 kLw1+nQiaSDwkyvjoNw2D0R3dN+SnBi06HG1s3TOoOvNCDUXV5ucaNQK1Kbys49hx6
	 /juYk12sHgDnrQrIMEwtmEumKOES0H1okVRE5+R168aRmF+qYQ4ppw/Kfra4PrNfW3
	 YhaZIeYTe6w4tK9Ox3H4968ZbRGp43kkC7vp81Gd13qPzugi8VN9tKHerIr0CKBuPG
	 CUc4ZCR6v33eg==
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
Subject: [PATCH 10/17] x86/numa_emu: use a helper function to get MAX_DMA32_PFN
Date: Tue, 16 Jul 2024 14:13:39 +0300
Message-ID: <20240716111346.3676969-11-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716111346.3676969-1-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_041549_009937_DD4133D1 
X-CRM114-Status: GOOD (  14.82  )
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

This is required to make numa emulation code architecture independent s
that it can be moved to generic code in following commits.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/numa.h  | 1 +
 arch/x86/mm/numa.c           | 5 +++++
 arch/x86/mm/numa_emulation.c | 4 ++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index 7017d540894a..b22c85c1ef18 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -74,6 +74,7 @@ void debug_cpumask_set_cpu(int cpu, int node, bool enable);
 int numa_emu_cmdline(char *str);
 void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
 					unsigned int nr_emu_nids);
+u64 __init numa_emu_dma_end(void);
 #else /* CONFIG_NUMA_EMU */
 static inline int numa_emu_cmdline(char *str)
 {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 1320d776caed..0a59e3ceecda 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -872,6 +872,11 @@ void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
 		__apicid_to_node[i] = j < nr_emu_nids ? j : 0;
 	}
 }
+
+u64 __init numa_emu_dma_end(void)
+{
+	return PFN_PHYS(MAX_DMA32_PFN);
+}
 #endif /* CONFIG_NUMA_EMU */
 
 #ifdef CONFIG_NUMA_KEEP_MEMINFO
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index f2746e52ab93..fb4814497446 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -128,7 +128,7 @@ static int __init split_nodes_interleave(struct numa_meminfo *ei,
 	 */
 	while (!nodes_empty(physnode_mask)) {
 		for_each_node_mask(i, physnode_mask) {
-			u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
+			u64 dma32_end = numa_emu_dma_end();
 			u64 start, limit, end;
 			int phys_blk;
 
@@ -275,7 +275,7 @@ static int __init split_nodes_size_interleave_uniform(struct numa_meminfo *ei,
 	 */
 	while (!nodes_empty(physnode_mask)) {
 		for_each_node_mask(i, physnode_mask) {
-			u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
+			u64 dma32_end = numa_emu_dma_end();
 			u64 start, limit, end;
 			int phys_blk;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
