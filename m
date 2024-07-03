Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F98DC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 07:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ax2mYomffaJbOLbsKoo4yoKy3HXyIMo+9aBj3uN2vQ=; b=z4uCw1gZyCqwmT
	mKrFl8lXWMHQK1bjiJ+nkcMI6RGwnNAbp+BAdQJwT9Ul3xnvUc/As6U2r71uPY60pfAdPfw9S1Mea
	WAOvn+HF6Lu7RfZL6kVfWkVhoRa02s42swUffC5P1cwCW+FwEGneRXw68SIkAZBE8PnxvvtM5sebg
	IhSrzE5+mgnLqyTQ9NNdbmgli9q6JucNdHMXlv3Z6iJVAPv8KeAd2OWp7SH8hburZJoIMY1HznO+K
	R0lFsunCfYPO0yILv/Hy75MQjz9Ax8cCvTLqF97jNzk4ee9WHF2cQWhAhs4oE7ovM9RQGgCdnu96P
	9E4CcTxRYMp93rnF32cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuOf-00000009KRL-25L6;
	Wed, 03 Jul 2024 07:27:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuOb-00000009KQ7-0n13
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 07:27:20 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719991632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MRcJPtwAugYmLwEOwHvkFNkj81DmVpTFKEzVl8DhqJA=;
	b=cWCUWJREPkgjz37I6P43j3hFhZiohMBVz1GQbLrPDZnFfwz4OhL8sRSHHNUVvqbenZUhQk
	DFmNoElj7rVxYLBoNenv8g+uQ9C30Hr3r/AOLX3LrfW43KJhk1gydRHLt4ar6+wyxsgpeg
	XqjytzayiC6s1QnhNV9yWmoJYP1YrXwvNEVb5PEsD2GBFkUEhZxCRRr9Y/QT8pkHHfSeEw
	xkRhFYjnwtUshJhQBoQULnjmOEcKIYjflpYh7UJkN2Zt2s4jSZVhRfErJIoMhWh7poqVvR
	nHizDL/udwwRD1QJSzVDz9icxEsPb9mR8wBV1OE2F3ilvveMUyPTTQBYjihpNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719991632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MRcJPtwAugYmLwEOwHvkFNkj81DmVpTFKEzVl8DhqJA=;
	b=VfecQw4BTpl4G88MXoxRxCmbv0R/oY7OVgFVy++xzFwQ0gAjrd6gCE2wvuMsU0+CHfauGK
	g7e5fp+5fuxt/PBA==
To: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: b.spranger@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Anup Patel <anup@brainfault.org>,
	Christoph Hellwig <hch@lst.de>,
	Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH] irqchip/sifive-plic: Fix plic_set_affinity() only enables 1 cpu
Date: Wed,  3 Jul 2024 09:26:59 +0200
Message-Id: <20240703072659.1427616-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_002717_531401_0EE271EF 
X-CRM114-Status: GOOD (  11.95  )
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

plic_set_affinity() only enables interrupt for the first possible CPU in
the mask. The point is to prevent all CPUs trying to claim an interrupt,
but only one CPU succeeds and the other CPUs wasted some clock cycles for
nothing.

However, there are two problems with that:
1. Users cannot enable interrupt on multiple CPUs (for example, to minimize
interrupt latency).
2. Even if users do not touch SMP interrupt affinity, plic_set_affinity()
is still invoked once (in plic_irqdomain_map()). Thus, by default, only
CPU0 handles interrupts from PLIC. That may overload CPU0.

Considering this optimization is not strictly the best (it is tradeoff
between CPU cycles and interrupt latency), it should not be forced on
users.

Rewrite plic_set_affinity() to enable interrupt for all possible CPUs in
the mask.

