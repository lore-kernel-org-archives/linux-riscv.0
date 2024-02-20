Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B56DC48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLwMaocOD+lHmHqWA28tBkk0Qq4R7a9DwayRJNPPRrw=; b=R/I/uGTQFKEUOf
	ha/DJsIlzw9Bf6uKmQ7i11YuFGUyqgcnkcetxz8FiLLTe7ftrbfuf6CHHQXlFEyzy1jJGXQ5X8kfw
	GWsgRa09OhF1RWJb9o2u4FGdkrOba0F307ao7G86YSBxA1AL8OsyNFal/Vw+0Zoot6hxigThkqD2z
	fjEpfK92aRRGWUTUW6LakO8WMtsbeg2OMRJ4toQ9Mwdkf5eW43OxxfYNFunwVDaBA8ZFJR3gSWLf7
	quJPow8wz81dhXxL995JfdjWF2o3t8jtpzdnNuxHGOcnaaIUHLZ+eaLCjD+ixi539GyHstXMKqZks
	UiUcYzpUK8TUuwuLrYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJIR-0000000DHej-3wi8;
	Tue, 20 Feb 2024 06:08:03 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJIN-0000000DHbV-45vJ
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:08:01 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c03d6e5e56so5249638b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 22:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708409278; x=1709014078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADCbdCrzcPKrHuVNHArQAhKf5LOV1FP1desVsvizcyc=;
        b=aPF+TE/mvvqzetzqCN1jqOeVRWIE25Jwji2+6nn8KkKkKMDQEeG6mkIOsTxHt6ojWn
         tU/kAVAJ8jN+IK21KIC7wAcMnJEIyAhnxxzHHYIxxX/txK3ZNaWKCs7FJ7puYoPovtLW
         Xvfa5T/LUo9vJJipWlI8pLzVrTCTNImOeTiqyemuFpobp9qcW5ARVlHG1kAA32KXtEnz
         PIVbRsrtTLnJkWJ8CsqYQmjsy6uoiqdt08zTvO+E7s/U+OVpgUpv+y6hCohoWIuUqMq5
         EEO9kTS9EVOq+BVz7k6tqr/NrvnzC7tCD7R2sGSCb/eZw9w8PCwuAyubBM8ctiPDHpnD
         xbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708409278; x=1709014078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADCbdCrzcPKrHuVNHArQAhKf5LOV1FP1desVsvizcyc=;
        b=JnMXn3Cw2JZja4RfeHVSRK2Wxvq4HCE3w2BLEJjcpCvGNKj3zcQEKmJCsIDxEZYxr9
         U4uWJuuATbSrOJPLzOGp6dfyZ1Krah8uCDb6KYSUquf1eq2fqb8zzDRJ12ArCaeLRj5p
         anERmZ5+AZTXPbzNNWme6V+Aps6c6UGYTrg5HeWietuAvGxWQzMcV++TgtQtZtsE15iO
         elYOshZCwVdix6KYuf6wWUyQ2KlaWlGk3A7IdLnc53pvMS3p5k4RxCpSjxfy3+rNQ7+t
         9yY5qm7gfrn+n5xOLb8pgJsabQf7PV2owlskczRulwv+vBh98dAQnHgpZL0xmY+DDPgS
         EEhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUSID7Hb9JW7yRxkcLbVRnFNqsmLc+d7WrZe/HtyWM8hNxgWVzyz6Uy1he6Bzikz7idOn7lYTxXuEbih8HQC6KgYg/4v56/qWTH5U67AqH
X-Gm-Message-State: AOJu0Yzy1ICmawxLcD8jdubfy4ZhGhLMvZ8gpirV13I8bPDscwAD1vrg
	5yvEGVbNB0xdmFj/EK+dF1Shf80IjUsBPoK+MsujH9dTYJuVM4VOy89TggHukH0=
X-Google-Smtp-Source: AGHT+IFmjBmRXnMrxFIxl7ltl98zshg6DefC/ZSQRgCv09coMxJDssOSPjyVh6cEeNZep67UibNQjw==
X-Received: by 2002:a05:6359:c85:b0:179:24ae:25dd with SMTP id go5-20020a0563590c8500b0017924ae25ddmr15679627rwb.25.1708409278454;
        Mon, 19 Feb 2024 22:07:58 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.86])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090276c600b001db4c89aea5sm5368114plt.158.2024.02.19.22.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 22:07:58 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v13 02/13] irqchip/sifive-plic: Improve locking safety by using irqsave/irqrestore
Date: Tue, 20 Feb 2024 11:37:07 +0530
Message-Id: <20240220060718.823229-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220060718.823229-1-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_220800_058348_CA489DDE 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Now that PLIC driver is probed as a regular platform driver, the lock
dependency validator complains about the safety of handler->enable_lock
usage:

[    0.956775]  Possible interrupt unsafe locking scenario:

[    0.956998]        CPU0                    CPU1
[    0.957247]        ----                    ----
[    0.957439]   lock(&handler->enable_lock);
[    0.957607]                                local_irq_disable();
[    0.957793]                                lock(&irq_desc_lock_class);
[    0.958021]                                lock(&handler->enable_lock);
[    0.958246]   <Interrupt>
[    0.958342]     lock(&irq_desc_lock_class);
[    0.958501]
                *** DEADLOCK ***

To address above, let's use raw_spin_lock_irqsave/unlock_irqrestore()
instead of raw_spin_lock/unlock().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 48483a1a41dd..e91077ff171f 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -103,9 +103,11 @@ static void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)
 
 static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
-	raw_spin_lock(&handler->enable_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&handler->enable_lock, flags);
 	__plic_toggle(handler->enable_base, hwirq, enable);
-	raw_spin_unlock(&handler->enable_lock);
+	raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
 }
 
 static inline void plic_irq_toggle(const struct cpumask *mask,
@@ -236,6 +238,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
 static int plic_irq_suspend(void)
 {
 	unsigned int i, cpu;
+	unsigned long flags;
 	u32 __iomem *reg;
 	struct plic_priv *priv;
 
@@ -253,12 +256,12 @@ static int plic_irq_suspend(void)
 		if (!handler->present)
 			continue;
 
-		raw_spin_lock(&handler->enable_lock);
+		raw_spin_lock_irqsave(&handler->enable_lock, flags);
 		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
 			reg = handler->enable_base + i * sizeof(u32);
 			handler->enable_save[i] = readl(reg);
 		}
-		raw_spin_unlock(&handler->enable_lock);
+		raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
 	}
 
 	return 0;
@@ -267,6 +270,7 @@ static int plic_irq_suspend(void)
 static void plic_irq_resume(void)
 {
 	unsigned int i, index, cpu;
+	unsigned long flags;
 	u32 __iomem *reg;
 	struct plic_priv *priv;
 
@@ -284,12 +288,12 @@ static void plic_irq_resume(void)
 		if (!handler->present)
 			continue;
 
-		raw_spin_lock(&handler->enable_lock);
+		raw_spin_lock_irqsave(&handler->enable_lock, flags);
 		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
 			reg = handler->enable_base + i * sizeof(u32);
 			writel(handler->enable_save[i], reg);
 		}
-		raw_spin_unlock(&handler->enable_lock);
+		raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
 	}
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
