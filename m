Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AD6C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36BF72173C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bCcpQH9s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="iheGcVmB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36BF72173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tgh+QoIFO6N2dwwhK0zl7sWeBnZBacQQY9q7ChNTKi4=; b=bCcpQH9sWW87kYrHwJBgRWIbig
	EfI8fHWtiOZygBWEQRwzZZ7nCENdakvWQjx+3DhPXODWbsu9/p7AmYvjSVNX4b6LJ0gfw7hNj000e
	+gzM4SMLav1kWfjZyVw0Ky16mDIHnfHoZ9lvJRq/ZRfVUjyNM/MkFeykcTz0mLwLKWGXRrVy++NUX
	290pqvgQpSoQ4tpU+RXdTPw1M0cZAjPiPAWDBqWCdpI5GK45c1UqRD9BLUZzcB7EpZKYOT4cFAuNf
	eUfyNsPCPDLTEvNLmdMTG+8IfKC9DOLWCtSGR8+tb/1U5/hfSEwkkezPBFPmetsXZ7n4Lptzz8thI
	lJFkAhfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXUt-0005DX-3E; Mon, 07 Jan 2019 16:11:27 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXUp-0005Ap-Jk
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 16:11:25 +0000
Received: by mail-pg1-x541.google.com with SMTP id w6so335346pgl.6
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CSYWd6VeFZK8P72VO6QNWHyKLKv+RHglMAIawF/x8uk=;
 b=iheGcVmBnGNRZU3bCLq2c45+BKRGm2ge/n6wBqlJo88S5ApAC2vyibvQG/BZ+uKJau
 7MZECl+8mdL7EfUkhZbf+l061G3Rez+3xIM6q4a7uudhIiV2gMhB4LvYEkyBlymkxDz+
 YFWVJx07s/+MT1XD4yX0rsCwzOl3JWzGlr/v1WKkjCgzHjGesRZng/VUkSikdIJV5t1L
 r7zJe+AnWwNz7AJwd1KkkkW27OjnbolOm2tK2qj1GnFIZaqT2Ynm9MfvqErrXpKy5OHB
 gEHzX3r7Jaosj3Fd1BACYFHZtjUVb1QJeIadRAXDWZDY9WOyXSXiOtiwIJgmBN/2ou0i
 GvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CSYWd6VeFZK8P72VO6QNWHyKLKv+RHglMAIawF/x8uk=;
 b=BmGpvijG9zdq5whkLUBfMta8+AP3aB2sDLN315t0NdCkp/bnUb5as9D+cmE4duGr6p
 pmdYSesyMXkdFFMhP6RJtHkhYp8LtzVrGsjH/o8aByIkJEVWa2iL5IFqzfjp//S+hZbs
 QyCwgAXontBoNZiOptlDPit2xtNDl1M8jiN9ZY+wTGquq1SZxjLGYZoH23cIbKLpwOSO
 CVqElmabiRLwR9bumPGT+gylq9WMY4aqGWX3o1SpnTkRjtM0THfjaxM5sg3p08R3Us2m
 ccN81aiKN1vLpjJPMoluvcUJhPUEzS5wE/Im4N46KPPgwuynKjin822HgCdRmHKqDAlo
 dgUg==
X-Gm-Message-State: AJcUukdVwXvs8qxlmxWHO1A+xn64AMEKC5eaUBqK3Yxs5eOhsfKOvvzG
 M7vp0X/8oiT+ECC5o13SLrIsUw==
X-Google-Smtp-Source: ALg8bN6RTmQpLYFPorPual2M7RwPK9lJ3CXTe3NMKljh56xYmRBUArCfZKtTyXAkpSEOpSVRoHMrPg==
X-Received: by 2002:a63:cc4e:: with SMTP id q14mr11301316pgi.291.1546877482641; 
 Mon, 07 Jan 2019 08:11:22 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.214])
 by smtp.gmail.com with ESMTPSA id a10sm93243512pfi.138.2019.01.07.08.11.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 08:11:22 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 3/5] RISC-V: Move setup_bootmem() to mm/init.c
