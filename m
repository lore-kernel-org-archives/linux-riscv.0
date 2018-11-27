Return-Path: <SRS0=t+O9=OG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87018C43610
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B7A3208E7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P8a8BNfa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="sO0/VK35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B7A3208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=erMVsU3aYElkYxMcswWQZVudSy6n92+Q97WmQoRbCZw=; b=P8a8BNfaMMKIbAlsMXyck8aIW/
	pHmkq6Q90WaxPivLTP+C1dOrlBuRyvmH1r4x0S8LTw26YNc0OYDBL2V9bXRmLagHSaJbwpq2W8gdx
	WphEOLB3nV3j4jJoFxOLxqWiaTVYCcC0C8o5r5TVmVwJqWRxHP7rsTcs50GJOD+OlcqhIeKK7AvMN
	0SMT1b8YqG4RlQAypsojIM1o2ti9WDV36SS5boXpbEj+14i++JCVJiTpXtwHvqNL0XyvUlLXtDxS6
	8WAiopkI5oYy/7SGgvrKWtwGnvZoqA9VQ824FAXGgQAqtiVIqyuaOTNbA5sfP+Fd8iaK9vXIdwRdg
	mqra270Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRaDs-00061X-80; Tue, 27 Nov 2018 10:04:04 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRaDo-0005tj-7G
 for linux-riscv@lists.infradead.org; Tue, 27 Nov 2018 10:04:01 +0000
Received: by mail-pf1-x443.google.com with SMTP id z9so8116420pfi.2
 for <linux-riscv@lists.infradead.org>; Tue, 27 Nov 2018 02:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dN98w9I5INwpkhNGUkRMYFLzjCSv+OZAezmuQZQ+ddo=;
 b=sO0/VK35tm2AheeAcYzA8s7RURZ57m91yq8ZClthssKGmyBE/DzDNmWwXICHAPEoCT
 wgCE4TCmHXWEsQh/920Likcc1cCtzDSq+/w/o29GX/wO5Az2cNv62WorklTHu+Al65Qn
 9tioKsYLZPceBNI9WHETYbmRNDkJr++BMPGMcSVXow0f5v/84qUbOieKHEVekdxl/xwJ
 +roGcwklYBi97zCAM3eFGvFshTZ4z7QUuxExXyJBjbTTlz4+iPHm6jmXcAizx+Tn1V29
 2dHNfyWUwEnudRQvw9e+LzD/xbWsruDA4O/vfFISTUBwFw0KnuspwIdKy5nmV7Sit+3s
 cDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dN98w9I5INwpkhNGUkRMYFLzjCSv+OZAezmuQZQ+ddo=;
 b=m5AejxL0ps+443CZB5im/yjuEFBFA1tedm71jQMRV2TkWltoeqV43BehITaMDpvq4o
 LppKw6GhaLRR63fmDw1jrkcSM/1NT5TP7DLB6hDkR22BUxwtLIp8b5ycAzP88+gjTlsx
 yYROSrFy/E61Qevdvz3ymqXoPiS5AUQRZpaA9XFjcaps+vNegLA3qMqthGQRbr+INaLR
 cK925P64P2lY12XdPIH7TyemkymxNsMbmJXqpb8DwRs2xYNk9S+2xQsfhG0RFwW9M25a
 EAle83MO+EjOqloJNyQ1urvQ2x7T/ad5RU/Jk3T4rzbvQz9GeyB4i72K1v05cSLkcuas
 0GgQ==
X-Gm-Message-State: AA+aEWY9f6alxTjce1WS8v/foxKXrZKWZrzXZbNw7MYzBrngP9p7X/g2
 du9QQraA1ul8B5qcPebXCeLbiA==
X-Google-Smtp-Source: AFSGD/VWhAb0ja271OBzyvwMk5MnCTwXQ7xN2UawQd5izyWUcv400qLQFMnJKNH+y569tQY8t3i/Zg==
X-Received: by 2002:a63:6ecf:: with SMTP id j198mr29093500pgc.3.1543313029266; 
 Tue, 27 Nov 2018 02:03:49 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.48.241])
 by smtp.googlemail.com with ESMTPSA id t87sm9519590pfk.122.2018.11.27.02.03.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Nov 2018 02:03:48 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v2 4/4] irqchip: sifive-plic: Implement irq_set_affinity() for
 SMP host
Date: Tue, 27 Nov 2018 15:33:17 +0530
Message-Id: <20181127100317.12809-5-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127100317.12809-1-anup@brainfault.org>
References: <20181127100317.12809-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181127_020400_257252_E9DBA4AB 
X-CRM114-Status: GOOD (  14.01  )
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
Message-ID: <20181127100317.yT7YZ_C8qwIR8LJ51u7SEQXoLywLoD38cWKIn6RrhIc@z>

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
index ffd4deaca057..fec7da3797fa 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -98,14 +98,42 @@ static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
 
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
@@ -114,6 +142,9 @@ static struct irq_chip plic_chip = {
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
