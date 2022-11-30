Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC1DC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 03:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CI0ZlBo3ARsiUkPnf1WnlOHSLMEKVf/D4yNq8LaXlU=; b=WXBopFhAEyoxCq
	4Z3FrBfUjR3flSCG/qN+ma6YcGl/KOTUaXjR93zZlAbvnVA+WJOW8sBb+ORegd1MYIJxKPKYQO2/4
	I/anZJ6HxxIECunxk83oF3XF5k4AzLIekZ2ZFrdhvkpryH7ZTjOmkNP1auJX7bKC/lXCUsMhfgC5X
	POIz2uNpRhEWMQNmrlJxcfB1OrT9THLynrBbKPY0OwF7k5AaNZ7zOv7nXplZv3VKz2trofbEIIONA
	T/ptcDyxbIQrQR+yYlPWm5cFK8S+CfkAjtOUWMbYaZTiqTWsdsmlSVmz7x+woyzpx32zHLTAUnKan
	YQPZFXPYCiTWTL+KLh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0E02-00CerA-CA; Wed, 30 Nov 2022 03:43:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Dzy-00Cemr-BB
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 03:43:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E4605B819FC;
	Wed, 30 Nov 2022 03:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC79C433D7;
	Wed, 30 Nov 2022 03:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669779779;
	bh=LkmHPwyg5AHgsnlnySZigQWgA50amndJsxUL70mm6Oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j30TQDDrhpuHNiOp7vSJZapkItKWEkMy4nD1ayO6InfFSwiubyjcvBhjO7iX/bXC7
	 vwdbZT8DEnxZRM5FK0YEVrA7AuQSLAv5sDCTl627jgbmoJilplqp+ee7scQRfJAsTQ
	 MzNxPjMPhPMCTC22dQHJ+5o8c9YeTss2Ns7DuOwvK50Naz1GFECszcmRvwymMaxob9
	 JTGrYLwNEbPOC3BMpqXU0kgaiFbGmsrwc8hwpBrhsxCh8RO0qd04hbTI4vi10Ivm7t
	 1xMbWouFbGyPZOZqS1uMn+Nuu2O2xlPoTQw4RvUoHPtRQ1binklq6XPz/YbxSfYjfK
	 qyb261txv3UnQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V9 08/14] riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
Date: Tue, 29 Nov 2022 22:40:53 -0500
Message-Id: <20221130034059.826599-9-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221130034059.826599-1-guoren@kernel.org>
References: <20221130034059.826599-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_194302_742599_52E784EA 
X-CRM114-Status: GOOD (  14.36  )
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

Add the HAVE_SOFTIRQ_ON_OWN_STACK feature for the IRQ_STACKS config. The
irq and softirq use the same independent irq_stack of percpu by time
division multiplexing.

Tested-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig      |  7 ++++---
 arch/riscv/kernel/irq.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2653a381cc62..85241415a935 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -446,12 +446,13 @@ config FPU
 	  If you don't know what to do here, say Y.
 
 config IRQ_STACKS
-	bool "Independent irq stacks" if EXPERT
+	bool "Independent irq & softirq stacks" if EXPERT
 	default y
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
+	select HAVE_SOFTIRQ_ON_OWN_STACK
 	help
-	  Add independent irq stacks for percpu to prevent kernel stack overflows.
-	  We may save some memory footprint by disabling IRQ_STACKS.
+	  Add independent irq & softirq stacks for percpu to prevent kernel stack
+	  overflows. We may save some memory footprint by disabling IRQ_STACKS.
 
 endmenu # "Platform type"
 
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 5d77f692b198..a6406da34937 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -11,6 +11,7 @@
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 #include <asm/vmap_stack.h>
+#include <asm/softirq_stack.h>
 
 #ifdef CONFIG_IRQ_STACKS
 static DEFINE_PER_CPU(ulong *, irq_stack_ptr);
@@ -38,6 +39,38 @@ static void init_irq_stacks(void)
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
