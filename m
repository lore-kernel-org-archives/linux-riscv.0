Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B314C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 09:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC1C42086C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 09:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fPlGDp6X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC1C42086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NfB3HCPLR7xmiOIZn8hNBdhpgw2CeV04mFZXsA47QOs=; b=fPlGDp6XjRhSps
	j8S8fn5qSs6e/1IX+iyEoyjobVTft9rkPZJx3xwVXlFTERkWYde+Yt/nia3V7OkigYR7LfJgxxaNq
	jIfwjzcDI0wgqO/2VvjYOhbMFogTYl3jGVC4XqarqYUJTefERvpPV26YtXehFu0CRDUEG/R3UTtQl
	S4VQTs+nVG33HbB3QF56Pb1CGzzvF3asKmFoXf4ldlsQe3i9H02XV2VDhe/SNpD8oVQxZKdoZYdFv
	M3dX7wijISP5FT3yTSusWs9V5S21bKiwqLFNuzPRqrB4jUeZBz1XzTDaqWC0A2N8Mj2nIy+o+Ev+f
	wA2bUpjZj2divnqleZAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYpXt-0002Px-0X; Mon, 17 Dec 2018 09:50:41 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYpVU-00071V-Lz
 for linux-riscv@lists.infradead.org; Mon, 17 Dec 2018 09:48:41 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0CC2AE4B
 for <linux-riscv@lists.infradead.org>; Mon, 17 Dec 2018 09:47:59 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v3] riscv: don't stop itself in smp_send_stop
X-Yow: My LIBRARY CARD expired...
Date: Mon, 17 Dec 2018 10:47:56 +0100
Message-ID: <mvm7eg85vsj.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_014813_826102_8CAB08FE 
X-CRM114-Status: GOOD (  12.86  )
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

Add IPI_CPU_STOP message and use it in smp_send_stop to stop other cpus,
but not itself.  Mark cpu offline on reception of IPI_CPU_STOP.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
v3: minor fixes
---
 arch/riscv/kernel/smp.c | 43 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 57b1383e5e..d0bd3f1187 100644
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
+	set_cpu_online(smp_processor_id(), false);
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
+		pr_warn("SMP: failed to stop secondary CPUs %*pbl\n",
+			cpumask_pr_args(cpu_online_mask));
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
