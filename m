Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80270606A332
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ME4TGNCV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdF9UocY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N+mPXJzqJpK4ZvKYvQWzPRt9V5McM65w70/fWpFjBP4=; b=ME4TGNCVkZ8gOGvKvkQbv2ZYPh
	QulFgqWv6MTw/23R+WgbBRZKyp+zxEctvAI5ZAe2KXC+4Un36y71MhvX5M7z6SZfOzMONEK4add5v
	bH8IrmUGYXa/ZFT7cgzr5MuwwVrkYfPKApcKDzEkCZpg2wZduuJ3ERsqS6jwaOsvbbUv88ZehtQNe
	34ZlU/YRBdPLKiNQ4q7Php2uu/fF6T+LmKJf1Y7Tt5qOtw/ZeveWuGIenvGVC+tSFlrL5nAEBZovm
	ZSRS7kmnHpkkhH5JX7VFM3tVEwJQua7R7/pn/3ZKmgWcspX6Ie1z56l0doxzvQbcJvMsUqh51Spp6
	ek6iPFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYc-00000001TjX-0R3H;
	Mon, 16 Nov 2026 07:55:18 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYZ-00000001Tgn-1etU
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:55:16 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-37628596783so5239821eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815714; x=1795420514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlwthUQB8tol72ooMeZKyFcpKOFDs2Moeh6kbO8jdj8=;
        b=bdF9UocYI7dskwICvbP6K/IlXpSVN+hprPhg+p/i7kzoL2rkPkrql2bn98QmnHva0G
         fngzdDHGx3lHMZyZSp16HvkD3sjyyvhl4rkB3rncIijQiO0VDfYt20NgaAi7WX9Xcda0
         WM2jWhhGQNJCXemUihADO4/baxT4Rcdiu5/FTVNmWyfvLe/qXBC5gD3wgX/FfIPtOkgn
         Pb2gRJvBFE8VbXJcBPDivfIZCnG7ensX9s7oO2Hs4dLphdKELrKTQbX0KitOR2zTg7Q4
         ougNFdJsLaU+X9Wa1u2haIVh2xJ+14BkAatxcGkTT6DEV0EyR1s21fEqVGgUb4FPDDlj
         tpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815714; x=1795420514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wlwthUQB8tol72ooMeZKyFcpKOFDs2Moeh6kbO8jdj8=;
        b=LKkial7uW2oW5GcvGUvF8+JAtKQ+P74KhfZgP0pui/OM/iBDOahvXcFvpejE7ZM+Rw
         9aqw29zUYdfHYKmBsDa75lrrN3WHjpD7asBdTtev/ZsHk2yzA/GSqBGCvSYf2fiFIr3K
         bPHvYV/MfMLgUsY8XhE6+d4gfQRP5txbwArTNkoxusB3pxs2lQTVjG2V0EYE8PdaHTd4
         IS0LJeNX2hd+LzD1TPBplpS7wAklMiwvlBDPzS9i6IZwmiEAXg0PnhNZr9EL9T6ir1n/
         uGji9DttbNu045BJH84qbM6AVzvBBnnMj/YMUVugnzbAwGF4sLtdw8nv92ZxEwlP9zTb
         s6Lg==
X-Forwarded-Encrypted: i=1; AL+hErHOkZ2tRW2I9CwndweCYG8FMUeqlWMwYu3tOHDxDDfsEykAxT+N4hWTEK9doSCA9kvxeubHRbXeE2tAAg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Zfm8vR8Rzg7zlcngCf9YkDBmqnLAz6kOFC62I34Ac+PfZ/62C
	CfWj9R1i8fE0HOY6y+TSgcapNDnAWHSPNYckFYIUOyob8/nkh0hKwU8y
