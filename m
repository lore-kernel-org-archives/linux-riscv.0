Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A57606A32C
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aumzOFo/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GePq53wL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4T8fobie4csrptIK7WkyMiLa1TUEQCmhSuvEhN70/l0=; b=aumzOFo/qQbjF5oUlWyWWrfEnf
	8kTxPrzJ9sIyOkZOC5U2nOy+DbDoPZUaisLjMq16mNcYwLA+hNKlCEmkQXuM4noD0O6T9nkICGro8
	s/xzIJ+UAfYfWDMgascKiXUzJhnMg1AxY+/4d9h/ACBw20xJxAi0mUJZhysvp0sUo4O4gUbmZonyW
	2o5VntoyhQdnVsjMFr+o8+/EOlToE91mknWit+ldzNYobWWmyvhnW9ozVQUlKfsWXrctgNGHXNyFF
	DrLdlA8a8ojOjcimN/ATblimNZJsW08hSWwpnvwHuqPGRZj287q5tAlvdq7BwktAznnCeSH5AyKev
	BvBmpckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBWl-00000001S0e-3KZX;
	Sun, 22 Nov 2026 17:38:59 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBWg-00000001Ryt-3FYb
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 17:38:58 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38190551625so5348463eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369134; x=1795973934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orB6lrzLivgtrtBBhDCdt1CSbjhX161s0L8BSLZHQSc=;
        b=GePq53wLfr/5WqnjKtcjFH3MiYY+nN3ooJtFvSkv5YZLe/CqWGaZ+2VA5rzZ/ayCY/
         tCoxOvirYUNGT5TMko2tkcc+GEvWq2j/A81y1xS5qrxnlZpcr2Jb0mdtWUf9N+a0cd40
         zeslZr1T75p3SsO2CKC2i0mtkZ49KZSKcNeGUjHrr4zERo0F2yuQT6FUD2iIg9RG/rWJ
         ovf/hE7tboYznYVF8cbgB9IUCAhi6f/WEd9xQs47eP+LEpBjY81Wxeuxln/jK8Yd5JA5
         7N/Qpnz7UxNCGEv02UBafpavttVtiBTO3MtZa2WujuYgfwVhTndfJcxY49JoxeyZzNgh
         ZYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369134; x=1795973934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=orB6lrzLivgtrtBBhDCdt1CSbjhX161s0L8BSLZHQSc=;
        b=zX/4+dt6wobTDvIq/nDQwECMSUIGhuRAi7sC0OxCX+QWf7F5TGXyXNGM4MJ6YWQiTL
         kpoASG3yOYI2G++qmxki0xXGonrCKBIDiSYAlH6tWyb23GrY/g9czwNcWBoRnl9V06zf
         wiJ/1Ubo+cswgdf4k5bSAQmdBhNcNfZMAdlWXJPKNxpvFirPxDjwBzHGYXDt5F+SEhQb
         ctbDv1JuMLH8YRZpONLj88b9QgUzPenIKsomLtuoXJtFzCDppAmm23gHo4eldZ7Qv1p4
         dbMn69AI8GG/715WZD6hR1c+0dlbO02J4JIZ17QjDNpS6+jmQEzxRClGJ1CanRwvB/CW
         hAnQ==
X-Forwarded-Encrypted: i=1; AL+hErFvhGVswUBul9tVbHzpLPapufD3Ns6K6iGYiFEIlWiw1/Aws/FgWFbNLjWWENZfEypyTR5EtI8JfrwstA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8KAyfAnRstl1GQYg5ZQ2SbEpmDhEeDdXhbbA3pzh0swVd1SWgm
	QI/nDy21E0Ac/FQZoQEgqK5H9HxDT9BZcqWXvEhEJsiHjgNNW5HponR5
