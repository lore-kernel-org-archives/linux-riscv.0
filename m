Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906DCC3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6657A23400
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SL0J/cUA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6657A23400
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Lq/7Y2PiEU0JG0ImFFM8FQJvoLE7HVs+v4f5zxqLlQ=; b=SL0J/cUAGdhudu
	ITpwVej9S6rS/MVQ+p5MsGrTvllXIQ5G4EC1eZ1tz9fSSc2p7vKlK07pqtpJ/dAZjqV6/3IlQ/NDc
	wg13CbKGEyPfv2A6uMiiKhhNOokxZDYdnPwt7NsVyRXpLv06StcrcD7w7a/GbtqPBjkwTbNah3HvK
	iKDUrfKx0LJqZt+q9MtvgbyJzq3ZaXPWXblYurlg5yWt57tWcwSO77ptHCfpMxgoJeKNWfHjo4f/0
	0xm1wF262ly4KmVV+V13eKo3b/ocpnBYJXPQdnhnd3TJqznxMLqBe3Tdmx5Wo+2LL0wQH7GFp/ozj
	dzX/sy1+1XgSrqZH1OCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0h1U-00009t-Du; Thu, 22 Aug 2019 06:56:40 +0000
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0h1J-0008Qm-Vp; Thu, 22 Aug 2019 06:56:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 7/8] riscv: improve the local flushing logic in
 sys_riscv_flush_icache
Date: Thu, 22 Aug 2019 15:56:11 +0900
Message-Id: <20190822065612.28634-8-hch@lst.de>
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

If we have to offload any remote sfence the SBI we might as well let it
handle the local one as well.  This significantly simplifies the cpumask
operations and streamlines the code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/cacheflush.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 9180b2e93058..8f1134715fec 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -20,7 +20,6 @@ void flush_icache_all(void)
 static void flush_icache_mm(bool local)
 {
 	unsigned int cpu = get_cpu();
-	cpumask_t others, hmask;
 
 	/*
 	 * Mark the I$ for all harts not concurrently executing as needing a
@@ -29,27 +28,23 @@ static void flush_icache_mm(bool local)
 	cpumask_andnot(&current->mm->context.icache_stale_mask,
 		       cpu_possible_mask, mm_cpumask(current->mm));
 
-	/* Flush this hart's I$ now, and mark it as flushed. */
-	local_flush_icache_all();
-
 	/*
-	 * Flush the I$ of other harts concurrently executing.
+	 * It's assumed that at least one strongly ordered operation is
+	 * performed on this hart between setting a hart's cpumask bit and
+	 * scheduling this MM context on that hart.  Sending an SBI remote
+	 * message will do this, but in the case where no messages are sent we
+	 * still need to order this hart's writes with flush_icache_deferred().
 	 */
-	cpumask_andnot(&others, mm_cpumask(current->mm), cpumask_of(cpu));
-	local |= cpumask_empty(&others);
-	if (!local) {
-		riscv_cpuid_to_hartid_mask(&others, &hmask);
-		sbi_remote_fence_i(hmask.bits);
-	} else {
-		/*
-		 * It's assumed that at least one strongly ordered operation is
-		 * performed on this hart between setting a hart's cpumask bit
-		 * and scheduling this MM context on that hart.  Sending an SBI
-		 * remote message will do this, but in the case where no
-		 * messages are sent we still need to order this hart's writes
-		 * with flush_icache_deferred().
-		 */
+	cpu = get_cpu();
+	if (local ||
+	    cpumask_any_but(mm_cpumask(current->mm), cpu) >= nr_cpu_ids) {
+		local_flush_icache_all();
 		smp_mb();
+	} else {
+		cpumask_t hmask;
+
+		riscv_cpuid_to_hartid_mask(mm_cpumask(current->mm), &hmask);
+		sbi_remote_fence_i(cpumask_bits(&hmask));
 	}
 
 	put_cpu();
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
