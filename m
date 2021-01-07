Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A327C433E6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4712312E
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4712312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ygn2Li3VSxHx0EFNvRpWVefQ7SK/6ZJA2po6OARn5QM=; b=yHVOPVFkBC8zb4SXeTEPJjUwX
	8smh2VW+bvMoedNSFurDLmRAg05LT8+AMVFY7lo1ZsOeFL6fTZwYKVtLfgnkaMmKyjarqt/geLwpc
	wkp2ufxdPA2SbiYGkmPCIuwNWz7zf13xMgI9cQnQGPbMcxh42JBG63sV2117bT7TmzAfOxUGNq6DR
	HXy5XumUaomLNMEJU8OuwFJJVK0mUa0P31BxPnOT8FW/SGCHtSkwdnNKVcQDioStQjEnto8QT1iz4
	de6CDJuq6Oer0flH7L9/U/G/TDTEJXCs/YbKQQeuDVsHeUjgx1za0EZ3Cwe2BGJyQpOOEepWa8aje
	v1qgahd9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRZx-0001Aj-03; Thu, 07 Jan 2021 09:27:37 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxRZu-00018a-4i
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 09:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610011653; x=1641547653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZSbgxwC4YIGgbIv1CVEHDpNY53JBS2SY0k5ZL1SxFM=;
 b=DqgkxaUE/b8VP5ujfqttA5DgT/BnpjKr3UBq2/2ycT+HlYUT5lE28CXX
 ymGrlqC8IZrVy/PoQp1m0qpr7AlvhNce+JGo59coan0JYbeVHr1yMiHbJ
 +02qZ/SwXgiIaVLjG1QFg1iC1E4CPzhm4+ZzQcwxbaHbCPbKQAApAGwRE
 priYtq94t9tc00AumptZ7vEJbIzwBUF6YfWnQG0Ki5uV0/bUKhhXKpNNZ
 US+sSoE6mltQQ0F0AJU9LykeCM97s8W6c7PEKBKtRvs4z54GEeTNDXZCM
 pYrWK2edvwAswohCUIrPr0m3fRhd2fcjF3Lg6JrstCCgGB/5p3w3R4AoJ g==;
IronPort-SDR: PmvKdsl0u5lWZabK6Kr27WqCDqPZ0/D4vwSbyZ+jdcHZH7byM/b8rclHGvZ5R937H4Sj9F9BMz
 V7rZpatWJ9OA1LjoLXoLIUVTfT+8213CUkKUgWkUIGjo3PpNC9tyQFueVgesY8TChv2VQ0OmTB
 Pz4UJ3b/9bETH6wQxcktP3QnlE8BxTWvlqGd9mzXZ5yybSJ4ZHHXRGIs8nlkyIqoh5G1DjbkW2
 DJGQ8ni9HsiJSIscgXtOsk7nGqmhLrBk9POXoRO8V2KXlBjXNDRFvU/bNk3h5IWAHAbcQ5teqh
 hVI=
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; d="scan'208";a="156751187"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jan 2021 17:27:29 +0800
IronPort-SDR: +gUmZjE6mzsHN+VRSlUW3TnBA97yFn18QUj57ZMr1O3FuGFQ56ZdoUrMEFzhtHIEEXrlRIGnVq
 1bXMQZOnbtK3schhzlC5CgXxuJSbGGxkw65Niijs+IgFd+bcRYaA92PY3naoFlxTCaDRb5ewbg
 rJPc2p8l4+LLiayPFfIY12Q8ZsepqppfEixMK2YQlRp2twKS++vTKJqQ9drAAiZtlrVYXk3qaB
 uH6X+YYIXEobOZddU62kKTplubpWDG6dWU2v7dkiRUuCsEGsfWGQCLJucmOXewCvh6477ziuJx
 /V90nOq2WhB6jGVdHx6Xa90O
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 01:12:21 -0800
IronPort-SDR: kLjln25qDdG41vstcY7mxJThPxVXQ/G2dXUPRPrEz9UusObiazDjcJWc4TGnfb78oBBRrAekYv
 fMAAxVLqu30wqz8KSo7SSDLnGGvWvJ6ERVRwjPOoBs9aGEUYf8TszF9EozC23jrGSNALnWwpwE
 3aaM3Tc5VSM1ABuLJmiF+3Bk5xyeZ9T/qfF+g6XGvQJ3UbtvKcEKk4DbaT3XrkXZvbnahQauLJ
 vnXDruup40/3utsPciFdH+xPcMI17iYVnjhzwioPMhRAbvqtBu8YwVC0hfyfQJ6mdl23Qrf46y
 XSA=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.136])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2021 01:27:29 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] RISC-V: Do not allocate memblock while iterating reserved
 memblocks
Date: Thu,  7 Jan 2021 01:26:49 -0800
Message-Id: <20210107092652.3438696-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107092652.3438696-1-atish.patra@wdc.com>
References: <20210107092652.3438696-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_042734_347563_78D9C4FA 
X-CRM114-Status: GOOD (  18.12  )
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
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
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
