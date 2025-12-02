Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB83ACFD376
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 06:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWRyh1MEGKN2zNjSBO26NBZqz7+rixHVYO6QM2K4tQY=; b=jFR4Z3N6sz6WBP
	LgWebD6Y9LRHoXfA6ZA5HCLnW8NBrMoxk1dnJPeItS7IaNdxMkYJBpAy+QEbw7hPKJ7Bqb0j4qd8g
	Dox1eFl9CGXP4R7tD293kD/6huMWrj918iNIxT3wsczipJGSyb8nKpvAvHkd9TlpqYb/xITx+xJ5R
	Z9Wwj+vRrndMzRxwfigCY5BGJyewtDg0POPg5IBInRbml9OFLQotBmL8cC1+nTv3/ulLC4o3V1ahe
	a3QV9CynO6xlmMgrGvQywHgfxnTiVANeUlnIzW66bBfc+DszYzN7fe85+qH6urPhHJagYCmQxDm8B
	+eVB60bdaodBjHBhisAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJS6-00000004sPG-2lQt;
	Tue, 02 Dec 2025 06:01:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJS4-00000004sO9-1A8x
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 06:01:29 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3410c86070dso4221603a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 22:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764655287; x=1765260087; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjMzCp0YdhbklZdy04cAQHKZQn0920G7A9CAjRSvCOU=;
        b=gbCX+W9QBPM5fovZUPeto+YvY9/oKjLrEYFBBGyx+q3hEV1qkfDk3ajleSX1AQEWWB
         dOgT9ye/jXvyNe6ylPaeFPTMpvHGxCiI06omqffdgSeRHaYJpiOr9K4uzgkiUGG3QfgP
         Ziizxkog4qMVLhSdm7Vm67KvswzxCcWkgqGAWB6QYNC9iBd5T7XzVW2My3jCidcsSDtV
         KwJvXm+XB2lPIH1qQT/b3vBarQybIMQPZ4i+s8+WSxjf/x+zA1QVw5TRSFiFuQ5MKH3r
         UIMhuYFfZGvABMn+QGP4ukPIytc+3EnhfyqjuO7+h4iqG98pvFFbBnziSGDYaOQ+gwrs
         rW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764655287; x=1765260087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VjMzCp0YdhbklZdy04cAQHKZQn0920G7A9CAjRSvCOU=;
        b=dVQRO1/Fce0G43NwZzNKk6FiXv99PRMTXc4A3aDnXXlTn29JjSheVTG6rdpZopR+fA
         JjqNpIQNjoeO8Mr/3zAYUiTTVBsu1F4q3RKwSiNbYKTslf6n3pG85Kt/xVmMNRYYgc84
         WURHWFFTnPpJ2UMwjbQmtnDBIRens0Zlp8wL/Cu5Ep+KmT4O6BcGGJ3Myir9kDrY1Dl7
         0vdzewXLLNAkyFGy7yTqU0qAGqxUj59G5/8FwywQN1+GSC2oDht5FDQkmZn3GKvNEgGk
         zzF4wN8GMPJTHBuI6ekiBZTaa5Ehqoa+NMrotH0bWsGjXkD3zyAQoOCs5xnN/2kIGm5N
         BJqw==
X-Gm-Message-State: AOJu0YwJ/VXh4RyvyLTBgMYyz4Z72RXMMQZ42s8spKBLl08B25aCJL97
	Tig/hiOKV6AGYnAAoXx048P0rh8LxCn029f/1GxOESWQ2gt6rX6VQFcT8vqcSiaF4lU=