Date: Mon,  7 Jan 2019 21:40:45 +0530
Message-Id: <20190107161047.10516-4-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190107161047.10516-1-anup@brainfault.org>
References: <20190107161047.10516-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_081123_648276_9C038DE2 
X-CRM114-Status: GOOD (  16.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <anup.patel@wdc.com>

The setup_bootmem() mainly populates memblocks and does
early memory reservations. The right location for this
function is mm/init.c.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/setup.c        | 48 ++++----------------------------
 arch/riscv/mm/init.c             | 40 ++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 43 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 16301966d65b..35893810cba3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -404,6 +404,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define kern_addr_valid(addr)   (1) /* FIXME */
 #endif
 
+extern void setup_bootmem(void);
 extern void paging_init(void);
 
 static inline void pgtable_cache_init(void)
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f7132547b8b3..49a13b98e13f 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -156,49 +156,6 @@ void __init parse_dtb(unsigned int hartid, void *dtb)
 	early_init_dt_scan(__va(dtb));
 }
 
-static void __init setup_bootmem(void)
-{
-	struct memblock_region *reg;
-	phys_addr_t mem_size = 0;
-
-	/* Find the memory region containing the kernel */
-	for_each_memblock(memory, reg) {
-		phys_addr_t vmlinux_end = __pa(_end);
-		phys_addr_t end = reg->base + reg->size;
-
-		if (reg->base <= vmlinux_end && vmlinux_end <= end) {
-			/*
-			 * Reserve from the start of the region to the end of
-			 * the kernel
-			 */
-			memblock_reserve(reg->base, vmlinux_end - reg->base);
-			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
-		}
-	}
-	BUG_ON(mem_size == 0);
-
-	set_max_mapnr(PFN_DOWN(mem_size));
-	max_low_pfn = memblock_end_of_DRAM();
-
-#ifdef CONFIG_BLK_DEV_INITRD
-	setup_initrd();
-#endif /* CONFIG_BLK_DEV_INITRD */
-
-	early_init_fdt_reserve_self();
-	early_init_fdt_scan_reserved_mem();
-	memblock_allow_resize();
-	memblock_dump_all();
-
-	for_each_memblock(memory, reg) {
-		unsigned long start_pfn = memblock_region_memory_base_pfn(reg);
-		unsigned long end_pfn = memblock_region_memory_end_pfn(reg);
-
-		memblock_set_node(PFN_PHYS(start_pfn),
-		                  PFN_PHYS(end_pfn - start_pfn),
-		                  &memblock.memory, 0);
-	}
-}
-
 void __init setup_arch(char **cmdline_p)
 {
 	init_mm.start_code = (unsigned long) _stext;
@@ -211,6 +168,11 @@ void __init setup_arch(char **cmdline_p)
 	parse_early_param();
 
 	setup_bootmem();
+
+#ifdef CONFIG_BLK_DEV_INITRD
+	setup_initrd();
+#endif /* CONFIG_BLK_DEV_INITRD */
+
 	paging_init();
 	unflatten_device_tree();
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f354486f9b78..d0965979ee70 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -16,6 +16,7 @@
 #include <linux/memblock.h>
 #include <linux/swap.h>
 #include <linux/sizes.h>
+#include <linux/of_fdt.h>
 
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
@@ -62,3 +63,42 @@ void free_initmem(void)
 {
 	free_initmem_default(0);
 }
+
+void __init setup_bootmem(void)
+{
+	struct memblock_region *reg;
+	phys_addr_t mem_size = 0;
+
+	/* Find the memory region containing the kernel */
+	for_each_memblock(memory, reg) {
+		phys_addr_t vmlinux_end = __pa(_end);
+		phys_addr_t end = reg->base + reg->size;
+
+		if (reg->base <= vmlinux_end && vmlinux_end <= end) {
+			/*
+			 * Reserve from the start of the region to the end of
+			 * the kernel
+			 */
+			memblock_reserve(reg->base, vmlinux_end - reg->base);
+			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
+		}
+	}
+	BUG_ON(mem_size == 0);
+
+	set_max_mapnr(PFN_DOWN(mem_size));
+	max_low_pfn = memblock_end_of_DRAM();
+
+	early_init_fdt_reserve_self();
+	early_init_fdt_scan_reserved_mem();
+	memblock_allow_resize();
+	memblock_dump_all();
+
+	for_each_memblock(memory, reg) {
+		unsigned long start_pfn = memblock_region_memory_base_pfn(reg);
+		unsigned long end_pfn = memblock_region_memory_end_pfn(reg);
+
+		memblock_set_node(PFN_PHYS(start_pfn),
+				  PFN_PHYS(end_pfn - start_pfn),
+				  &memblock.memory, 0);
+	}
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
