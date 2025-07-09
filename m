Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B9C8303C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 02:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRARrjK2FwCFz3vF0TmKwaaCU6jD0DNRaQ0YwuCq1dQ=; b=wzCC543pw60m1Q
	Q71CZn8IDtht7WFYrwTpQ02hkTAKONh+KUqLFvN7AYPZ17UStsVlYtQ9kML7ieSr4AvAUsk/Iuws3
	cnj2KeT+L88LaXSHRuzNLm/GAb/Z7kBA5o5DJAKQIjEIolrrDaJ9ANx/cNsCP1O0cmXgkaroPsrxn
	bsltKaNviYlyxmeN/Tp8KAWK6AW8sg3Vp0whfKCd+s5nK3oZ1+5/G21TKhGjioSYbrJ5/Rzrt9TUH
	vkursIHT/XPyhkHvRqFAEE54B7vgmwDbMq8eoVq58VazZA/Nn/aDHMGh2gcj7CXmH1LyUHzzBSGVF
	myVkXdAgo3FRXmEOWgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKz9-00000007Dcb-1cnD;
	Wed, 09 Jul 2025 02:56:39 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKz7-00000007Dc7-0ySX
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 02:56:38 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fac7147cb8so89318476d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Jul 2025 19:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752029796; x=1752634596; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rg1PwZb/Nj9zinwW4tBBT6J6d/gy4SIm72/5Qr/32aU=;
        b=MBSit+ACQLc3OTA9/pAHN4KEteaqb+5G8ODGwaBfWHh3anU19Da5CwaOG8pTuJn5sh
         Uxzp/eWpfkag8lZiwy2W6aPru9N4SZ51nxbTV7+o6mR4HaOON9msv8SNeHDZubpTNCkh
         7/vA3lCyvbxAOFja04QJWWYww1U8kXnulIAagVicUZqnca+CExDdS6hIGVHbOPwy6D7v
         0omTSfGFPFvvSwns8eTY4Cr5YjK8jU5RrUIplpwb60lCyfu1LHuo8NshY7uMJSDmKHrI
         5VIEf04ggko5Yln9fRkAlzAyL/ysOlCrjbQrOapi8l5MdxY2toFmquGanqvp4ORBVR1/
         OTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029796; x=1752634596;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg1PwZb/Nj9zinwW4tBBT6J6d/gy4SIm72/5Qr/32aU=;
        b=shv2TmVD4ATVlZe5AUf9MLKIEYNg+18B9S3//IgazThqFtg6LBTUMQmUPqBg2W/1yZ
         ZqCUXwK30J9dqoYnT9M/d1gidqALiGUShhp2X4yyqKh1zAruHiV+WDUjKq+aPJYjawDj
         Ob3jdBUF+Ae4ZAgy9g7Hv9U4iHTa8jMMm44q6/z1iTiSZJx5KSIvUnPig4Ri8h8ikOb9
         QvR0HmOPghdBIRdV1CWTqKVGvUQ5yINiU0ZcVKXRzlfZ32xmH88cEFvnUCEtdD9Ryuo9
         YPI2RrDrPFTJLzNUTaIAYjS8wPHoMAwk+Q/789AdzOBJpKpEpdrXkuRM1R2T6v0uSpuF
         7/UA==
X-Forwarded-Encrypted: i=1; AJvYcCVNQPdnvsRcs4TkrIbqFt8ytF1XmcQFaRpbI5JrZ62v56o4qZ0DthoX4DZMSzPR+Tew8H2IXzYOjCNygA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU1h7bdUq/ALq/bf/ALzK8i+L+m9+ySFVfx3a4/A3WLhRi7neu
	O2P7WrqUNZyeAaezuw8wpSelkBU3owMQ709e8OMU8x4ZI0jlN+feJ1umQzuM1YInI6U=
X-Gm-Gg: ASbGnctdw5EgOqq44zLwVdurpTX5DiNHAvIXvpx/i4izNKHFEKVeYnikurb+hilFwxw
	/TVVxiiaLqVRWn1MJksBEJsY2YZiMzvD+RxuYy9WGyGKtVOB9pcTtR6jz9TnbodbXj9zLo6CRqE
	CF4QImJoTWQDWpnfZcxqAh8JJ886XXWopfim3A8VPmTGYmtY5vZd/my2VJahNx1sDxOODavHLts
	duFJY1rraWCvVEc0CjjgO/sybchvMD/wqwBuWOHdKH9pNMboQMaa4vj0nL8tosI2A/FC65gUbdI
	rUrixGjOW3MxqFNkuOLEZ6JGhfpgefGSM6faqBguxYSZLteBqyoUS3OJazkBfY9G5y68jioag2P
	K+23fXfJV
X-Google-Smtp-Source: AGHT+IE2w+6pcL8ow4gEfiQsAilesspsCHatY+WU2AnhEdGzmw3Vr+kWUWblRdjFmoueDfNIhkUnFg==
X-Received: by 2002:a05:6214:1c08:b0:702:d997:71d4 with SMTP id 6a1803df08f44-7048b94bb8cmr13576576d6.24.1752029796113;
        Tue, 08 Jul 2025 19:56:36 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbeb2318sm867257585a.107.2025.07.08.19.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:56:35 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 2/2] irqchip/riscv-aplic: Save and restore APLIC registers
