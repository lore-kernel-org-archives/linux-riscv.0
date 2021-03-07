Return-Path: <SRS0=YBN+=IF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DA2C433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 02:25:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CF76505D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 02:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76CF76505D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YYNWmnNWxp5t/rZYFAX+TfEEKN6UvWoYLSYLIhDh9mQ=; b=n3KC+C5yVGZ+39TLjmhQi0oVx
	nNiZtzUOjEPWMDn3Jcf+0Ck8gToF9Kw28HsyQbJS7pBVDRKs/y0AXtwib+Ded+RDgdMu0FtQ82Noo
	3DCed8IAPfUSeepXerGHA7MU+A2/sS2ZJrp9xbBEwZTPkVuhdfKcCeIk4wZUfjz5PbwKYfEzHL8/w
	wLyASwDzrVj7LHULE91k6z86h9lR+6rtmEIw3IrrvXuEmxITXRqf0u+956gd3r+81T5uOt9+MZVaH
	WqTem2HObGso7kFQHsQ4ISJ5K17YVvEFTQ4vEdxwvRbLJrMHUlKy9Ewq9dePV010D3oWoxBfyR5ED
	IuIkJkkLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIj6k-0076kp-VA; Sun, 07 Mar 2021 02:25:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIj6e-0076iN-4z
 for linux-riscv@lists.infradead.org; Sun, 07 Mar 2021 02:25:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8191464FF0;
 Sun,  7 Mar 2021 02:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615083918;
 bh=S6WUpjoSEoqdZcEDlaFPSR66FdKOqh3DN9zUenNHBho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GPF9ZLKvsA9TElGF5fM9CASwJMPYicM7Gsq5B4QgSfNW2lWZQi5FbhDUsX5WmGbUx
 KsT8fKazFFUg+grRKSPsjqmn4Y7ydNu73bM7ah6F+rpsh8Lf8X5VYpvFaJO8EmlG8r
 5Yyoi+gPaGvB53Uo9/T1cggH/92ybq71+1DlIpSqcF8121vjW2+OHoPKr4YMQj0bQk
 txRNmTT80i8+hO0DPECc6RTIwu/p79RJJKgCmpn1r+D/ywrsPkwyzALALOB5UiEuc7
 +mvQLNZrJqDNHbRbWqWh/WJKlfMZHkWfpTwNXBksutBIcBl88sxzcvcgdPucDCqJDK
 +TWl4ZDT37L/A==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH 2/2] riscv: Enable generic clockevent broadcast
Date: Sun,  7 Mar 2021 10:24:46 +0800
Message-Id: <20210307022446.63732-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210307022446.63732-1-guoren@kernel.org>
References: <20210307022446.63732-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_022523_462096_98AB0044 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

When percpu-timers are stopped by deep power saving mode, we
need system timer help to broadcast IPI_TIMER.

This is first introduced by broken x86 hardware, where the local apic
timer stops in C3 state. But many other architectures(powerpc, mips,
arm, hexagon, openrisc, sh) have supported the infrastructure to
deal with Power Management issues.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Kconfig      |  2 ++
 arch/riscv/kernel/smp.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 85d626b8ce5e..8637e7344abe 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -28,6 +28,7 @@ config RISCV
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
+	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
@@ -39,6 +40,7 @@ config RISCV
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY if SMP
 	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
 	select GENERIC_IOREMAP
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index ea028d9e0d24..8325d33411d8 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/clockchips.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/profile.h>
@@ -27,6 +28,7 @@ enum ipi_message_type {
 	IPI_CALL_FUNC,
 	IPI_CPU_STOP,
 	IPI_IRQ_WORK,
+	IPI_TIMER,
 	IPI_MAX
 };
 
@@ -176,6 +178,12 @@ void handle_IPI(struct pt_regs *regs)
 			irq_work_run();
 		}
 
+#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
+		if (ops & (1 << IPI_TIMER)) {
+			stats[IPI_TIMER]++;
+			tick_receive_broadcast();
+		}
+#endif
 		BUG_ON((ops >> IPI_MAX) != 0);
 
 		/* Order data access and bit testing. */
@@ -192,6 +200,7 @@ static const char * const ipi_names[] = {
 	[IPI_CALL_FUNC]		= "Function call interrupts",
 	[IPI_CPU_STOP]		= "CPU stop interrupts",
 	[IPI_IRQ_WORK]		= "IRQ work interrupts",
+	[IPI_TIMER]		= "Timer broadcast interrupts",
 };
 
 void show_ipi_stats(struct seq_file *p, int prec)
@@ -217,6 +226,13 @@ void arch_send_call_function_single_ipi(int cpu)
 	send_ipi_single(cpu, IPI_CALL_FUNC);
 }
 
+#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
+void tick_broadcast(const struct cpumask *mask)
+{
+	send_ipi_mask(mask, IPI_TIMER);
+}
+#endif
+
 void smp_send_stop(void)
 {
 	unsigned long timeout;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
