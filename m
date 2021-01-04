Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8346CC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:01:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E58E02085B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E58E02085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/95aECW9OgZhnHCRKFi1XA1HbYFG5IdCirGjTZHSqOI=; b=uzEgobG6m+9uihuofwIKaqopV
	V2Dppp44WjXeGnsohX5eIY1291SwerPXmgiGwNJAC/RKvAFK6US/DgzigXs4D696lbketpH9kXF08
	ph2AIH+UD4wa2RcinBmlTE8V1CpcRlGFAyMV6T+rlT8bh3qx0X2v5nd/fSYO8XjguU2bD1ZBMePxG
	hBSFwt1YyZyfpTD6zTHKkwSnVs4yFwQYdImNeJa7r83vvgvQ2BLW/to2LoabqsSfWiGA8mGZZh75S
	Kw0D7Rhhx7H8fu8y2qLKg6p4rqv3MPYHYrDBoBXGkxhe9ZFfKPdB1Wh4L3K3SAnSEuC1YFC4G9Be2
	BXc4sFM/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwW2N-0006dW-1H; Mon, 04 Jan 2021 20:01:07 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwW2J-0006ct-Qf
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 20:01:04 +0000
X-Originating-IP: 90.112.190.212
Received: from debian.home (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 977CF40003;
 Mon,  4 Jan 2021 20:00:59 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 02/12] riscv: Protect the kernel linear mapping
Date: Mon,  4 Jan 2021 14:58:30 -0500
Message-Id: <20210104195840.1593-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210104195840.1593-1-alex@ghiti.fr>
References: <20210104195840.1593-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_150104_060493_5F7A39B4 
X-CRM114-Status: GOOD (  17.15  )
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

The kernel is now mapped at the end of the address space and it should
be accessed through this mapping only: so map the whole kernel in the
linear mapping as read only.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/include/asm/page.h |  9 ++++++++-
 arch/riscv/mm/init.c          | 29 +++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 98188e315e8d..a93e35aaa717 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -102,8 +102,15 @@ extern unsigned long pfn_base;
 extern unsigned long max_low_pfn;
 extern unsigned long min_low_pfn;
 extern unsigned long kernel_virt_addr;
+extern uintptr_t load_pa, load_sz;
+
+#define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_pa_offset))
+#define kernel_mapping_pa_to_va(x)	\
+	((void *)((unsigned long) (x) + va_kernel_pa_offset))
+#define __pa_to_va_nodebug(x)				\
+	((x >= load_pa && x < load_pa + load_sz) ?	\
+		kernel_mapping_pa_to_va(x): linear_mapping_pa_to_va(x))
 
-#define __pa_to_va_nodebug(x)	((void *)((unsigned long) (x) + va_pa_offset))
 #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - va_pa_offset)
 #define kernel_mapping_va_to_pa(x)	\
 	((unsigned long)(x) - va_kernel_pa_offset)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9d06ff0e015a..7b87c14f1d24 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -159,8 +159,6 @@ void __init setup_bootmem(void)
 {
 	phys_addr_t mem_start = 0;
 	phys_addr_t start, end = 0;
-	phys_addr_t vmlinux_end = __pa_symbol(&_end);
-	phys_addr_t vmlinux_start = __pa_symbol(&_start);
 	u64 i;
 
 	/* Find the memory region containing the kernel */
@@ -168,7 +166,7 @@ void __init setup_bootmem(void)
 		phys_addr_t size = end - start;
 		if (!mem_start)
 			mem_start = start;
-		if (start <= vmlinux_start && vmlinux_end <= end)
+		if (start <= load_pa && (load_pa + load_sz) <= end)
 			BUG_ON(size == 0);
 	}
 
@@ -179,8 +177,13 @@ void __init setup_bootmem(void)
 	 */
 	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
 
-	/* Reserve from the start of the kernel to the end of the kernel */
-	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
+	/*
+	 * Reserve from the start of the kernel to the end of the kernel
+	 * and make sure we align the reservation on PMD_SIZE since we will
+	 * map the kernel in the linear mapping as read-only: we do not want
+	 * any allocation to happen between _end and the next pmd aligned page.
+	 */
+	memblock_reserve(load_pa, (load_sz + PMD_SIZE - 1) & ~(PMD_SIZE - 1));
 
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = max_pfn;
@@ -438,7 +441,9 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
 #endif
 
-static uintptr_t load_pa, load_sz;
+uintptr_t load_pa, load_sz;
+EXPORT_SYMBOL(load_pa);
+EXPORT_SYMBOL(load_sz);
 
 static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
 {
@@ -596,9 +601,17 @@ static void __init setup_vm_final(void)
 
 		map_size = best_map_size(start, end - start);
 		for (pa = start; pa < end; pa += map_size) {
-			va = (uintptr_t)__va(pa);
+			pgprot_t prot = PAGE_KERNEL;
+
+			/* Protect the kernel mapping that lies in the linear mapping */
+			if (pa >= __pa(_start) && pa < __pa(_end))
+				prot = PAGE_KERNEL_READ;
+
+			/* Make sure we get virtual addresses in the linear mapping */
+			va = (uintptr_t)linear_mapping_pa_to_va(pa);
+
 			create_pgd_mapping(swapper_pg_dir, va, pa,
-					   map_size, PAGE_KERNEL);
+					   map_size, prot);
 		}
 	}
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