Date: Wed,  9 Jul 2025 10:55:16 +0800
Message-Id: <20250709025516.28051-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250709025516.28051-1-nick.hu@sifive.com>
References: <20250709025516.28051-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_195637_275795_D6B0A8FF 
X-CRM114-Status: GOOD (  21.67  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The APLIC may be powered down when the CPUs enter a deep sleep state.
Therefore adding the APLIC save and restore functions to save and
restore the states of APLIC.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 drivers/irqchip/irq-riscv-aplic-direct.c |  14 ++-
 drivers/irqchip/irq-riscv-aplic-main.c   | 143 +++++++++++++++++++++++
 drivers/irqchip/irq-riscv-aplic-main.h   |  12 ++
 drivers/irqchip/irq-riscv-aplic-msi.c    |   3 +-
 4 files changed, 170 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 205ad61d15e4..df42f979d02c 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cpu.h>
+#include <linux/cpumask.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
@@ -171,6 +172,16 @@ static void aplic_idc_set_delivery(struct aplic_idc *idc, bool en)
 	writel(de, idc->regs + APLIC_IDC_IDELIVERY);
 }
 
+void aplic_direct_restore(struct aplic_priv *priv)
+{
+	struct aplic_direct *direct =
+			container_of(priv, struct aplic_direct, priv);
+	int cpu;
+
+	for_each_cpu(cpu, &direct->lmask)
+		aplic_idc_set_delivery(per_cpu_ptr(&aplic_idcs, cpu), true);
+}
+
 static int aplic_direct_dying_cpu(unsigned int cpu)
 {
 	if (aplic_direct_parent_irq)
@@ -343,5 +354,6 @@ int aplic_direct_setup(struct device *dev, void __iomem *regs)
 	dev_info(dev, "%d interrupts directly connected to %d CPUs\n",
 		 priv->nr_irqs, priv->nr_idcs);
 
-	return 0;
+	/* Add the aplic_priv to the list */
+	return aplic_add(dev, priv);
 }
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 93e7c51f944a..9054ce7a7256 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -12,10 +12,130 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/printk.h>
+#include <linux/syscore_ops.h>
 
 #include "irq-riscv-aplic-main.h"
 
+static LIST_HEAD(aplics);
+
+static void aplic_restore(struct aplic_priv *priv)
+{
+	int i;
+	u32 clrip;
+
+	writel(priv->saved_domaincfg, priv->regs + APLIC_DOMAINCFG);
+#ifdef CONFIG_RISCV_M_MODE
+	writel(priv->saved_msiaddr, priv->regs + APLIC_xMSICFGADDR);
+	writel(priv->saved_msiaddrh, priv->regs + APLIC_xMSICFGADDRH);
+#endif
+	for (i = 1; i <= priv->nr_irqs; i++) {
+		writel(priv->saved_sourcecfg[i - 1],
+		       priv->regs + APLIC_SOURCECFG_BASE +
+		       (i - 1) * sizeof(u32));
+		writel(priv->saved_target[i - 1],
+		       priv->regs + APLIC_TARGET_BASE +
+		       (i - 1) * sizeof(u32));
+	}
+
+	for (i = 0; i <= priv->nr_irqs; i += 32) {
+		writel(-1U, priv->regs + APLIC_CLRIE_BASE +
+			    (i / 32) * sizeof(u32));
+		writel(priv->saved_ie[i / 32],
+		       priv->regs + APLIC_SETIE_BASE +
+		       (i / 32) * sizeof(u32));
+	}
+
+	if (priv->nr_idcs) {
+		aplic_direct_restore(priv);
+	} else {
+		/* Re-trigger the interrupts */
+		for (i = 0; i <= priv->nr_irqs; i += 32) {
+			clrip = readl(priv->regs + APLIC_CLRIP_BASE +
+				      (i / 32) * sizeof(u32));
+			writel(clrip, priv->regs + APLIC_SETIP_BASE +
+				      (i / 32) * sizeof(u32));
+		}
+	}
+}
+
+static void aplic_save(struct aplic_priv *priv)
+{
+	int i;
+
+	for (i = 1; i <= priv->nr_irqs; i++) {
+		priv->saved_target[i - 1] = readl(priv->regs +
+						  APLIC_TARGET_BASE +
+						  (i - 1) * sizeof(u32));
+	}
+
+	for (i = 0; i <= priv->nr_irqs; i += 32) {
+		priv->saved_ie[i / 32] = readl(priv->regs +
+					       APLIC_SETIE_BASE +
+					       (i / 32) * sizeof(u32));
+	}
+}
+
+static int aplic_syscore_suspend(void)
+{
+	struct aplic_priv *priv;
+
+	list_for_each_entry(priv, &aplics, list) {
+		aplic_save(priv);
+	}
+
+	return 0;
+}
+
+static void aplic_syscore_resume(void)
+{
+	struct aplic_priv *priv;
+
+	list_for_each_entry(priv, &aplics, list) {
+		aplic_restore(priv);
+	}
+}
+
+static struct syscore_ops aplic_syscore_ops = {
+	.suspend = aplic_syscore_suspend,
+	.resume = aplic_syscore_resume,
+};
+
+static int aplic_notifier(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	struct aplic_priv *priv = container_of(nb, struct aplic_priv, genpd_nb);
+
+	switch (action) {
+	case GENPD_NOTIFY_PRE_OFF:
+		aplic_save(priv);
+		break;
+	case GENPD_NOTIFY_ON:
+		aplic_restore(priv);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+int aplic_add(struct device *dev, struct aplic_priv *priv)
+{
+	int ret;
+
+	list_add(&priv->list, &aplics);
+	/* Add genpd notifier */
+	priv->genpd_nb.notifier_call = aplic_notifier;
+	ret = dev_pm_genpd_add_notifier(dev, &priv->genpd_nb);
+	if (!ret)
+		return devm_pm_runtime_enable(dev);
+
+	return ret == -ENODEV || ret == -EOPNOTSUPP ? 0 : ret;
+}
+
 void aplic_irq_unmask(struct irq_data *d)
 {
 	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
@@ -59,6 +179,7 @@ int aplic_irq_set_type(struct irq_data *d, unsigned int type)
 	sourcecfg = priv->regs + APLIC_SOURCECFG_BASE;
 	sourcecfg += (d->hwirq - 1) * sizeof(u32);
 	writel(val, sourcecfg);
+	priv->saved_sourcecfg[d->hwirq - 1] = val;
 
 	return 0;
 }
@@ -95,6 +216,8 @@ void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
 		valh |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXS, priv->msicfg.hhxs);
 		writel(val, priv->regs + APLIC_xMSICFGADDR);
 		writel(valh, priv->regs + APLIC_xMSICFGADDRH);
+		priv->saved_msiaddr = val;
+		priv->saved_msiaddrh = valH;
 	}
 #endif
 
