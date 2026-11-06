Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BEE606A335
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 06:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IeE+UpcK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gT7Hf7ic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LPUtRgaxj0I4XgfCLHA1Q0jWyYQFxDd0Ip8qUaDpEzo=; b=IeE+UpcKMioIc7Q0fyONis4j8m
	oaUojq6kgIcsFxswaEjmtvfpaj3jEq3iZGZsyjWzfgkXYg32/9a8PgLx1m7mm8t6VRLzxun7b938f
	JWiWiM6JcTzolqvHPm0LP4EmszcIb1JUXybwM9/3Dp8orD1axkCj13pP3dxdQyRsnCTk/uSaHi5Os
	XHVjbFU2g1mPGDLNLh8L1AqSGSEEYv+uKbKm8QpBwG96krVNGGIbAEHsAtqSYdLoPcNjvebubVIBe
	HyPLz3Q8y9jS6liDW52T6fapvtaVO06CPcv9zKrPeu8ZdnT+q0WJgrhJV38AVxXIqtySckabtDeI9
	XA8VtPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD6Z-0000000BJxn-3rU1;
	Fri, 06 Nov 2026 06:07:15 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD6X-0000000BJwM-2d37
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 06:07:14 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1ae18eb9b69so421041c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 22:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945233; x=1794550033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tf8e1TiIZCPiuqeGmQ9C1JUjOtS/N/aYWA/KP8sylw=;
        b=gT7Hf7iclELyYlQd9K8NaZ/MekwBEIN76zBo0Fz2ze50OURRI/7iw3gjd7aj1w6lrM
         73iUGUKOaLE6UtQe7S2kYoqa1UUbsmgS6HZ+5VjN8HhbLw9KrTb0H18v4cX5hrxk0vbC
         59XNmtaS5QabbfaZEIT/q6a1SiUrrXhP3iQGcqkcDI6Fd3xMSnXzdSI8yj5QR6hTVx6l
         QyxKTJKgMSKNnRZB1kFfGsR+hLKMrRmR+S0977n0cV+3VqWHikz+JUoiU+Bj8I+oAfaY
         W3+TjVKyOnIc1izBf6i17u6MHAJvEhzJ9JxsKu26CD6dtV1XVBYIfT7mgEFuKfDH7I4j
         1qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945233; x=1794550033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tf8e1TiIZCPiuqeGmQ9C1JUjOtS/N/aYWA/KP8sylw=;
        b=CbGmJvbuDN98byHnTKVrGqKATHdi1dImeJhL2m/ZglJUnii6t1AKgdKBJz3U8E6bUQ
         k2+pKNgECpsOIyaLiD21mwm4X30q8n2D7BrzlOLSQLM9gXf3g492GfdHfw8GTsikUsjh
         l90qhNfjemlmPg8bOlWuJLZBVWEMS+Z9Cj8JzuRSJSwDcIIJmiyKUDAOTlreS8g0CmdO
         fuTmjLlj71WbVmrS+hCmr8PAL9457i5OUs9EWWxU1hfoeK2Gvo9P1RFLjBPncrpam9Tz
         zOdDw35zrI+4gpwI3KGoMX/3+JabJ2HzjLKI8DELZzY0rBWFlEzHEzfrNSVhkT8dWj5D
         celA==
X-Forwarded-Encrypted: i=1; AKwUvBw8h5t5nCFVNhDrrkbRU+uxptWF0oWDCWm3aU0anhk+VIbEDJqBY8L3nmZaZy1wsOFlpJdM60JidrzxPg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Xg6XLHvntQ5zjCAtypW1U59F/t9MKtrP6BvRpSxtBaowMaT8N
	zJBdmur59XZufP45RCWbhadyWiv2futo+vJYH9BdTCcQqtS7vPvkUNLY
X-Gm-Gg: AYBFou0voiK0vPCgHlMd3MsulQy8IrpwaELwR7iIXYCPDflJNLnEaHQBxFwDeIvzZas
	x2mKzB3D/2ej1AiF7H/BkmYVgzlzHMjK3vVQtTfPA8/SB5G5eGXD1jkzT5GKtdMtUInp20age/6
	Fq3/eQaG/QHQQaqx/bRLvR20yyasri2hVnN9k8RzXrLBkNqs5pque7NBQrYkaXx3wRUXjpttgIt
	wM4vTI+MTIJjUdUkImzcT33wdHYmZ6ADUZ2uFLRg54Cz1I0zarVkz88FzJqn5HzWpAlplvrDNiM
	849RP28UglfAgbXcjTffTTyKydA0oDT/GgErKYxV5doh7Z3l5v3qXs5es4tn1NuNvrTxwUe2lzG
	xFgVZVuyfjG+noAx6efZycoVe1bdTXjn0wxThZ0eX3xX78rN1pC+DmF5vofrlUBDbUUnUdNH9zK
	L+1EsyBTVPmJwNu1NmUjdKZ8U0B9pUbSZG0MiW6XoCUI0Zzu/cHrdD6XXeJRamaojQHXWGtA72F
	o7dmS3nG4N+eJ3QrkuwYP8HFdFL0mfNz1CKTHj6pxbd9XVCAu1wkaMLuXI1VPxpLx0rZ8m8huw5
	2GojgpQ9LjqnrC//n6V8B7tb6942xcjxrDp4xblelKajcee2t1Mi
