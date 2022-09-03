Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4A7ECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AumpImu/YLBg/D02TXaS4zDH251qRrKIImwwlu8f1wo=; b=Rv/d+u1Gfeweqz
	p+mT0iLW8PrU5vhyvMwlls7+8HYur56MGh4unG+Ppz4atwyteGwdhCCKR1vXy5zj7WaNIGs3Ifcce
	VSod9NlCryMZSBdulTGBt8Hl8kuMeSzA1LR+b8PDeFVBzXit/y3Kuhrp+AUp5L9gl/8VrzI8hsimj
	T9PwDF3vWs/F5pAMjRsl5iDXhkPa1FAB1IZX7+Fomi5a30uQVuJ3srN1H33MzYvxlfLeZCSbxe6kY
	a5WkuNtRUqK1TohlJG4+lQ/+l39/bKYHaUllYYPFKy6smJoWFxinNxMNCTmxngI3E9HyAqKjdAnIi
	t7Kpp7wFcZJpIcfnjmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUWAK-00DjsY-TU; Sat, 03 Sep 2022 16:38:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUWAH-00DjqB-MO
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 16:38:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3363460A47;
	Sat,  3 Sep 2022 16:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71876C433D7;
	Sat,  3 Sep 2022 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662223113;
	bh=kkU88ruHZB/3z5MRfFsNgiX+HAQDk+V3gAcd/JsO0+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V8XnIC0r0bcarId5VzdVbkRlr7RFqTBlvRUb9R09OAvUMk1XTmuCvbHwLTOuS+3oF
	 rs9SeRyzFpg3OCeFLZX2mZaVLrdc/Ru/apJanGXXUMlpIDMxNj0ZPQqXelszDS3525
	 Kh1tYFpmuVZImtQlWHFwyGKggSKQajtbX8YXCTBMxHkyiIxIktzMqhutTv8ivWQP9U
	 4spvQz+be7CzBZ2dZg/fm2YZrgnY2tNSyPAtWJ7tEtRYNYibmI4KbvFEMvU/Y1yNil
	 7WGMpVn3h1EBFdzrkU3B8jrK2QB2I0vtvvhUYCLlbCoUNZx5ACYwSFk0qAeOh8d0EE
	 vUleH5KCQK3Dg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 3/3] riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
Date: Sat,  3 Sep 2022 12:38:08 -0400
Message-Id: <20220903163808.1954131-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220903163808.1954131-1-guoren@kernel.org>
References: <20220903163808.1954131-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_093837_793518_0798A043 
X-CRM114-Status: GOOD (  12.22  )
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
---
 arch/riscv/Kconfig      |  7 ++++---
 arch/riscv/kernel/irq.c | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8a12b4ba1a9..da548ed7d107 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -434,12 +434,13 @@ config FPU
 	  If you don't know what to do here, say Y.
 
 config IRQ_STACKS
-	bool "Independent irq stacks"
+	bool "Independent irq & softirq stacks"
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
index eec5c38100b6..282acfee7304 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -38,6 +38,21 @@ static void init_irq_stacks(void)
 		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
 }
 #endif /* CONFIG_VMAP_STACK */
+
+#ifndef CONFIG_PREEMPT_RT
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
+#endif /* CONFIG_PREEMPT_RT */
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
