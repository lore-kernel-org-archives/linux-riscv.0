Return-Path: <SRS0=P6b6=UX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80663C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 05:44:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59A5C2146F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 05:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JUJNJBq/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59A5C2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJd8P2OjQRNEUKQrXZ6qXONxjZJ8pu5USysh6K0zbok=; b=JUJNJBq/vfG35F
	RrYIo69yskj0FbqaAoZLml/PrJJQk1viW+K+qUQbK5sM5ddJo6TBZQK+4ORCispJlatkdl9UsqKt2
	TQbqbsy5zOarqO0r5YvzXvDOQgDlyWTmL6k2cjYMTCOORRFKBUGgjTz7kPDENmpOcKFEBOdS4ix9J
	gP3/lotx4KFirQmYgsGI6lthovVpOhwkYawMqk/LfQJ9xCwRMFHija3jN+vpFwgXYJ6+7lN4GFzOT
	xYdsFw/2cbco1uLhcogkzppK1eZ+lE9C0+Pe3qWiRcAx6l8OfwPlHMdGGmUcU7MdO5wGu4NAdMwMi
	aCCSkc/3Jig73hs/LIeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfHlm-0006lJ-28; Mon, 24 Jun 2019 05:43:58 +0000
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfHlj-0006gQ-Me; Mon, 24 Jun 2019 05:43:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 12/17] riscv: implement remote sfence.i natively for M-mode
Date: Mon, 24 Jun 2019 07:43:06 +0200
Message-Id: <20190624054311.30256-13-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624054311.30256-1-hch@lst.de>
References: <20190624054311.30256-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: linux-mm@kvack.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V ISA only supports flushing the instruction cache for the local
CPU core.  For normal S-mode Linux remote flushing is offloaded to
machine mode using ecalls, but for M-mode Linux we'll have to do it
ourselves.  Use the same implementation as all the existing open source
SBI implementations by just doing an IPI to all remote cores to execute
th sfence.i instruction on every live core.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/cacheflush.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 9ebcff8ba263..10875ea1065e 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -10,10 +10,35 @@
 
 #include <asm/sbi.h>
 
+#ifdef CONFIG_M_MODE
+static void ipi_remote_fence_i(void *info)
+{
+	return local_flush_icache_all();
+}
+
+void flush_icache_all(void)
+{
+	on_each_cpu(ipi_remote_fence_i, NULL, 1);
+}
+
+static void flush_icache_cpumask(const cpumask_t *mask)
+{
+	on_each_cpu_mask(mask, ipi_remote_fence_i, NULL, 1);
+}
+#else /* CONFIG_M_MODE */
 void flush_icache_all(void)
 {
 	sbi_remote_fence_i(NULL);
 }
+static void flush_icache_cpumask(const cpumask_t *mask)
+{
+	cpumask_t hmask;
+
+	cpumask_clear(&hmask);
+	riscv_cpuid_to_hartid_mask(mask, &hmask);
+	sbi_remote_fence_i(hmask.bits);
+}
+#endif /* CONFIG_M_MODE */
 
 /*
  * Performs an icache flush for the given MM context.  RISC-V has no direct
@@ -28,7 +53,7 @@ void flush_icache_all(void)
 void flush_icache_mm(struct mm_struct *mm, bool local)
 {
 	unsigned int cpu;
-	cpumask_t others, hmask, *mask;
+	cpumask_t others, *mask;
 
 	preempt_disable();
 
@@ -47,9 +72,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 	cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
 	local |= cpumask_empty(&others);
 	if (mm != current->active_mm || !local) {
-		cpumask_clear(&hmask);
-		riscv_cpuid_to_hartid_mask(&others, &hmask);
-		sbi_remote_fence_i(hmask.bits);
+		flush_icache_cpumask(&others);
 	} else {
 		/*
 		 * It's assumed that at least one strongly ordered operation is
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
