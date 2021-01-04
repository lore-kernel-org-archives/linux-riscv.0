Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48E8C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:05:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AEA92085B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AEA92085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5PMXKlwefKRYSL2m7e7vBMUcgqAPhW7gu5LdDpEOX1M=; b=1vfavhiQBst17GTAAcP5TT2BZ
	QLiEl4fPmUuo9HcUjI96e9EHCRb2F2+vCxvY9d/Ee4vcLMj6HnS7z3lhEdwxr5+6NZl/B3J6LhJlj
	0XwHNgV+bbI7ZsfT7E/jNgLwbNs8hpHgqw4XQgZL/aXEoPB8BLxYSmbsr0g2IbK3nAEjEZUgX3Woh
	dhm/BKni8SsW2d9ZGM8vlIm3rPmhspAOmFPAksyHyTwiRYqEcrR3q42e5+7pvGDreGcOQdfDDyIB6
	0ucb+7XUaDLiUCiUcCH0CEJayy2V+StkqRmwY+vU0cS6aDbKTEaNxPgOLaOCGZPTgRgn6UbpRBfgv
	DJFBEeLwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwW6Q-00083w-QK; Mon, 04 Jan 2021 20:05:18 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwW6M-00082D-KB
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 20:05:17 +0000
X-Originating-IP: 90.112.190.212
Received: from debian.home (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 53D97E0002;
 Mon,  4 Jan 2021 20:05:11 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 06/12] riscv: Prepare ptdump for vm layout dynamic
 addresses
Date: Mon,  4 Jan 2021 14:58:34 -0500
Message-Id: <20210104195840.1593-7-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210104195840.1593-1-alex@ghiti.fr>
References: <20210104195840.1593-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_150515_002188_ED875336 
X-CRM114-Status: GOOD (  12.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is a preparatory patch for sv48 support that will introduce
dynamic PAGE_OFFSET.

Dynamic PAGE_OFFSET implies that all zones (vmalloc, vmemmap, fixaddr...)
whose addresses depend on PAGE_OFFSET become dynamic and can't be used
to statically initialize the array used by ptdump to identify the
different zones of the vm layout.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/mm/ptdump.c | 56 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index ace74dec7492..1be2ca81f8ad 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -58,29 +58,50 @@ struct ptd_mm_info {
 	unsigned long end;
 };
 
+enum address_markers_idx {
+#ifdef CONFIG_KASAN
+	KASAN_SHADOW_START_NR,
+	KASAN_SHADOW_END_NR,
+#endif
+	FIXMAP_START_NR,
+	FIXMAP_END_NR,
+	PCI_IO_START_NR,
+	PCI_IO_END_NR,
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	VMEMMAP_START_NR,
+	VMEMMAP_END_NR,
+#endif
+	VMALLOC_START_NR,
+	VMALLOC_END_NR,
+	PAGE_OFFSET_NR,
+    KERNEL_MAPPING_NR,
+	END_OF_SPACE_NR
+};
+
 static struct addr_marker address_markers[] = {
 #ifdef CONFIG_KASAN
 	{KASAN_SHADOW_START,	"Kasan shadow start"},
 	{KASAN_SHADOW_END,	"Kasan shadow end"},
 #endif
-	{FIXADDR_START,		"Fixmap start"},
-	{FIXADDR_TOP,		"Fixmap end"},
-	{PCI_IO_START,		"PCI I/O start"},
-	{PCI_IO_END,		"PCI I/O end"},
+	{0,			"Fixmap start"},
+	{0,			"Fixmap end"},
+	{0,			"PCI I/O start"},
+	{0,			"PCI I/O end"},
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-	{VMEMMAP_START,		"vmemmap start"},
-	{VMEMMAP_END,		"vmemmap end"},
+	{0,			"vmemmap start"},
+	{0,			"vmemmap end"},
 #endif
-	{VMALLOC_START,		"vmalloc() area"},
-	{VMALLOC_END,		"vmalloc() end"},
-	{PAGE_OFFSET,		"Linear mapping"},
+	{0,			"vmalloc() area"},
+	{0,			"vmalloc() end"},
+	{0,			"Linear mapping"},
+	{0,			"Kernel mapping (kernel, BPF, modules)"},
 	{-1, NULL},
 };
 
 static struct ptd_mm_info kernel_ptd_info = {
 	.mm		= &init_mm,
 	.markers	= address_markers,
-	.base_addr	= KERN_VIRT_START,
+	.base_addr	= 0,
 	.end		= ULONG_MAX,
 };
 
@@ -335,6 +356,21 @@ static int ptdump_init(void)
 {
 	unsigned int i, j;
 
+	address_markers[FIXMAP_START_NR].start_address = FIXADDR_START;
+	address_markers[FIXMAP_END_NR].start_address = FIXADDR_TOP;
+	address_markers[PCI_IO_START_NR].start_address = PCI_IO_START;
+	address_markers[PCI_IO_END_NR].start_address = PCI_IO_END;
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	address_markers[VMEMMAP_START_NR].start_address = VMEMMAP_START;
+	address_markers[VMEMMAP_END_NR].start_address = VMEMMAP_END;
+#endif
+	address_markers[VMALLOC_START_NR].start_address = VMALLOC_START;
+	address_markers[VMALLOC_END_NR].start_address = VMALLOC_END;
+	address_markers[PAGE_OFFSET_NR].start_address = PAGE_OFFSET;
+	address_markers[KERNEL_MAPPING_NR].start_address = KERNEL_LINK_ADDR;
+
+	kernel_ptd_info.base_addr = KERN_VIRT_START;
+
 	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
 			pg_level[i].mask |= pte_bits[j].mask;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
