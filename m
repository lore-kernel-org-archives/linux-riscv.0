Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2928C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 820DD2082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXWkWpF8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="wjl1UJN5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 820DD2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uYpuWWGefuROWiY8GnseNI4mg6rD6/dO012VhTSC5uk=; b=iXWkWpF8wHpX3C5rZrtnTIJ7nq
	mBMiANY6Ed9Ka6ybK3vkxPdoASw3lp7Ni77iCfWxwPjTYXmr1/ankxo2FfmmUijX6xRr1HUFBISGD
	EFAAzT6uq/7fhuawIqrBpMnvtN9dGGAMHa104vGoOXlybYmjDQIWi64V2DXJw3fg4I5kWuNQ6mE03
	qRKdASHvhsI3CAhPHtiiUlJV6A1hFIzysv87gZstvovmHi/ke9BQc2s5EkzgHsLU3AMyETV0C141q
	lRgInHN3Lr8uF5JdqfGqmrFzU1TCyTZViCvWNYh+OJ+kqy1osFtKTP53N+rqR0nM6a1qy9orjVZ9f
	xR/CNd1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSdl6-0003nk-0j; Fri, 30 Nov 2018 08:02:44 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSdl3-0003iK-Mb
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 08:02:43 +0000
Received: by mail-pf1-x443.google.com with SMTP id c73so2383603pfe.13
 for <linux-riscv@lists.infradead.org>; Fri, 30 Nov 2018 00:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=T0WD9iFbcYcBF+9tnjwvFYL8QS9M8hvpmA7nOVXSSFo=;
 b=wjl1UJN5WECuRxVrxFO9Md5dOpl1rJKgaQyV8B7tM0/JjOOV/jLOt/XmZji9lZGs48
 awFXpiHCYYrVS8Bi2booEEZuIE0iJ6XsosqhWClkw3OonRcuZ1r9PTfBckCsRpVSUJsV
 NzwlRA/e6RUUHH3h7ctHFjbtu/AmUFdcOaLT5enpMwaAJtHQ7PE7S1yUAHjnSN/NbMMU
 t6NbxUckG7WZe3/fwzN4rO1qurr8osenXi1Pqxn4mxlGBxt1+VOyg8eBu20/m1xP3ABV
 mwvBNYweGfVg74nXfCOtRsWt7WkxqbWMZD7XsynMBO/faOwBlZm/1NwdgifBLnqJCGyF
 1p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=T0WD9iFbcYcBF+9tnjwvFYL8QS9M8hvpmA7nOVXSSFo=;
 b=fH2HIM7SLj7ALyEOyTaIjcPIudqA6L8ktWKHoXi3zh1v6580y9iX41k8coLJPEUyjR
 /KBKWvetnSJcSW7d/3HMBsp2kmY3CCDd1iYdh4O9MzmaKAo4GvgdSSiRiHLX7SBnngkM
 vrYMYrEplurX7jkWFFdhbuhIX8dooD1nAWRfF7vV9irXX8Djb+2as30lw04htjk7XYPI
 mQG5jElOyfX03zG2zHVA/a6fgYJYfRjrC3ZN4GM55Oj+uCpMzb7mVbGdaZCU6iR44puL
 1UGPkICVI89QLkgOlfO9b4VLp96iz8ZLPy3Qx2Io+kdoWjN/2ZcNK0d8T9As+ja29qrW
 EN6A==
X-Gm-Message-State: AA+aEWZFRQ6Lx14YTvjIVYTJqSrwp01cOyaXoD2/icyyuFQySF/Y0GUC
 mPO+hnDCO9dWfHxSFL9zI8IYyQ==
X-Google-Smtp-Source: AFSGD/UU/M4HBSQV/wbUYfbV4VJLosqQcHkSBmI/FPBg+p0zHXEzcPdn/OHc+YgH8fUfZ3CUYFRP7Q==
X-Received: by 2002:a63:4e41:: with SMTP id o1mr2895034pgl.282.1543564950998; 
 Fri, 30 Nov 2018 00:02:30 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.52.208])
 by smtp.googlemail.com with ESMTPSA id
 q187sm19218333pfq.128.2018.11.30.00.02.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 00:02:30 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v3 3/6] irqchip: sifive-plic: More flexible plic_irq_toggle()
Date: Fri, 30 Nov 2018 13:32:04 +0530
Message-Id: <20181130080207.20505-4-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181130080207.20505-1-anup@brainfault.org>
References: <20181130080207.20505-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_000241_740610_218F9A7B 
X-CRM114-Status: GOOD (  12.41  )
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

We make plic_irq_toggle() more generic so that we can enable/disable
hwirq for given cpumask. This generic plic_irq_toggle() will be
eventually used to implement set_affinity for PLIC driver.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 48bee877e0f1..d4433399eb89 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -78,8 +78,7 @@ struct plic_hw {
 
 static struct plic_hw plic;
 
-static inline void plic_toggle(struct plic_handler *handler,
-				int hwirq, int enable)
+static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
 	u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
 	u32 hwirq_mask = 1 << (hwirq % 32);
@@ -92,27 +91,27 @@ static inline void plic_toggle(struct plic_handler *handler,
 	raw_spin_unlock(&handler->enable_lock);
 }
 
-static inline void plic_irq_toggle(struct irq_data *d, int enable)
+static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
 {
 	int cpu;
 
-	writel(enable, plic.regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
-	for_each_cpu(cpu, irq_data_get_affinity_mask(d)) {
+	writel(enable, plic.regs + PRIORITY_BASE + hwirq * PRIORITY_PER_ID);
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
+	plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 1);
 }
 
 static void plic_irq_disable(struct irq_data *d)
 {
-	plic_irq_toggle(d, 0);
+	plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 0);
 }
 
 static struct irq_chip plic_chip = {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
