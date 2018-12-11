Return-Path: <SRS0=hxTO=OU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33063C5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 10:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0336520811
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 10:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M2MaOeqz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0336520811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/dC+UmxgHnubBvqPKP3CkhNivekzqxtR0FyWx4ctDQ=; b=M2MaOeqzxSzCOK
	sEiBALSDn41MnSYPaLqLKj8RxGAkvBVztWNKQFz5FcbLdA6GSwZv8qCD8NCsvRsRXSVGZ23goibdR
	qxQClDjNSIwQRlMZ5OIBcmN82SkUhSyjkMVaQc4l40jpWPhKR7/+jzckabkooHarX1E67jOF2UFFU
	UT1pm6C6DZx7F7BUoCH7RqnYkTd58WVcmhsqwGjRzSXdHZq46aZ02vWyvd/x9tOjvLyN++oRxTbX7
	3vp53Vsmxpyi7j5jyU36Jzywdwy5N7i2Soa7Rt954WWtoRwGjJPSSS9ZGHydaCMr7fGgsrYnfvmDV
	fAF905wUhM/5oGr6j0/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWf9r-0003fG-9h; Tue, 11 Dec 2018 10:20:55 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWf9o-0003YJ-Fh
 for linux-riscv@lists.infradead.org; Tue, 11 Dec 2018 10:20:54 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05C82AE06;
 Tue, 11 Dec 2018 10:20:41 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v2] riscv: don't stop itself in smp_send_stop
References: <mvmbm67etfg.fsf@suse.de>
 <72991c58-91f5-abb1-54f9-35ae4533a26e@wdc.com>
 <mvmsgz5bqd7.fsf@suse.de>
X-Yow: I'm RELIGIOUS!!  I love a man with a HAIRPIECE!!
 Equip me with MISSILES!!
Date: Tue, 11 Dec 2018 11:20:40 +0100
In-Reply-To: <mvmsgz5bqd7.fsf@suse.de> (Andreas Schwab's message of "Mon, 10
 Dec 2018 11:58:12 +0100")
Message-ID: <mvmd0q89xfr.fsf_-_@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_022052_666161_A3675D7C 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add IPI_CPU_STOP message and use it in smp_send_stop to stop other cpus,
but not itself.  Mark cpu offline on reception of IPI_CPU_STOP.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/smp.c | 43 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 57b1383e5e..b813264416 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -23,6 +23,7 @@
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
+#include <linux/delay.h>
 
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
@@ -31,6 +32,7 @@
 enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
 	IPI_MAX
 };
 
@@ -66,6 +68,13 @@ int setup_profiling_timer(unsigned int multiplier)
 	return -EINVAL;
 }
 
+static void ipi_stop(void)
+{
+	set_cpu_online (smp_processor_id(), false);
+	while (1)
+		wait_for_interrupt();
+}
+
 void riscv_software_interrupt(void)
 {
 	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
@@ -94,6 +103,11 @@ void riscv_software_interrupt(void)
 			generic_smp_call_function_interrupt();
 		}
 
+		if (ops & (1 << IPI_CPU_STOP)) {
+			stats[IPI_CPU_STOP]++;
+			ipi_stop();
+		}
+
 		BUG_ON((ops >> IPI_MAX) != 0);
 
 		/* Order data access and bit testing. */
@@ -121,6 +135,7 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",
+	[IPI_CPU_STOP]		= "CPU stop interrupts",
 };
 
 void show_ipi_stats(struct seq_file *p, int prec)
@@ -146,15 +161,29 @@ void arch_send_call_function_single_ipi(int cpu)
 	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
 }
 
-static void ipi_stop(void *unused)
-{
-	while (1)
-		wait_for_interrupt();
-}
-
 void smp_send_stop(void)
 {
-	on_each_cpu(ipi_stop, NULL, 1);
+	unsigned long timeout;
+
+	if (num_online_cpus() > 1) {
+		cpumask_t mask;
+
+		cpumask_copy(&mask, cpu_online_mask);
+		cpumask_clear_cpu(smp_processor_id(), &mask);
+
+		if (system_state <= SYSTEM_RUNNING)
+			pr_crit("SMP: stopping secondary CPUs\n");
+		send_ipi_message(&mask, IPI_CPU_STOP);
+	}
+
+	/* Wait up to one second for other CPUs to stop */
+	timeout = USEC_PER_SEC;
+	while (num_online_cpus() > 1 && timeout--)
+		udelay(1);
+
+	if (num_online_cpus() > 1)
+		pr_warning("SMP: failed to stop secondary CPUs %*pbl\n",
+			   cpumask_pr_args(cpu_online_mask));
 }
 
 void smp_send_reschedule(int cpu)
-- 
2.20.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
