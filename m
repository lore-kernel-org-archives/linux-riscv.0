Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9CAC87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQwi3VBNtRPB0dV/VUgPiCG5ZFJZ+HvXSqF1iXPqUTw=; b=cI0a9wz+U2lmka
	f1jhZMQxg5CbjgnXafSEJI+Fi8l5wS3i7obQJeqYc4dLKgSeYjm8Em5Th7awPCRhgQ6MaxSqupw/K
	SNiDLAcgNvQP+1BtNt2Yhb+BmWt2CazFfGE1L5z7dqwAKXOkgVq8t4ouz/Aser9CJ2zgGWsNY0abz
	wL3VMQdCQBAxjHeDA1dbXXmFdraXPfIDW9ePVgEgPvH7PHn6eDLkZfVQZX0X4gJIQo7ouP4JCm00q
	/uTNJyIqQ04mgavE5Hn34140BHM7/PT5yge71W/ydVEbzABef7ZaIESpDqHNRfTM0dfkcw0AqJCVV
	t87v4GWMJQHYkLw7hmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZhf-0000000Ef0g-0UPU;
	Wed, 06 Aug 2025 08:40:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZUv-0000000Edat-2qGF
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 08:27:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2401b855980so49070235ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1754468865; x=1755073665; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3CEcIdPrfApIq6dhGmfZt+45Bs79xC7g2ZEuPue/6M=;
        b=CUMkdChc2B1Vz52D+XOpKEmxsd4BN0xXHApx6l7gDNYpNdDOiGmouTQdFH8n8w8QL0
         fosfXXsfg0sxv+l0sn5GgbA2KhTBROaM7YUdzQbVSF2rj2bQ+JbRONEnxj5xe95kVp74
         iU91EjoyfeIBX+g3xc6GAbINj9rva0dDRT8Qq3kMiL4ocO5Ou66ecy8SrYhfsis9YZU3
         CIR9zj8b4fnD5zQ9vyiZ+IlQnnhoEpF8xWuFiDT0j6ZKvrEBD9b4L93qMSWfRjUjksqS
         ktn9NoJ4fYUTPGP/bfwDN3ePQYHi7ByBNBhWflqCCKd942aojZ8sv0qqU6u4c6RiN+lT
         p68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754468865; x=1755073665;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3CEcIdPrfApIq6dhGmfZt+45Bs79xC7g2ZEuPue/6M=;
        b=rUA1rS6cfVNBk1fkYlKQUcAO7aU3iDErxQOXOTJelZ8Yx6D8QZOZnRNvyak5z6WIQ6
         bGu7Ir/2HNLFMAyPcsPyGma1GffzO6li63eNBGYytW89XGnKZdrrz3ayEFdUY7/RbEhz
         igczQkqLMwsiC284FhHPzy8iQEDhu+gR4vhrk7kC3gUdpAtlz2Rskx17kk9ltv/8OFv4
         vjlGJ2YnqnWC0Uo5TH/oytiD6rCScVuSgJ68p4NGqK/z6N5IxgY3OXfhvtWDl5QvBGef
         HzMnR35w5Q1cKqGjQ1HEVeZeqJdg2+fXIlvwt+ASreJQH0ecSmwMOa4xUTfAg6fMh5UV
         o+3w==
X-Forwarded-Encrypted: i=1; AJvYcCVL7V4XzSYXA2SindvYJjk/6dVbMuHryyAQqmcfzkkLUDOYf+rKBDncFPnPkWJn1b2q/2sQ+w8YyCw3Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuFm6t5i7RbFEDxH8EvcP0j4OWqldCgV3feDUVL0fneP35G7rG
	tRce3Floo5t6UJ8wAfwOEwHv3aO3mKMsiP33HnGuZGklbETSWVJtp9cG7Pnjajt6mcQ=
X-Gm-Gg: ASbGncuIV8v8Mo4nNBgPZa9tLsUXv3d8E22yWt+3A3N/xqP52ZS/rrehTKS2yAy0rU9
	Ko7QQlfTDxjvnVGeo8XIqS8k5FJ9i9y3bGPYQ/acsDMs1No5ZM+edM/fn+WocG3dbr2SPZotaF+
	cMHLIAyTvOlroQlaRGuD5z07M5fYnxn8a8veFapo7BFDZj7w94YnKGvlaHdjRnGOJRkfrT1L7JU
	Lc1MWDSfEDl1suZtP0iReN8byJSS4/WLVxMsCq0rzqV5l46oOA9W1jXljRHgPewV0zQCjtFeGU1
	h1dcZu1yPThK4U13cQKid5cf5Q483gWLYqO1gZQLWXlWrvl0G30iNQIUj2mCNANOLNcMNQ7CCVT
	2PENy77BnRXXOAQ36c0+VMlzTgc/oTMXmXAY6AlkbKe4/
