Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CFCC43464
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 23:41:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2471420665
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 23:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dwFyDYLa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cFPcOKx9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2471420665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nB19WuXEHKUo6SDyHaLQj/sogrhE7BBCyg5F1eTtvZo=; b=dwFyDYLammjjoRfOHey8k3wUHo
	d2YWMsaBWhMunO+A3Hmh+PvJ7a6slkYqTqH/KXaORYfBOGV7dj5ih4OLFkHzOuaECI0/eCZxws9Vw
	jscSySrQRfq9VaYKXDTDcIQccKKkXUyVvWmWjKT2oDKxFOC4/WV0sT12DmmLz+zHDfJU6pqb1QVRd
	A0STNYoZM6DrWwW5uAmydfg2iMxiTyGATiw1PpQjOhMwd+ovaOJ4Gny1AQLfsvPubUVi0kTgY/0zp
	2ldJYywSsAjn7N8ju6wpLpxj+RNmIi5mPto6IKTXzCCMLkl/yOjsTlQzaiyUkztwaB/Rcp2Wav1n7
	zLfiXGDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ3Wh-0001wp-KH; Thu, 17 Sep 2020 23:41:19 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ3We-0001wK-7P
 for linux-riscv@lists.infradead.org; Thu, 17 Sep 2020 23:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600386077; x=1631922077;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NBBooLWx4dX/xQPDDaQE8cweQZvaQZMOQrLJFZ3y+F8=;
 b=cFPcOKx9qIOx+HQZ0hZN/Q+PWdCp25llehNKbdJPtCHDkKovwyNWwLNa
 IGd4483XD4EVDp26qNFSULjBlfqgiITszX8e3+KVilKIQiOIkwc0DsyH5
 Gjw52st7VU2bUAt3yOMD7oNcw/WjZjs31xtWCBXpsOCBf9PfrJKJ77q5i
 ICW2xkE8eNoxEpDQ8BcR/G4MBAuV5Tx4OIORxLKMXcAbLFjUI+amqVrTD
 OSqZICW0fsICtUdNOUI1yuFCfpceGhy+0th+ZvRLM0sz8ZQ5Ohf+dGtJZ
 YUcFRVPUBbxNzRU9cffAKhZ5v5aXYpwJkl1h3tVqdrExrt+XireZv5NPZ w==;
IronPort-SDR: i51YejxHvVUtKDgpgWUCe4fJiYQwCw+7ONCQEKCDQ9uIc+hFUzENu8YiHsZmTqFxxmN8s9W07t
 SQYxsXnHbJmjmWmdgcSv42/hJrpjL9nQ41pNamyNP0YKGuzaS4lFJztoNWSXjOB58dib3q54yG
 bx6fHzL0ejp2UdTvQ+LKqzk1V8I9wL9OQT7bMEzZwSs+m9muIOF/A9JTfAk0upEOE6fNQ6s7ql
 ceOoOrTJUCGwnFGylj6nhkx9clYPdA+A/TV1iDyAIAI32/30xhdQfPykafp9bY7GvvpShbejxs
 ZtA=
X-IronPort-AV: E=Sophos;i="5.77,272,1596470400"; d="scan'208";a="152041698"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2020 07:41:13 +0800
IronPort-SDR: F6JGwQoFqmalbid7aM8wHI1FX8BH+vZ59NPBJYGkM9AHmCBrkj1L93Oq92AiOAmAH8lVVPHLH3
 /xxVj82kJQ4Q==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 16:28:20 -0700
IronPort-SDR: AqIqh7onWLPTwrZYu9YWnVbKUodp27nHtfmGPfYmcgIhjqU7JYKDqG8BcMfwhGPkzpN2rbC4Nq
 EDgcRgO12Pgw==
WDCIronportException: Internal
Received: from use204338.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.39])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Sep 2020 16:41:11 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: Remove any memblock representing unusable memory
 area
Date: Thu, 17 Sep 2020 16:40:55 -0700
Message-Id: <20200917234055.2321977-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_194116_487037_9577B237 
X-CRM114-Status: GOOD (  14.68  )
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
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V limits the physical memory size by -PAGE_OFFSET. Any memory beyond
that size from DRAM start is unusable. Just remove any memblock pointing
to those memory region without worrying about computing the maximum size.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
Changes from v1->v2:
Used memblock_enforce_memory_limit instead of memblock_remove without
computing the maximum memory size.
---
 arch/riscv/mm/init.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 787c75f751a5..ed6e83871112 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -146,8 +146,6 @@ static phys_addr_t dtb_early_pa __initdata;
 void __init setup_bootmem(void)
 {
 	struct memblock_region *reg;
-	phys_addr_t mem_size = 0;
-	phys_addr_t total_mem = 0;
 	phys_addr_t mem_start, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
@@ -155,21 +153,18 @@ void __init setup_bootmem(void)
 	/* Find the memory region containing the kernel */
 	for_each_memblock(memory, reg) {
 		end = reg->base + reg->size;
-		if (!total_mem)
+		if (!mem_start)
 			mem_start = reg->base;
 		if (reg->base <= vmlinux_start && vmlinux_end <= end)
 			BUG_ON(reg->size == 0);
-		total_mem = total_mem + reg->size;
 	}
 
 	/*
-	 * Remove memblock from the end of usable area to the
-	 * end of region
+	 * The maximum physical memory supported is -PAGE_OFFSET.
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
