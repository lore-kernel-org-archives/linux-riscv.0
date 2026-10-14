Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA62CC6B27
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0n7rWzuacopQbi+/m0ZwISwHR38yDiuUrgPOmVHV9mc=; b=wFJH+FumHm07Gi
	rVnDXyp/0T/IJMIloiaQnFBFbwjZ7AGiyw1yoiNl2I6lKDPkTUIm71EwfYD0elliwr4ErKKj9XFzm
	wHWH7mQkLoPDLEpSjnatGDF1+QENBVSJUlCP7T4k76TRfg2RvjCD8BhQLXSiqI9DmJ3GHbCBtkYaj
	F5MBwgikQ8DepvP1U6SjaghyNqqiSZKpII4RycCOkHoVJSLEyl76dy1a0pzyCMBORLG9a87NYD49X
	2+wceuSDQ3bzFFbQxSoN+q7Oz2DFuPnjQuSP9ecCA5PhI5NYAn7sxF/JEHab0f8mq8Zv6w4ixOiJl
	+87Y4AEE/IHhkmJgyAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtga-0000000EnKe-1lwF;
	Wed, 14 Oct 2026 07:46:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtgX-0000000EnJb-2ajB
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 07:46:02 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e8b20a899fso14748285ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963961; x=1792568761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mIieeGY1UVHx10SysmP5f2W/As1aw4zkNpA5Xc1vkM=;
        b=Xr0526OB5P/ftYcJL50oM9McGqJtw1NxFSBFgo9+a6dETkTFeaWUEJmpeSDdLhQZN8
         FQzUKPV9KMRUDDRPuJ3omtSn28G6SZJQKKr3zbaz8NsexgYBwlLAGlp3zeylgWX9H0n9
         mwP4qOzETkZCDZc8vdTeDivx/YlZLfN1db8uea54LLiukMvRexrssd6sEBBKe4S3dQaK
         ELCJQmDxI+yU4+ir/PmxB03x6Uxx4mrWBQkGaCtMxcUMFyLPLufD7j8C0b1pXgh6uPGW
         Eb4mdxDxAv22kbsCvi647N6mRP31AIpY48rjg7Omrqs3MeomdXrd4X498EvDxWBuYnKU
         JNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963961; x=1792568761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mIieeGY1UVHx10SysmP5f2W/As1aw4zkNpA5Xc1vkM=;
        b=Oyab+SuWJJv+viqrkQLdU5c+Aykq4VL/i9b1nBDkcnru24HrieHCbOpdLxLsr6o2Ra
         Oq7CGr7W9BiMtFEEG8g76CQHZEEnkNUGhnBWa0TMQDHvegFjl7tW3fETYh3WTZMaqbUf
         0hN6IWAC1NFJHTQNBzVaL3qYE/R9J+X5CTYur8zoOGS74qq8NfEwhi+iUcRI9dNVWT4i
         DxCdnQ07/dQN5wVng6h2SYaLDF2BhUbKgKAZLMYLCPpH5H3c7Q4jbM3n2PtSob/djmGa
         2hcWL+iSSfx/Or5B9hSUpI/8ZzP74ZyhEludEnhVSCdPTt6aqwLd0kodL/or7jFm5Rv1
         Tk/g==
X-Forwarded-Encrypted: i=1; AKwUvByUINHGyZbmPsAPj4s+9p0khmHkIZxTgTOJWULdOc/tJGveQ4GWkc1Avmn+Gso+RFuz3WYbK9BGyyF0JQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKWH41iXP3SnlgYbSaXBSS/NYE35WaDhbPriqxy9GQ5Jtk3EegO
	3+/ku5PNNEmT39COc6zTpHkUFe4QHewZiWLCPv6MDokjCtNvuH0MwPdb
X-Gm-Gg: AYBFou360sZ4BM9ub8PBgtiLHzghArD0MCxCxD8cH6lKiF7uOG8wXq9GSVKMDpi1BHZ
	zMDRwcFrwxbhsUAw9CofFV4rqNkr0nqttJMUePCevNujwNFMiL2KTvvj+WYKkgnBqUPXrSuFpMa
	IuiEHGuWBsg5PexEOMf3QJUJ2S5jxLG4rKKMxUviWxAV1+3S++mI+RpE0+w7EnMUyi+e7mxy31O
	rRHgAqKaLhjGxqankHBB9BrOggLJvTYEpKnt7TEZIGHmxH63j98TMMbBzV5fOEmyWEGZ/sm9R8M
	lCOAWwcfGqO6WoNy78SF18JfKTBYYMD8lUKPOCB/BgoLDWHIlJOmSxYO8b8cxtkFcYayOm1VDwe
	0fN2EPclyBTmY9D2yZcOYRSqTzU7RXU5HH/+OCG4OSFrQ27Apop8bBOON1Z3WdzXaVCVVRl7gU9
	8n+pd/M3qkmtqdnja/fqrWgpm5Z0PJtMY7o6nDnR/sy6eUwPYnreJqT7in8BGmPWj7v52Y
X-Received: by 2002:a17:903:2307:b0:2e9:401f:f102 with SMTP id d9443c01a7336-2e9401ffc4cmr7724765ad.32.1791963960773;
        Wed, 14 Oct 2026 00:46:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a05f70sm65986985ad.7.2026.10.14.00.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:46:00 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Date: Wed, 14 Oct 2026 15:45:14 +0800
Message-ID: <20261014074516.240247-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_004601_669138_0F7C228D 
X-CRM114-Status: GOOD (  23.70  )
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

Sophgo SoCs such as SG2044 contain eFuses used to store
factory-programmed data.

