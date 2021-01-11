Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348CDC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8BC22D08
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8BC22D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ycmZBkuqJypR4s8T0u0eQC6/xr0pFhIpmOUuX2SfU/Y=; b=FFvcfgoNSX0W+Z/LVo5SUZiKx
	PPO4k+/oMuLCDQHMODVdhPTqJFGgNP0Sz4O5wQilxYQvhM/rW5rwh7jgXQ5cbPv5ZcslgOsC4hEkC
	RGvxWw8xCdnx2PDcd9WFd+kBr/T/gdSdxefzxsH6RYhYFXANaoa1HnLw84TvEVmhsiZXLIdnc/Tat
	VkCgLbNGEmxZxg1k/YFtfbQOwWWVPcRrHilYopz2NJMlMsFxHhDChZbntKfXV23fNVBx43rBkxe9d
	cLNlwrY1wU9y1Pd707M45U5gsPbnpbTqoZ1rqztreI8kQIxzpe3+kWZ/2QLQhv3YQvpny5GdHVpTz
	/jQeHldlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6sN-0002N2-PH; Mon, 11 Jan 2021 23:45:31 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6sH-0002IU-KN
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 23:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610408725; x=1641944725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oZ32JyRr/0hov1ExpFgrBbBCQ8Msd+e4ScJeLBVGhAo=;
 b=bWLhagMdZ6z3gdV/oW0snC5NJTTfxdjvbDcUMsJATUaIa6G7Ry6Qmr2S
 1JNNQfiHMXVfHcgy4DAFIQmtjyzYXWRm9o+ugKJS8Mb57pGDTMqlqJJPc
 CKg/khOfV3s3TQH9OAggut7OlftSaDtioHfCZf+Ogw6caexWFBALRx9s2
 a260XDX65lPVnmOqR91eWpc9U7SShYeDrLyGUnTs3EmJDDEXPee2LEDQk
 FfFYy77JzILqflhIJOCy4PKp+z7hYBqL39T5EfTlrE7tFUlzcxamZoy/2
 WJw1zBjZJEC65c+UlmEzdDU0w8ONURLglmMuOHI4m0MF3bZEli2Lttk5j Q==;
IronPort-SDR: K0huab3E6cxbo2aB5jMNaF2YHjIqWTWywICU4+aejYyf/7rZkFjw2eY3NqfkpDR2S8Fwo687AN
 uGdayMIvIX+dnLlywefu3xQkmeV0rX6ZM1UYBbGVTImOMNUcJAp1J22SFBipx0XO0Ltq2r6+/7
 dRic0fYpK6NTaM9+KfCsQS0OQQ1Ngvg8zaHyRvfNt7OscOYUBBULOBDStdBF3sYtaX4c3U0CSX
 iOe+vlTY4FC4tab9eExP7wlOdjY5Jrt137ORrH0K3FNi1bu4vkz2uOsHtVaeNyXAxHTnDIpRGa
 Duc=
X-IronPort-AV: E=Sophos;i="5.79,339,1602518400"; d="scan'208";a="161629286"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 07:45:20 +0800
IronPort-SDR: NH7GM9D+ZJAn9hPasKtHn4D/11hsaCF1xh47fQFJutwB60Akr8nNvEyXLAdHWc3BNZ5wctLZRN
 QDzzr/5F9oHlfXStOCpTcu/pnZkx468WYsUkJPRoRzyIrajaslFNXBz62yYnH4gcWF91LUNB3s
 9qipYGFfYyqFnepwqxObhGxFH0m3raraqYk4KCH2N7rbZMEiLhbsjA1Gnl9zt+YBglEXxFsBZU
 QhT5wJlXjVGrBqMp5eitjgBkE5vZcvl465j1p36Dg3HLC/k0NRxXG5FeMYIvr/4NecRGjNxUL2
 0TQc0+pLYIXtDxY3w455+mlk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 15:30:06 -0800