X-Gm-Gg: ASbGncuskDD8tLnwH7dqnWDIBxAXIFwim7CH52a5ap52aPPuzSprg/+598ggIt+gxe8
	fzYlAn1DP88zvTthitV2jTT2yjyZCppksjNErOL2BFNVK2nfy+hxXKPf+TixPNS0WpRoMZk/9e2
	oa+IPtYVRoXjgBDnofG73d4VQNaItyE37/EfovARRiYhqmYaSDChNT0ylgg4AxWHFIm15vWIw7B
	rGm+8GcsK7BXRCFZ6PW1PNPDPNRQFeBtSTsOd9rDaafT7hNsXkDb9zOLE9lcAaGNrgHI6olPC7g
	gMKPbNe8sWaFoqb36RhG9Z9PaFJUvtI1CjMiHr3w1Rj5BUjIT19FuewRmY+lInFEkoW6hx9YV4t
	poWQyH38py3t13+YGjrKesRKBqLjWrBYEqigOq9tscUCZGfRi3XuR1FPBkPA97loAgqL/wXKXbh
	vlsS24GM3j
X-Google-Smtp-Source: AGHT+IEUKPl00bYyajTuOTnh93gNZhE3b7XRi8C2K56+OOSTWlUpe0tn8sPwti3RRAIYAehK3weEQA==
X-Received: by 2002:a17:90b:3b86:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-34733e2d536mr38766998a91.5.1764655287162;
        Mon, 01 Dec 2025 22:01:27 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a547483sm19083810a91.4.2025.12.01.22.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:01:26 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Dec 2025 14:07:41 +0800
Subject: [PATCH v3 2/2] irqchip/riscv-aplic: Preserve APLIC states across
 suspend/resume
MIME-Version: 1.0
Message-Id: <20251202-preserve-aplic-imsic-v3-2-1844fbf1fe92@sifive.com>
References: <20251202-preserve-aplic-imsic-v3-0-1844fbf1fe92@sifive.com>
In-Reply-To: <20251202-preserve-aplic-imsic-v3-0-1844fbf1fe92@sifive.com>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Cyan Yang <cyan.yang@sifive.com>, 
 Nutty Liu <liujingqi@lanxincomputing.com>, Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_220128_359635_550B0755 
X-CRM114-Status: GOOD (  23.17  )
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

The APLIC states might be reset when the platform enters a low power
state, but the register states are not being preserved and restored,
which prevents interrupt delivery after the platform resumes.
Solve this by adding a syscore ops and a power management notifier to
preserve and restore the APLIC states on suspend and resume.

Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/irqchip/irq-riscv-aplic-direct.c |  10 ++
 drivers/irqchip/irq-riscv-aplic-main.c   | 166 ++++++++++++++++++++++++++++++-
 drivers/irqchip/irq-riscv-aplic-main.h   |  19 ++++
 3 files changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index c2a75bf3d20c64c1e1f0e863486633071ab115a7..5a9650225dd805539a2cdf7ca64c7addb4fea39d 100644
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
@@ -171,6 +172,15 @@ static void aplic_idc_set_delivery(struct aplic_idc *idc, bool en)
 	writel(de, idc->regs + APLIC_IDC_IDELIVERY);
 }
 
