Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C77606A322
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qs4lG0l/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JsK5XJw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sKrp6t1n6GP+M5fZeVk+u1/PiGN6q91aIsXbqvHBkfQ=; b=Qs4lG0l/Rhaigv+quIA5sOq+5W
	6v8ruFzfwKhvKDo/64REay0bshK2iTMj9PyO64qJ+9rcE+M978/v23p8ajKDif4WqLNEorfjn/nw0
	2vohW8xJG8TTCNIx0hdy6Sd7hARTxeI8jLHNjGNWzxFXDF5msBW6b5HUefk2z6EifMGOHCYbTz0Uz
	nHkkkC+5drBH8Ik01KJVLsPpg1/2k6pSK6fD3Lq5hAUy/VzHnunrayDP/z4RMQn7gByYDaMlvU3K+
	clV2Q8c0+SYwLB0pCgfR+QAkUNJ/r8oKVhFvAomCQ1MvpxiI9ntfd/960qyiuczTZoHN3uUqI74sl
	7KdZPrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkyN-00000005lO8-3CQx;
	Tue, 24 Nov 2026 07:29:51 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkyA-00000005lH2-285W
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 07:29:49 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd69954c755so3002572a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 23:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505377; x=1796110177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvS+jc71C12qiJZLy6Pzsl8hjxfmeERzsMTIxPdnLAM=;
        b=0JsK5XJwOsQmjgKhbZNiP7HV/ev1uSIkboxWnfLKz7hnCkBo/5BRnCY1pLWODNdxvJ
         nB2RjM6RsTgChiYmFNupTXKeATPGz/Jznc9zTIITpDx5wM8yugnkoWfrHV9KxcgsQ8vD
         +kk0AjypzvIkAUMr39XZD7eBbMWDCzBi3zytHQSM8S5HJiDUPIrmZzWjGhHxg3Yyw1kh
         1FwSliIC3EOCwg+9jaMOjdqmvv52fYa2JijqZdTnxXscSoYFkc77baL6gmcBLK99hFbg
         7/lTOywDQAPZQtz5aUE197zjZXJ0tMhe1miENuW0TWwAt4w6WdF2c4F4RqWUgHEGe0Rh
         IL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505377; x=1796110177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvS+jc71C12qiJZLy6Pzsl8hjxfmeERzsMTIxPdnLAM=;
        b=LGl5tNS0/C5qZp+lwzZbyM0LXxx2bnAuNg/XF79CwSiv1X9Kk1pObUKXjSEzUB+NQm
         YBuwJjTrNu7KOopGehWnrtXKs5/0eGCvRkq46lLqRsItViSY/lyv3Jxj8aJmdESLwDKX
         sOTLBnTLgbxggElOR0xnu32zzQBmesCQAEfiE44BQ5ZSOvNJZof3dcRsAt4w4sQUPSM6
         9GsS5FGQMWBzqMu5MCKJE1DymKYsa62ANg/JRsZm4hmzhOkx5fBtA0izX1CI4Q6kEtxT
         nzSH6VQER4cqyOU8ewhO0tyuJsuoN94Yz1MMOYD5kaxPxY/BAGyUitAwOLFfrNDMjMWK
         mO+g==
X-Forwarded-Encrypted: i=1; AL+hErH0uEzD7c5NJjeMNool3UyoTRHtEb88JBx8oniqoG+BKwanQ3uBBssunLjtNiFYLjPbHsjSYhRMG3sIuA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+z9Um7Q575zhLmsvPutgLIFP12IwzoL8+0MV5/AFSkE8AiAYX7
	dyCn58Q5O9xp4fYFuugrgkbpJBy9toP+kH4FoXhhDp59Jl08f+ACHXht
X-Gm-Gg: AZFdTZeUqauGr98YdU/SHH7u2/EpKjUypM1k+Z+37ivzWM/lZ1FXIcb717TrU5aVV1Y
	UiKQdLCkB7Ktu0hmI2JKTca0KXA6ZC6MSqcELbPTyMbzq0If7jiOntp553ctrpELolm626zA+Vt
	LC2gSisCb6Ies69oKp02A4RA3c2Wks0vn27qvKbXXxDCekHvitRdTrWLpxaHwt6o2POph4b7eqJ
	A3Dy9NkQsrI2xkMzR0ssp+BFZdHBHF7G/WjYRTVw1osBQkWNdv3ttKFrVSClCOO4Zn1SSK9ovHk
	qO3q/NNJjQpdbslbc0kmSVXyk14EGTiWdYVKhqvRsulfcT30BFH46VGNWhzFpQPDoOFCeBMUN9/
	24MOjrsN8s6y/QWfbrH3v1YJQ9btTk86qknO/vv8h7tUtW8RRvOGaHsaFTZoco+kLHvjL9D7ey0
	k0Pth90FfDkqcd+kz3G4PVmNyou2+yLkk73swDidEWnjM6wFUqc2G5crszq8d1LA/PzpiqloKmz
	64/El6jDH0Gxrjbphm+IknAXLgzdVlL/O+GMr7cTQ9MNygAzqjRBQxvUgVoS9GA+8V5JNKdK2H9
	IYhkNnQD3QeXj7U4oNHf8g96ZG4=
X-Received: by 2002:a17:90a:e7d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b41c9e52f6mr12937561a91.35.1795505377490;
        Mon, 23 Nov 2026 23:29:37 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm22247243a91.12.2026.11.23.23.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:37 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Date: Tue, 24 Nov 2026 15:29:22 +0800
Message-ID: <20261124072924.556678-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_232938_592787_0598C230 
X-CRM114-Status: GOOD (  24.10  )
X-Spam-Score: -2.1 (--)
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
index d2f5bb236663..3bcbad51616c 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,18 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SOPHGO_EFUSE
+	tristate "Sophgo eFuse support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	default ARCH_SOPHGO
+	help
+	  Say y here to enable support for reading eFuses on Sophgo SoCs
+	  such as the SG2044. These are e.g. used to store factory programmed
+	  required data for internal device like ROM patch.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-sophgo-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..aac736057201 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -81,6 +81,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
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
index 000000000000..d42f18f36828
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
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
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
+static int sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
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
+	buf = kzalloc((end - start) * SG2044_EFUSE_ALIGN, GFP_KERNEL);
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
+	mutex_init(&efuse->mutex);
+
+	config.priv = efuse;
+	config.size = SG2044_EFUSE_CONTENT_SIZE;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
+}
+
+static const struct of_device_id sophgo_efuses_of_match[] = {
+	{ .compatible = "sophgo,sg2044-efuse" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
+
+static struct platform_driver sophgo_efuses_driver = {
+	.driver = {
+		.name = "sophgo_efuse",
+		.of_match_table = sophgo_efuses_of_match,
+	},
+	.probe = sophgo_efuses_probe,
+};
+module_platform_driver(sophgo_efuses_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo efuse driver");
+MODULE_LICENSE("GPL");
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
