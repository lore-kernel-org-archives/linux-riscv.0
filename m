Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDD2EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4opnrJ9vNU66F1ff6fHPwFN9rBnCW7fJkOhuSeahIk=; b=xjAVxoHOa6sxFm
	8i9P6FBQoLttSGsluLjABSBte2PgcIEhQl0Xl64JyKPtLjlSsOcA7DM5v6xGQHnjWk9XIoqf9dg+O
	O0e1uOll3sCrmvvfUe0asbmadRSo0yKmJetEL/Uly9mkJJltBVFEd4UNXPp+B1gOCct2XBplsPm90
	LrHXzmBKAd71ezfSn912QAimPNKht5jN+Fg8QyoyFr8mAQKw3O4VHGJLKOMpYuuz0lXLpoHffmTXn
	nfZ4rAo9LCzFoA4jM6RDUNAhKaVt0+mhbm0K6yp2eKd9aBf8u9N0XP9j2W5l8zrAWNWkUB9Fs/Jnj
	WUM/HTSVtkv5nbwWMPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInRI-00B5H4-25;
	Mon, 10 Jul 2023 09:44:16 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInRF-00B5F3-2I
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:44:15 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7835971026fso131597739f.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 02:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688982253; x=1691574253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcrEH8OhJJZAITXaKfZ/zoRtjGXDZoTtkGYiYC2zu4k=;
        b=k9I6V1IUS4US1apWUM7Biypnkl1j3cmwGs/+X8mONjgRQ0/mvTIFsLT5xlP2nSMe9U
         Zj8UQ5TW38KLf2+UFXp7URzCpnLlvdBt71DZonWt6vajN3vWx9PaN7vrHUnY8FXNmtId
         sM5/q2vhuf0KK5/xIF7IBJlFoCTi4RhgWYQcQ0lUUNkOD1/qH47+LfhtkbX66td1BnjE
         M/UlmhyYevubBtLAUXDfdXsOa2rf9DdPEd8U73JDtkPIShLKAbOdWGrsHZicPdrZLpnD
         oJlP1Mq7cZQzFvBkh5tsmMm8HL2GmO8dtYvQPrSW/502WOqvTGr5TORZUJgxSIBuxGbe
         IKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688982253; x=1691574253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcrEH8OhJJZAITXaKfZ/zoRtjGXDZoTtkGYiYC2zu4k=;
        b=Di90Ooufe8uvNGYFbNyWWLk1cmfmjG7Bj2qiaXd8UySAWvFL8Bdy0ogMCg1ttavcwe
         NyuMLD7bUxn+H2FIY2As/ZeDXWsNCYB6a1kI/520IpuEc7fTiX/KLY8lSBV7dSPLLit0
         P7NbBzjdqf/QuNAhBmxg2fGk3C8RyurW8CPENznZ1XWLbJvOR9YPL+ICE85ErJeonv9W
         El+rEZefQUmHX86/i6JQP6cml7X6z5AlIlF9NWBWU4o3+9ypzfMDJqdq/6oJ/eEh0WLF
         zf/jzvtzgYXt5AmiDcBqUbXasJCpxsDHWa8LbgfFx/zYc+MAYqnmvJMnHKtN3ogfGWb3
         vI2A==
X-Gm-Message-State: ABy/qLYGJqyIvRaT9AJSN6MI354kyrVJLr+T08l7lYLaABekLEgxb7Gv
	D4aoCn30CcCGQ29Q+lnAy/We2A==
X-Google-Smtp-Source: APBJJlFByc//esrREQrT/7t7e+ELFneay8aEl5p8Am6SDXZPF8z6e4ES81u5UEKeQZknUM1Z0b3Iqw==
X-Received: by 2002:a6b:90b:0:b0:783:47cd:27b5 with SMTP id t11-20020a6b090b000000b0078347cd27b5mr11431490ioi.3.1688982252722;
        Mon, 10 Jul 2023 02:44:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k1-20020a6b7a41000000b007870c56387dsm936938iop.49.2023.07.10.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:44:12 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 5/9] irqchip/riscv-imsic: Add support for PCI MSI irqdomain
Date: Mon, 10 Jul 2023 15:13:17 +0530
Message-Id: <20230710094321.1378351-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710094321.1378351-1-apatel@ventanamicro.com>
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024413_751917_CCC77CB8 
X-CRM114-Status: GOOD (  17.13  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Linux PCI framework requires it's own dedicated MSI irqdomain so
let us create PCI MSI irqdomain as child of the IMSIC base irqdomain.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig           |  7 +++++
 drivers/irqchip/irq-riscv-imsic.c | 49 +++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8ef18be5f37b..d700980372ef 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -550,6 +550,13 @@ config RISCV_IMSIC
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
diff --git a/drivers/irqchip/irq-riscv-imsic.c b/drivers/irqchip/irq-riscv-imsic.c
index ceb5e0fc883c..061bba1b69a2 100644
--- a/drivers/irqchip/irq-riscv-imsic.c
+++ b/drivers/irqchip/irq-riscv-imsic.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
@@ -80,6 +81,7 @@ struct imsic_priv {
 
 	/* IRQ domains */
 	struct irq_domain *base_domain;
+	struct irq_domain *pci_domain;
 	struct irq_domain *plat_domain;
 };
 
@@ -530,6 +532,39 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
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
+	.name			= "RISC-V IMSIC-PCI",
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
 	.name			= "RISC-V IMSIC-PLAT",
 };
@@ -554,12 +589,26 @@ static int __init imsic_irq_domains_init(struct fwnode_handle *fwnode)
 	}
 	irq_domain_update_bus_token(imsic->base_domain, DOMAIN_BUS_NEXUS);
 
+#ifdef CONFIG_RISCV_IMSIC_PCI
+	/* Create PCI MSI domain */
+	imsic->pci_domain = pci_msi_create_irq_domain(fwnode,
+						&imsic_pci_domain_info,
+						imsic->base_domain);
+	if (!imsic->pci_domain) {
+		pr_err("Failed to create IMSIC PCI domain\n");
+		irq_domain_remove(imsic->base_domain);
+		return -ENOMEM;
+	}
+#endif
+
 	/* Create Platform MSI domain */
 	imsic->plat_domain = platform_msi_create_irq_domain(fwnode,
 						&imsic_plat_domain_info,
 						imsic->base_domain);
 	if (!imsic->plat_domain) {
 		pr_err("Failed to create IMSIC platform domain\n");
+		if (imsic->pci_domain)
+			irq_domain_remove(imsic->pci_domain);
 		irq_domain_remove(imsic->base_domain);
 		return -ENOMEM;
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
