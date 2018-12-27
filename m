Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30BAC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:19:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 946AA214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c3nn1DSU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="OCTZqQNw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 946AA214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gRZw3fmV73hMeGQI5RJK4WG1yRw6ICDqsfs7iA/EMp0=; b=c3nn1DSUZPH1twrvR4jGa33rZ5
	leybuLvAGOcquCWJWPcfPPlSSqcrnRykq7j1IP4fzjtD+YYgIgVKZNA/iSndDqtWwOhtBGH85PQx6
	sd3yKoFd0YXe+wQ5+OggtJDF1JttRsNb+Uhz+rEEFPvjBw2+k5egoo88xBURf9CSceDeHTFPE8h0d
	VMklEzBrqL7Av9xCSDryiTF3pXHZ8zfJz/biCjlUa9ygrG1Gj7SIdDaBTsOdmtdtSJerv3ExcYmpl
	rTEnmBwR4RiYApkjtHAdLRS4S2LyetN61bbefDjeOW8DLk2pqxOm0PydHP66/40j5okpR5Eaon65K
	A25tzswA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcTh6-00021I-KB; Thu, 27 Dec 2018 11:19:16 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcTh3-0001u2-Ux
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 11:19:15 +0000
Received: by mail-pl1-x643.google.com with SMTP id e5so8673209plb.5
 for <linux-riscv@lists.infradead.org>; Thu, 27 Dec 2018 03:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BlKwaKedPU8kFUHvmSJlIsJdtI4hfi1jlcbkI/tlo30=;
 b=OCTZqQNw7DV07aIFDKDv0z0AYosGSiDht8YH4GvU2kpz3CNiBL+UEJve4odddSgz35
 HrTMmLW7DcyUNFmnUtJIiREORENznhqnrhSyctrNA2Gzw1eRj9zlmLdal+kAee3g2Mi0
 8koCENIcjxuI3FQLdwBnz7OxfIyopKmhYKbALeghp1kNVCssCGtc9AxO4BPTxNU1ra7D
 QECsDLI5Jtj+LpBmGH1muNPr3+VKncfNB2yy39ksn2AWT9QLUDynhzA9hPWmq0a83lW6
 2OG2AAiIigPqTOF0/TxtCc0RPRem9mzLXErLwIw2YHo/pypng3bXFP9yQAeOnxAXQXPc
 SVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BlKwaKedPU8kFUHvmSJlIsJdtI4hfi1jlcbkI/tlo30=;
 b=jf3pwdCXY+v+IsDwLnmx6IbqekhIoul8wlguuWzyyBEqm5tnpfkiccV8JftUPnD6Zm
 7GuozvhhdgtKj6+FvfBYyc7a//bTN4ALWftrnvHEUqMWGzKzwndwMItYofphzE856at2
 V7YOBMd8GlAX8+KtqQVpSTgsruvfF/UtzH/ghfW6wLzUjsYvl37FzHXDpPxAZ3neYXQf
 6E4wne1Qr+dDdMTugruEJaK6WCy3qf1v7jOit1FNH/Ys6rxst2Ab0rhOa3vSD2lmxT8p
 0ttM2ee4gaHGssR42TXnM0DwD8eGaVRwoMz+NOzvkzVCz8iC2RCPReiU20Ljagpf+w2x
 hlIw==
X-Gm-Message-State: AJcUukdfKt74S6in55xwUoUoFKnwXnO5+VfQ+/ieo5+8fX7D1eX1kIZB
 gyiIqM7KxBD8cZAcaZn3rW+kTA==
X-Google-Smtp-Source: ALg8bN7sjGQs3LKy6zrCEASgCguLw8wUXkjefkp68QsylfpBG8VNUiOfuEzhxPFjK2ZB841oYMe6qw==
X-Received: by 2002:a17:902:6a4:: with SMTP id
 33mr22737414plh.99.1545909543048; 
 Thu, 27 Dec 2018 03:19:03 -0800 (PST)
Received: from localhost.localdomain ([106.51.18.57])
 by smtp.gmail.com with ESMTPSA id u137sm66830105pfc.140.2018.12.27.03.18.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Dec 2018 03:19:02 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v4 5/5] irqchip: sifive-plic: Implement irq_set_affinity() for
 SMP host
