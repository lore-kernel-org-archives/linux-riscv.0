Return-Path: <SRS0=qhrg=NC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66259C004D3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 12:04:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EC420652
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 12:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWsb87te";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="YsPyyxPd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35EC420652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8UZQM2XC9ogo708hPmMXrUb5iY9YJOvYXmZn6PQIUMM=; b=RWsb87teD+au/XC9z8OfFsV/1u
	VOOpCNwTlhoAAlbjmy42uiNpLX4dTuo1fULcZecVMvOX/KuIfDNqW4LLKiDs1TiiZgNGndTzr8G8e
	3gp+LI0fWxMcQOvHqpUXIsjqxlYbOcJ153oFDXoEtOlujpL8RHc8YXGftOdMYxagHusx0tG/YqrIq
	tFcSmUHbEz8g3Cwl9ursm7cjvFwMU/5cPOz9Qvnor8gj25YYHDkkyPesQPNW4wRHtVPiPTVuf42F3
	CEMpxFP0YpE2im5DBMbaG3apZgYoxdOtcadTsRb5FWlWXmXQENz7gTLyN/8vwLbe7PVRKjBwenXot
	35riw0zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gEYwU-0007cg-Nx; Mon, 22 Oct 2018 12:04:18 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEYwN-0007Vl-E8
 for linux-riscv@lists.infradead.org; Mon, 22 Oct 2018 12:04:15 +0000
Received: by mail-pg1-x544.google.com with SMTP id o14-v6so3210600pgv.7
 for <linux-riscv@lists.infradead.org>; Mon, 22 Oct 2018 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ilMbH1SeaC6uzJ9Hi4gKESHzVTgqGMWeA+QgYge5P6c=;
 b=YsPyyxPd+yZmkyL2ZyKc0VptbYk8GSOr/c/Re5KrjbQzulCB0sLSG3vM3MLwAS/cFW
 Q3OPrwUTC4I0hgcnKGfr7ppEAmi4vU1H4Q4SAK7MWNkosvcl93XeQAGxvnXBx7TPOlgE
 G5KlxGpswSMIajesJjcReNwmy3UkI45/lw/NkEiQQ07pJBWxOmlk/muEk8OVwfMyj7Wl
 WcMYNrerQy4hUwrhEECjibkC9VyTomkX0oYdlN8aaUeSMet4MAPF2dLWF8bEjpoI2aYs
 YWtfj65tO8Q1FNCA8kmnKHfx9MKPe876eekrhqB37JvMCQJMPKk0iJkp/yooDo9ayObX
 e3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ilMbH1SeaC6uzJ9Hi4gKESHzVTgqGMWeA+QgYge5P6c=;
 b=Rxjr/3F5h3h0PzbnqVggDsiNtyxUio4BeWDlRrUTlrTMna3AixwwI8pPUil0lCbemb
 BsZb2JU8uPTLAf7eRTCHl3dUv+CQf6hya5cY+FeLUDQGLoQxCXafu6nKqg3YjKMdf2YE
 UGXTclcnAXrQo9C/E36+JUZTTNJKqc+7aNLtE03ihkHnhJo+n3YutXI7DYZi7D6Q25sJ
 ubQB5HbWR5Bap/pgMqykMUBgiJyATdVKuhNtoCjagUiBQTm0htnudcbxGehpmrGMoJRT
 WSAyMmOHpPl6tazSfmWoHGOrAhJfo3egxCfT3E1/53G63QKDAqOhlC1hk3z4nzeW0ULo
 tTUA==
X-Gm-Message-State: ABuFfogs1dXDwM60UxetWiMXot4ZefiaKOjpaoNFFUzOaXNbk5d8Vvzy
 MhX7AskHD16g3m3OYD4UD7AwJw==
X-Google-Smtp-Source: ACcGV63uUsDrc+6E5Ps+AWf61WfD7l/QDkHew4oj+StB7qlEBJUfwmQ0UAJI78H7dyQ93MbCeOq8Wg==
X-Received: by 2002:a63:8c0b:: with SMTP id
 m11-v6mr43040215pgd.422.1540209840480; 
 Mon, 22 Oct 2018 05:04:00 -0700 (PDT)
Received: from anup-ubuntu64.dlink.router ([106.51.30.16])
 by smtp.googlemail.com with ESMTPSA id
 n79-v6sm55443405pfk.19.2018.10.22.05.03.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Oct 2018 05:03:59 -0700 (PDT)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 4/4] irqchip: sifive-plic: Implement irq_set_affinity() for
 SMP host
Date: Mon, 22 Oct 2018 17:15:17 +0530
Message-Id: <20181022114517.22748-5-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181022114517.22748-1-anup@brainfault.org>
References: <20181022114517.22748-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181022_050411_526161_20239897 
X-CRM114-Status: GOOD (  14.49  )
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
Message-ID: <20181022114517.IKX7x59GARHya1sCESZyu_pN7uvjL4pqBn6WrQtv8qc@z>

Currently on SMP host, all CPUs take external interrupts routed via
PLIC. All CPUs will try to claim a given external interrupt but only
one of them will succeed while other CPUs would simply resume whatever
they were doing before. This means if we have N CPUs then for every
external interrupt N-1 CPUs will always fail to claim it and waste
their CPU time.

Instead of above, external interrupts should be taken by only one CPU
and we should have provision to explicity specify IRQ affinity from
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
 drivers/irqchip/irq-sifive-plic.c | 35 +++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index eb9e8aee1a1a..5a53ffb3c413 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -97,14 +97,42 @@ static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
 
 static void plic_irq_enable(struct irq_data *d)
 {
-	plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 1);
+	unsigned int cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
+					   cpu_online_mask);
+	WARN_ON(cpu >= nr_cpu_ids);
+	plic_irq_toggle(cpumask_of(cpu), d->hwirq, 1);
 }
 
 static void plic_irq_disable(struct irq_data *d)
 {
-	plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 0);
+	plic_irq_toggle(cpu_possible_mask, d->hwirq, 0);
 }
 
+#ifdef CONFIG_SMP
+static int plic_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
+			    bool force)
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
@@ -113,6 +141,9 @@ static struct irq_chip plic_chip = {
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
