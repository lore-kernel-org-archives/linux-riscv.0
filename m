Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7E7CAC58E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uuTx508B6dVqXUc3h+JrP5XhKWQf1h8b2GmodEQP0U=; b=IMNdXitwJ3xTaU
	GsfBtDDhyxzZhJS1/76gJ57IZ73UnYx9/WVw3PWec+Hl+MZxK09GVk8XQJYwLxhnxTMa7GehWD3Lw
	b5J4EKV6M1mUNCbiCsqb3bWpIwh3ef+r/v4XnMon1aKSSBzrJeZ3gNL+9FW0a3uahkSQjQbibXLz2
	iLsgyiblkY4SQHJQ7G/H73zUe0Fau8+J6h6iEYMbFKnovIDXzx+QmOUhFB3ZZhKKLE8WO+ysSi4wT
	dwPfERChusIaJKw/KZPLQG7V6/7JxzQ0ytZWLHD9hDf65f1GAuc9cas2QZjHStEK8LkiuS4/DCM8+
	2z+1UlxaqVo7qhSTej+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwteV-00000006Xnr-0v3z;
	Fri, 12 Sep 2025 02:36:43 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwteS-00000006XmI-2l9I
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:36:41 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-746d5474a53so475715a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644599; x=1758249399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggltpTc0D00UKxi4gG99EmSzD1bwb+Ulvy+/Q1NlhRc=;
        b=OrqRxJajVdoT22BECyj5ZhPLTOZxOeS9Xsog0r7AT23OAY2NzfSeKpILPoDHLgMOMv
         LXCOr7EOlLw7lHrrA1gcqVHD8HsDnuKTtkwF9p+tMdkwzcd2YlCK4xTnwjw63RvIZaeX
         duWSTOxBYdP5XOpN3S8hesG9bEP/soM5aLeQDlXqlcFaMD+k3QReMRocxcCV7YKBKzaT
         DRgDxDYobwJRLx7RDRKo2VI9t3BLHqiajkmSl+0voFwBZa9QJkBZnEaeBkbdtjaew7Us
         g/e4hzkFbA+Td25ZWh9VpzC+yg3rXaX1v+/k6iUAgooRrB9vsVb40ewXOc8WjqhcjuGM
         EJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644599; x=1758249399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggltpTc0D00UKxi4gG99EmSzD1bwb+Ulvy+/Q1NlhRc=;
        b=Ca+oOeo9LXsUo2DzO7STqWRaJLT3M1pAc5xw101ooX6atN01coeKh2gKMIAocBcRT+
         u5WdStpH0nYwrQerOByveR2Tbg7gQPo6dH9QYDYj2xQEV2SEgKxfHjh+DWQoeKGwjREI
         QvOBT1Owebol7pEgsTIigIAAQ+FbKIP+EZilRKINd35NsYU0f7qvN/8sq9D4xK2do7Fl
         tj541ydZwOhZA4GvU5Eqkq+gu4CQ+VK04dKBbtrfJGBRul29/98OfG6tRXbkRMJvUvTb
         xHfQPX1865WwgsBmCH/2O+6KKr62o/Wb9zhHMvBPavWHexVU6b0zVviXg/037hCB0TAp
         Y1ow==
X-Forwarded-Encrypted: i=1; AJvYcCUjAJtY8KkJ/Pw2ZpeeZQCIpGy6bq2b5QJd1WVLRxEEpEDxbHFoylxK92JHIj6wcAkSBPuUzqt6uvyrew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbEnaeKRzosFNEiT+b3CuVorCe+oo47cZOH/jwhOeTAkrDCYyx
	VX6IlMTG0gZlLngcyKaw8Nt8qkrjCp7UJU3oUfPQ1DQW0vSjPSRDYBgz
