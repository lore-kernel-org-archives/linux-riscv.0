Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02704CAC582
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 02:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuEQkL8fJw9B7bRDB5PipXaoM4/9nbGI/21yXxVnDAA=; b=VdWv6nEviELdrn
	KDjM4sNg42ndr/talsoNo0NAzyMXTIjtS97qAP4SfouDc0cEByU6WWJUJ0QIjIPG0McLuFh/TweDO
	/wvjCATKHOo8nQbgyst5KIRR9qI15E1sjqjIV6JF9EoUGIrf4EDuCyo5GW0d+CgCi78HzO6KniW0Y
	/2Pi/Krkn6ODvaZzVtHkR5mriMLzmF3LSyby2LetMpvpHAv3qk8//cZSJjvVGp7ESAC+RyAqmBT6N
	To7Jnt9Pu3sW7er5puVfBw2SULmSp5TBO1NDTQ3aZpKL7eDJfzk0KwSSzFispImPRRzyiqfBn4TZp
	KHnP0B9Q7yi3XH6gjzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAGR-0000000BbTH-2OdU;
	Wed, 10 Sep 2025 02:08:51 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAGP-0000000BbRu-1lcq
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 02:08:50 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-722e079fa1aso68459196d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 19:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470128; x=1758074928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1kKuKImv7GctF9OqERXtoZe8KO1bpSjPCvzB+6cOlo=;
        b=L8KDGq0I5FKGxeBypQF+4yIa8lq+DnR7/+Bwnkzjbtv7LGsWnCYhmdXuWjCxQm6U7z
         0yRRy66OS0Tvocib8UGt0aodrNtXsiy5UrFZun+wpmn75AwnQm8gcHztWbJDFHijuh7q
         h7a6lKFKX98HULMLxlsaVRFDgB9lhF7/xogXtnMBGaScUjoDElohGv6ZA5P8DT2bOb7z
         9UsFysuk0ZZ3q54fVZNt6A+ZNai+t3DkKlEeZlXlckiP1mfkV93OvMJzoDkHLBHljrI/
         n1UjZSaA5tIU9TTFJxq1q5YI4bHsINiJ9s9iwcOqwZMNO+vNbHt5wtww+zWCkoVt4UWv
         F3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470128; x=1758074928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1kKuKImv7GctF9OqERXtoZe8KO1bpSjPCvzB+6cOlo=;
        b=BIXil24RaZXh2lCaWfU6k1MlSQakDAxVBxriT0nGyaWC65e0+Uu6+uFuOSs0Wu1R5B
         LcMxbtK+XLvBc6/QKvkJvdSq84pywzj/swUmnw0Lp4fCk6iKVveb8LP3nyAxeMdF2KZj
         OfT6MmAQCM+U5iOcOo/WWweWGqkVVJAwHJr679xbv9Z9bu+f/tnMHtiqlcngCg3axMeA
         YIvDhZMJAAXUkhFmqlHjLpp7mES3sXeHLvJ9GXsya54Ut2Lh6xBnePxM2hAxLMrJ4KTE
         AgeNf2+QWEVqDK6yX6q+eVvi6eF56H4qP9BnxBKQrhSIRkBaoVMsCAx/fw10k4tD1oYg
         Z5xg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1FwU/NleIKokdTKepE+R2ickB6rJv4znZoOQKhSJBHyd/96pHkepl91mcTkamTc+rqmPKxhnWpPLGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvqibofEtDzE6FWlCy9SK7ol48Ni9ipZ1rnELxYuhhqkml2NK5
	6PmwVclyS8BOgGCIGuKNf+4nwV7Hbd/IukjvCaEHXbTX1EwMnoQpe/Ec
X-Gm-Gg: ASbGncuu5Luuojai7FMhRrr3+SVM4zKSYC2GqanljGWQGEKy6ZowKMDsTFmaqyA1Juh
	T3giXZgZfgGS8D/cOa/CPfKX79fLhvDCpQXS2DIMR5mPytLDA4L3E2KNU65ONfRXYrm26QXLqXJ
	Qj/X5T4qTnKClFYpgV10HDJ8F9hrXfLUgqGytuwm64dA3ne8S5d2dcw9ue/Xhz6uAIAOFKQ9T27
	ehuODLeoyQk2pSdx7n5fNcktRNpi87U3RlSoA4mdrYgU65kgXDAimusVTop7qxIK1/pJa2bhwdV
	B88AsK6aOMSZo3BIJ98a5sDJuMmIznZLnR2j41j/jRhUK2dAiKz3Gj2Zice+DozTQYQCGwfyCMV
	nwY+QOpjM23T9pYYN0/pWR5GRSV2dfhNZ
X-Google-Smtp-Source: AGHT+IEP0LcAhoihnbV2d1OBh2Z6NJtDjWlEEi8NwAlfZHgJtJ8a8yODK14yeBgI516xZ4vfhQNFaQ==
X-Received: by 2002:a05:6214:2421:b0:720:e5a:fe3b with SMTP id 6a1803df08f44-7394425a27dmr153957196d6.58.1757470128096;
        Tue, 09 Sep 2025 19:08:48 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-725dda254d4sm132429776d6.8.2025.09.09.19.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:08:47 -0700 (PDT)
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
	fengchun.li@sophgo.com
Subject: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Date: Wed, 10 Sep 2025 10:08:39 +0800
Message-Id: <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190849_479088_10AD188E 
X-CRM114-Status: GOOD (  20.73  )
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
rate(gen4) and lanes(x16 or x8).

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/Kconfig       |  10 ++
 drivers/pci/controller/cadence/Makefile      |   1 +
 drivers/pci/controller/cadence/pcie-sg2042.c | 104 +++++++++++++++++++
 3 files changed, 115 insertions(+)
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
index 000000000000..c026e1ca5d6e
--- /dev/null
+++ b/drivers/pci/controller/cadence/pcie-sg2042.c
@@ -0,0 +1,104 @@
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
+
+	cdns_pcie_disable_phy(pcie);
+}
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
+		.pm		= &cdns_pcie_pm_ops,
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