IronPort-SDR: JGAiHmoKynGPRy8l4SeqkvGkhiqKA9dy8OgqjlzdySKCZqlN+fM35WStMKIu/dQcHvAYEBREKx
 vrrLSQEwSqCV1oG1Ga+TJiuHFmBK8gv2uCTC4MRL4c7R6PjsJGRhDosYmDStYKfzH0oiSXV1Dw
 3DrShXs2GtwtlCOBk/fC6zHdqnPtXapj4pdfCaIDHSITwRLVHnhDja3zu8QLqYzcnCXSk+evex
 qNi5d4QynM9trXGsrADNHKZyJWUiTpOb0AxYLTJw6ee3OYgzmMLF5ap0TfphnjpN82/9l1VpA2
 trY=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.194])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Jan 2021 15:45:20 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] RISC-V: Do not allocate memblock while iterating
 reserved memblocks
Date: Mon, 11 Jan 2021 15:45:01 -0800
Message-Id: <20210111234504.3782179-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111234504.3782179-1-atish.patra@wdc.com>
References: <20210111234504.3782179-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_184525_825682_45C26A2D 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, resource tree allocates memory blocks while iterating on the
list. It leads to following kernel warning because memblock allocation
also invokes memory block reservation API.

[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at kernel/resource.c:795
__insert_resource+0x8e/0xd0
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
5.10.0-00022-ge20097fb37e2-dirty #549
[    0.000000] epc: c00125c2 ra : c001262c sp : c1c01f50
[    0.000000]  gp : c1d456e0 tp : c1c0a980 t0 : ffffcf20
[    0.000000]  t1 : 00000000 t2 : 00000000 s0 : c1c01f60
[    0.000000]  s1 : ffffcf00 a0 : ffffff00 a1 : c1c0c0c4
[    0.000000]  a2 : 80c12b15 a3 : 80402000 a4 : 80402000
[    0.000000]  a5 : c1c0c0c4 a6 : 80c12b15 a7 : f5faf600
[    0.000000]  s2 : c1c0c0c4 s3 : c1c0e000 s4 : c1009a80
[    0.000000]  s5 : c1c0c000 s6 : c1d48000 s7 : c1613b4c
[    0.000000]  s8 : 00000fff s9 : 80000200 s10: c1613b40
[    0.000000]  s11: 00000000 t3 : c1d4a000 t4 : ffffffff

This is also unnecessary as we can pre-compute the total memblocks required
for each memory region and allocate it before the loop. It save precious
boot time not going through memblock allocation code every time.

Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/setup.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 1d85e9bf783c..3fa3f26dde85 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -127,7 +127,9 @@ static void __init init_resources(void)
 {
 	struct memblock_region *region = NULL;
 	struct resource *res = NULL;
-	int ret = 0;
+	struct resource *mem_res = NULL;
+	size_t mem_res_sz = 0;
+	int ret = 0, i = 0;
 
 	code_res.start = __pa_symbol(_text);
 	code_res.end = __pa_symbol(_etext) - 1;
@@ -145,16 +147,17 @@ static void __init init_resources(void)
 	bss_res.end = __pa_symbol(__bss_stop) - 1;
 	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
+	mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt) * sizeof(*mem_res);
+	mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
+	if (!mem_res)
+		panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);
 	/*
 	 * Start by adding the reserved regions, if they overlap
 	 * with /memory regions, insert_resource later on will take
 	 * care of it.
 	 */
 	for_each_reserved_mem_region(region) {
-		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      sizeof(struct resource));
+		res = &mem_res[i++];
 
 		res->name = "Reserved";
 		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
@@ -171,8 +174,10 @@ static void __init init_resources(void)
 		 * Ignore any other reserved regions within
 		 * system memory.
 		 */
-		if (memblock_is_memory(res->start))
+		if (memblock_is_memory(res->start)) {
+			memblock_free((phys_addr_t) res, sizeof(struct resource));
 			continue;
+		}
 
 		ret = add_resource(&iomem_resource, res);
 		if (ret < 0)
@@ -181,10 +186,7 @@ static void __init init_resources(void)
 
 	/* Add /memory regions to the resource tree */
 	for_each_mem_region(region) {
-		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      sizeof(struct resource));
+		res = &mem_res[i++];
 
 		if (unlikely(memblock_is_nomap(region))) {
 			res->name = "Reserved";
@@ -205,9 +207,9 @@ static void __init init_resources(void)
 	return;
 
  error:
-	memblock_free((phys_addr_t) res, sizeof(struct resource));
 	/* Better an empty resource tree than an inconsistent one */
 	release_child_resources(&iomem_resource);
+	memblock_free((phys_addr_t) mem_res, mem_res_sz);
 }
 
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
