Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F5FC61CE4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:57:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A47E72086D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iume7Vlc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rBGDm4uR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A47E72086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Rxjsi4KJprJVdSH8P88Vk9dwrr0ddxOd31Oem5ozUCQ=; b=Iume7VlcBdtaepLIgUjXnNGJi6
	u1iWT1NHZoTa96ANAkbVGA5WhJ1OR95cRfMJKexQTqBEWJ2f8kxkQLU3sbyyjuofrEVRFLfb9Qg6n
	udVtWDCiUUllgxk+WKeV6ltu0Mk7qASNlUGfLzH9WSBT+6zFt8/but7sth/zc0QkgaqFdzl48I11+
	e0dgq2zRD2Dr8jlLA+R4tIXEERxSod40kTDS5rGSV6GFYgjSOMbXQ1xi8FDS7GCLmpnxTM3h8pwAD
	a41oN12rBBOjq2vTCezbU8E1Klhjm+LFiy5UH/+nEK6DxjCcjEEBw4q29Mfcn+avxIVEEHWBhf5s0
	wYrNMM3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkjdH-0003Zo-Mr; Sat, 19 Jan 2019 05:57:27 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkjdF-0003Z0-6f
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:57:26 +0000
Received: by mail-pl1-x643.google.com with SMTP id w4so7287105plz.1
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CjZIBVEjqmdShbw4sLzqrHILGuR+HGi+gie0rBXNKAc=;
 b=rBGDm4uR5MsMj4AVHwedS1S8fZWjCWGgE/axmXhYebfnuSRUr/kZ24MZPJgiXKeoLr
 mQ9tSSrg7kno7tuZbA1jK3fz6/DuZdXCStw7nsuEr9dVdhbemRWNvN4hcbkwD99zmds2
 hZiQp0CtzXBfZIE7wJVPSPtolYA/Gpnu2OCZLNoOP/Ds/kGpAnDKjpbS1DX3gabyX0z6
 BO/45ETnAB8Gu6iDoWdigvkApfiSuQAbrHdKGgB8VM/No3BZje2eRF1kO5fw//68Tgno
 B52mVQp6kdFVsMPBZ0fS6JFnEnG0MdCuNAqTYlGMHRtG11rWVGCJ4PX8STEo4u+IDh9e
 AWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CjZIBVEjqmdShbw4sLzqrHILGuR+HGi+gie0rBXNKAc=;
 b=VRd2G4ZaixKLK92TggFrda2CSaHjb8yG1hLc7Bymn7cVfyXce/9B1BVwYQwZsACXnD
 qXr9kW3ajd7M6IPjx3LWd487O2B0iWSKGTrhFv9AKA3Lkj379bUSdBYAkWwNtDwKHjA/
 u1seTHbzlCg/WMTywHINYSaubfSiCA6SNo6eeenKanT2OQcHGNmu4iRPoTjSdP1AEd8i
 DFrS3ddg4TY9z1l4B9Et4xByMH2CCawYkIcm4Uhfw15HaGG74yET25QSO+D+IAovm37+
 SI0BPJi4FNnuPHDntdxh5nAVZ4ZU+NfbDsPEfqC8po3UGVbmQqhDgoG/SoWWcxqdA+Kr
 OtBg==
X-Gm-Message-State: AJcUukcfwnnztmUX3j9ac/uOGBPj8mxaZyTqrnI95Y5hSm/9AU/8yK5l
 MSgiP8id49v0T2LXgLpPdDaJWQ==
X-Google-Smtp-Source: ALg8bN4pAQmq9qeZTy/18Z5B+okIFRCgQ/SRHTp6JCBZWsGQ10lNn4bWZRRPbOeAxn5h6BSM3+kPiA==
X-Received: by 2002:a17:902:29ab:: with SMTP id
 h40mr21767170plb.238.1547877444212; 
 Fri, 18 Jan 2019 21:57:24 -0800 (PST)
Received: from localhost.localdomain ([49.207.51.221])
 by smtp.gmail.com with ESMTPSA id c7sm9295535pfh.18.2019.01.18.21.57.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 21:57:23 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v5 5/5] irqchip: sifive-plic: Implement irq_set_affinity() for
 SMP host
Date: Sat, 19 Jan 2019 11:26:25 +0530
Message-Id: <20190119055625.100054-6-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190119055625.100054-1-anup@brainfault.org>
References: <20190119055625.100054-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_215725_240336_6707823A 
X-CRM114-Status: GOOD (  14.21  )
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/irqchip/irq-sifive-plic.c | 44 ++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 24c906f4be93..e04a862c2cfb 100644
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
+	if (force)
+		cpu = cpumask_first(mask_val);
+	else
+		cpu = cpumask_any_and(mask_val, cpu_online_mask);
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