Before:
$ cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 10:       2538       2695       3080       2309  RISC-V INTC   5 Edge      riscv-timer
 12:          3          0          0          0  SiFive PLIC 111 Edge      17030000.power-controller
 13:       1163          0          0          0  SiFive PLIC  25 Edge      13010000.spi
 14:         60          0          0          0  SiFive PLIC   7 Edge      end0
 15:          0          0          0          0  SiFive PLIC   6 Edge      end0
 16:          0          0          0          0  SiFive PLIC   5 Edge      end0
 17:          0          0          0          0  SiFive PLIC  78 Edge      end1
 18:          0          0          0          0  SiFive PLIC  77 Edge      end1
 19:          0          0          0          0  SiFive PLIC  76 Edge      end1
 22:        796          0          0          0  SiFive PLIC  32 Edge      ttyS0
 23:          0          0          0          0  SiFive PLIC  38 Edge      pl022
 24:       9062          0          0          0  SiFive PLIC  75 Edge      dw-mci
 25:          0          0          0          0  SiFive PLIC  35 Edge      10030000.i2c
 26:          0          0          0          0  SiFive PLIC  37 Edge      10050000.i2c
 27:          1          0          0          0  SiFive PLIC  50 Edge      12050000.i2c
 28:          0          0          0          0  SiFive PLIC  51 Edge      12060000.i2c
IPI0:       118         98         88        138  Rescheduling interrupts
IPI1:      2272       1910       3758       3200  Function call interrupts
IPI2:         0          0          0          0  CPU stop interrupts
IPI3:         0          0          0          0  CPU stop (for crash dump) interrupts
IPI4:         0          0          0          0  IRQ work interrupts
IPI5:         0          0          0          0  Timer broadcast interrupts

After:
$ cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 10:       2539       2734       2295       2552  RISC-V INTC   5 Edge      riscv-timer
 12:          2          1          0          0  SiFive PLIC 111 Edge      17030000.power-controller
 13:        643        194        368         75  SiFive PLIC  25 Edge      13010000.spi
 14:          6         22         19         27  SiFive PLIC   7 Edge      end0
 15:          0          0          0          0  SiFive PLIC   6 Edge      end0
 16:          0          0          0          0  SiFive PLIC   5 Edge      end0
 17:          0          0          0          0  SiFive PLIC  78 Edge      end1
 18:          0          0          0          0  SiFive PLIC  77 Edge      end1
 19:          0          0          0          0  SiFive PLIC  76 Edge      end1
 22:        158        254        226        207  SiFive PLIC  32 Edge      ttyS0
 23:          0          0          0          0  SiFive PLIC  38 Edge      pl022
 24:       2265       2250       1452       2024  SiFive PLIC  75 Edge      dw-mci
 25:          0          0          0          0  SiFive PLIC  35 Edge      10030000.i2c
 26:          0          0          0          0  SiFive PLIC  37 Edge      10050000.i2c
 27:          0          0          0          1  SiFive PLIC  50 Edge      12050000.i2c
 28:          0          0          0          0  SiFive PLIC  51 Edge      12060000.i2c
IPI0:        92        118        116        120  Rescheduling interrupts
IPI1:      4135       2653       2170       3160  Function call interrupts
IPI2:         0          0          0          0  CPU stop interrupts
IPI3:         0          0          0          0  CPU stop (for crash dump) interrupts
IPI4:         0          0          0          0  IRQ work interrupts
IPI5:         0          0          0          0  Timer broadcast interrupts

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/irqchip/irq-sifive-plic.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 9e22f7e378f5..f30bdb94ceeb 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -163,20 +163,19 @@ static void plic_irq_eoi(struct irq_data *d)
 static int plic_set_affinity(struct irq_data *d,
 			     const struct cpumask *mask_val, bool force)
 {
-	unsigned int cpu;
 	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
+	struct cpumask new_mask;
 
-	if (force)
-		cpu = cpumask_first_and(&priv->lmask, mask_val);
-	else
-		cpu = cpumask_first_and_and(&priv->lmask, mask_val, cpu_online_mask);
+	cpumask_and(&new_mask, mask_val, &priv->lmask);
+	if (!force)
+		cpumask_and(&new_mask, &new_mask, cpu_online_mask);
 
-	if (cpu >= nr_cpu_ids)
+	if (cpumask_empty(&new_mask))
 		return -EINVAL;
 
 	plic_irq_disable(d);
 
-	irq_data_update_effective_affinity(d, cpumask_of(cpu));
+	irq_data_update_effective_affinity(d, &new_mask);
 
 	if (!irqd_irq_disabled(d))
 		plic_irq_enable(d);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
