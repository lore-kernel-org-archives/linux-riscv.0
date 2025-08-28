Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E975CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 02:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFWH7zzUfPTfjHNXUQbhcSDf51C5wOSd4I45odAxaPA=; b=ViHl0qO0YdNIa9
	DEgbc4TWWuv7Cv8Iib3NAeLnuuu6yjsEiDXUc2bOa5vQKnjCvO8pQGkGZPkAarNvA4oiSvzasH5SI
	gUtQp48KIjnDZVR8h4FV61VrDJEiq1vshArCxuyxQz6QqKWXAw+gfjgC89A4VSmiIr8R0If4QR/4i
	YqwGaVJKp85rOscKkxY5NYaMbAY/p3MR8HN8z4oUq/OBz2RgBpQUexapNs47Gs1j0OItJ8nbcFJ54
	SnYR1nzFZpUbFtTrnCv49nFQPkPOR/VxjXrN34HZjHoNHt2FsMk9X/N7a1fHnHD/R5tooPYAj86DK
	KSTFvVDkfBYrQSFMRFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSFS-0000000006S-0Zp6;
	Thu, 28 Aug 2025 02:20:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSDG-0000000Hamq-3JM2
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Aug 2025 02:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=G1J0WFYBhSOi86+35mD2mRHFDAZtuR1uDJv4Cz+MRN0=; b=oc1s5y/vOvGgU8HFuk0PJayphi
	sMnKL7IPK9U504zO6TYbw/jBq8D9QhOV4gifl9QP0bVbK6sSVDoo+xrdh3cygxWoYMxmfbiZqn3ZF
	uKwGTtS2mhJfQkbTHycsimwXwAiDVTHU1RYaksFsur7/CBESdSJF3NYhqJ8JL6oCnPCDA5vq2I4pE
	LvOHqxi6HmNs88/O2GS36MNoRDOg8PtE1+XSZVTW0WLfaD71Fh1vPMdWnYGwA0rxLPKy3dZefOWhN
	6+XAnOxFz/SCtwXJEEUfXaVMMHeel9TngkRLqekXGKbMv4Kxp/MqjqkZROt/vWkwAW6bNh8Gdj49H
	mf4mkRcQ==;
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSD1-00000002bv3-3vnY
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 02:18:05 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-30ccec59b4bso461837fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 19:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347469; x=1756952269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1J0WFYBhSOi86+35mD2mRHFDAZtuR1uDJv4Cz+MRN0=;
        b=T53TcEyQTGruRcJ3pWkTMp6coJOl+5vaEzDExaHZrseXT1tBKm2haIG15vLeAWhaP+
         xgNlLA2b+B6JeDTn5VSmkRF/4aEztaGMreLjhKrMCkXHfDXVyRmeOM/AoHO908FSf9El
         c0/9Lfbk6n328nF5TXJQLv/vYzBNZSOrc9tDvAYWxJY0JvKtsCJnjDCsDKthfwN9nnkU
         zzfoqkJYVV/LAZmitsT1wMLDD6/trrwItwwO0MmkcNp8j4IjQXJrUEQnADu7LjjMbK+R
         pcUJ2IF2Lv1d81Xe5TKxPJO2KTLzcKWCMNI2fLWKLuj/Rn2qBSQm6XJsAkGGyTUdCAt7
         zLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347469; x=1756952269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1J0WFYBhSOi86+35mD2mRHFDAZtuR1uDJv4Cz+MRN0=;
        b=uuYcdRnQEqoaEhQE2qOTOQKrwkSUUkmHFiivCuGpDHv+RUmL8J4CpadgRcLmvFPGfY
         oS4ivntimxMJ17m+7Bw914qnicoWPg9HmtnbD5zlR77ETJoH64hwMmTOLNjHswo5g6U/
         5B5fuhBWz0tRMc9znJZYW6mtXXS/3G+yFuTUrHBXNL1kZBrIoTlkjSS4pab9jtwKE32a
         9vG7taWK/PFaYeKnhq3xrNq2aiZZCw57shrGuCSGZuAZLJ4dwShxl7XMmEoXIQeSHsxx
         U60pjlKEAvsR7n985RsFKNt2SLGtGW9oX48sSr8FOHAr4II/koqqA8vnOc51FxgVml4X
         Ko8g==