X-Google-Smtp-Source: AGHT+IEMfOC8kcOgoOR6YkCT1wJ8ue+iA2kItdoT5VcS68K8udNWTH2Hm081Da8hQRywsIPvk/8qUA==
X-Received: by 2002:a17:903:3c6d:b0:237:e696:3d56 with SMTP id d9443c01a7336-2429f42a761mr43251695ad.32.1754468864911;
        Wed, 06 Aug 2025 01:27:44 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e897690csm151958645ad.99.2025.08.06.01.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:27:44 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: anup@brainfault.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 2/2] irqchip/riscv-aplic: Save and restore APLIC registers
Date: Wed,  6 Aug 2025 16:27:26 +0800
Message-Id: <20250806082726.8835-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806082726.8835-1-nick.hu@sifive.com>
References: <20250806082726.8835-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_012745_735820_69485148 
X-CRM114-Status: GOOD (  19.92  )
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
 drivers/irqchip/irq-riscv-aplic-direct.c |  11 ++
 drivers/irqchip/irq-riscv-aplic-main.c   | 158 ++++++++++++++++++++++-
 drivers/irqchip/irq-riscv-aplic-main.h   |  11 ++
 3 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 205ad61d15e4..61b9ac2e1b7b 100644
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
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 93e7c51f944a..91fe3305934d 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -12,10 +12,143 @@
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
+	list_for_each_entry(priv, &aplics, head) {
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
+	list_for_each_entry(priv, &aplics, head) {
+		aplic_restore(priv);
+	}
+}
+
+static struct syscore_ops aplic_syscore_ops = {
+	.suspend = aplic_syscore_suspend,
+	.resume = aplic_syscore_resume,
+};
+
+static int aplic_pm_notifier(struct notifier_block *nb, unsigned long action, void *data)
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
+static void aplic_remove(void *data)
+{
+	struct aplic_priv *priv = data;
+
+	list_del(&priv->head);
+	dev_pm_genpd_remove_notifier(priv->dev);
+}
+
+static int aplic_add(struct device *dev, struct aplic_priv *priv)
+{
+	int ret;
+
+	list_add(&priv->head, &aplics);
+	/* Add genpd notifier */
+	priv->genpd_nb.notifier_call = aplic_pm_notifier;
+	ret = dev_pm_genpd_add_notifier(dev, &priv->genpd_nb);
+	if (ret && ret != -ENODEV && ret != -EOPNOTSUPP) {
+		list_del(&priv->head);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, aplic_remove, priv);
+	if (ret)
+		return ret;
+
+	return devm_pm_runtime_enable(dev);
+}
+
 void aplic_irq_unmask(struct irq_data *d)
 {
 	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
@@ -59,6 +192,7 @@ int aplic_irq_set_type(struct irq_data *d, unsigned int type)
 	sourcecfg = priv->regs + APLIC_SOURCECFG_BASE;
 	sourcecfg += (d->hwirq - 1) * sizeof(u32);
 	writel(val, sourcecfg);
+	priv->saved_sourcecfg[d->hwirq - 1] = val;
 
 	return 0;
 }
@@ -95,6 +229,8 @@ void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
 		valh |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXS, priv->msicfg.hhxs);
 		writel(val, priv->regs + APLIC_xMSICFGADDR);
 		writel(valh, priv->regs + APLIC_xMSICFGADDRH);
+		priv->saved_msiaddr = val;
+		priv->saved_msiaddrh = valh;
 	}
 #endif
 
@@ -106,6 +242,7 @@ void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
 	writel(val, priv->regs + APLIC_DOMAINCFG);
 	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
 		dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);
+	priv->saved_domaincfg = val;
 }
 
 static void aplic_init_hw_irqs(struct aplic_priv *priv)
@@ -176,7 +313,24 @@ int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *
 	/* Setup initial state APLIC interrupts */
 	aplic_init_hw_irqs(priv);
 
-	return 0;
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
+	return aplic_add(dev, priv);
 }
 
 static int aplic_probe(struct platform_device *pdev)
@@ -209,6 +363,8 @@ static int aplic_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
 			      msi_mode ? "MSI" : "direct");
+	else
+		register_syscore_ops(&aplic_syscore_ops);
 
 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
index b0ad8cde69b1..f27d5ff1c741 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.h
+++ b/drivers/irqchip/irq-riscv-aplic-main.h
@@ -24,6 +24,7 @@ struct aplic_msicfg {
 };
 
 struct aplic_priv {
+	struct list_head	head;
 	struct device		*dev;
 	u32			gsi_base;
 	u32			nr_irqs;
@@ -31,6 +32,15 @@ struct aplic_priv {
 	u32			acpi_aplic_id;
 	void __iomem		*regs;
 	struct aplic_msicfg	msicfg;
+	struct notifier_block	genpd_nb;
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
@@ -39,6 +49,7 @@ int aplic_irq_set_type(struct irq_data *d, unsigned int type);
 int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
 			      unsigned long *hwirq, unsigned int *type);
 void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode);
+void aplic_direct_restore(struct aplic_priv *priv);
 int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *regs);
 int aplic_direct_setup(struct device *dev, void __iomem *regs);
 #ifdef CONFIG_RISCV_APLIC_MSI
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