X-Gm-Gg: AYBFou0uEcKxEqLOFxmMionKdqilDNDOna019bjLv4bvv/ZZ8S3TE3WBK/F5lg0ucGv
	LskidsoGBVinSR02ISuDK5xRJ2uL0BDh2KrVZ86Yi7zz8h4Jj0yVSk4fS5/zjodpL1VNRiqID2p
	wBwwNv6qs3n0tV7wjs9BN9RkQeXx0e0nX9dl4+lBhGM0v2rTEEraUE/O3ejhhoPTZGFadQVq9Cr
	1Y50vDpmJmslpeHRJ81mAH5mYngdvNTyRPC82vJ1QncV94o88VEI29bfH35kQU+D9MQ6rzjqVCH
	J9QSEjfvOC7An/Kqbk1NAA4qGbW7Gko/rQml1QVDNkpS4dnJmQRHSlPKSaaLmuqlMEp2FKoHMdp
	lXINoDlQcu2tbQ4d0kOl++SaCQuYb69nLbsVsnZnbpzdkNW8YZV7xRrHHNJ5M48/2NEDRt7pqVe
	VWeQD46sOHjWfo5spT8d6w0F+oVcmsLpzlXHkUL3+cZrjjF6T+y7DL+VFVukjdXgqcAGAf1H7QK
	cdljN7mWC08P6H/50DXHC4zlPCQQFPecjyGPagaTrgNZ1uH1aR4Fv+hdfLu/ejsa3BGhYqyFuSX
	lkPuFEfITYESYpG3cfnuaoEdmPk4NhYS9ed7/43cCPif27rUmXFa
X-Received: by 2002:a05:7301:b14:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-37b4a3a4b7emr5761932eec.4.1794815714344;
        Sun, 15 Nov 2026 23:55:14 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:14 -0800 (PST)
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
Subject: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Date: Mon, 16 Nov 2026 15:54:22 +0800
Message-ID: <20261116075423.1519438-3-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235515_445654_625A6C8B 
X-CRM114-Status: GOOD (  26.70  )
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

Keep the root key and SSK registers outside the exposed bank ranges.

FUSE_READY reports completion of a software-triggered reload. Trigger a
reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
snapshot. Fail probe if the reload times out.

Snapshot the shadow registers with aligned 32-bit reads and expose the
data in little-endian order at controller-relative offsets. Serve reads
from the snapshot and use keepouts for the remaining register ranges.

Enable the AES_WTM clock only while accessing the hardware. Leave its
shared reset deasserted on teardown because WTM_RST resets the entire GEU.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/nvmem/Kconfig             |  11 ++
 drivers/nvmem/Makefile            |   1 +
 drivers/nvmem/spacemit-k3-efuse.c | 199 ++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)
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
index 000000000000..e126902130d4
--- /dev/null
+++ b/drivers/nvmem/spacemit-k3-efuse.c
@@ -0,0 +1,199 @@
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
+#define K3_EFUSE_REG_SIZE		0x400
+#define K3_EFUSE_BANK_SIZE		0x20
+#define K3_EFUSE_CONFIG			0x004
+#define K3_EFUSE_SOFTWARE_RESET		BIT(22)
+#define K3_EFUSE_BANK0_OFFSET		0x104
+#define K3_EFUSE_STATUS			0x184
+#define K3_EFUSE_READY			BIT(1)
+#define K3_EFUSE_BANK7_OFFSET		0x190
+#define K3_EFUSE_RESET_DELAY_US		1
+#define K3_EFUSE_POLL_INTERVAL_US	1
+#define K3_EFUSE_POLL_TIMEOUT_US	10000
+
+static const unsigned int k3_efuse_bank_offsets[] = {
+	K3_EFUSE_BANK0_OFFSET,
+	K3_EFUSE_BANK7_OFFSET,
+};
+
+/* Prevent NVMEM reads from exposing the root key and SSK registers. */
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
+	__le32 data[ARRAY_SIZE(k3_efuse_bank_offsets)][K3_EFUSE_BANK_SIZE / sizeof(u32)];
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
+		memcpy(val, (u8 *)efuse->data[bank] + index, bytes);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int k3_efuse_reload(void __iomem *base)
+{
+	u32 val;
+
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val | K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+	readl(base + K3_EFUSE_CONFIG);
+	udelay(K3_EFUSE_RESET_DELAY_US);
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
+		.size = K3_EFUSE_REG_SIZE,
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
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
+
+	reset = devm_reset_control_get_shared(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset\n");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+
+	/* WTM_RST resets the entire GEU; leave it deasserted on teardown. */
+	ret = reset_control_deassert(reset);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to deassert reset\n");
+		goto disable_clk;
+	}
+
+	ret = k3_efuse_reload(base);
+	if (ret) {
+		dev_err_probe(dev, ret, "Timed out waiting for shadow reload\n");
+		goto disable_clk;
+	}
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		for (i = 0; i < ARRAY_SIZE(efuse->data[bank]); i++) {
+			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i * sizeof(u32));
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
+		return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register NVMEM\n");
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
