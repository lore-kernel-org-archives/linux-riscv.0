Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8C0C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A75E2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YJeMa9RB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="K1q9rjXH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A75E2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jRjsx89mtr7wUeIcz/gnDiB+bB5QPl4NbO590BCpxug=; b=YJeMa9RBVajLQi2MwSdGxgUQec
	ma7sigVDgdfEFUHE5MuirwkYydkquU5iIOicMZExCOWEq6c4efiFy+uno6z7PfkLg7irPsFR+eVmn
	+q6aZnYWkSw4scBh/xcVHbbQ8+SJMPBbqnRBlbnmt/3elVGQwEQzTSl+w6sbl7PtJKxTJrzk3hebp
	GK/HpGlnyaETwCUXSAx2jOK03A8EeftLZJs9edsxEwASHFC797pcaSjktCobuu7ZuxgazXPMoDkq1
	KdGL8Td905WxYHX5uoEyfqZkr6AVkx5ebDVBgalkmjfV292KdsjQxUhhs5BlY+v4Bcw0NDyJfMVMB
	YtCLrK5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXUy-0005IJ-Ak; Mon, 07 Jan 2019 16:11:32 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXUt-0005E6-Rk
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 16:11:29 +0000
Received: by mail-pl1-x642.google.com with SMTP id e5so357216plb.5
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 08:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t2eEqpoIDFvDG2gAO/fqfzYdvBoxxIkAd2CWhpFMFaE=;
 b=K1q9rjXHYg/XE/gYjtrKRPXFj2vv+NgpkDNWFCPt0FYOROE3IN/vc/V38JtDYXDryO
 wUZuCo7mRDTty67q70n29YIzOsbnZgN1Jmfxh5DtiXFGTBakfxzPFk55n5RZ15K29ZNd
 x/VlMl4MvFbnilVcC7enJyqpEcMhwlIZfUVqVB+YZ6V6oeX/dgDpip15PFYSBJSWI3rY
 v+9goMMgNuwpiDiLP8g4Hl8jioFVAZc84j5P8CcWM4dhvOw5QzDbFghNjqnL4Bb2oFEM
 79GR4MytTX4Ce6nWixQ+cXmQn3OalLIgx/ix0ov2x8lj5MHjqiSgMVXlKmjY4qoI8pyL
 rDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t2eEqpoIDFvDG2gAO/fqfzYdvBoxxIkAd2CWhpFMFaE=;
 b=TlFjPRyzGnUIaE3wxLFpRq7Kf5TTFpVtHHPmrreikr2x+hoDS8jX+V10gH11Haug9y
 KZlj+hUSud4g0s4kvwoxLW5i+xvT+8Zhnya/aGzqK6HXIYavbdy1Mx/kN1CarK71pwKj
 R/tHVsX8E0SYIJ8o5C6Ni0nGKH3trYjQywkW02qsb6JmEBaF5+Z0SaLqtq74PS2r86KM
 arerkIA4XjslUa64TzMUeKpXK9hYFYAlkiA6gFJUV6jVwIFc4FAoA1q12fjBZo5+ixsr
 G+xPeR0bZG7C5kXDuoTkQpuunLl76gsF9kkST0Qp6qU+pzdFnlRIlcuFCV+CqaEEmXy0
 U3Bw==
X-Gm-Message-State: AJcUukcMcFCh8JqMClABqJ5vti/g63SSbwNjcllaTlgkG4DyGtIFmED3
 JbdgGBqzXirr1nzf2HaTn9y696gbvis=
X-Google-Smtp-Source: ALg8bN4rv79GPRCMZZRRUYzTPZUTJRiPCBKRvB+SoPWGOw9W/9hS/LCTjOsk5w2dK8fNTCDnM6Wk7Q==
X-Received: by 2002:a17:902:b093:: with SMTP id
 p19mr61640077plr.135.1546877487094; 
 Mon, 07 Jan 2019 08:11:27 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.214])
 by smtp.gmail.com with ESMTPSA id a10sm93243512pfi.138.2019.01.07.08.11.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 08:11:26 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 4/5] RISC-V: Move setup_vm() to mm/init.c
Date: Mon,  7 Jan 2019 21:40:46 +0530
Message-Id: <20190107161047.10516-5-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190107161047.10516-1-anup@brainfault.org>
References: <20190107161047.10516-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_081128_050821_6AC3A735 
X-CRM114-Status: GOOD (  13.07  )
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

The setup_vm() is responsible for setting up initial
page table hence should be placed in mm/init.c.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kernel/setup.c | 49 --------------------------------------
 arch/riscv/mm/init.c      | 50 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 49 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 49a13b98e13f..e9c7f1a6db5a 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -102,55 +102,6 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
 
-pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
-pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
-
-#ifndef __PAGETABLE_PMD_FOLDED
-#define NUM_SWAPPER_PMDS ((uintptr_t)-PAGE_OFFSET >> PGDIR_SHIFT)
-pmd_t swapper_pmd[PTRS_PER_PMD*((-PAGE_OFFSET)/PGDIR_SIZE)] __page_aligned_bss;
-pmd_t trampoline_pmd[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
-#endif
-
-asmlinkage void __init setup_vm(void)
-{
-	extern char _start;
-	uintptr_t i;
-	uintptr_t pa = (uintptr_t) &_start;
-	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
-
-	va_pa_offset = PAGE_OFFSET - pa;
-	pfn_base = PFN_DOWN(pa);
-
-	/* Sanity check alignment and size */
-	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
-	BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
-
-#ifndef __PAGETABLE_PMD_FOLDED
-	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
-			__pgprot(_PAGE_TABLE));
-	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
-
-	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
-		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
-		swapper_pg_dir[o] =
-			pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
-				__pgprot(_PAGE_TABLE));
-	}
-	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
-		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
-#else
-	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN(pa), prot);
-
-	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
-		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
-		swapper_pg_dir[o] =
-			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
-	}
-#endif
-}
-
 void __init parse_dtb(unsigned int hartid, void *dtb)
 {
 	early_init_dt_scan(__va(dtb));
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d0965979ee70..b487f76d6060 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -102,3 +102,53 @@ void __init setup_bootmem(void)
 				  &memblock.memory, 0);
 	}
 }
+
+pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
+pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
+
+#ifndef __PAGETABLE_PMD_FOLDED
+#define NUM_SWAPPER_PMDS ((uintptr_t)-PAGE_OFFSET >> PGDIR_SHIFT)
+pmd_t swapper_pmd[PTRS_PER_PMD*((-PAGE_OFFSET)/PGDIR_SIZE)] __page_aligned_bss;
+pmd_t trampoline_pmd[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
+#endif
+
+asmlinkage void __init setup_vm(void)
+{
+	extern char _start;
+	size_t o;
+	uintptr_t i;
+	uintptr_t pa = (uintptr_t) &_start;
+	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
+
+	va_pa_offset = PAGE_OFFSET - pa;
+	pfn_base = PFN_DOWN(pa);
+
+	/* Sanity check alignment and size */
+	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
+	BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
+
+#ifndef __PAGETABLE_PMD_FOLDED
+	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
+			__pgprot(_PAGE_TABLE));
+	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
+
+	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
+		o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+		swapper_pg_dir[o] =
+			pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
+				__pgprot(_PAGE_TABLE));
+	}
+	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
+		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
+#else
+	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN(pa), prot);
+
+	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
+		o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+		swapper_pg_dir[o] =
+			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
+	}
+#endif
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