X-Forwarded-Encrypted: i=1; AJvYcCUL+lmW7/ax9YQGh7OCXetnBDncSMF5Mo+y+uqIl3zj+6xgR3M7ocAijdsw5aSCP/imWzQP3mwuNp1rmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwH8WCxYlx3UKY6g6sEyycCdiwfgmlNXPsSTTpIQHPMBd5V3DnY
	1OrxVHqGpFWz4eqO88mVoRqO+Gn73JrGMT7EGmJeNE3ido/d0UDtgkf8
X-Gm-Gg: ASbGncvEjLHzRmkge2UDT+QqV4haCKDbRCrFptnBPOlEMJQoSlyxyE9cc4EJHvom6Rd
	nn7L3e+Tf3wRRntdFwPpeK7wn1nyXDeCFK9J0yAmHhtFJ27itqY8cHCa6dOslaPSdZeOxoHWrae
	TYhCK7eRIct7GaWFL/g/M8Om1e36GOt2UdqzQoR9uPQoOpCqCvsspKuePue43nYNymhDB3svV5l
	/6UBwvH3NZc2dMByKLj2XimYXx5Pyn5xZ9ndCIYpitwgt5NOzqV/GDCs0YzTVcoUmwwNUpo2OHn
	KsanHZyxOpYSNMJzHjVEXYp8CLbXQsCnrR0jl6Iugq9zBeUwwS8SzpUpCRMWQJI3Yy5FVHAOJmS
	eruhchm9MomGVb4frmmhMr3OevrKOZDMMkTjmLOkh4Tk=
