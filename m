Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD70C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4/9u94p9zp6PQi6NeXEPnqkEixycBYQpGGdqJ/SVEY=; b=lE9VZNkG4AVN9U
	Odn0qSXzLpdZZNGHY2B8riJElwqIpb9w5I5NZyZrWSRI1yluYzAb/80g2b55GF3Q6gFDyEOooNRPa
	rQR4CxsQHIldzFNwZ60r9VsBe2Hmrav2f81XmIIQi3xjw9xBXEB/Rxj8rRmNSWrgDxkL4RxZOOXwa
	p3bDIad/5tH7aTnH4UmCWELr0KpkVMklXbjT/nh20l8XAoohTnHLyksek4ZgYcdBAZgURiQKdfnWo
	pZ+JEpIZMFz/dPuK5bHyzm1ra48fihdKOvNroK8PcwsSYQjz8jLM+dmCJcn59mWj0wFYWCoy5AnGY
	oEzjbn9S3DFPJtfiOhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGjL-00000009FdH-05ig;
	Wed, 11 Jun 2025 08:22:43 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGRA-00000009Cfz-21j5
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:03:57 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6fada2dd785so73659146d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629035; x=1750233835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk7Khhw8gAKW9DoLENa1NeEo5OGSYSokoeVpM6P3AMw=;
        b=fftZZhklLN8R4yYkBST7i67MBaupHs1lzNvevouh07evbOX9bwc8I8TMsdUPhuOSV3
         PZbyHdOM6PS7SJc6/oo/jkMf8VqY2IUj4yiUuw2TPnqoLvjLdkxPAJMzNOAxLZq5kZ7U
         TRVo8k+UILyuzbPz7tLwsfrkwd0uGRrwjjqJGWzxFtnkGR/AiFJTwddUY9bysOQBa7XR
         QxMRQYochhep4N5t8bWNeLpRJteEH02DnydMBlJefICHNCWbeowwZL56gv2BhBGYGFbb
         Etb801MNoM8O4yCiLjGGISfSk95yuoZBDZahgcUvRVGq84IS4VYmQclZzN09HRsUPq9p
         r/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629035; x=1750233835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jk7Khhw8gAKW9DoLENa1NeEo5OGSYSokoeVpM6P3AMw=;
        b=qIImL1HlOntJ5FJIITuX+HV2F6HDN2qtF128/TLToFEb4QgIUNekvjUqB1ScmfbPG2
         59uPEHCVYVLXtJFwFiNK+HS2TFJD8BSFoa8Re+ifPjda5gCnYdHupn6DdZTqVTDiCKOK
         1xcf8bXkESl3e20fTly3hAFOOfVNOBhC3T8yRjJucjzDfPtLpTHwXbl1I9S+yqdlVcM4
         8Sj3R+P+yIHpZKWrRMp/jnoox5gCmVIsP+kSXFh5ou+1O/+cEcDzKsPpLDfHNvPG0iy6
         Xb3u75V5xphHa0ldQww0AjsA/45L6+kqv0ci1M+QEYvnuhohQWBWl2TkT/XQT0bJmFV+
         raUg==
X-Forwarded-Encrypted: i=1; AJvYcCXQoRsqmlXcJHxmDJ4/tIuZvNBmzsUtkPSvCOq/AeSLvHJby+dd69DDVOcWojgHw1V/D6Xhs3d+0Z693g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3NwtsTTX3M65/+CDpOLnWckQLTe+X4CVvWIR6TuozlGgb8gvC
	DtpkcKCuu3Jmsnkg92tBeAsOKtLRJN7kAW9/dyDjegwDx2IRukTRR1U0
X-Gm-Gg: ASbGncucyZroXJVcaDMuAYplD7QwZqqiHZC9bgjUtKLU9Mqv9Dss+gKKW7m+PbE1cxc
	pBhsHAuqeZ3d9qbeZ+kN3Q5kvU22ZjBlAGx6w4R35sOwqYy9f/B4OjtaIBf9oycZCJ8vi1ePwyO
	535McTPNPW+WV5WT2PT1GmY0YpD4VA+ppV7QmeJjps6ElE4A1uVqKJMOWM+Xp3908Vihh7PZD8h
	WEcWu8kstzzq4L9DQx9cbVPraqvwsA+MueBlDLxq6M1sWaHO5DEkoTReDki23px2IL+vDt7e2ED
	mmcGF8PAi2FHC4Glzcck7a8B4wVf02yGQaZsSg==
X-Google-Smtp-Source: AGHT+IH0eJcVpA3Axo1UhLVYk276iRhesKKZ51mNNdrlNRONtSi0+NgwJZgm5NkVtqY8aPkz01lwfQ==
X-Received: by 2002:a05:6214:2a4f:b0:6fa:c246:c363 with SMTP id 6a1803df08f44-6fb2d1355b7mr30778916d6.13.1749629035565;
        Wed, 11 Jun 2025 01:03:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b36737sm79188206d6.115.2025.06.11.01.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:03:55 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for Sophgo CV1800 SoCs
Date: Wed, 11 Jun 2025 16:02:00 +0800
Message-ID: <20250611080228.1166090-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080228.1166090-1-inochiama@gmail.com>
References: <20250611080228.1166090-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010356_526925_95C0D852 
X-CRM114-Status: GOOD (  20.75  )
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