X-Gm-Gg: AZFdTZdN+91g6NK9PJ15xv6niD+VeSh0EqNFE2QUKZRvrWKoLGhRsNK5yTNS8hSckp0
	FobCJc2rjVG0rZYNXYU9oTSA/Espj7rxc37kp3yIRcw6ECmttW5PbDl0/oF9spB4btJqgx1N67m
	GvoEew+8sFbsGRgG+PI+TA0vBy87+BkLPI1wtrhS6tiXrft6A9Vv3Yy0r890YSAL3fVBGmiBcxm
	4TVjMp2YzLCND2aObW+og8Cne+Vbg4SwlgMoMg3sHaZv8pdNq9uD8lFZgAdvf+cPYolnOfZ/QIz
	Luxts1u/IlRmCFujKkmd3QDqw/kMFrKUvdDr4Pp/LGt3bPGyWcdoU4+XeVypcRU45m/lxlxHo03
	zgsPeS8k7nBIsEvcMIqXa60E0gsS+JBOHNtcE62lwnh03pbAZO8tYN5IhIO11ZJ5XcZf9Vo5fq/
	98Zzv2xGx7CVMfVguhSJ6OaYJlentRosNOe+9NICVB9cCSlwlAxoucNH3Q2DtFApwATHapU4pSX
	mLzmzmyvmRap9RXgGJSRMZ0wbOWA8CEYjFdlZrvPnSm2yxm5/Q15rDkENTknPkDGWI8BlyqmeJs
	u+CsnTn0+7ZxQrx4Avon73VCwXZQE1IiYjo+JtxOQVlVYQukAA==
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr451144eec.16.1795369133997;
        Sun, 22 Nov 2026 09:38:53 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:53 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Date: Mon, 23 Nov 2026 01:38:09 +0800
Message-ID: <20261122173810.2409146-3-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_093854_825234_C4E5CCBE 
X-CRM114-Status: GOOD (  24.03  )
X-Spam-Score: 1.5 (+)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
controller. These banks contain temperature calibration parameters and
other configuration data.

