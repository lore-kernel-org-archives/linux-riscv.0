Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D82EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjFOeNQ3RY7khZaLzD3e3ndoQG1ElWPo03aB3uzfFJs=; b=PvOMHX1RjIOVRl
	5XcDX3V0I8sreiQdjbiS0F1VetP/fF21K3ThsziQcIcbOOv9uDp4OiB36rNe1FzsdF4MWP7zGBazj
	IhsEbh3WanRfPNCkvQAQUuLiGjaRMkoC83MMEAmd56Wuazy2g27hEgmxNwvaFEAtIccEVhuWVYVhR
	6cVtSw78RQ/1B+de3Xij0rRELzgD1CRHUPBnh0mX0j/Xn4VMPYuPuMloUDSvYhnzTvBHssqWoPVSp
	IjHF1N9lLSkS51id/oMljl8RsNbbSkkEyXR2y0h2HcQeC30BdhbrhrpUtGYLcYWUheUisQmGIHKM/
	3sdXNB6ZXaUrMW1d/5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9FLI-009d72-1u;
	Wed, 14 Jun 2023 01:30:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9FLD-009d5p-2w
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 01:30:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58058619E3;
	Wed, 14 Jun 2023 01:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1C7C433C8;
	Wed, 14 Jun 2023 01:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686706230;
	bh=iT82mDfcbsJU8gzbcrM/NjkddpYqzVIJB0ER0mXt9RQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DItFaqVwyVZfghto0Bh8xCeovRtD/Z0suxiTAWh05dXsyaR2dSLivgDymyJm9TiNX
	 i2qiqsszBI+qmJYpHYnRYL+bBiXqqgq9uOyLlxFsqo3OmutVy3syO7RjjX+GPsX9V+
	 Tr36lIgYuP1sHknpDuBl52E8M63WcYOUT2za6yqxEYoKmC0v3T7jUvPqYWzDtMoIFC
	 7aLmq22dOSit3DBZMCcKalCkeE+4vRfqo+8bjjbl+x5ujIbvH27HHGu3rsVCEQ2aHL
	 I3QlA5dHTsPv2lQczF4tuWYQ3MPW1lAxOgAkWC9pATWeSPNQvObSVv7kJP4GxHf/df
	 sYPlZjGpYsU1w==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	bjorn@kernel.org,
	cleger@rivosinc.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V13 2/3] riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK
Date: Tue, 13 Jun 2023 21:30:17 -0400
Message-Id: <20230614013018.2168426-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230614013018.2168426-1-guoren@kernel.org>
References: <20230614013018.2168426-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_183032_047661_84ABF0CF 
X-CRM114-Status: GOOD (  13.54  )
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
index a8368fe7be14..f515cb101c19 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -591,11 +591,13 @@ config FPU
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
