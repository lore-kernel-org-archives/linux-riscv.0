Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B41C43610
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 16:32:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF91D20863
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 16:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KvhWpDFl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF91D20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wvMJOexd1ChXm4RxlCRb0Cy9S7axzrQcSqHJQdOHK/Y=; b=KvhWpDFl2MqxPg
	q5nPXg38RHoBU2TBrxiGpeAdbXIrnL3K4/ydbYsgm3Ujiak0iheuBhljECEKn/dEKoE+wfmrUMHdk
	1m/qI/x7zkiOk3Sxn72VsLQpmqBgJYi5vUe+dortRq9WdEXg2pg8s84apIx1rwfKEjzMO24gJ6YOa
	0XPe7MYqDfk7EKw46tzq8S010q/1EWWnhRvQTkVp93vAKQJHu96pud2jcgePfDvDPL9rFsbe95jvT
	u5uMjnJ1AlDVETtUCxtaWw+2DlAx6FbyF3glHD6yFy5FFGIo2zdp8eQmh6gyy61qzYOk1QM1LpUkP
	jERjdUfWyJe6jz7HByGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSPEi-0000qz-Tg; Thu, 29 Nov 2018 16:32:20 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSPEf-0000qL-SD
 for linux-riscv@lists.infradead.org; Thu, 29 Nov 2018 16:32:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30C16B00C
 for <linux-riscv@lists.infradead.org>; Thu, 29 Nov 2018 16:32:04 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: don't stop itself in smp_send_stop
X-Yow: It's a lot of fun being alive...  I wonder if my bed is made?!?
Date: Thu, 29 Nov 2018 17:32:03 +0100
Message-ID: <mvmbm67etfg.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181129_083218_054908_23095D59 
X-CRM114-Status: GOOD (  10.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Only run ipi_stop on other cpus, not itself.  Don't wait for ipi_stop to
return, since it never does.  Also, mark each cpu offline.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/smp.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 57b1383e5e..5c6bb5fe5a 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -23,6 +23,7 @@
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
+#include <linux/delay.h>
 
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
@@ -148,13 +149,27 @@ void arch_send_call_function_single_ipi(int cpu)
 
 static void ipi_stop(void *unused)
 {
+	set_cpu_online (smp_processor_id(), false);
 	while (1)
 		wait_for_interrupt();
 }
 
 void smp_send_stop(void)
 {
-	on_each_cpu(ipi_stop, NULL, 1);
+	unsigned long timeout;
+	struct cpumask mask;
+
+	cpumask_copy (&mask, cpu_online_mask);
+	cpumask_clear_cpu (smp_processor_id (), &mask);
+	on_each_cpu_mask(&mask, ipi_stop, NULL, 0);
+
+	/* Wait up to one second for other CPUs to stop */
+	timeout = USEC_PER_SEC;
+	while (num_online_cpus() > 1 && timeout--)
+		udelay(1);
+
+	if (num_online_cpus() > 1)
+		pr_warn("SMP: failed to stop secondary CPUs\n");
 }
 
 void smp_send_reschedule(int cpu)
-- 
2.19.2


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