As for SG2044, HW automatically loads the eFuse content
into shadow registers which are organized as 32bit values
exposed as MMIO.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/nvmem/Kconfig        |  12 +++
 drivers/nvmem/Makefile       |   2 +
 drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 drivers/nvmem/sophgo-efuse.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b..a7936dd65bdd 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SOPHGO_EFUSE
+	tristate "Sophgo eFuse support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	default ARCH_SOPHGO
+	help
+	  Say y here to enable support for reading eFuses on Sophgo SoCs
+	  such as the CV1800B. These are e.g. used to store factory programmed
+	  calibration data required for the builtin ethernet PHY.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-sophgo-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 2bbfb9ff1885..430ddddf8c3c 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -79,6 +79,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SOPHGO_EFUSE)	+= nvmem-sophgo-efuse.o
+nvmem-sophgo-efuse-y			:= sophgo-efuse.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
new file mode 100644
index 000000000000..5f90adaf8e4f
--- /dev/null
+++ b/drivers/nvmem/sophgo-efuse.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sophgo SoC eFuse driver
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/cleanup.h>
+#include <linux/iopoll.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+
+#define SG2044_EFUSE_CONTENT_SIZE		0x400
+
+#define SG2044_EFUSE_MD				0x000
+#define SG2044_EFUSE_ADR			0x004
+#define SG2044_EFUSE_RD_DATA			0x00c
+
+#define SG2044_EFUSE_MODE			GENMASK(1, 0)
+#define SG2044_EFUSE_MODE_READ			2
+
+#define SG2044_EFUSE_BOOT_DONE			BIT(7)
+#define SG2044_BOOT_TIMEOUT			10000
+
+#define SG2044_EFUSE_ADR_ADDR			GENMASK(7, 0)
+
+#define SG2044_EFUSE_ALIGN			4
+
+struct sophgo_efuses {
+	void __iomem *base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct mutex mutex;
+};
+
+static int sg2044_efuse_wait_mode(struct sophgo_efuses *efuse)
+{
+	u32 value;
+
+	return readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
+				  FIELD_GET(SG2044_EFUSE_MODE, value) == 0,
+				  1, SG2044_BOOT_TIMEOUT);
+}
+
+static int sg2044_efuse_set_mode(struct sophgo_efuses *efuse, int mode)
+{
+	u32 val = readl(efuse->base + SG2044_EFUSE_MD);
+
+	val &= ~SG2044_EFUSE_MODE;
+	val |= FIELD_PREP(SG2044_EFUSE_MODE, mode);
+
+	writel(val, efuse->base + SG2044_EFUSE_MD);
+
+	return sg2044_efuse_wait_mode(efuse);
+}
+
+static u32 sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
+				    unsigned int offset, u32 *strip)
+{
+	u32 val = FIELD_PREP(SG2044_EFUSE_ADR_ADDR, offset);
+	int ret;
+
+	guard(mutex)(&efuse->mutex);
+
+	writel(val, efuse->base + SG2044_EFUSE_ADR);
+
+	ret = sg2044_efuse_set_mode(efuse, SG2044_EFUSE_MODE_READ);
+	if (ret < 0)
+		return ret;
+
+	*strip = readl(efuse->base + SG2044_EFUSE_RD_DATA);
+
+	return 0;
+}
+
+static int sg2044_efuses_read(void *context, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct sophgo_efuses *efuse = context;
+	unsigned int start, start_offset, end, i;
+	u32 value;
+	u8 *buf;
+	int ret;
+
+	start = rounddown(offset, SG2044_EFUSE_ALIGN);
+	end = roundup(offset + bytes, SG2044_EFUSE_ALIGN);
+	start_offset = offset - start;
+
+	start /= SG2044_EFUSE_ALIGN;
+	end /= SG2044_EFUSE_ALIGN;
+
+	ret = readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
+				 (value & SG2044_EFUSE_BOOT_DONE),
+				 1, SG2044_BOOT_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	buf = kzalloc(end - start, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = start; i < end; i++) {
+		ret = sg2044_efuses_read_strip(efuse, i, &value);
+		if (ret)
+			goto failed;
+
+		memcpy(&buf[(i - start) * 4], &value, SG2044_EFUSE_ALIGN);
+	}
+
+	memcpy(val, buf + start_offset, bytes);
+
+failed:
+	kfree(buf);
+
+	return ret;
+}
+
+static int sophgo_efuses_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sophgo_efuses *efuse;
+	struct nvmem_config config = {
+		.dev = &pdev->dev,
+		.add_legacy_fixed_of_cells = true,
+		.read_only = true,
+		.reg_read = sg2044_efuses_read,
+		.stride = 1,
+		.word_size = 1,
+		.name = "sophgo-efuse",
+		.id = NVMEM_DEVID_AUTO,
+		.root_only = true,
+	};
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	efuse->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(efuse->base))
+		return PTR_ERR(efuse->base);
+
+	efuse->num_clks = devm_clk_bulk_get_all_enabled(&pdev->dev, &efuse->clks);
+	if (efuse->num_clks < 0)
+		return dev_err_probe(dev, efuse->num_clks, "failed to get clocks\n");
+
+	config.priv = efuse;
+	config.size = SG2044_EFUSE_CONTENT_SIZE;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
+}
+
+static const struct of_device_id sophgo_efuses_of_match[] = {
+	{ .compatible = "sophgo,sg2044-efuse", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
+
+static struct platform_driver sophgo_efuses_driver = {
+	.driver = {
+		.name = "sophgo_efuse",
+		.of_match_table = sophgo_efuses_of_match,
+	},
+	.probe = sophgo_efuses_probe,
+};
+
+module_platform_driver(sophgo_efuses_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo efuse driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
