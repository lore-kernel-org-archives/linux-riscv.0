Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A487C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBQ/1CdRFZZ424+cAPZSQiG7exHDhVd3c/WUYKmMK3Y=; b=WKoN75R3/HHgyx
	hS5otQ4x7mTwu4Pb5znQo/pYTbEVHDiDD5NEHm8Mii16aI+ZH6DRiZQw2lTCrC4dEQneAIZA0zu0Z
	9udRyWq6g4HErA4AOx4XKmRQMHyA+rZivvO8w+YwJk2MebErN2CM+rRvXjeoTX8Kjjsyy3QkdPx0E
	vhrzAllkGT00Mw2D9lHRlyxJi/jcl+onNx6l3EUhfhOhtTLXA05mcV63MShLER2wNbtpqeyKS2d7C
	g/wbt9fgX1WNzQ/bOk2zavMdEbkzQgXylx7FirwMKT4UPgn3tQeoAwxEfV1/Q2dq6Am711GjSVQ48
	6oAr4yeOepu77J1LMIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0qK-00EKcZ-Ti; Fri, 03 Dec 2021 05:10:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0qE-00EKY3-Or
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 05:10:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44A206295C;
 Fri,  3 Dec 2021 05:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78123C53FCE;
 Fri,  3 Dec 2021 05:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508238;
 bh=B/zsYpq5+A4GvqC7QPKWBXDoi6KpkUlp/0uSJZbfvns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WD6Qtv0Sh02axx6BSHidc9fhCdMLUOK4Lec+xUPnxJ7D3vjMjl2Ryx+w3uazem6OL
 6gB+d1URWrUBOBChJJdRbgDne9TOQMftsvmYyedqO6lv7WC6SxsB222hc2dk3W1Jv0
 ZZE74zGZnewmIwTeAoqSLV3E43RRcevXkl93u/RK+VMj6O/e+A3Eu81HjL9/CaKVzo
 WRMBRO3yUp21rVVbpsgDea1jGM90d0lopTSi0CHHmzgHcJQlwFAE5jPqoZ6FvVzPOU
 fjxQ2Eyvq0VMZPj53GsOi43Q89K+VXG7rCc4WHQRX52O7cqozUyfFZ168oCojUr/G1
 eRveUrGvgdt9Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] riscv: mm: init: try IS_ENABLED(CONFIG_XIP_KERNEL)
 instead of #ifdef
Date: Fri,  3 Dec 2021 13:03:16 +0800
Message-Id: <20211203050317.2102-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203050317.2102-1-jszhang@kernel.org>
References: <20211203050317.2102-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211038_881494_B2AC9DD3 
X-CRM114-Status: GOOD (  12.55  )
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
---
 arch/riscv/mm/init.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4d4fcd7ef1a9..4a9e3f429042 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -161,13 +161,13 @@ early_param("mem", early_mem);
 static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
-	phys_addr_t vmlinux_start = __pa_symbol(&_start);
 	phys_addr_t __maybe_unused max_mapped_addr;
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