X-Gm-Gg: ASbGncsnP7K1iQLRi9uPCTYmGU/tOvQDQc8NAuImYWEiijdhGiPHC2/qZusHmUAT1B7
	splIhpmX9IO0rUliAGedTxkmQgN7OXgGU3vdakMeSXs972WlpF+Z2bRM/jvn64Bo05X5j0k0BLF
	Ec7Z9VwpKMALNlppiRpypKzg82JDnwkOT25KC9WH/q0JaheC+vJxRB/4mzp1NozFzDRIJF5qsL3
	jbYHzGkGpeZjLDUO+2tknbIxGy67MWMAw+b2thOh9ZXuwcI5ZCmKSnu+2umeVSrufXWVITVHY+t
	PYjxNUpkAVSXHavTJWFWWZKoOH0cUY9HEVoEuDL8bcG1bSvIGo2u0YlApoAkK7eR2sYDUuRv6BE
	36y1jnhF5YTxnEn9BKHK6pONaSlAVW7lq
X-Google-Smtp-Source: AGHT+IFT8EKRFDpgNVFde0rDbnWyS6vNtP7dHpbjXsQb+tjyelQnUQR1SGs7F/2QHfYBGudTg1wi/g==
X-Received: by 2002:a05:6808:1994:b0:43b:7b7f:d26d with SMTP id 5614622812f47-43b8d9fd706mr472672b6e.24.1757644599414;
        Thu, 11 Sep 2025 19:36:39 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7524bd835f0sm746972a34.33.2025.09.11.19.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:36:39 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Date: Fri, 12 Sep 2025 10:36:31 +0800
