Return-Path: <SRS0=YBN+=IF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337AFC433E6
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 02:25:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7285965056
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 02:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7285965056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HK8vBWYrmfL0UBYkH/2NGqnvZEz7zevC5esoySF+n7Y=; b=jlFP2UV7Jv78vqD27S69T5a1OT
	GfwGzG3Hc/GVcYc/aPtaT5rxDMy7JlIIs2KTKrSNe1bnZmkjKZ+vZYEEgsNN28FYwQxeEXZ3g0Cty
	zNGmXsEuOAAu1rp9EY4UXdizm4g7EH6K9ezdQHeO/70/CEB7zTGcS0WeA23K9vsNni8+Qwe818Gid
	DQqLHfLwmF5tBR7tNr22EjdcQw6aI1jIzpnCU7VmagRBdmvDWp5wTLC2/1DgHEd563fCispDF/Bh3
	/41PyCyeuYhKidQabssewcQMQG/iLYhzIDt3On3m2OlAjMcZ5q90GgmnkgmBpu80sp88kFBnTXz9j
	lTVyCeKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIj6g-0076iY-6O; Sun, 07 Mar 2021 02:25:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIj6X-0076c2-V4
 for linux-riscv@lists.infradead.org; Sun, 07 Mar 2021 02:25:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2295F65056;
 Sun,  7 Mar 2021 02:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615083910;
 bh=WhlbkUebwc1GJfXvE/1rpEg/Mf21MpRw1uus7X8kdhM=;
 h=From:To:Cc:Subject:Date:From;
 b=P/PmwbHZ6rBXncMvOhHWf1UeeMdm+EzqFTqXWkT46ndkYAfO1qnLQxRFvfotu3sJY
 Kh5z/TnOtYx6WabQsMWEtpP5NJtcFjN9r9dSYGTnJTR8TziqKn0M45t2L73ISLmSSw
 8DJVqyWu6l4pssJWUlB2uAn4XSept9KW85JTvRzM0joP4Aal2p2RvdOI+Bx2koToGu
 Jkew5iPqShZCoORlTR9AwEYJqPKBz23lIfW6nDs7TrTkx/sL/jfKTIhJjam+DJJb1B
 6a7qVm1pZEvrAU51xaXZoFodiLSwNiuf5JDqNfxfjo10vqlIz7G5Mx70WXjz4D6Hve
 5Wtbn7puahsJQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 1/2] csky: Enable generic clockevent broadcast
Date: Sun,  7 Mar 2021 10:24:45 +0800
Message-Id: <20210307022446.63732-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_022514_609417_93E34E24 
X-CRM114-Status: GOOD (  10.10  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When percpu-timers are stopped by deep power saving mode, we need
system timer help to broadcast IPI_TIMER.

This is first introduced by broken x86 hardware, where the local apic
timer stops in C3 state. But many other architectures(powerpc, mips,
arm, hexagon, openrisc, sh) have supported the infrastructure to
deal with Power Management issues.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/csky/Kconfig      |  2 ++
 arch/csky/kernel/smp.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 34e91224adc3..4328511ac050 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -6,6 +6,7 @@ config CSKY
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610
@@ -19,6 +20,7 @@ config CSKY
 	select IRQ_DOMAIN
 	select HANDLE_DOMAIN_IRQ
 	select DW_APB_TIMER_OF
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_IOREMAP
 	select GENERIC_LIB_ASHLDI3
 	select GENERIC_LIB_ASHRDI3
diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index 0f9f5eef9338..76d38d84da70 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -8,6 +8,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/notifier.h>
 #include <linux/cpu.h>
+#include <linux/clockchips.h>
 #include <linux/percpu.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -32,6 +33,7 @@ enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
 	IPI_IRQ_WORK,
+	IPI_TIMER,
 	IPI_MAX
 };
 
@@ -67,6 +69,13 @@ static irqreturn_t handle_ipi(int irq, void *dev)
 			irq_work_run();
 		}
 
+#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
+		if (ops & (1 << IPI_TIMER)) {
+			stats[IPI_TIMER]++;
+			tick_receive_broadcast();
+		}
+#endif
+
 		BUG_ON((ops >> IPI_MAX) != 0);
 	}
 
@@ -102,6 +111,7 @@ static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",
 	[IPI_IRQ_WORK]		= "Irq work interrupts",
+	[IPI_TIMER]		= "Timer broadcast interrupts",
 };
 
 int arch_show_interrupts(struct seq_file *p, int prec)
@@ -130,6 +140,13 @@ void arch_send_call_function_single_ipi(int cpu)
 	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
 }
 
+#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
+void tick_broadcast(const struct cpumask *mask)
+{
+	send_ipi_message(mask, IPI_TIMER);
+}
+#endif
+
 static void ipi_stop(void *unused)
 {
 	while (1);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