Date: Thu, 27 Dec 2018 16:48:21 +0530
Message-Id: <20181227111821.80908-6-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181227111821.80908-1-anup@brainfault.org>
References: <20181227111821.80908-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181227_031914_014576_26F4F274 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently on SMP host, all CPUs take external interrupts routed via
PLIC. All CPUs will try to claim a given external interrupt but only
one of them will succeed while other CPUs would simply resume whatever
they were doing before. This means if we have N CPUs then for every
external interrupt N-1 CPUs will always fail to claim it and waste
their CPU time.

Instead of above, external interrupts should be taken by only one CPU
and we should have provision to explicitly specify IRQ affinity from
kernel-space or user-space.

This patch provides irq_set_affinity() implementation for PLIC driver.
It also updates irq_enable() such that PLIC interrupts are only enabled
for one of CPUs specified in IRQ affinity mask.

With this patch in-place, we can change IRQ affinity at any-time from
user-space using procfs.

Example:

/ # cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
  8:         44          0          0          0  SiFive PLIC   8  virtio0
 10:         48          0          0          0  SiFive PLIC  10  ttyS0
IPI0:        55        663         58        363  Rescheduling interrupts
IPI1:         0          1          3         16  Function call interrupts
/ #
/ #
/ # echo 4 > /proc/irq/10/smp_affinity
/ #
/ # cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
  8:         45          0          0          0  SiFive PLIC   8  virtio0
 10:        160          0         17          0  SiFive PLIC  10  ttyS0
IPI0:        68        693         77        410  Rescheduling interrupts
IPI1:         0          2          3         16  Function call interrupts

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 44 ++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 24c906f4be93..47da70795145 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -83,29 +83,58 @@ static void plic_toggle(struct plic_handler *handler,
 	raw_spin_unlock(&handler->enable_lock);
 }
 
-static void plic_irq_toggle(struct irq_data *d, int enable)
+static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
 {
 	int cpu;
 
-	writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
-	for_each_cpu(cpu, irq_data_get_affinity_mask(d)) {
+	writel(enable, plic_regs + PRIORITY_BASE + hwirq * PRIORITY_PER_ID);
+	for_each_cpu(cpu, mask) {
 		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
 
 		if (handler->present)
-			plic_toggle(handler, d->hwirq, enable);
+			plic_toggle(handler, hwirq, enable);
 	}
 }
 
 static void plic_irq_enable(struct irq_data *d)
 {
-	plic_irq_toggle(d, 1);
+	unsigned int cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
+					   cpu_online_mask);
+	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
+		return;
+	plic_irq_toggle(cpumask_of(cpu), d->hwirq, 1);
 }
 
 static void plic_irq_disable(struct irq_data *d)
 {
-	plic_irq_toggle(d, 0);
+	plic_irq_toggle(cpu_possible_mask, d->hwirq, 0);
 }
 
+#ifdef CONFIG_SMP
+static int plic_set_affinity(struct irq_data *d,
+			     const struct cpumask *mask_val, bool force)
+{
+	unsigned int cpu;
+
+	if (!force)
+		cpu = cpumask_any_and(mask_val, cpu_online_mask);
+	else
+		cpu = cpumask_first(mask_val);
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	if (!irqd_irq_disabled(d)) {
+		plic_irq_toggle(cpu_possible_mask, d->hwirq, 0);
+		plic_irq_toggle(cpumask_of(cpu), d->hwirq, 1);
+	}
+
+	irq_data_update_effective_affinity(d, cpumask_of(cpu));
+
+	return IRQ_SET_MASK_OK_DONE;
+}
+#endif
+
 static struct irq_chip plic_chip = {
 	.name		= "SiFive PLIC",
 	/*
@@ -114,6 +143,9 @@ static struct irq_chip plic_chip = {
 	 */
 	.irq_enable	= plic_irq_enable,
 	.irq_disable	= plic_irq_disable,
+#ifdef CONFIG_SMP
+	.irq_set_affinity = plic_set_affinity,
+#endif
 };
 
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
