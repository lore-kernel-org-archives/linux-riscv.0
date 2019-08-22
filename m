Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5453C3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DA6233A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGXQ+B3c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DA6233A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6s6yhIeKowiMIbF7h62ESFq0r+ccvHlU5CfKXkE2ZIk=; b=fGXQ+B3c9fIBWA
	apdifkGCsH1Najn1mxq3Lt2QvpWGZsn2MhlKcda9ByyDqfBmZzKmkLywAXsISvs0vCLohH98weid9
	sk9hUo5MN9lcLLm6W7HOGJ/k2BPvGOYGmD1H3uoudCFFV9Dmo+p3UMGCyGTiGkFnKgOvBE7yK7zqh
	TmcAQDHVdpQBL9V3sKybkT+fbtAyNp4iI8AeqhyjszWW2jB+zC038/s4Ek7i9QqCxU+/b81UuKqb2
	c9P10XviiV9BuPeocuzogb6+q9I70Uh1pgNvrvdWzJMf14WcF/XGO4cmFQ1hIDy/uM49InUMNzA3s
	TdEjDX5A3lVjDDjlLC8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0h1O-0008VC-Gk; Thu, 22 Aug 2019 06:56:34 +0000
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0h1G-0008Mp-F2; Thu, 22 Aug 2019 06:56:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 5/8] riscv: actually clear icache_stale_mask for all harts in
 mm_cpumask
Date: Thu, 22 Aug 2019 15:56:09 +0900
Message-Id: <20190822065612.28634-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822065612.28634-1-hch@lst.de>
References: <20190822065612.28634-1-hch@lst.de>
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The comment in flush_icache_mm claim that we mark all harts that we
are sending the remote sfence.i to are marked as flushed, but we only
actually do this for the current one.  Fix the code to actually mark
all.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/cacheflush.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index eed715de4795..dacf72f94d12 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -20,21 +20,23 @@ void flush_icache_all(void)
 static void flush_icache_mm(bool local)
 {
 	unsigned int cpu;
-	cpumask_t others, hmask, *mask;
+	cpumask_t others, hmask;
 
 	preempt_disable();
 
-	/* Mark every hart's icache as needing a flush for this MM. */
-	mask = &current->mm->context.icache_stale_mask;
-	cpumask_setall(mask);
+	/*
+	 * Mark the I$ for all harts not concurrently executing as needing a
+	 * flush for this MM.
+	 */
+	cpumask_andnot(&current->mm->context.icache_stale_mask,
+		       cpu_possible_mask, mm_cpumask(current->mm));
+
 	/* Flush this hart's I$ now, and mark it as flushed. */
 	cpu = smp_processor_id();
-	cpumask_clear_cpu(cpu, mask);
 	local_flush_icache_all();
 
 	/*
-	 * Flush the I$ of other harts concurrently executing, and mark them as
-	 * flushed.
+	 * Flush the I$ of other harts concurrently executing.
 	 */
 	cpumask_andnot(&others, mm_cpumask(current->mm), cpumask_of(cpu));
 	local |= cpumask_empty(&others);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