Message-Id: <01b0a57cd9dba8bed7c1f2d52997046c2c6f042b.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_193640_719514_409EDFE9 
X-CRM114-Status: GOOD (  20.86  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add support for PCIe controller in SG2042 SoC. The controller
uses the Cadence PCIe core programmed by pcie-cadence*.c. The
PCIe controller will work in host mode only, supporting data
rate (16 GT/s) and lanes (x16 or x8).

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/Kconfig       |  10 ++
 drivers/pci/controller/cadence/Makefile      |   1 +
 drivers/pci/controller/cadence/pcie-sg2042.c | 138 +++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c

diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
index 666e16b6367f..02a639e55fd8 100644
--- a/drivers/pci/controller/cadence/Kconfig
+++ b/drivers/pci/controller/cadence/Kconfig
@@ -42,6 +42,15 @@ config PCIE_CADENCE_PLAT_EP
 	  endpoint mode. This PCIe controller may be embedded into many
 	  different vendors SoCs.
 
+config PCIE_SG2042_HOST
+	tristate "Sophgo SG2042 PCIe controller (host mode)"
+	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
+	select PCIE_CADENCE_HOST
+	help
+	  Say Y here if you want to support the Sophgo SG2042 PCIe platform
+	  controller in host mode. Sophgo SG2042 PCIe controller uses Cadence
+	  PCIe core.
+
 config PCI_J721E
 	tristate
 	select PCIE_CADENCE_HOST if PCI_J721E_HOST != n
@@ -67,4 +76,5 @@ config PCI_J721E_EP
 	  Say Y here if you want to support the TI J721E PCIe platform
 	  controller in endpoint mode. TI J721E PCIe controller uses Cadence PCIe
 	  core.
+
 endmenu
diff --git a/drivers/pci/controller/cadence/Makefile b/drivers/pci/controller/cadence/Makefile
index 9bac5fb2f13d..5e23f8539ecc 100644
--- a/drivers/pci/controller/cadence/Makefile
+++ b/drivers/pci/controller/cadence/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
 obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
 obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
 obj-$(CONFIG_PCI_J721E) += pci-j721e.o
+obj-$(CONFIG_PCIE_SG2042_HOST) += pcie-sg2042.o
diff --git a/drivers/pci/controller/cadence/pcie-sg2042.c b/drivers/pci/controller/cadence/pcie-sg2042.c
new file mode 100644
index 000000000000..db91c37790b7
--- /dev/null
+++ b/drivers/pci/controller/cadence/pcie-sg2042.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pcie-sg2042 - PCIe controller driver for Sophgo SG2042 SoC
+ *
+ * Copyright (C) 2025 Sophgo Technology Inc.
+ * Copyright (C) 2025 Chen Wang <unicorn_wang@outlook.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "pcie-cadence.h"
+
+/*
+ * SG2042 only supports 4-byte aligned access, so for the rootbus (i.e. to
+ * read/write the Root Port itself, read32/write32 is required. For
+ * non-rootbus (i.e. to read/write the PCIe peripheral registers, supports
+ * 1/2/4 byte aligned access, so directly using read/write should be fine.
+ */
+
+static struct pci_ops sg2042_pcie_root_ops = {
+	.map_bus	= cdns_pci_map_bus,
+	.read		= pci_generic_config_read32,
+	.write		= pci_generic_config_write32,
+};
+
+static struct pci_ops sg2042_pcie_child_ops = {
+	.map_bus	= cdns_pci_map_bus,
+	.read		= pci_generic_config_read,
+	.write		= pci_generic_config_write,
+};
+
+static int sg2042_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pci_host_bridge *bridge;
+	struct cdns_pcie *pcie;
+	struct cdns_pcie_rc *rc;
+	int ret;
+
+	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
+	if (!bridge) {
+		dev_err_probe(dev, -ENOMEM, "Failed to alloc host bridge!\n");
+		return -ENOMEM;
+	}
+
+	bridge->ops = &sg2042_pcie_root_ops;
+	bridge->child_ops = &sg2042_pcie_child_ops;
+
+	rc = pci_host_bridge_priv(bridge);
+	pcie = &rc->pcie;
+	pcie->dev = dev;
+
+	platform_set_drvdata(pdev, pcie);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_no_callbacks(dev);
+	devm_pm_runtime_enable(dev);
+
+	ret = cdns_pcie_init_phy(dev, pcie);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to init phy!\n");
+		return ret;
+	}
+
+	ret = cdns_pcie_host_setup(rc);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to setup host!\n");
+		cdns_pcie_disable_phy(pcie);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void sg2042_pcie_remove(struct platform_device *pdev)
+{
+	struct cdns_pcie *pcie = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct cdns_pcie_rc *rc;
+
+	rc = container_of(pcie, struct cdns_pcie_rc, pcie);
+	cdns_pcie_host_disable(rc);
+
+	cdns_pcie_disable_phy(pcie);
+
+	pm_runtime_disable(dev);
+}
+
+static int sg2042_pcie_suspend_noirq(struct device *dev)
+{
+	struct cdns_pcie *pcie = dev_get_drvdata(dev);
+
+	cdns_pcie_disable_phy(pcie);
+
+	return 0;
+}
+
+static int sg2042_pcie_resume_noirq(struct device *dev)
+{
+	struct cdns_pcie *pcie = dev_get_drvdata(dev);
+	int ret;
+
+	ret = cdns_pcie_enable_phy(pcie);
+	if (ret) {
+		dev_err(dev, "failed to enable PHY\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(sg2042_pcie_pm_ops,
+			       sg2042_pcie_suspend_noirq,
+			       sg2042_pcie_resume_noirq);
+
+static const struct of_device_id sg2042_pcie_of_match[] = {
+	{ .compatible = "sophgo,sg2042-pcie-host" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sg2042_pcie_of_match);
+
+static struct platform_driver sg2042_pcie_driver = {
+	.driver = {
+		.name		= "sg2042-pcie",
+		.of_match_table	= sg2042_pcie_of_match,
+		.pm		= pm_sleep_ptr(&sg2042_pcie_pm_ops),
+	},
+	.probe		= sg2042_pcie_probe,
+	.remove		= sg2042_pcie_remove,
+};
+module_platform_driver(sg2042_pcie_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("PCIe controller driver for SG2042 SoCs");
+MODULE_AUTHOR("Chen Wang <unicorn_wang@outlook.com>");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