@@ -106,6 +229,7 @@ void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
 	writel(val, priv->regs + APLIC_DOMAINCFG);
 	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
 		dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);
+	priv->saved_domaincfg = val;
 }
 
 static void aplic_init_hw_irqs(struct aplic_priv *priv)
@@ -176,6 +300,23 @@ int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *
 	/* Setup initial state APLIC interrupts */
 	aplic_init_hw_irqs(priv);
 
+	/* For power management */
+	priv->saved_target = devm_kzalloc(dev, priv->nr_irqs * sizeof(u32),
+					  GFP_KERNEL);
+	if (!priv->saved_target)
+		return -ENOMEM;
+
+	priv->saved_sourcecfg = devm_kzalloc(dev, priv->nr_irqs * sizeof(u32),
+					     GFP_KERNEL);
+	if (!priv->saved_sourcecfg)
+		return -ENOMEM;
+
+	priv->saved_ie = devm_kzalloc(dev,
+				      DIV_ROUND_UP(priv->nr_irqs, 32) * sizeof(u32),
+				      GFP_KERNEL);
+	if (!priv->saved_ie)
+		return -ENOMEM;
+
 	return 0;
 }
 
@@ -209,6 +350,8 @@ static int aplic_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
 			      msi_mode ? "MSI" : "direct");
+	else
+		register_syscore_ops(&aplic_syscore_ops);
 
 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
index b0ad8cde69b1..969319242dbc 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.h
+++ b/drivers/irqchip/irq-riscv-aplic-main.h
@@ -31,6 +31,16 @@ struct aplic_priv {
 	u32			acpi_aplic_id;
 	void __iomem		*regs;
 	struct aplic_msicfg	msicfg;
+	struct notifier_block	genpd_nb;
+	struct list_head	list;
+	u32 *saved_target;
+	u32 *saved_sourcecfg;
+	u32 *saved_ie;
+	u32 saved_domaincfg;
+#ifdef CONFIG_RISCV_M_MODE
+	u32 saved_msiaddr;
+	u32 saved_msiaddrh;
+#endif
 };
 
 void aplic_irq_unmask(struct irq_data *d);
@@ -39,7 +49,9 @@ int aplic_irq_set_type(struct irq_data *d, unsigned int type);
 int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
 			      unsigned long *hwirq, unsigned int *type);
 void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode);
+void aplic_direct_restore(struct aplic_priv *priv);
 int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *regs);
+int aplic_add(struct device *dev, struct aplic_priv *priv);
 int aplic_direct_setup(struct device *dev, void __iomem *regs);
 #ifdef CONFIG_RISCV_APLIC_MSI
 int aplic_msi_setup(struct device *dev, void __iomem *regs);
diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609f..c9b4f7d5e6ea 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -281,5 +281,6 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
 	pa = priv->msicfg.base_ppn << APLIC_xMSICFGADDR_PPN_SHIFT;
 	dev_info(dev, "%d interrupts forwarded to MSI base %pa\n", priv->nr_irqs, &pa);
 
-	return 0;
+	/* Add the aplic_priv to the list */
+	return aplic_add(dev, priv);
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
