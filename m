Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC9AEE3F09
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlTpUxiZD4nxj5cKK+iFrZMQd19dr/1igwj6JUCkiRo=; b=YM0TpgnsSN8e/8
	YbUP9WUCKg5KDZKMmr/DsNu9V5gUWf5sYIZhnmVm2okDyG+qrUgwOCsItnTFy5HPDFMH6XiIBPf4V
	GquaUQDy4MJ43hxE5Xio/KT5QgcXlWHSjA/zceYVkWAVHIEUoFbwfU8d1PWtzTAx+sAHDBKev+py9
	UgZ/gyr8j2wmeHrjs0XHoEIfudavgNdf2xdnXlHUfSw4dLkPYtsxE2u1r/EYPO7zwLIZJJ2v9lgD4
	Akzib022dAiE7c2RmOv5ODh0Hu25WYOefGNtud5E828gyfML/tpGI7xp0C4wXzKUimLFS7RpQxD5X
	ZGKtSfQr5WD2EaBbpzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7Xw-003wFV-0w;
	Tue, 12 Sep 2023 17:51:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7Xt-003wBI-2H
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:51:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c06f6f98c0so50041415ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541086; x=1695145886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULAM2cjqGNSNlXEqRgMaXwaIHenoZQcGTorSa/ElLrs=;
        b=eLD6jbqSylZ4+iFS2lMHr/zzIh9wbUnxUvFTMyG5JPcxifjVoaHXnLTyG7dRxcD0HW
         RLq7np1BmM7hi2453yyfMhtXVO9ZiPzlb9RsZW+zMFMFfaargKISX/Ddl1g+/hQKWGs4
         YZZUBkEl/bA4osmksIYdsgAHP8PyYjh91AvYdVzKczdHRelgORUBB0iYqQuSMHOKVI7D
         5rhaF92adv+QWCT8BsdebVe+RT/9yZ9Ft4vZBrt/ES7hJXAu4POiLhnW6totx+unpLcq
         P0/POgoeu5gUm7Q6LvWHqxBi6HoksxUFpO7lpNw9GwTf7bjHV7t3gsTHFXPp6D8KBcM1
         1RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541086; x=1695145886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULAM2cjqGNSNlXEqRgMaXwaIHenoZQcGTorSa/ElLrs=;
        b=D5OTLvHJiUrfYGJ4mfZgjI/AAMcfUAnINn69EqH7t1XSqnoDSVewBapwHtsrBTI/ZQ
         bqVXxpyogBOKkTCk+Az38QkrDTTqzkqs5EaPdhcJwvKW5Z80h3UdEmF75alJl/7M983y
         /mZpkMLkEWb1BWSKYXWqNmkfbegu5FOCXR3KGCxoHuqgkJ6tkqBjHkH1uB5XUdqeMZfG
         cGNzYulEIzgM1Y5b/uD3ppTlD4rZGKELMAfsujA2E3vYm1KAD+BiLPNeWCUr0DXJoLYD
         NzjGTDK1zzfnK0+yAdxjWuKfPpP6eMudfdfP1W6Zt7fu+syNaGeQoUavjS3/JHLXzLIK
         w5dg==
X-Gm-Message-State: AOJu0Yyjp5T5VcUZ2TRvszwS31ni+CKSb6SYz3IqJfFzFonuAl91C6XU
	N9H1FAZXizmK3AaBCuHeygcidg==
X-Google-Smtp-Source: AGHT+IFJh8UphwdAEpQShz1M//4fzHvEQ0muo9MLiJBcGmOW4xSyUBW+ebY5Q+aizD1he9EO0y8fLw==
X-Received: by 2002:a17:902:b697:b0:1c3:d864:d6a8 with SMTP id c23-20020a170902b69700b001c3d864d6a8mr489453pls.23.1694541085840;
        Tue, 12 Sep 2023 10:51:25 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:51:25 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 11/16] irqchip/riscv-imsic: Add support for PCI MSI irqdomain
