Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56480C32771
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqfcYqAdHYchboOgVq4uzndqy3+pZLrby2vqcRCVih0=; b=12tOvBxMBeE0wV
	rWzEX28pBe9iFtB6sVfoRAfmZQY/sGAOjXR8JQchUlQ19PdgjF6N+aq5EEZJLptXObpYY07TdTZ1O
	tQ728cZH+FCFT5oemplqfqFJDOav8sT/RKwn1tx44k6qQAGEheg0fRhm2AdGe14XO75KrVn/7LwGz
	iADXiieXtr9nkou+g2idKyQBA9fsCOKZe+OFELoer4Vf0bkKv6ZmZyn/ruIj5nooCazXN+9F6dia7
	wKqGkhHfMQIAMcgG5z/G1cK9hNZ4DepVV0WGfkgwL/yC58Mw92mOukh0FQWJ140S1shVm60nzuTwA
	czVIB0yTySODQLL0Iggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwc9-000GYe-29; Sun, 18 Sep 2022 15:53:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwc4-000GT1-QO
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 15:53:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F2FA615B8;
	Sun, 18 Sep 2022 15:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FD2C433D7;
	Sun, 18 Sep 2022 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663516423;
	bh=29zlGuT1X5r9cCKTt+R7SgdGZDrIKH77ZOPWMnBYqHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F1wMe3TR+hYRxAHDIDnacSVI1BoGGJAtPQgC54014hqyn6ouoNjiaeiFas3/fOVas
	 Q6JsJqxMhkNg6U3zGWrJ3b5g+iApR0lFfCAM83fi77fdYM7fhL3zNYoZgEyfp/y30v
	 Pkn3oyzcD5IKnF8EqtsixCwS6twrekc3x0aO0NEVjBjqb2QEsxvs0H2zK+jiP7AsRv
	 bieP/cvbOrhDpTupJHYA7HZlNJYKhUlc547Ei27iY682Pd2RoQuMPLxcZfJlLbJO6l
	 UjapxECgFuntiBqMRiWY1VQHsWneYlpGK9OOkN5kS22hXI4E6qinUSm6rm3aqHW2h4
	 oOOyGZMJEwqGQ==
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
	David.Laight@aculab.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 09/11] riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
Date: Sun, 18 Sep 2022 11:52:44 -0400
Message-Id: <20220918155246.1203293-10-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220918155246.1203293-1-guoren@kernel.org>
References: <20220918155246.1203293-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_085344_941707_1D9EE5CC 
X-CRM114-Status: GOOD (  13.11  )
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

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/riscv/Kconfig      |  7 ++++---
 arch/riscv/kernel/irq.c | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 75db47a983f2..dfe600f3526c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -434,12 +434,13 @@ config FPU
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
index 5ad4952203c5..6dc9ccd01470 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -11,6 +11,7 @@
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 #include <asm/vmap_stack.h>
+#include <asm/softirq_stack.h>
 
 #ifdef CONFIG_IRQ_STACKS
 static DEFINE_PER_CPU(ulong *, irq_stack_ptr);
@@ -38,6 +39,21 @@ static void init_irq_stacks(void)
 		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
 }
 #endif /* CONFIG_VMAP_STACK */
+
+#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
+static void do_riscv_softirq(struct pt_regs *regs)
+{
+	__do_softirq();
+}
+
+void do_softirq_own_stack(void)
+{
+	ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id());
+
+	call_on_stack(NULL, sp, do_riscv_softirq, 0);
+}
+#endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
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
