Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2820EC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AqCGRA5H9ilzMA23l6xKmpNJ66jAvwRDX/zn2LN5NvI=; b=uJMUA2DAzZ0Kyk
	9todv/winZPWrurfxFQszXey35DBSm+eCeEvYLjsPH3CjS2e2eoDhuwiC5PhFQDH1c9j/L7BrN7lG
	OYmXdi3xwemZ9ef2Cc8/6aFVfv9b7OXCkCM79tiaYFsYi1WYgmo1SJdKmM9Vpa1tTGIrduCK/KDPf
	qi5ghssDFMK4l34aucddGwAwKhYlv8CEy8fhZZqmJbT1mFpCn02q72BJyhr/5UjWfM4eNslZFKzNm
	EJjS8dJc3WrOF8tiM9LgPZpBtTFXEEUaQJex82m2sLQfiUZLYu2YYPnU3RqUecwj4xHS1+gi1UG62
	fgjLaX7BAGPt4lNOW+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welOI-00000000Z5e-3voW;
	Wed, 01 Jul 2026 03:13:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welOH-00000000Z5Y-3NF4
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 03:13:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F0FC436FF;
	Wed,  1 Jul 2026 03:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03391F000E9;
	Wed,  1 Jul 2026 03:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782875613;
	bh=0IYbLhaDKGrOgLQH0RlnBWUYYp7rsPIN/uj5DCWF0ps=;
	h=From:To:Cc:Subject:Date;
	b=VnYtJGCKC+VQnhRJnOTOxij39OLFLEWlpkIoEfLQ9khAwTGR35l/fkSaOPhdtNpoR
	 IuDRUirEh2Z9yiCKRHN13iomRgs+YXio48uRBugDOtiaSRKd9IzKWhFx4VwLBs2LxB
	 /04OANhDNep741QhQSpZ9tUt3k8nKyO6e1ea250K9qpMmwYecoD/NA5sroUjeWII5p
	 YQ3F4MQa6VD50cQbXRL3+8C1YU/0OJfwE+6NkztWF8K0RAQ979l85n4U7nRa76fu2J
	 W0tOv4hSsHJN8Tsszxh22PUwcnlnPox0bZdqMKTFK0CC+R+GkDWKKNnrJdWiLphDdN
	 4sj50SrU33V1g==
From: Guo Ren <guoren@kernel.org>
To: guoren@kernel.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	chenhuacai@loongson.cn,
	jelonek.jonas@gmail.com,
	jiayuan.chen@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rostedt@goodmis.org,
	samuel.holland@sifive.com,
	stable@vger.kernel.org,
	tglx@kernel.org,
	tsbogend@alpha.franken.de
Subject: [PATCH] riscv: smp: Invoke cpu_ops->cpu_stop() in ipi_stop() for hotplug
Date: Wed,  1 Jul 2026 03:13:22 +0000
Message-ID: <20260701031322.1018667-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

When a CPU receives an IPI stop during hotplug teardown, the
platform-specific cpu_stop() callback should be called before
spinning in wait_for_interrupt(), so that firmware (e.g. SBI HSM)
is notified that the hart has stopped.

This aligns ipi_stop() with the existing behavior of
ipi_cpu_crash_stop(), which already calls cpu_ops[cpu]->cpu_stop()
under CONFIG_HOTPLUG_CPU.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kernel/smp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..95aa11a0e590 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -82,6 +82,12 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 static void ipi_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
+
+#ifdef CONFIG_HOTPLUG_CPU
+	if (cpu_has_hotplug(cpu))
+		cpu_ops->cpu_stop();
+#endif
+
 	while (1)
 		wait_for_interrupt();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