+void aplic_direct_restore_states(struct aplic_priv *priv)
+{
+	struct aplic_direct *direct = container_of(priv, struct aplic_direct, priv);
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
index 93e7c51f944abe4cb96fc7427c1f36ab7d2cbc4d..b760942e57f916d86b2d424dca8a3c6008f064e6 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -12,10 +12,165 @@
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
+static void aplic_restore_states(struct aplic_priv *priv)
+{
+	struct aplic_saved_regs *saved_regs = &priv->saved_hw_regs;
+	struct aplic_src_ctrl *srcs;
+	void __iomem *regs;
+	u32 nr_irqs, i;
+
+	regs = priv->regs;
+	writel(saved_regs->domaincfg, regs + APLIC_DOMAINCFG);
+#ifdef CONFIG_RISCV_M_MODE
+	writel(saved_regs->msiaddr, regs + APLIC_xMSICFGADDR);
+	writel(saved_regs->msiaddrh, regs + APLIC_xMSICFGADDRH);
+#endif
+	/*
+	 * The sourcecfg[i] has to be restored prior to the target[i], interrupt-pending and
+	 * interrupt-enable bits. The AIA specification states that "Whenever interrupt source i is
+	 * inactive in an interrupt domain, the corresponding interrupt-pending and interrupt-enable
+	 * bits within the domain are read-only zeros, and register target[i] is also read-only
+	 * zero."
+	 */
+	nr_irqs = priv->nr_irqs;
+	for (i = 0; i < nr_irqs; i++) {
+		srcs = &priv->saved_hw_regs.srcs[i];
+		writel(srcs->sourcecfg, regs + APLIC_SOURCECFG_BASE + i * sizeof(u32));
+		writel(srcs->target, regs + APLIC_TARGET_BASE + i * sizeof(u32));
+	}
+
+	for (i = 0; i <= nr_irqs; i += 32) {
+		srcs = &priv->saved_hw_regs.srcs[i];
+		writel(-1U, regs + APLIC_CLRIE_BASE + (i / 32) * sizeof(u32));
+		writel(srcs->ie, regs + APLIC_SETIE_BASE + (i / 32) * sizeof(u32));
+
+		/* Re-trigger the interrupts if it forwards interrupts to target harts by MSIs */
+		if (!priv->nr_idcs)
+			writel(readl(regs + APLIC_CLRIP_BASE + (i / 32) * sizeof(u32)),
+			       regs + APLIC_SETIP_BASE + (i / 32) * sizeof(u32));
+	}
+
+	if (priv->nr_idcs)
+		aplic_direct_restore_states(priv);
+}
+
+static void aplic_save_states(struct aplic_priv *priv)
+{
+	struct aplic_src_ctrl *srcs;
+	void __iomem *regs;
+	u32 i, nr_irqs;
+
+	regs = priv->regs;
+	nr_irqs = priv->nr_irqs;
+	/* The valid interrupt source IDs range from 1 to N, where N is priv->nr_irqs */
+	for (i = 0; i < nr_irqs; i++) {
+		srcs = &priv->saved_hw_regs.srcs[i];
+		srcs->target = readl(regs + APLIC_TARGET_BASE + i * sizeof(u32));
+
+		if (i % 32)
+			continue;
+
+		srcs->ie = readl(regs + APLIC_SETIE_BASE + (i / 32) * sizeof(u32));
+	}
+
+	/* Save the nr_irqs bit if needed */
+	if (!(nr_irqs % 32)) {
+		srcs = &priv->saved_hw_regs.srcs[nr_irqs];
+		srcs->ie = readl(regs + APLIC_SETIE_BASE + (nr_irqs / 32) * sizeof(u32));
+	}
+}
+
+static int aplic_syscore_suspend(void)
+{
+	struct aplic_priv *priv;
+
+	list_for_each_entry(priv, &aplics, head)
+		aplic_save_states(priv);
+
+	return 0;
+}
+
+static void aplic_syscore_resume(void)
+{
+	struct aplic_priv *priv;
+
+	list_for_each_entry(priv, &aplics, head)
+		aplic_restore_states(priv);
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
+		aplic_save_states(priv);
+		break;
+	case GENPD_NOTIFY_ON:
+		aplic_restore_states(priv);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void aplic_pm_remove(void *data)
+{
+	struct aplic_priv *priv = data;
+	struct device *dev = priv->dev;
+
+	list_del(&priv->head);
+	if (dev->pm_domain)
+		dev_pm_genpd_remove_notifier(dev);
+}
+
+static int aplic_pm_add(struct device *dev, struct aplic_priv *priv)
+{
+	struct aplic_src_ctrl *srcs;
+	int ret;
+
+	srcs = devm_kzalloc(dev, (priv->nr_irqs + 1) * sizeof(*srcs), GFP_KERNEL);
+	if (!srcs)
+		return -ENOMEM;
+
+	priv->saved_hw_regs.srcs = srcs;
+	list_add(&priv->head, &aplics);
+	if (dev->pm_domain) {
+		priv->genpd_nb.notifier_call = aplic_pm_notifier;
+		ret = dev_pm_genpd_add_notifier(dev, &priv->genpd_nb);
+		if (ret)
+			goto remove_head;
+
+		ret = devm_pm_runtime_enable(dev);
+		if (ret)
+			goto remove_notifier;
+	}
+
+	return devm_add_action_or_reset(dev, aplic_pm_remove, priv);
+
+remove_notifier:
+	dev_pm_genpd_remove_notifier(dev);
+remove_head:
+	list_del(&priv->head);
+	return ret;
+}
+
 void aplic_irq_unmask(struct irq_data *d)
 {
 	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
@@ -60,6 +215,8 @@ int aplic_irq_set_type(struct irq_data *d, unsigned int type)
 	sourcecfg += (d->hwirq - 1) * sizeof(u32);
 	writel(val, sourcecfg);
 
+	priv->saved_hw_regs.srcs[d->hwirq - 1].sourcecfg = val;
+
 	return 0;
 }
 
@@ -82,6 +239,7 @@ int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
 
 void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
 {
+	struct aplic_saved_regs *saved_regs = &priv->saved_hw_regs;
 	u32 val;
 #ifdef CONFIG_RISCV_M_MODE
 	u32 valh;
@@ -95,6 +253,8 @@ void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
 		valh |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXS, priv->msicfg.hhxs);
 		writel(val, priv->regs + APLIC_xMSICFGADDR);
 		writel(valh, priv->regs + APLIC_xMSICFGADDRH);
+		saved_regs->msiaddr = val;
+		saved_regs->msiaddrh = valh;
 	}
 #endif
 
@@ -106,6 +266,8 @@ void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
 	writel(val, priv->regs + APLIC_DOMAINCFG);
 	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
 		dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);
