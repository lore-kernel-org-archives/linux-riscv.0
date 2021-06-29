Return-Path: <SRS0=OKTc=LX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B627AC11F66
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 09:16:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DEE61DE1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 09:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DEE61DE1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnMT19wlQ+79+yANBPXGmhsh9N9YhzDYYlrCIXk1c1c=; b=2GWlXvHDqN+W/m
	EcX0urJys0U0aC6fUdaXomKN6ilyyDhL4QiGoz9LhkCXqqVYQ9BPzR3MSmfptFxAbi4cUXcQ1xQTR
	1r0OvlGMQIb2t8o4tTc9QcTHnMRY/bdIGvkmMcMk+c03iuodpStWH3rJDoP+Qj6tEAM8yrF3gPqvw
	YErsXLqkB0YDP1KgmMo9Rlagt3F7ceOgsHwR2owKQtQ4AlVEVZ5O946V4+gJbuZSQFBiJXBKxyxNG
	Rm7kY5MZX8vTFFeuuSFVD/eSTM9sg6cixElhDxVTCrYDPmkPYnP1EPNZlFTZRNVCa3QszF8FUcIuz
	J4PVDeMSa+q7q9Xaxu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly9ql-00ALg6-Vx; Tue, 29 Jun 2021 09:16:12 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly9qj-00ALev-PK
 for linux-riscv@lists.infradead.org; Tue, 29 Jun 2021 09:16:11 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 76C7E200012;
 Tue, 29 Jun 2021 09:16:02 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 3/3] riscv: Make sure the kernel mapping does not overlap with
 IS_ERR_VALUE
Date: Tue, 29 Jun 2021 11:13:48 +0200
Message-Id: <20210629091349.3802690-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210629091349.3802690-1-alex@ghiti.fr>
References: <20210629091349.3802690-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_021609_998409_BF6EED56 
X-CRM114-Status: GOOD (  14.29  )
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

The check that is done in setup_bootmem currently only works for 32-bit
kernel since the kernel mapping has been moved outside of the linear
mapping for 64-bit kernel. So make sure that for 64-bit kernel, the kernel
mapping does not overlap with the last 4K of the addressable memory.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a1a0c4afa80f..a90c41bc9485 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -156,7 +156,7 @@ static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
-	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
+	phys_addr_t __maybe_unused max_mapped_addr;
 	phys_addr_t dram_end;
 
 #ifdef CONFIG_XIP_KERNEL
@@ -179,14 +179,20 @@ static void __init setup_bootmem(void)
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
 	dram_end = memblock_end_of_DRAM();
+#ifndef CONFIG_64BIT
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
 	 * macro. Make sure that last 4k bytes are not usable by memblock
-	 * if end of dram is equal to maximum addressable memory.
+	 * if end of dram is equal to maximum addressable memory. For 64-bit
+	 * kernel, this problem can't happen here as the end of the virtual
+	 * address space is occupied by the kernel mapping then this check must
+	 * be done in create_kernel_page_table.
 	 */
+	max_mapped_addr = __pa(~(ulong)0);
 	if (max_mapped_addr == (dram_end - 1))
 		memblock_set_current_limit(max_mapped_addr - 4096);
+#endif
 
 	min_low_pfn = PFN_UP(memblock_start_of_DRAM());
 	max_low_pfn = max_pfn = PFN_DOWN(dram_end);
@@ -556,6 +562,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
 	uintptr_t va, end_va;
 
 	end_va = kernel_virt_addr + load_sz;
+
 	for (va = kernel_virt_addr; va < end_va; va += map_size)
 		create_pgd_mapping(pgdir, va,
 				   load_pa + (va - kernel_virt_addr),
@@ -602,6 +609,13 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	/* Sanity check alignment and size */
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
 	BUG_ON((load_pa % map_size) != 0);
+#ifdef CONFIG_64BIT
+	/*
+	 * The last 4K bytes of the addressable memory can not be mapped because
+	 * of IS_ERR_VALUE macro.
+	 */
+	BUG_ON((kernel_virt_addr + load_sz) > ADDRESS_SPACE_END - SZ_4K);
+#endif
 
 	pt_ops.alloc_pte = alloc_pte_early;
 	pt_ops.get_pte_virt = get_pte_virt_early;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
