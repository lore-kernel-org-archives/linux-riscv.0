Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E368860A3810
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OZWq1JOp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i3aUv73PbZr8nlVoxqQN4ceWEif0Y8Cadp4b8WYyz24=; b=OZWq1JOpTBa/C18STg1WI3cTIX
	fOxit1kKxOMy+gZh5vGKYgRIion+DHssljatVwbQTs7ARAg31TCUV7diD37hE0WATOetQsxHijz7M
	VruI0MZxLpy2IhqnRRocJa3HnauecCXHTulmeTN13jxEp4tw62re4I2CyTI10wHv6VvOeMRnjJiEY
	jcFUsc9yF50Glmi9MgXQhlnZ/CklFT3xyGmTepIk9ZVKKzR3YsKmMMALfk7+jZB+rOkxy0/Bf0R6r
	zGvhc7DsAUdPmY8RXFUgqRqcD4xw1088R5UwLjZ9vZrKUPLYp7kTwJ3+c28epDxY8GVSuOd0aHw8i
	DwZiK/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTV-0000000Bqhw-42Z4;
	Fri, 13 Nov 2026 07:13:29 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTL-0000000Bqdb-2sTf
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:13:24 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5L059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:28 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:28 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 07/19] cache: andes_llcache: clean up cache inv/wback functions
Date: Fri, 13 Nov 2026 15:11:31 +0800
Message-ID: <20261113071143.1446167-8-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CR5L059129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231320_416391_87E3A08B 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Replace open-coded cache line alignment with ALIGN_DOWN/ALIGN helpers,
initialize line_size at declaration site, and use !size instead of
start == end for the early-out check. Drop redundant blank lines.

Also declare pa in andes_cpu_cache_operation() as phys_addr_t, the type
virt_to_phys() returns.

No functional change intended.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 61730e218afa..3c271e1e49bf 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -65,7 +65,7 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
 	int mhartid = smp_processor_id();
-	unsigned long pa;
+	phys_addr_t pa;
 
 	while (end > start) {
 		csr_write(CSR_UCCTLBEGINADDR, start);
@@ -101,21 +101,17 @@ static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
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
 
@@ -123,15 +119,15 @@ static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