Reload the shadows during probe and cache the data for subsequent reads.
Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
other banks.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/nvmem/Kconfig             |  11 ++
 drivers/nvmem/Makefile            |   1 +
 drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a9eb764ffee..e0af83ecee37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26529,6 +26529,7 @@ SPACEMIT K3 EFUSE DRIVER
 M:	Jiayu Du <duge1256@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+F:	drivers/nvmem/spacemit-k3-efuse.c
 
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..4a8f975b35c7 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,17 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SPACEMIT_K3_EFUSE
+	tristate "SpacemiT K3 eFuse support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	help
+	  Say Y here to read configuration and calibration data from the
+	  SpacemiT K3 eFuse shadow banks. Programming the fuses is not supported.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called spacemit-k3-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..d29716957faf 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SPACEMIT_K3_EFUSE)	+= spacemit-k3-efuse.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/spacemit-k3-efuse.c b/drivers/nvmem/spacemit-k3-efuse.c
new file mode 100644
index 000000000000..48e072602583
--- /dev/null
+++ b/drivers/nvmem/spacemit-k3-efuse.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K3 read-only eFuse driver
+ *
+ * Copyright (c) 2026 Spacemit Co. Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <asm/byteorder.h>
+
+#define K3_EFUSE_NR_BANKS		16
+#define K3_EFUSE_BANK_SIZE		0x20
+#define K3_EFUSE_NVMEM_SIZE		(K3_EFUSE_NR_BANKS * K3_EFUSE_BANK_SIZE)
+#define K3_EFUSE_BANK7_OFFSET		(7 * K3_EFUSE_BANK_SIZE)
+#define K3_EFUSE_CONFIG			0x004
+#define K3_EFUSE_SOFTWARE_RESET		BIT(22)
+#define K3_EFUSE_BANK0_REG		0x104
+#define K3_EFUSE_STATUS			0x184
+#define K3_EFUSE_READY			BIT(1)
+#define K3_EFUSE_BANK7_REG		0x190
+#define K3_EFUSE_RELOAD_PULSE_US	1
+#define K3_EFUSE_POLL_INTERVAL_US	1
+#define K3_EFUSE_POLL_TIMEOUT_US	10000
+
+static const struct {
+	unsigned int reg;
+	unsigned int offset;
+} k3_efuse_banks[] = {
+	{
+		.reg = K3_EFUSE_BANK0_REG,
+		.offset = 0,
+	}, {
+		.reg = K3_EFUSE_BANK7_REG,
+		.offset = K3_EFUSE_BANK7_OFFSET,
+	},
+};
+
+static const struct nvmem_keepout k3_efuse_keepouts[] = {
+	{
+		.start = K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_BANK7_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK7_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_NVMEM_SIZE,
+	},
+};
+
+struct k3_efuse {
+	__le32 data[ARRAY_SIZE(k3_efuse_banks)][K3_EFUSE_BANK_SIZE / sizeof(u32)];
+};
+
+static int k3_efuse_read(void *context, unsigned int offset, void *val,
+			 size_t bytes)
+{
+	struct k3_efuse *efuse = context;
+	unsigned int bank, index;
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_banks); bank++) {
+		if (offset < k3_efuse_banks[bank].offset)
+			continue;
+
+		index = offset - k3_efuse_banks[bank].offset;
+		if (index >= K3_EFUSE_BANK_SIZE ||
+		    bytes > K3_EFUSE_BANK_SIZE - index)
+			continue;
+
+		memcpy(val, (u8 *)efuse->data[bank] + index, bytes);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int k3_efuse_reload_shadows(void __iomem *base)
+{
+	u32 val;
+
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val | K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+	readl(base + K3_EFUSE_CONFIG);
+	udelay(K3_EFUSE_RELOAD_PULSE_US);
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val & ~K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+
+	return readl_poll_timeout(base + K3_EFUSE_STATUS, val,
+				  val & K3_EFUSE_READY,
+				  K3_EFUSE_POLL_INTERVAL_US,
+				  K3_EFUSE_POLL_TIMEOUT_US);
+}
+
+static int k3_efuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvmem_config config = {
+		.dev = dev,
+		.name = dev_name(dev),
+		.id = NVMEM_DEVID_NONE,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.reg_read = k3_efuse_read,
+		.word_size = 1,
+		.stride = 1,
+		.size = K3_EFUSE_NVMEM_SIZE,
+		.keepout = k3_efuse_keepouts,
+		.nkeepout = ARRAY_SIZE(k3_efuse_keepouts),
+	};
+	struct reset_control *reset;
+	struct nvmem_device *nvmem;
+	struct k3_efuse *efuse;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int bank, i;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to get clock\n");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+
+	reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = dev_err_probe(dev, PTR_ERR(reset),
+				    "Failed to get and deassert reset\n");
+		goto disable_clk;
+	}
+
+	ret = k3_efuse_reload_shadows(base);
+	if (ret) {
+		dev_err_probe(dev, ret, "Timed out waiting for shadow reload\n");
+		goto disable_clk;
+	}
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_banks); bank++) {
+		for (i = 0; i < ARRAY_SIZE(efuse->data[bank]); i++) {
+			u32 val = readl(base + k3_efuse_banks[bank].reg +
+					i * sizeof(u32));
+
+			efuse->data[bank][i] = cpu_to_le32(val);
+		}
+	}
+
+	clk_disable_unprepare(clk);
+
+	config.priv = efuse;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem),
+				     "Failed to register NVMEM\n");
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(clk);
+	return ret;
+}
+
+static const struct of_device_id k3_efuse_of_match[] = {
+	{ .compatible = "spacemit,k3-efuse" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, k3_efuse_of_match);
+
+static struct platform_driver k3_efuse_driver = {
+	.probe = k3_efuse_probe,
+	.driver = {
+		.name = "spacemit-k3-efuse",
+		.of_match_table = k3_efuse_of_match,
+	},
+};
+module_platform_driver(k3_efuse_driver);
+
+MODULE_AUTHOR("Jiayu Du <duge1256@gmail.com>");
+MODULE_DESCRIPTION("SpacemiT K3 read-only eFuse driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