Date: Tue, 12 Sep 2023 23:19:23 +0530
Message-Id: <20230912174928.528414-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105129_743467_04845A00 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Linux PCI framework requires it's own dedicated MSI irqdomain so
let us create PCI MSI irqdomain as child of the IMSIC base irqdomain.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |  7 ++++
 drivers/irqchip/irq-riscv-imsic-platform.c | 48 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 56 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index ee99aacbefcc..a6aad78076a0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -551,6 +551,13 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 
+config RISCV_IMSIC_PCI
+	bool
+	depends on RISCV_IMSIC
+	depends on PCI
+	depends on PCI_MSI
+	default RISCV_IMSIC
+
 config EXYNOS_IRQ_COMBINER
 	bool "Samsung Exynos IRQ combiner support" if COMPILE_TEST
 	depends on (ARCH_EXYNOS && ARM) || COMPILE_TEST
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index b78f1b2ee3dc..ff737b4e195f 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -12,6 +12,7 @@
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
@@ -184,6 +185,39 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
 	.free		= imsic_irq_domain_free,
 };
 
+#ifdef CONFIG_RISCV_IMSIC_PCI
+
+static void imsic_pci_mask_irq(struct irq_data *d)
+{
+	pci_msi_mask_irq(d);
+	irq_chip_mask_parent(d);
+}
+
+static void imsic_pci_unmask_irq(struct irq_data *d)
+{
+	pci_msi_unmask_irq(d);
+	irq_chip_unmask_parent(d);
+}
+
+static struct irq_chip imsic_pci_irq_chip = {
+	.name			= "IMSIC-PCI",
+	.irq_mask		= imsic_pci_mask_irq,
+	.irq_unmask		= imsic_pci_unmask_irq,
+	.irq_eoi		= irq_chip_eoi_parent,
+};
+
+static struct msi_domain_ops imsic_pci_domain_ops = {
+};
+
+static struct msi_domain_info imsic_pci_domain_info = {
+	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
+		   MSI_FLAG_PCI_MSIX | MSI_FLAG_MULTI_PCI_MSI),
+	.ops	= &imsic_pci_domain_ops,
+	.chip	= &imsic_pci_irq_chip,
+};
+
+#endif
+
 static struct irq_chip imsic_plat_irq_chip = {
 	.name			= "IMSIC-PLAT",
 };
@@ -208,12 +242,26 @@ static int imsic_irq_domains_init(struct device *dev)
 	}
 	irq_domain_update_bus_token(imsic->base_domain, DOMAIN_BUS_NEXUS);
 
+#ifdef CONFIG_RISCV_IMSIC_PCI
+	/* Create PCI MSI domain */
+	imsic->pci_domain = pci_msi_create_irq_domain(dev->fwnode,
+						&imsic_pci_domain_info,
+						imsic->base_domain);
+	if (!imsic->pci_domain) {
+		dev_err(dev, "failed to create IMSIC PCI domain\n");
+		irq_domain_remove(imsic->base_domain);
+		return -ENOMEM;
+	}
+#endif
+
 	/* Create Platform MSI domain */
 	imsic->plat_domain = platform_msi_create_irq_domain(dev->fwnode,
 						&imsic_plat_domain_info,
 						imsic->base_domain);
 	if (!imsic->plat_domain) {
 		dev_err(dev, "failed to create IMSIC platform domain\n");
+		if (imsic->pci_domain)
+			irq_domain_remove(imsic->pci_domain);
 		irq_domain_remove(imsic->base_domain);
 		return -ENOMEM;
 	}
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 3170018949a8..ff3c377b9b33 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -31,6 +31,7 @@ struct imsic_priv {
 
 	/* IRQ domains (created by platform driver) */
 	struct irq_domain *base_domain;
+	struct irq_domain *pci_domain;
 	struct irq_domain *plat_domain;
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
