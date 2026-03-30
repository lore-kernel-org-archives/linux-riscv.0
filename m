Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2ADFB3D02
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaA6CFwimbbG9h/I4DTCkOl1xOILxObTLHFlFtSDk0w=; b=ak7Csu8leS/Yz0
	5P/OGAfXesn/PBTX+UNSd+b0DyxxWRGz/kU3RZoOLLIHiLJywW9FrQhvk/rXTx+l8xvxCH4DT6pFo
	XCVtKIxGut95Ob1MQVkXzjUQmjir4g8W8fkuqiNp1wQ+oZ1Resn7v8Fk6NOOFEaYDM0yR1Hy6Bqaj
	fsxjgdxkm3b4V4K++0W4WddaSEfXSkyIMMeF8/zvOFGjQJ3yb2Ra45+smuczWDqbdpad2uU36FKAn
	zGToVvJKtybM89cSCREkxstxBLMUEzzh61Sqc+yKqFz9znxy00Fq9Y18Jmjc2DDXIy2FvL4g//NWO
	WAHlUWUaH2k5MdMCKDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79ru-0000000B3br-1maI;
	Mon, 30 Mar 2026 10:29:14 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rs-0000000B3aG-0dym
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:29:13 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UASEsn038230;
	Mon, 30 Mar 2026 18:28:14 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:14 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 4/7] cache: andes_llcache: centralize cache ops and use native WBINVAL
Date: Mon, 30 Mar 2026 18:27:21 +0800
Message-ID: <20260330102724.1012470-5-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 62UASEsn038230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_032912_538041_EAD9167B 
X-CRM114-Status: GOOD (  10.90  )
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

Introduce andes_cpu_cache_operation() to centralize address
translation, alignment, and IRQ handling, removing the redundant
wrappers andes_cpu_dcache_wb_range and andes_cpu_dcache_inval_range.

This refactoring includes the following refinements:
- Consolidates address translation, boundary alignment, and IRQ handling
  (local_irq_save/restore) into the central function.
- Make IRQ handling per cache line instead of across the entire cache
  operation.
- Cleans up redundant intermediate wrapper functions
  (andes_cpu_dcache_wb_range, andes_cpu_dcache_inval_range).
- wback_inv was chaining wback + inv separately; use the hardware's
  native WBINVAL CCTL instead, which does both in one shot.

Signed-off-by: Alex Chun-Ju Lin <alex749@andestech.com>
Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 63 ++++++++++++-----------------------
 1 file changed, 21 insertions(+), 42 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 57f666bc537a..0efa6e9c80bd 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -69,21 +69,29 @@ static inline uint32_t andes_cpu_llc_get_cctl_status(void)
 	return readl_relaxed(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
 }
 
-static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
-				       unsigned int l1_op, unsigned int llc_op)
+static void andes_cpu_cache_operation(phys_addr_t paddr, size_t size,
+				      unsigned int l1_op, unsigned int llc_op)
 {
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
+	unsigned long start = (unsigned long)phys_to_virt(paddr);
+	unsigned long end = start + size;
+	unsigned long flags;
 	unsigned long pa;
 	int mhartid = 0;
 
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
+
 	if (IS_ENABLED(CONFIG_SMP))
 		mhartid = cpuid_to_hartid_map(get_cpu());
 	else
 		mhartid = cpuid_to_hartid_map(0);
 
 	mb(); /* complete earlier memory accesses before the cache flush */
-	while (end > start) {
+	for (; start < end; start += line_size) {
+		local_irq_save(flags);
+
 		csr_write(CSR_UCCTLBEGINADDR, start);
 		csr_write(CSR_UCCTLCOMMAND, l1_op);
 
@@ -95,7 +103,7 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 			ANDES_LLC_CCTL_STATUS_IDLE)
 			;
 
-		start += line_size;
+		local_irq_restore(flags);
 	}
 	mb(); /* issue later memory accesses after the cache flush */
 
@@ -103,60 +111,31 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 		put_cpu();
 }
 
-/* Write-back L1 and LLC entry */
-static inline void andes_cpu_dcache_wb_range(unsigned long start, unsigned long end)
-{
-	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_WB,
-				   ANDES_LLC_CCTL_PA_WB);
-}
-
-/* Invalidate the L1 and LLC entry */
-static inline void andes_cpu_dcache_inval_range(unsigned long start, unsigned long end)
-{
-	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_INVAL,
-				   ANDES_LLC_CCTL_PA_INVAL);
-}
-
 static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-	unsigned long start = (unsigned long)phys_to_virt(paddr);
-	unsigned long end = start + size;
-	unsigned long line_size = andes_priv.andes_cache_line_size;
-	unsigned long flags;
-
 	if (unlikely(!size))
 		return;
 
-	start = ALIGN_DOWN(start, line_size);
-	end = ALIGN(end, line_size);
-
-	local_irq_save(flags);
-	andes_cpu_dcache_inval_range(start, end);
-	local_irq_restore(flags);
+	andes_cpu_cache_operation(paddr, size, ANDES_L1D_CCTL_VA_INVAL,
+				  ANDES_LLC_CCTL_PA_INVAL);
 }
 
 static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	unsigned long start = (unsigned long)phys_to_virt(paddr);
-	unsigned long end = start + size;
-	unsigned long line_size = andes_priv.andes_cache_line_size;
-	unsigned long flags;
-
 	if (unlikely(!size))
 		return;
 
-	start = ALIGN_DOWN(start, line_size);
-	end = ALIGN(end, line_size);
-
-	local_irq_save(flags);
-	andes_cpu_dcache_wb_range(start, end);
-	local_irq_restore(flags);
+	andes_cpu_cache_operation(paddr, size, ANDES_L1D_CCTL_VA_WB,
+				  ANDES_LLC_CCTL_PA_WB);
 }
 
 static void andes_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
-	andes_dma_cache_wback(paddr, size);
-	andes_dma_cache_inv(paddr, size);
+	if (unlikely(!size))
+		return;
+
+	andes_cpu_cache_operation(paddr, size, ANDES_L1D_CCTL_VA_WBINVAL,
+				  ANDES_LLC_CCTL_PA_WBINVAL);
 }
 
 static int andes_get_llc_line_size(struct device_node *np)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
