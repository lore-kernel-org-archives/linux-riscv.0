Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC093E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Up5VXcIj+37TJrjvJ2sFTbnnOd4IO+r3XanfgpuYGU=; b=pUz9mFrOq1MlP5
	bymieQ5/L4exf96fkI7XWhbyvbSRNnQvOkL9yz2K9L44/fY+KO8DvPhmgcK0l5zOGABCLwv0ixd84
	w2VSbFbYuDriSD3l7mcgQW1EFdh3zjPpAr6DgkQNWwIrCx7gRoJ2VLd+IrLeIbE2BukWODHxHjaAq
	hReIORZPT4ObCa30FGEB0foyXSQNOYc1xVkgxDfaGq9XfYs4tp2BLNjjMlXFQNpdqBULiDmu9xGQ9
	5/z4PU7Jb0QEbOE48GyNktKPvfUP7dErCQARR8wRlJmriPo1/mpzCeAQIHfJH5EcZ32doeS1y0G8n
	e4j0MI+6bKYt2fa7V0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW0X-00000006hn4-0IEN;
	Sat, 14 Dec 2024 17:32:49 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVub-00000006gQ7-2CrT
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:42 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7fcf59a41ddso1528872a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 09:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197199; x=1734801999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6payGCmGMW/0vjHgpi/115tsc+b1yXaj6IL2K0q/xw=;
        b=MlCHZHWFhhhvk9pdN+LoMtPNyl++oJlxykhxrdrnbdhtxtb7rCEByhaT6j1tPLSrR+
         ff3Vg4p7aCZhfanj7Sc5KWNh8jR5q9WZrZ6gGC3MvRag/uxZKfv4GGB3hkt1z8DqgM8k
         eKcqNk6UeACjt6NniLVGTSiSZriEh0Spk9Nm1rJ8UOkQD13Rn22nFA8Xc2meMKY+I/v2
         LpU9Ax4ZSYWjjXVOMz2+ALYlW7BsQ6QTte6BtdZGH/A2DuAYqLTxrmkBXFiB3wrOVuSW
         gk36qYCCWlE7XwklidHd9p++Ih+iJTvuFXLd+qvpaF76kcs6cV56NdNSfVgHpgEbzR8A
         JBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197199; x=1734801999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6payGCmGMW/0vjHgpi/115tsc+b1yXaj6IL2K0q/xw=;
        b=WC4mQNgK2w2uV2YRo4nA8Fu5YUijif+zuwLXo6/43bLl/KXW5+cMNT+pqwiY175Pen
         gyDotjY2H2u8NLZ4YdF5QfkrarzzQZTvqTs/AbZzpjwVU6eeltgNhEfe3VgpxM5NqxLS
         NzCfHCAImOfYPgtEfRhIK2lv+tVST2peD32V/H1zStPSSOS8HbJ35BB8DMlL4YS87SsO
         eg8E6wa0kPV1x6U9yYM300p8yD0e6V61/0cbVNqtWQe/uZcUVr0bVwU5Fu7835Pr5BBG
         aOo4ONNDoDAosspdjnVx21YIWWIEBhLq5OAR/6/4IVNvjtWakMiCofkIlPr6RTbKOTis
         2RZw==
X-Forwarded-Encrypted: i=1; AJvYcCVys+Z/hXpavMIm8Qp8+1dqQ5vc3aojjZzWhgj0Z6PCaHUQjlu9+mIZbw+42Txn3TWW1lIoa5YIhaETtw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4r+xDVMn3AfthG3PRJLT4sZP9KMM7VWwhdJFwaPX67MUnZGPL
	2yA+5bZBiJEGv5VrERmOnIl73bA6kFITvFzCTdykXWAnkhhbF0LYjeZ2aA+Lxdk=
X-Gm-Gg: ASbGncv/SXS3H0EpzqoD6GP9ASqt3lVDBbU+2CkysUU1fYYGGegEuCCnVIjPwPOpqiD
	N4Vx6zN1rfnMoIdEEKbYLFBeGnSCWAkHJP/y52naXY8GNsRq7gB6UjawDlYMGRZSyPgkNJrPglN
	PluVCa/7pZ7slCnz9d4pqgGHF6ZM1qOkPt1GoLtRWlV8HVBA7CX1JlvwPOnyK/vAhs4evRPM64V
	nValEoKMHbjh2A7+mmtXO4RijJKbAUxuC14f6DZsFW6CjvSwPKaMrGdnilv6V8tJyWNTbSpOO9x
	MtuSH+MVsnIpUcc=
X-Google-Smtp-Source: AGHT+IE4G8tF4t4tobhDLydlOHpy74mKHnjdVddbrMVpE78sNcz73JzvON/bt8jZjW3R+eaoP7P0Vw==
X-Received: by 2002:a17:90b:2242:b0:2ee:ba0c:1726 with SMTP id 98e67ed59e1d1-2f2901b253dmr8940041a91.34.1734197199504;
        Sat, 14 Dec 2024 09:26:39 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:39 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 05/11] genirq: Introduce kconfig option GENERIC_PENDING_IRQ_CHIPFLAGS
