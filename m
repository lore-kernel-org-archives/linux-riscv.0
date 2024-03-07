Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6861C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzgniybiGMefTOhQ136QDyCQbPXosB+CrKq+NBWuPx8=; b=ew9DbqX6i5p2U0
	Tsk0oprCe0f+Zh5CuE4uCeXImbnFbHQgIDN1Iwb3289t+L6Sz4OWadP4tVSMmLJBQareujJkii1yV
	IEbd0LPWRsuSl+3p7Bl5bYHmAlwLckMuDHPcySenswnFA/hvXfqrxCafPyiTIofGHkv4Lfn/LhuYJ
	yWmrKleeb+jzRwwYZJhIkA4JNCO1+WNFjZJTPSJIBOLXW7bync2BVa/xq9mHJWKeMtj+9UI3oYbUF
	3flS4sNAGD0Ey1M7ao8NzkbnzVG2ZexE6p2w/Y9q5skz2t+X6Da39hu2IR3lPl850MYyqOExVmpHb
	ofW46nX3wf1TeYzTFkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEM0-00000004w1O-1K64;
	Thu, 07 Mar 2024 14:04:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riELY-00000004vdF-2Tgb
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 14:03:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so7720375ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 06:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709820223; x=1710425023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jRh4tMvuYcqr95qV4EQU7BolCnIgD6A0sDxFfSdHTU=;
        b=lXyH/ycDnmuzm3I/vfiMNSw6NwKWi6HYHPB0exD/Dp+qS8KHIufnpS9pLLDVrI6udv
         mUR2HmqphFjciLJ+1X78TCDriXPBQZZGVJcV1Qt3dYC2vCvaX1zB63D74pfztYOfTsJI
         g3TcTkmkQwet0TU9G0qRv53ssDVP3Ym+uIMwkBY8rguNxq73eof6A/nfVqXbOzDxJcf7
         hpXY79zQAhi6x5QuZ6pRc/BUOr6y0D68hmqCsbzTSZaH4ykBVKah1zIR2YCQLLSTrgFA
         /wDuLp4hHLES4Gu7MI0NEeD5guD5QyYAk77t9g7+jszgFipxGXA5m8vDLe5LaJ456YbH
         2JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820223; x=1710425023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jRh4tMvuYcqr95qV4EQU7BolCnIgD6A0sDxFfSdHTU=;
        b=B8ApRrne8IhfNKf0H3UUGjcpztx6my1y02XVXoVVVck9RDUEbHm1Vsk77Aa4RiI1OM
         O+k1GBVLmXUxpk8I0A6ji8kbRRI8vEVLAPG4KA+H9timkri/uSaCPW4rELcTE+g7hfGa
         fZYS5Gp3shPTME1iXPl48AbM/CzgXDnB4noSoqi5R9sLg4RhGvOq2GXabL+Jf7BlhPT5
         gyJ35f0sxPJwmDNPOxN8kDJIniIROqgY8zK1NXL/Z2eA05O0Ty6JVlxnVHM1/nBx2pKP
         68UK1QWK8VphkjWzJ7nHbql7JAWcwspvVL9EQTgDnkEhLQdnrA7DRsub7GRiDrMDmREh
         miaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWSlH9w2TCVP++/sybiZ+5DlueqfFJvLpLqtv2bNCLPHgqqLMICH4lU7Q7YnNIL1f2/mU7cFhHZI7hoaBc6tieivg/2LamfyrbLc28TWTK
X-Gm-Message-State: AOJu0YyP5Wunc2TH7k27UsjOPOqZWztqPmQcFdopi3vy6dkumj1dha3R
	RqJfeHp++J95Rdcryy2gWcyeME0lFRNY+mrd/0r88NMpM+kWCCjyUvLKmcCpCw0=
X-Google-Smtp-Source: AGHT+IHGmxFeZ72Q590ilBqOWS3an5Vyy6hLjQbRDQ0n1Sbt0i2JyCIRAP1shhfNGwpiSrO/aex5oA==
X-Received: by 2002:a17:903:2305:b0:1dc:6fec:15d8 with SMTP id d5-20020a170903230500b001dc6fec15d8mr9709155plh.47.1709820223228;
        Thu, 07 Mar 2024 06:03:43 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.79])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709026f0100b001dd6174c651sm386228plk.149.2024.03.07.06.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:03:42 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v16 4/9] irqchip/riscv-imsic: Add device MSI domain support for PCI devices
Date: Thu,  7 Mar 2024 19:33:02 +0530
Message-Id: <20240307140307.646078-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307140307.646078-1-apatel@ventanamicro.com>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_060344_883984_54DBE8A9 
X-CRM114-Status: GOOD (  14.59  )
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

The Linux PCI framework supports per-device MSI domains for PCI devices
so extend the IMSIC driver to allow PCI per-device MSI domains.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |  7 +++++
 drivers/irqchip/irq-riscv-imsic-platform.c | 35 ++++++++++++++++++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 85f86e31c996..2fc0cb32341a 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -553,6 +553,13 @@ config RISCV_IMSIC
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
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
index 35291bf90d65..1e6dddfd3046 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -14,6 +14,7 @@
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
@@ -207,6 +208,28 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
 #endif
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
+	irq_chip_unmask_parent(d);
+	pci_msi_unmask_irq(d);
+}
+
+#define MATCH_PCI_MSI		BIT(DOMAIN_BUS_PCI_MSI)
+
+#else
+
+#define MATCH_PCI_MSI		0
+
+#endif
+
 static bool imsic_init_dev_msi_info(struct device *dev,
 				    struct irq_domain *domain,
 				    struct irq_domain *real_parent,
@@ -230,6 +253,13 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 
 	/* Is the target supported? */
 	switch (info->bus_token) {
+#ifdef CONFIG_RISCV_IMSIC_PCI
+	case DOMAIN_BUS_PCI_DEVICE_MSI:
+	case DOMAIN_BUS_PCI_DEVICE_MSIX:
+		info->chip->irq_mask = imsic_pci_mask_irq;
+		info->chip->irq_unmask = imsic_pci_unmask_irq;
+		break;
+#endif
 	case DOMAIN_BUS_DEVICE_MSI:
 		/*
 		 * Per-device MSI should never have any MSI feature bits
@@ -269,11 +299,12 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 #define MATCH_PLATFORM_MSI		BIT(DOMAIN_BUS_PLATFORM_MSI)
 
 static const struct msi_parent_ops imsic_msi_parent_ops = {
-	.supported_flags	= MSI_GENERIC_FLAGS_MASK,
+	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
+				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
 				  MSI_FLAG_USE_DEF_CHIP_OPS,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
-	.bus_select_mask	= MATCH_PLATFORM_MSI,
+	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
 	.init_dev_msi_info	= imsic_init_dev_msi_info,
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
