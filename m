Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF830C4363D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 21:52:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34EA02083B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 21:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ro8/2RR0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="UEV3JjLg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34EA02083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t0z1wwtMhbppoCCv+7t5KfeWal5ZKV7gKp9c6494MdU=; b=ro8/2RR02qHzs10ZD//DmbllOc
	M1BgJogfK1qou4ilCqy8MiX7I+gq8LYNiQptfZHzB5xQ2ZjcjPHDRuMhq4J2wAoeDkOzsH1Jdxzv3
	oRmO9uVXl67fwb61KuOp60AAZ31Y7ZTKoh8v0oE4SnET1f+9vXhL2SJKlxluxJx8bqmYSOgHC0PE/
	H3pkB0P+LV+tfMi1sv7vNzvhE909Sw8UbenB1odEzRYJz38GT0PQPNfHb4XoV+R7DYNS3r2iFbZLy
	fR/2CuWBg/jMCX/G3is6WT+wyUPcJf+ExsrBhtZ160GHjZlBcy0UMXFBvM6PjHAjAR89eUe2GCFQv
	O+LJQTOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQHM6-0001U3-DI; Wed, 07 Oct 2020 21:52:14 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQHM3-0001TG-TZ
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 21:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602107530; x=1633643530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/oniEhso/26JSasHkIO1CiOAfMMzjz+yrKndXGJYt70=;
 b=UEV3JjLg6Zj+rQrcQVji/WSPpCr9wvJ6YE4ahE4K9szdS5vakmS+nxfk
 4+XwGtBhyI9Q0MYo8R6jA8lOGd3dTwvqeZti7u4glejZlrL7U3k45na5e
 tMC8Mprnm3ak1qC60/sZ9H2aN2851r+o7aquOmg86d3GRpuja26EgvwdY
 TPP9x9wGUdSmW61XPTfcU1pI/7Z5OoK6pJnR45t6hrBc6irDfVWc/57l9
 t32pJr9Ql4LqjUel2V5W0N1n1UXhgaSMcilyYtHUH6Ylozp6MME0BA4Eq
 A+DxfvyNE6E3CU7pmXF9ERuJg1KdSBUrvrUZj6ovlgdF6ELcXtOKZHcAt Q==;
IronPort-SDR: ivSNkhkhytodgXeND00bDgTya6enReYjkY3Nm4calSL9+2zqXIeU5Xb2Si41GJbeLsU6DEXlbL
 03V6oRgimL+sftllvU6OLyE42FSceoYhCbcrFfLKKzu7e0w0ctaUmNLDA1wdYFjuUHJbnQROYj
 ysduKYXLE7P2zZyM0L+LIHFq8QKES7I3b0hntQ2qCoeZfgeDNOBUAKSp3w09QRz5lYNrxnHnZJ
 BW1ubNhD++jNQ6m0L9s/9wvlNuJRLp+aUz2C2Krbeo0RlaDqhihtwJHi8JGv2bUxPAn+90lU6m
 sW8=
X-IronPort-AV: E=Sophos;i="5.77,348,1596470400"; d="scan'208";a="259103325"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Oct 2020 05:52:07 +0800
IronPort-SDR: FDFyU/S8EGmbXUBXlMlhCuaTRL/uLHm7trY3QzBa6dfNs3CsUlIl7HdNi7ZhTTE+xw7SgqNNms
 hOEEkREkNQYg==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 14:37:59 -0700
IronPort-SDR: RTUD36E2uQ6HTNvp95Nc4RYgHy3IZEnDnWXYqosV2EdlYL1oeBgiWSZWnD3sUoTup3xtIfelVs
 rKc9ml7jxhVg==
WDCIronportException: Internal
Received: from b9f8262.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.253])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Oct 2020 14:52:09 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4] RISC-V: Remove any memblock representing unusable memory
 area
Date: Wed,  7 Oct 2020 14:51:59 -0700
Message-Id: <20201007215159.1287602-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_175212_168805_076AB8A4 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V limits the physical memory size by -PAGE_OFFSET. Any memory beyond
that size from DRAM start is unusable. Just remove any memblock pointing
to those memory region without worrying about computing the maximum size.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
---
Changes from v3->v4:
1. Rebased on top of for-next.
---
 arch/riscv/mm/init.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4eda1a7e8521..da43c17544c5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -156,9 +156,8 @@ static void __init setup_initrd(void)
 
 void __init setup_bootmem(void)
 {
-	phys_addr_t mem_size = 0;
-	phys_addr_t total_mem = 0;
-	phys_addr_t mem_start, start, end = 0;
+	phys_addr_t mem_start = 0;
+	phys_addr_t start, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
 	u64 i;
@@ -166,21 +165,18 @@ void __init setup_bootmem(void)
 	/* Find the memory region containing the kernel */
 	for_each_mem_range(i, &start, &end) {
 		phys_addr_t size = end - start;
-		if (!total_mem)
+		if (!mem_start)
 			mem_start = start;
 		if (start <= vmlinux_start && vmlinux_end <= end)
 			BUG_ON(size == 0);
-		total_mem = total_mem + size;
 	}
 
 	/*
-	 * Remove memblock from the end of usable area to the
-	 * end of region
+	 * The maximal physical memory size is -PAGE_OFFSET.
+	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
+	 * as it is unusable by kernel.
 	 */
-	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
-	if (mem_start + mem_size < end)
-		memblock_remove(mem_start + mem_size,
-				end - mem_start - mem_size);
+	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
