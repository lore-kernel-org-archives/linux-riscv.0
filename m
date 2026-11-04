Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62275606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mwLBSS5v;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mEkANnpz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Unsubscribe-Post:List-Owner;
	bh=ScozrH22DZZ2n/5IQSF3GqqAZX82YLdANVQV97ZpsCQ=; b=mwLBSS5vgMIwlsqtZuSSGCNFyJ
	R81O+G8S0lUwPbKg0WqfBJw3eBfdBvn0YcXuyb7jAlLyrqMc4uOXwdBmYAwK+wQdqAtksgADdljF1
	705yrYqCLvNjZ5FKZ1YiGhjn2EGqZhmo3Ac68qHGxMKhS7d41MIgGcmtE3aFOLH4t2HgB+BqkoMmg
	0CKGDLm6IsbBb7JFqTYGmVjfOZtYprNdjQg246SBHcGowsSQk8RZGbUiwdfoE4Re6ZAnkjv4EBhK8
	6PtOBG643w+1g5VT+O81MjAYWkAEVee5YgoKIwZrDdqP631io0XDslJl2ljXSxJmvb/XAuPziG7QA
	p+YDymJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYVY-000000052N5-1lzw;
	Wed, 04 Nov 2026 10:46:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYVV-000000052MN-2ngQ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 10:46:19 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261104104615euoutp01ce974afa58f6fa4eae15d27226978c51~k0cBWTH5t2955329553euoutp01G
	for <linux-riscv@lists.infradead.org>; Wed,  4 Nov 2026 10:46:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261104104615euoutp01ce974afa58f6fa4eae15d27226978c51~k0cBWTH5t2955329553euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793789175;
	bh=8Ms//SCjMBtZLtOk9KuIQ01hGHzi7dKhO5yJDKE3fuI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=mEkANnpzRYT8fuIt1XolCJnjpE/FK7WNHqpQlhOxxsEj9z90WlqQUd5tV4R44dHDO
	 Cmqt7Sqk6nxqF7pkpQWUCRxq+DvMCNFOj2baJJBAunjWKywRSHrKn71/CwMxvURV78
	 qo70suTDNKKHtYWBbmfUzChU474qnM/FZTLimaqo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583~k0cBBCjGw2798527985eucas1p2O;
	Wed,  4 Nov 2026 10:46:15 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261104104614eusmtip1aebd75a70441e6179ea0b97d1d5e0155~k0cAXegGO2242822428eusmtip1e;
	Wed,  4 Nov 2026 10:46:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley
	<conor.dooley@microchip.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob
	Herring <robh@kernel.org>, Mike Rapoport <rppt@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] riscv: mm: reserve the DTB before scanning reserved memory
Date: Wed,  4 Nov 2026 11:46:03 +0100
Message-ID: <20261104104604.3370384-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMS-MailID: 20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583
X-Msg-Generator: CA
X-RootMTR: 20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583
X-EPHeader: CA
X-CMS-RootMailID: 20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583
References: <CGME20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_024617_972144_EB6601EA 
X-CRM114-Status: GOOD (  13.45  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

early_init_fdt_scan_reserved_mem() allocates memory from memblock while
it scans /reserved-memory: the reserved_mem array, and the regions that
are placed dynamically by size. On RISC-V the DTB was only reserved
after that scan, so memblock could hand out the memory the DTB occupies
while the DTB was still being parsed.

Reserve the DTB before the scan, so that memblock never allocates from
it.

Fixes: ef69d2559fe9 ("riscv: Move early dtb mapping into the fixmap region")
Closes: https://lore.kernel.org/all/b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com/
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/riscv/mm/init.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e822fce0af4b..bbc2d8cb4627 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -294,13 +294,6 @@ static void __init setup_bootmem(void)
 
 	reserve_initrd_mem();
 
-	/*
-	 * No allocation should be done before reserving the memory as defined
-	 * in the device tree, otherwise the allocation could end up in a
-	 * reserved region.
-	 */
-	early_init_fdt_scan_reserved_mem();
-
 	/*
 	 * If DTB is built in, no need to reserve its memblock.
 	 * Otherwise, do reserve it but avoid using
@@ -309,6 +302,13 @@ static void __init setup_bootmem(void)
 	 */
 	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
 		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
+
+	/*
+	 * No allocation should be done before reserving the memory as defined
+	 * in the device tree, otherwise the allocation could end up in a
+	 * reserved region.
+	 */
+	early_init_fdt_scan_reserved_mem();
 }
 
 #ifdef CONFIG_RELOCATABLE
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