Date: Sat, 14 Dec 2024 22:55:43 +0530
Message-ID: <20241214172549.8842-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092641_573994_D5926CD4 
X-CRM114-Status: GOOD (  19.58  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Introduce kconfig option GENERIC_PENDING_IRQ_CHIPFLAGS which allows
irq core to set IRQD_MOVE_PCNTXT flag based on IRQCHIP_MOVE_DEFERRED
flag.

This kconfig option will help architectures such as x86 and RISC-V
to mark top-level irqchip instances where irqs can't be moved in
the process context.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    | 10 ++++++++++
 kernel/irq/Kconfig     |  4 ++++
 kernel/irq/chip.c      | 39 ++++++++++++++++++++++++++++++++++++---
 kernel/irq/irqdomain.c |  1 +
 4 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index fa711f80957b..b689c8fe8d60 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -567,6 +567,7 @@ struct irq_chip {
  *                                    in the suspend path if they are in disabled state
  * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before startup
  * IRQCHIP_IMMUTABLE:		      Don't ever change anything in this chip
+ * IRQCHIP_MOVE_DEFERRED:             Move the interrupt in actual interrupt context
  */
 enum {
 	IRQCHIP_SET_TYPE_MASKED			= (1 <<  0),
@@ -581,6 +582,7 @@ enum {
 	IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND	= (1 <<  9),
 	IRQCHIP_AFFINITY_PRE_STARTUP		= (1 << 10),
 	IRQCHIP_IMMUTABLE			= (1 << 11),
+	IRQCHIP_MOVE_DEFERRED			= (1 << 12),
 };
 
 #include <linux/irqdesc.h>
@@ -634,6 +636,14 @@ static inline void irq_move_masked_irq(struct irq_data *data) { }
 static inline void irq_force_complete_move(struct irq_desc *desc) { }
 #endif
 
+#if defined(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)
+void irq_update_pcntxt_flag(unsigned int irq, const struct irq_chip *chip);
+#else
+static inline void irq_update_pcntxt_flag(unsigned int irq, const struct irq_chip *chip)
+{
+}
+#endif
+
 extern int no_irq_affinity;
 
 #ifdef CONFIG_HARDIRQS_SW_RESEND
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 529adb1f5859..6d85a47fbf41 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,6 +31,10 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
 
+# Deduce delayed migration from top-level interrupt chip flags
+config GENERIC_PENDING_IRQ_CHIPFLAGS
+	bool
+
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 271e9139de77..623959a24464 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -33,6 +33,33 @@ struct irqaction chained_action = {
 	.handler = bad_chained_irq,
 };
 
+#ifdef CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS
+static void __irq_update_pcntxt_flag(struct irq_desc *desc,
+				     const struct irq_chip *chip)
+{
+	if (chip) {
+		if (chip->flags & IRQCHIP_MOVE_DEFERRED)
+			irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
+		else
+			irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
+	}
+}
+
+void irq_update_pcntxt_flag(unsigned int irq, const struct irq_chip *chip)
+{
+	unsigned long flags;
+	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
+
+	__irq_update_pcntxt_flag(desc, chip);
+	irq_put_desc_unlock(desc, flags);
+}
+#else
+static inline void __irq_update_pcntxt_flag(struct irq_desc *desc,
+					    const struct irq_chip *chip)
+{
+}
+#endif
+
 /**
  *	irq_set_chip - set the irq chip for an irq
  *	@irq:	irq number
@@ -47,6 +74,7 @@ int irq_set_chip(unsigned int irq, const struct irq_chip *chip)
 		return -EINVAL;
 
 	desc->irq_data.chip = (struct irq_chip *)(chip ?: &no_irq_chip);
+	__irq_update_pcntxt_flag(desc, chip);
 	irq_put_desc_unlock(desc, flags);
 	/*
 	 * For !CONFIG_SPARSE_IRQ make the irq show up in
@@ -1114,16 +1142,21 @@ void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
 	trigger = irqd_get_trigger_type(&desc->irq_data);
 
 	irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
-		   IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
+		   IRQD_TRIGGER_MASK | IRQD_LEVEL);
 	if (irq_settings_has_no_balance_set(desc))
 		irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
 	if (irq_settings_is_per_cpu(desc))
 		irqd_set(&desc->irq_data, IRQD_PER_CPU);
-	if (irq_settings_can_move_pcntxt(desc))
-		irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
 	if (irq_settings_is_level(desc))
 		irqd_set(&desc->irq_data, IRQD_LEVEL);
 
+	/* Keep this around until x86 is converted over */
+	if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
+		irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
+		if (irq_settings_can_move_pcntxt(desc))
+			irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
+	}
+
 	tmp = irq_settings_get_trigger_mask(desc);
 	if (tmp != IRQ_TYPE_NONE)
 		trigger = tmp;
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ec6d8e72d980..ec5fc1d8cebe 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1508,6 +1508,7 @@ int irq_domain_set_hwirq_and_chip(struct irq_domain *domain, unsigned int virq,
 	irq_data->hwirq = hwirq;
 	irq_data->chip = (struct irq_chip *)(chip ? chip : &no_irq_chip);
 	irq_data->chip_data = chip_data;
+	irq_update_pcntxt_flag(virq, chip);
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