X-Received: by 2002:a05:701a:c907:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b25d2fe798mr1729112c88.8.1793945232552;
        Thu, 05 Nov 2026 22:07:12 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:12 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
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
Subject: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Date: Fri,  6 Nov 2026 14:05:24 +0800
Message-ID: <20261106060525.346873-3-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220713_675616_420D58CB 
X-CRM114-Status: GOOD (  24.68  )
X-Spam-Score: -1.9 (-)
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

Snapshot the shadow registers with aligned 32-bit reads and expose the
data in little-endian order at controller-relative offsets. Serve reads
from the snapshot and use keepouts for the remaining register ranges.
Keep the AES_WTM clock enabled and its shared reset deasserted while the
provider is registered.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/nvmem/Kconfig             |  14 +++
 drivers/nvmem/Makefile            |   1 +
 drivers/nvmem/spacemit-k3-efuse.c | 151 ++++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+)
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
index d2f5bb236663..28d6c59fbd74 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,20 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SPACEMIT_K3_EFUSE
+	tristate "SpacemiT K3 eFuse support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK && RESET_CONTROLLER
+	help
+	  Say Y here to read configuration and calibration data from the
+	  SpacemiT K3 eFuse shadow banks. The boot firmware must have loaded
+	  the shadow registers before Linux starts. Programming and reloading
+	  the fuses are not supported.
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
index 000000000000..d106053beae8
--- /dev/null
+++ b/drivers/nvmem/spacemit-k3-efuse.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K3 read-only eFuse driver
+ *
+ * Copyright (c) 2026 Spacemit Co. Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#define K3_EFUSE_REG_SIZE		0x400
+#define K3_EFUSE_BANK_SIZE		0x20
+#define K3_EFUSE_BANK0_OFFSET	0x104
+#define K3_EFUSE_BANK7_OFFSET	0x190
+
+static const unsigned int k3_efuse_bank_offsets[] = {
+	K3_EFUSE_BANK0_OFFSET,
+	K3_EFUSE_BANK7_OFFSET,
+};
+
+static const struct nvmem_keepout k3_efuse_keepouts[] = {
+	{
+		.start = 0,
+		.end = K3_EFUSE_BANK0_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK0_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_BANK7_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK7_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_REG_SIZE,
+	},
+};
+
+struct k3_efuse {
+	u8 data[ARRAY_SIZE(k3_efuse_bank_offsets)][K3_EFUSE_BANK_SIZE];
+};
+
+static int k3_efuse_read(void *context, unsigned int offset, void *val,
+			 size_t bytes)
+{
+	struct k3_efuse *efuse = context;
+	unsigned int bank, index;
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		if (offset < k3_efuse_bank_offsets[bank])
+			continue;
+
+		index = offset - k3_efuse_bank_offsets[bank];
+		if (index >= K3_EFUSE_BANK_SIZE || bytes > K3_EFUSE_BANK_SIZE - index)
+			continue;
+
+		memcpy(val, efuse->data[bank] + index, bytes);
+		return 0;
+	}
+
+	return -EINVAL;
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
+		.size = K3_EFUSE_REG_SIZE,
+		.keepout = k3_efuse_keepouts,
+		.nkeepout = ARRAY_SIZE(k3_efuse_keepouts),
+	};
+	struct reset_control *reset;
+	struct nvmem_device *nvmem;
+	struct k3_efuse *efuse;
+	struct resource *res;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int bank, i;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (resource_size(res) != K3_EFUSE_REG_SIZE ||
+	    res->start % sizeof(u32))
+		return dev_err_probe(dev, -EINVAL, "Invalid register window\n");
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to enable clock\n");
+
+	reset = devm_reset_control_get_shared_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to deassert reset\n");
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
+			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i);
+
+			put_unaligned_le32(val, efuse->data[bank] + i);
+		}
+	}
+
+	config.priv = efuse;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register NVMEM\n");
+
+	return 0;
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
