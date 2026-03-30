Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF15FB3D03
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlSsMzfBbcjyi7stkMQmG+uyPzL5JQ0EP/ioujexcuU=; b=B/31rhg73I9kCn
	bTGSmOgdxS7FNB8X4KVQPyrncDh4ZgPEwqD6BSMuoKxYd055D21vjOuBTSpFLmK3qxB5F+gPQsm/j
	sN22f48NgzufW8/1XeUfe/S54XCK+d4SQ57M8DAGLlyCb+zyr3dMhppZ7qQXC+wN5IJg/d+g1TA0n
	OvLWSGVwkWd62aBQUXtmTyQA/jQt4lMYj6eZIHu6NRkOsMmgwxUWniInshSSZ+ibsVPa1gutmq0Qc
	sDpHKFlDbSCuM4+uhZPzYQ5TebX+amD2AXSWc4VmxqgJYSpi9ue4PtA4kW/gOPVfwkLBP+nrwlAlB
	1jGjgCGFuKIL7x8OFZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rj-0000000B3XH-2uaK;
	Mon, 30 Mar 2026 10:29:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rh-0000000B3WM-3ztE
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=G+y+nUOkis1aIp7eWxQwSWeSBC9JWO972NVCukJltgo=; b=WoVnSvcjemQtyVh3LhnvfbtOAe
	MkGJE1BUzk75+zKmpuPQzMvkf1kj6mOKkyGfiE9xBqSC5pcymcEr+Hqp3CkzT7k1VistEdi+apEgp
	X4Q8sd03UvUIUaHVvGURpnH+wmtS1VzB2smCT6ktGueHGT8+SWcCTSB6/hj6OzV/4I0ovZrX6nn0W
	UakdylbJd/8SIAs5iDH3Mk3a6oAbsG5aBVqGbTQV3SX0ye6TsA5PmTmf5lFRjvzXbonkoPCg/ffgt
	okagIJCJH6Q/M+tlKibwYTMWjQujLa6jqOaZRwEg7yE+xuAGqyPffQij52IXrcLkek2d454pbD/63
	SRPPMpsw==;
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rd-0000000DZrI-1SVd
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:29:00 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UAS2eU038167;
	Mon, 30 Mar 2026 18:28:02 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:02 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 2/7] cache: andes_llcache: refactor initialization and cache operations
Date: Mon, 30 Mar 2026 18:27:19 +0800
Message-ID: <20260330102724.1012470-3-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 62UAS2eU038167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_112858_266779_A69E47E2 
X-CRM114-Status: GOOD (  13.98  )
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

This patch cleans up the Andes LLC cache driver:
 - improved error handling in andes_cache_init() by using goto labels
 - updated andes_dma_cache_inv/wback() to check for !size instead of
   start == end
 - cache-line-size mismatch from an error to a warning
 - Use ALIGN and ALIGN_DOWN helpers instead of the alignment logic in
   andes_dma_cache_inv() and andes_dma_cache_wback().

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 56 ++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index d5e382f3c801..d318b8009f7f 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -111,21 +111,17 @@ static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
-	unsigned long line_size;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
 	unsigned long flags;
 
-	if (unlikely(start == end))
+	if (unlikely(!size))
 		return;
 
-	line_size = andes_priv.andes_cache_line_size;
-
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
 
 	local_irq_save(flags);
-
 	andes_cpu_dcache_inval_range(start, end);
-
 	local_irq_restore(flags);
 }
 
@@ -133,15 +129,15 @@ static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
-	unsigned long line_size;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
 	unsigned long flags;
 
-	if (unlikely(start == end))
+	if (unlikely(!size))
 		return;
 
-	line_size = andes_priv.andes_cache_line_size;
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
+
 	local_irq_save(flags);
 	andes_cpu_dcache_wb_range(start, end);
 	local_irq_restore(flags);
@@ -159,14 +155,13 @@ static int andes_get_llc_line_size(struct device_node *np)
 
 	ret = of_property_read_u32(np, "cache-line-size", &andes_priv.andes_cache_line_size);
 	if (ret) {
-		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
+		pr_err("Cache: Failed to get cache-line-size\n");
 		return ret;
 	}
 
 	if (andes_priv.andes_cache_line_size != ANDES_CACHE_LINE_SIZE) {
-		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
-		       andes_priv.andes_cache_line_size);
-		return -EINVAL;
+		pr_warn("Cache: Expected cache-line-size to be 64 bytes (found:%u)\n",
+			andes_priv.andes_cache_line_size);
 	}
 
 	return 0;
@@ -186,16 +181,18 @@ static const struct of_device_id andes_cache_ids[] = {
 static int __init andes_cache_init(void)
 {
 	struct resource res;
-	int ret;
+	int ret = 0;
 
 	struct device_node *np __free(device_node) =
 		of_find_matching_node(NULL, andes_cache_ids);
-	if (!of_device_is_available(np))
-		return -ENODEV;
+	if (!of_device_is_available(np)) {
+		ret = -ENODEV;
+		goto err_ret;
+	}
 
 	ret = of_address_to_resource(np, 0, &res);
 	if (ret)
-		return ret;
+		goto err_ret;
 
 	/*
 	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
@@ -208,17 +205,22 @@ static int __init andes_cache_init(void)
 		return 0;
 
 	andes_priv.llc_base = ioremap(res.start, resource_size(&res));
-	if (!andes_priv.llc_base)
-		return -ENOMEM;
+	if (!andes_priv.llc_base) {
+		ret = -ENOMEM;
+		goto err_ret;
+	}
 
 	ret = andes_get_llc_line_size(np);
-	if (ret) {
-		iounmap(andes_priv.llc_base);
-		return ret;
-	}
+	if (ret)
+		goto err_unmap;
 
 	riscv_noncoherent_register_cache_ops(&andes_cmo_ops);
 
 	return 0;
+
+err_unmap:
+	iounmap(andes_priv.llc_base);
+err_ret:
+	return ret;
 }
 early_initcall(andes_cache_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