+
+	saved_regs->domaincfg = val;
 }
 
 static void aplic_init_hw_irqs(struct aplic_priv *priv)
@@ -176,7 +338,7 @@ int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *
 	/* Setup initial state APLIC interrupts */
 	aplic_init_hw_irqs(priv);
 
-	return 0;
+	return aplic_pm_add(dev, priv);
 }
 
 static int aplic_probe(struct platform_device *pdev)
@@ -209,6 +371,8 @@ static int aplic_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
 			      msi_mode ? "MSI" : "direct");
+	else
+		register_syscore_ops(&aplic_syscore_ops);
 
 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
index b0ad8cde69b1314c6db5ef3cc7070c843c381790..2d8ad7138541ad68a08349d9ed59a2554e520753 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.h
+++ b/drivers/irqchip/irq-riscv-aplic-main.h
@@ -23,7 +23,25 @@ struct aplic_msicfg {
 	u32			lhxw;
 };
 
+struct aplic_src_ctrl {
+	u32			sourcecfg;
+	u32			target;
+	u32			ie;
+};
+
+struct aplic_saved_regs {
+	u32			domaincfg;
+#ifdef CONFIG_RISCV_M_MODE
+	u32			msiaddr;
+	u32			msiaddrh;
+#endif
+	struct aplic_src_ctrl	*srcs;
+};
+
 struct aplic_priv {
+	struct list_head	head;
+	struct notifier_block	genpd_nb;
+	struct aplic_saved_regs	saved_hw_regs;
 	struct device		*dev;
 	u32			gsi_base;
 	u32			nr_irqs;
@@ -40,6 +58,7 @@ int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
 			      unsigned long *hwirq, unsigned int *type);
 void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode);
 int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *regs);
+void aplic_direct_restore_states(struct aplic_priv *priv);
 int aplic_direct_setup(struct device *dev, void __iomem *regs);
 #ifdef CONFIG_RISCV_APLIC_MSI
 int aplic_msi_setup(struct device *dev, void __iomem *regs);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