X-Google-Smtp-Source: AGHT+IHsxuJu7jkWvWsps1igHiY/UUiFcSFtA/FN5HQqjKuBeXruePrLDEHJj7TO/JjdqRVkSNwrvw==
X-Received: by 2002:a05:6871:e387:b0:315:8a2a:3f59 with SMTP id 586e51a60fabf-3158a2a4cf7mr1544247fac.21.1756347469269;
        Wed, 27 Aug 2025 19:17:49 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7a2dc16sm3674563fac.12.2025.08.27.19.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:17:47 -0700 (PDT)
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
Subject: [PATCH 3/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Date: Thu, 28 Aug 2025 10:17:40 +0800
Message-Id: <1df25b33f0ea90a81c34c18cadedd38526a30f01.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_031802_938225_A0EB1ED9 
X-CRM114-Status: GOOD (  22.94  )
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
PCIe controller will work in host mode only.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/Kconfig       |  12 ++
 drivers/pci/controller/cadence/Makefile      |   1 +
 drivers/pci/controller/cadence/pcie-sg2042.c | 134 +++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c

diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
index 666e16b6367f..b1f1941d5208 100644
--- a/drivers/pci/controller/cadence/Kconfig
+++ b/drivers/pci/controller/cadence/Kconfig
@@ -42,6 +42,17 @@ config PCIE_CADENCE_PLAT_EP
 	  endpoint mode. This PCIe controller may be embedded into many
 	  different vendors SoCs.
 
+config PCIE_SG2042
+	bool "Sophgo SG2042 PCIe controller (host mode)"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	depends on PCI_MSI
+	select PCIE_CADENCE_HOST
+	help
+	  Say Y here if you want to support the Sophgo SG2042 PCIe platform
+	  controller in host mode. Sophgo SG2042 PCIe controller uses Cadence
+	  PCIe core.
+
 config PCI_J721E
 	tristate
 	select PCIE_CADENCE_HOST if PCI_J721E_HOST != n
@@ -67,4 +78,5 @@ config PCI_J721E_EP
 	  Say Y here if you want to support the TI J721E PCIe platform
 	  controller in endpoint mode. TI J721E PCIe controller uses Cadence PCIe
 	  core.
+
 endmenu
diff --git a/drivers/pci/controller/cadence/Makefile b/drivers/pci/controller/cadence/Makefile
index 9bac5fb2f13d..4df4456d9539 100644
--- a/drivers/pci/controller/cadence/Makefile
+++ b/drivers/pci/controller/cadence/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
 obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
 obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
 obj-$(CONFIG_PCI_J721E) += pci-j721e.o
+obj-$(CONFIG_PCIE_SG2042) += pcie-sg2042.o
diff --git a/drivers/pci/controller/cadence/pcie-sg2042.c b/drivers/pci/controller/cadence/pcie-sg2042.c
new file mode 100644
index 000000000000..fe434dc2967e
--- /dev/null
+++ b/drivers/pci/controller/cadence/pcie-sg2042.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pcie-sg2042 - PCIe controller driver for Sophgo SG2042 SoC
+ *
+ * Copyright (C) 2025 Sophgo Technology Inc.
+ * Copyright (C) 2025 Chen Wang <unicorn_wang@outlook.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "pcie-cadence.h"
+
+/*
+ * SG2042 only support 4-byte aligned access, so for the rootbus (i.e. to read
+ * the Root Port itself, read32 is required. For non-rootbus (i.e. to read
+ * the PCIe peripheral registers, supports 1/2/4 byte aligned access, so
+ * directly using read should be fine.
+ *
+ * The same is true for write.
+ */
+static int sg2042_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
+				   int where, int size, u32 *value)
+{
+	if (pci_is_root_bus(bus))
+		return pci_generic_config_read32(bus, devfn, where, size,
+						 value);
+
+	return pci_generic_config_read(bus, devfn, where, size, value);
+}
+
+static int sg2042_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
+				    int where, int size, u32 value)
+{
+	if (pci_is_root_bus(bus))
+		return pci_generic_config_write32(bus, devfn, where, size,
+						  value);
+
+	return pci_generic_config_write(bus, devfn, where, size, value);
+}
+
+static struct pci_ops sg2042_pcie_host_ops = {
+	.map_bus	= cdns_pci_map_bus,
+	.read		= sg2042_pcie_config_read,
+	.write		= sg2042_pcie_config_write,
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
+	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
+	if (!pcie)
+		return -ENOMEM;
+
+	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
+	if (!bridge) {
+		dev_err(dev, "Failed to alloc host bridge!\n");
+		return -ENOMEM;
+	}
+
+	bridge->ops = &sg2042_pcie_host_ops;
+
+	rc = pci_host_bridge_priv(bridge);
+	pcie = &rc->pcie;
+	pcie->dev = dev;
+
+	platform_set_drvdata(pdev, pcie);
+
+	pm_runtime_enable(dev);
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "pm_runtime_get_sync failed\n");
+		goto err_get_sync;
+	}
+
+	ret = cdns_pcie_init_phy(dev, pcie);
+	if (ret) {
+		dev_err(dev, "Failed to init phy!\n");
+		goto err_get_sync;
+	}
+
+	ret = cdns_pcie_host_setup(rc);
+	if (ret < 0) {
+		dev_err(dev, "Failed to setup host!\n");
+		goto err_host_setup;
+	}
+
+	return 0;
+
+err_host_setup:
+	cdns_pcie_disable_phy(pcie);
+
+err_get_sync:
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static void sg2042_pcie_shutdown(struct platform_device *pdev)
+{
+	struct cdns_pcie *pcie = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	cdns_pcie_disable_phy(pcie);
+
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+}
+
+static const struct of_device_id sg2042_pcie_of_match[] = {
+	{ .compatible = "sophgo,sg2042-pcie-host" },
+	{},
+};
+
+static struct platform_driver sg2042_pcie_driver = {
+	.driver = {
+		.name		= "sg2042-pcie",
+		.of_match_table	= sg2042_pcie_of_match,
+		.pm		= &cdns_pcie_pm_ops,
+	},
+	.probe		= sg2042_pcie_probe,
+	.shutdown	= sg2042_pcie_shutdown,
+};
+builtin_platform_driver(sg2042_pcie_driver);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
