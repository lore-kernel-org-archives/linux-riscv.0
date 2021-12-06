Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4512FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIL9lEq6a4qf9k8uyA9eiFrcWL6IXa6VsxDcgqFnFeA=; b=xwZIvo3oN/0ANa
	n+RAGbsEKKsgO5U9o6JvWpEKye0FjNm1IY+z6aQl075m6NHMa8wUDv+yrLfiLOOoX+643MC3FGDbi
	OPFMzhGJVSWixJFpKnsS/ihMG+GmQJEpKkKVhxUnkolD2vAA4iHE0qZwYj9ezWhZIe21CxN0D6Pl+
	fVSeU7xi5ovblXgAWGUCeUOOtMEZiawDn0w/Z9nP5ij2VeQBVswtVNKF/NH602qrghJJXSU/G9A5r
	jlVh9fgXK1n1baoUrU/8SUjorVRQk/n9c51f2vcyed5p8USjYGaBjKODz0tSqH+hX7PLjzZXvoM5c
	BoeJTxqaQtKhLXJzOXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFeu-004QA1-TA; Mon, 06 Dec 2021 15:12:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFeA-004Pq5-Bm
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 15:11:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 068E3B81018;
 Mon,  6 Dec 2021 15:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BE1C341C2;
 Mon,  6 Dec 2021 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638803475;
 bh=YYjWVRV3U9MP8993oG6RsEXcX9rrLfWp3/tBMtaj+kw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kIPOtVJ0TSZca6iqQIoXetm9b3tQgBOJ5YUXwqPlmAPyNrZT7HEZwm9bl0I3smvuI
 FqdymKoWkb5iTU9ivhoCw+iwYMewOQd52G+Md5X9QZA37EmKoGFVTUPLhMY1aiM8d0
 QbNbX8nWAz9dq+rUNmp5Odsocjgc3dOFLvIQxh43coEiSV7kB3gdHAtp8H6/wqsAZ5
 1J7tgKWUs6t0HmBcmCiCCTurvZdu+2CvfTyUtH5m9kH831G2wT8YcFGzXF6XfO+lzb
 rxfUlBVC/+aBLf4vObDPFSIghnXYN78GJwZA/KMrcMqPZBY2ntihl7O3fzLc9+Rktk
 zLTIhH/2mynaw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] riscv: mm: init: try IS_ENABLED(CONFIG_XIP_KERNEL)
 instead of #ifdef
Date: Mon,  6 Dec 2021 23:03:52 +0800
Message-Id: <20211206150353.731-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206150353.731-1-jszhang@kernel.org>
References: <20211206150353.731-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_071118_581891_9ECDB7A2 
X-CRM114-Status: GOOD (  11.92  )
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

Try our best to replace the conditional compilation using
"#ifdef CONFIG_XIP_KERNEL" with "IS_ENABLED(CONFIG_XIP_KERNEL)", to
simplify the code and to increase compile coverage.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9c5816971f40..5e979fe06054 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -161,13 +161,13 @@ early_param("mem", early_mem);
 static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
-	phys_addr_t vmlinux_start = __pa_symbol(&_start);
 	phys_addr_t max_mapped_addr;
-	phys_addr_t phys_ram_end;
+	phys_addr_t phys_ram_end, vmlinux_start;
 
-#ifdef CONFIG_XIP_KERNEL
-	vmlinux_start = __pa_symbol(&_sdata);
-#endif
+	if (IS_ENABLED(CONFIG_XIP_KERNEL))
+		vmlinux_start = __pa_symbol(&_sdata);
+	else
+		vmlinux_start = __pa_symbol(&_start);
 
 	memblock_enforce_memory_limit(memory_limit);
 
@@ -183,11 +183,9 @@ static void __init setup_bootmem(void)
 	 */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-
 	phys_ram_end = memblock_end_of_DRAM();
-#ifndef CONFIG_XIP_KERNEL
-	phys_ram_base = memblock_start_of_DRAM();
-#endif
+	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
+		phys_ram_base = memblock_start_of_DRAM();
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