Add device driver for the mux driver for Sophgo CV18XX/SG200X
series SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/mdio/Kconfig            |  10 +++
 drivers/net/mdio/Makefile           |   1 +
 drivers/net/mdio/mdio-mux-cv1800b.c | 119 ++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-mux-cv1800b.c

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 7db40aaa079d..fe553016b77d 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -278,5 +278,15 @@ config MDIO_BUS_MUX_MMIOREG
 
 	  Currently, only 8/16/32 bits registers are supported.
 
+config MDIO_BUS_MUX_SOPHGO_CV1800B
+	tristate "Sophgo CV1800 MDIO multiplexer driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF_MDIO && HAS_IOMEM
+	select MDIO_BUS_MUX
+	default m if ARCH_SOPHGO
+	help
+	  This module provides a driver for the MDIO multiplexer/glue of
+	  the Sophgo CV1800 series SoC. The multiplexer connects either
+	  the external or the internal MDIO bus to the parent bus.
 
 endif
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index c23778e73890..a67be2abc343 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+= mdio-mux-meson-g12a.o
 obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+= mdio-mux-meson-gxl.o
 obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG) 	+= mdio-mux-mmioreg.o
 obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER) 	+= mdio-mux-multiplexer.o
+obj-$(CONFIG_MDIO_BUS_MUX_SOPHGO_CV1800B) += mdio-mux-cv1800b.o
diff --git a/drivers/net/mdio/mdio-mux-cv1800b.c b/drivers/net/mdio/mdio-mux-cv1800b.c
new file mode 100644
index 000000000000..6c69e83c3dcd
--- /dev/null
+++ b/drivers/net/mdio/mdio-mux-cv1800b.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo CV1800 MDIO multiplexer driver
+ *
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mdio-mux.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define EPHY_PAGE_SELECT		0x07c
+#define EPHY_CTRL			0x800
+#define EPHY_REG_SELECT			0x804
+
+#define EPHY_PAGE_SELECT_SRC		GENMASK(12, 8)
+
+#define EPHY_CTRL_ANALOG_SHUTDOWN	BIT(0)
+#define EPHY_CTRL_USE_EXTPHY		BIT(7)
+#define EPHY_CTRL_PHYMODE		BIT(8)
+#define EPHY_CTRL_PHYMODE_SMI_RMII	1
+#define EPHY_CTRL_EXTPHY_ID		GENMASK(15, 11)
+
+#define EPHY_REG_SELECT_MDIO		0
+#define EPHY_REG_SELECT_APB		1
+
+#define CV1800B_MDIO_INTERNAL_ID	1
+#define CV1800B_MDIO_EXTERNAL_ID	0
+
+struct cv1800b_mdio_mux {
+	void __iomem *regs;
+	void *mux_handle;
+};
+
+static int cv1800b_enable_mdio(struct cv1800b_mdio_mux *mdmux, bool internal_phy)
+{
+	u32 val;
+
+	val = readl(mdmux->regs + EPHY_CTRL);
+
+	if (internal_phy)
+		val &= ~EPHY_CTRL_USE_EXTPHY;
+	else
+		val |= EPHY_CTRL_USE_EXTPHY;
+
+	writel(val, mdmux->regs + EPHY_CTRL);
+
+	writel(EPHY_REG_SELECT_MDIO, mdmux->regs + EPHY_REG_SELECT);
+
+	return 0;
+}
+
+static int cv1800b_mdio_switch_fn(int current_child, int desired_child,
+				  void *data)
+{
+	struct cv1800b_mdio_mux *mdmux = dev_get_drvdata(data);
+
+	if (current_child == desired_child)
+		return 0;
+
+	switch (desired_child) {
+	case CV1800B_MDIO_EXTERNAL_ID:
+		return cv1800b_enable_mdio(mdmux, false);
+	case CV1800B_MDIO_INTERNAL_ID:
+		return cv1800b_enable_mdio(mdmux, true);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int cv1800b_mdio_mux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800b_mdio_mux *mdmux;
+
+	mdmux = devm_kzalloc(dev, sizeof(*mdmux), GFP_KERNEL);
+	if (!mdmux)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, mdmux);
+
+	mdmux->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mdmux->regs))
+		return PTR_ERR(mdmux->regs);
+
+	return mdio_mux_init(dev, dev->of_node, cv1800b_mdio_switch_fn,
+			     &mdmux->mux_handle, dev, NULL);
+}
+
+static void cv1800b_mdio_mux_remove(struct platform_device *pdev)
+{
+	struct cv1800b_mdio_mux *mdmux = platform_get_drvdata(pdev);
+
+	mdio_mux_uninit(mdmux->mux_handle);
+}
+
+static const struct of_device_id cv1800b_mdio_mux_match[] = {
+	{ .compatible = "sophgo,cv1800b-mdio-mux", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cv1800b_mdio_mux_match);
+
+static struct platform_driver cv1800b_mdio_mux_driver = {
+	.probe		= cv1800b_mdio_mux_probe,
+	.remove		= cv1800b_mdio_mux_remove,
+	.driver		= {
+		.name	= "cv1800b-mdio-mux",
+		.of_match_table = cv1800b_mdio_mux_match,
+	},
+};
+module_platform_driver(cv1800b_mdio_mux_driver);
+
+MODULE_DESCRIPTION("Sophgo CV1800 MDIO multiplexer driver");
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
