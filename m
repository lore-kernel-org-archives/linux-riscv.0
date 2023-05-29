Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CC1C7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEFWOApWmVh2TX8icvg47eJe/ThU7rBZHaWkvCh4/KM=; b=vgAJOxNazSqpHU
	MWto3/umuyYReb0cRUaC5td4DwlKRBrKtiL657LPA4UdK/2XagjX6TD/i40arrVUOpW8iE6scbPjB
	WFn4Hhsmn0cvWwKaKclbIyuA6QDjIDTpdHOsg/TUwTlSsd+K+QhMR4tA5dK3DdbB6F+lSrSluUqGp
	uJprfGYaZ7a1VKgIGDa3CJfhjnxh5dx3Xgz7kSAxdirlP0zuzzBCMWkWUDCXKFSsiobK0SsPgK4w7
	8+dYKIJhzDpPQMqkSo55mQ+2pbmudAMPbdr/h/lntartTh5uJgzBTWF3Xpm+k7TbhoJh0Rl/4KJAY
	9Zq6mAhq9Xwv3UCsGYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YWS-009kwK-0q;
	Mon, 29 May 2023 08:46:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YWP-009kuf-1W
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 08:46:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 082FF612FF;
	Mon, 29 May 2023 08:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7D3C4339B;
	Mon, 29 May 2023 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685349992;
	bh=jf544nMnrrkzn5ADVC/f/s+6Ap+dr5yU1BPKr7SBhq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDjZXxBrOIUdx5H1DZTFEzfLDMa1t+veVdiUgBDWwZqMjzcdlM6Ek5DC0G0nNdl8f
	 ImhvVBzWx96T6OQWkxfzvp/geEkhoMtDCk22mvh0dN6FDDqNvN8GJBIdYdL/qFVLJq
	 393Y+zXnIvccrtKjACGF45lrJMQMSM4mtU0oNrCwebKX+UikJ5I6VRLnqAZnXLhpgW
	 sWARuJJg8x4JUHgo+5FJyiOeP5K03W+rGilBRq5BpharrxABq4lgfj8GL3b45f7t04
	 K1+TBOKtVmyWkMKD5AiJ6rHU9f5mmeFV6v8uLUPztEnUJjg7dwdNX26pHycO3Gq/xy
	 ExopRPRK10RPg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	paul.walmsley@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V12 2/3] riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK
Date: Mon, 29 May 2023 04:45:59 -0400
Message-Id: <20230529084600.2878130-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230529084600.2878130-1-guoren@kernel.org>
References: <20230529084600.2878130-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_014633_592285_2E228C16 
X-CRM114-Status: GOOD (  14.75  )
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

Add the HAVE_SOFTIRQ_ON_OWN_STACK feature for the IRQ_STACKS config, and
the irq and softirq use the same irq_stack of percpu.

Tested-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig      |  6 ++++--
 arch/riscv/kernel/irq.c | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 44b4c9690f94..9567bf5fd5ed 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -589,11 +589,13 @@ config FPU
 	  If you don't know what to do here, say Y.
 
 config IRQ_STACKS
-	bool "Independent irq stacks" if EXPERT
+	bool "Independent irq & softirq stacks" if EXPERT
 	default y
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
+	select HAVE_SOFTIRQ_ON_OWN_STACK
 	help
-	  Add independent irq stacks for percpu to prevent kernel stack overflows.
+	  Add independent irq & softirq stacks for percpu to prevent kernel stack
+	  overflows. We may save some memory footprint by disabling IRQ_STACKS.
 
 endmenu # "Platform type"
 
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index a1dcf8e43b3c..d0577cc6a081 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -11,6 +11,9 @@
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <asm/sbi.h>
+#include <asm/smp.h>
+#include <asm/softirq_stack.h>
+#include <asm/stacktrace.h>
 
 static struct fwnode_handle *(*__get_intc_node)(void);
 
@@ -56,6 +59,38 @@ static void init_irq_stacks(void)
 		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
 }
 #endif /* CONFIG_VMAP_STACK */
+
+#ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
+void do_softirq_own_stack(void)
+{
+#ifdef CONFIG_IRQ_STACKS
+	if (on_thread_stack()) {
+		ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id())
+					+ IRQ_STACK_SIZE/sizeof(ulong);
+		__asm__ __volatile(
+		"addi	sp, sp, -"RISCV_SZPTR  "\n"
+		REG_S"  ra, (sp)		\n"
+		"addi	sp, sp, -"RISCV_SZPTR  "\n"
+		REG_S"  s0, (sp)		\n"
+		"addi	s0, sp, 2*"RISCV_SZPTR "\n"
+		"move	sp, %[sp]		\n"
+		"call	__do_softirq		\n"
+		"addi	sp, s0, -2*"RISCV_SZPTR"\n"
+		REG_L"  s0, (sp)		\n"
+		"addi	sp, sp, "RISCV_SZPTR   "\n"
+		REG_L"  ra, (sp)		\n"
+		"addi	sp, sp, "RISCV_SZPTR   "\n"
+		:
+		: [sp] "r" (sp)
+		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
+		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
+		  "memory");
+	} else
+#endif
+		__do_softirq();
+}
+#endif /* CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK */
+
 #else
 static void init_irq_stacks(void) {}
 #endif /* CONFIG_IRQ_STACKS */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
