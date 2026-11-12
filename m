Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55F6606A331
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F3zj625A;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GLjLahCD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jLTBNEmT1EU7tuUk3EtU2ev/g05oon5w+GYbFsagaWg=; b=F3zj625A8xeMCoT+QD964NskMk
	Y4DJrhDpf0qzRY8XdmQzR1k1NMHXjdTu30bx/6sqdRonaRX/EGtKRP1Um3mVpEsJlQgI8Friv8EgP
	PItEQmOtIojMr/z0g9Nd9Yrh/n6hDJciVXEsLuiVqYiDu3m6p7M8Uq/9LtUd+t0vRRAQ5R7txjv0E
	3uAabd/0nda2S8EtNXIitSeoHcPJ5vqc6UsQ6shJ5hFFChnO6joWXQYWi0infhMrsxnwfpYTaYY1+
	olylhSR+FFVY7SwJDRuKx0+6Ja/RzNDmDffPDM4eBlBvD+tE5T66y3XcNP4ZTsoN+0mB3HQtYUYj4
	ARvflZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPeH-00000008zHR-1Yxt;
	Thu, 12 Nov 2026 07:55:09 +0000
Received: from out-69.mta1.migadu.com ([2001:41d0:203:375::45] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPdt-00000008z7j-2Ij6
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 07:55:07 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=jCIzZyd444ha6pslVm1boveaGld0krXHIpLGnhI5FvQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794470083; v=1; x=1795074883;
 b=GLjLahCDBTChpUkJhgsQMhRmqaPDKVCWTZTJjtj7UThn8K+2SHfiH7hUxFclnWUTzdN/1t3l
 FNTuYmXdTx1a4PR+7DKBSxNQwNVtRiCjHvbuywz8QSgN86Gs1O0h4/+wTvJkfnFt80aL9EOc+IA
 eFPEre/EiXDgbrhNsMj0odvA=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 6cba420a238a3506;
	Thu, 12 Nov 2026 07:54:43 +0000
X-Mizu-Trace-ID: 6cba420a238a3506
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Thu, 12 Nov 2026 07:54:32 +0000
Subject: [PATCH v2 1/2] irqchip/riscv-imsic: Synchronize remote state with
 IRQ work
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-imsic-remote-sync-irqwork-v2-1-680f65b24ff6@linux.dev>
References: <20261112-imsic-remote-sync-irqwork-v2-0-680f65b24ff6@linux.dev>
In-Reply-To: <20261112-imsic-remote-sync-irqwork-v2-0-680f65b24ff6@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3849;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=jCIzZyd444ha6pslVm1boveaGld0krXHIpLGnhI5FvQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfC3aKyj4/JyrC1W9WF3ju0dx9fxIV1vz4fjlbWrpl5
 ewppqsnd5SyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAExE/BvDP9vq3w+NPpbsuCd0
 +UvGrFlqXNwHj08952U7v+u3lObSBglGhoON+ysDBdxfaX1yY2IqNljaJC3533vZnS81W25I7uC
 x5QAA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_235445_745753_C79DC65F 
X-CRM114-Status: GOOD (  18.62  )
X-Spam-Score: -2.1 (--)
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

Remote IMSIC state updates are deferred to a timer on the target CPU.
If that CPU has stopped its local clockevent and is waiting for a
broadcast interrupt, enabling the broadcast IRQ can depend on delivery
of that same interrupt. This can stall timer delivery when the broadcast
IRQ is unmasked or moved to another CPU, including during CPU hotplug.

Queue hard IRQ work to synchronize remote state independently of timer
delivery. Keep synchronous updates on the local CPU and the timer retry
for an unfinished vector move. Hard IRQ work also avoids depending on a
schedulable worker when PREEMPT_RT is enabled.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/Kconfig                 |  1 +
 drivers/irqchip/irq-riscv-imsic-state.c | 19 +++++++++++++------
 drivers/irqchip/irq-riscv-imsic-state.h |  4 ++++
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..5cdc3f52198c 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -651,6 +651,7 @@ config RISCV_IMSIC
 	bool
 	depends on RISCV
 	select IRQ_DOMAIN_HIERARCHY
+	select IRQ_WORK if SMP
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
 	select IRQ_MSI_LIB
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 01620373b43a..f6373e4019a2 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -252,6 +252,11 @@ void imsic_local_delivery(bool enable)
 }
 
 #ifdef CONFIG_SMP
+static void imsic_local_sync_work(struct irq_work *work)
+{
+	imsic_local_sync_all(false);
+}
+
 static void imsic_local_timer_callback(struct timer_list *timer)
 {
 	imsic_local_sync_all(false);
@@ -268,18 +273,19 @@ static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu
 	 */
 
 	/*
-	 * We schedule a timer on the target CPU if the target CPU is not
-	 * same as the current CPU. An offline CPU will unconditionally
-	 * synchronize IDs through imsic_starting_cpu() when the
-	 * CPU is brought up.
+	 * A remote CPU may have stopped its local timer and be waiting for
+	 * the broadcast interrupt whose IMSIC state needs updating. Use an
+	 * IPI-backed work item so enabling that interrupt does not depend on
+	 * its delivery. An offline CPU synchronizes IDs in imsic_starting_cpu().
 	 */
 	if (cpu_online(cpu)) {
 		if (cpu == smp_processor_id()) {
 			if (__imsic_local_sync(lpriv))
 				return;
+			__imsic_local_timer_start(lpriv, cpu);
+		} else {
+			irq_work_queue_on(&lpriv->sync_work, cpu);
 		}
-
-		__imsic_local_timer_start(lpriv, cpu);
 	}
 }
 #else
@@ -510,6 +516,7 @@ static int __init imsic_local_init(void)
 #ifdef CONFIG_SMP
 		/* Setup lazy timer for synchronization */
 		timer_setup(&lpriv->timer, imsic_local_timer_callback, TIMER_PINNED);
+		lpriv->sync_work = IRQ_WORK_INIT_HARD(imsic_local_sync_work);
 #endif
 
 		/* Allocate vector array */
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 189829b8673a..a36b9f0ef840 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -9,6 +9,7 @@
 
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/irqdomain.h>
+#include <linux/irq_work.h>
 #include <linux/fwnode.h>
 #include <linux/timer.h>
 
@@ -34,6 +35,9 @@ struct imsic_local_priv {
 	unsigned long				*dirty_bitmap;
 
 #ifdef CONFIG_SMP
+	/* Remote synchronization must not depend on a timer interrupt. */
+	struct irq_work				sync_work;
+
 	/* Local timer for synchronization */
 	struct timer_list			timer;
 #endif

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
