Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133B8C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 10:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brWEKCnZfAMoFRZuZ9Omo19ECKdM36TsL69dBtOwi+M=; b=D94artVeU1vngK
	qrjoltBmIWy+1LDTTDaM8qU2AkvKGWaC7iQXutQ2DalqNoYoKjsUs/r3BIHc4RLDBm0hzEKNcEnwd
	KzWNXB7C6/UCujfSqF4XXqNvAy2ZLoucCZhvXjyUrMDQMaBIiAMJyhtFbVa7KOc+pr39wuM3yK4m6
	dOg2O+DHvql48iZkFgtyavf+UAIS8BAOEjKMM8ZVuS6bIdvzD0cfzg+5CLWgE2sDhUF18PwAXGcIk
	5BaUysvo3saT7ZLEYk1zdStT+qQIAcjZYKj4srdDG0LckoIAz7r5JUq1SSrBndTERfxtPIb9MPQ7S
	AM9U4Zyl4a4BHmEFCHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclZA-00GHeq-Qf; Fri, 08 Apr 2022 10:10:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclZ5-00GHc7-Qx
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 10:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649412604; x=1680948604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9N0ZWNAd9mIyPI9EhwvOQXkX/MDUGG76apuykOonzGU=;
 b=jG/uxl62cKGkbpJg+FAm253Xx/fheRpX8bLPMwB+zQGxLci2Pxmppcer
 BxVUeefWc2pa3JmA9qIOgOCd8SoYamO4De2G7vEulAFi2WgRoZF0e4oAY
 e8k2O9Eu/rngbC88ZEa/4btnfql1f+b7rJN0aNg8fNCGd76qk3sAxyQXE
 Nhl8MMyWu0i4sM2GV6nZTIvJMw3HrqJIsu2k+3fJHEMCD4px4psPrMTrj
 LyJCyPdgSOKIaRGHZKJSeLgqBHu+27LIZSyMnA2iog44SWCcbJMxynrRq
 CRj8o+k5Jp834QbGjCliFeOhICPaun/xTJ0JpV4ckk8MuURU5FIL4L7K0 Q==;
X-IronPort-AV: E=Sophos;i="5.90,244,1643698800"; d="scan'208";a="152002989"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 03:10:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 03:09:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 03:09:58 -0700
From: <conor.dooley@microchip.com>
To: <herbert@gondor.apana.org.au>
CC: <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/1] hwrng: mpfs - add polarfire soc hwrng support
Date: Fri, 8 Apr 2022 10:09:12 +0000
Message-ID: <20220408100911.1638478-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408100911.1638478-1-conor.dooley@microchip.com>
References: <20220408100911.1638478-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_031003_997293_8BAA6A18 
X-CRM114-Status: GOOD (  19.32  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add a driver to access the hardware random number generator on the
Polarfire SoC. The hwrng can only be accessed via the system controller,
so use the mailbox interface the system controller exposes to access the
hwrng.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/char/hw_random/Kconfig    |  13 ++++
 drivers/char/hw_random/Makefile   |   1 +
 drivers/char/hw_random/mpfs-rng.c | 104 ++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 drivers/char/hw_random/mpfs-rng.c

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index a087156a5818..c3a9f17bf31c 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -385,6 +385,19 @@ config HW_RANDOM_PIC32
 
 	  If unsure, say Y.
 
+config HW_RANDOM_POLARFIRE_SOC
+	tristate "Microchip PolarFire SoC Random Number Generator support"
+	depends on HW_RANDOM && POLARFIRE_SOC_SYS_CTRL
+	help
+	  This driver provides kernel-side support for the Random Number
+	  Generator hardware found on PolarFire SoC (MPFS).
+
+	  To compile this driver as a module, choose M here. The
+	  module will be called mfps_rng.
+
+	  If unsure, say N.
+
+
 config HW_RANDOM_MESON
 	tristate "Amlogic Meson Random Number Generator support"
 	depends on HW_RANDOM
diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index 584d47ba32f7..3e948cf04476 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -46,3 +46,4 @@ obj-$(CONFIG_HW_RANDOM_CCTRNG) += cctrng.o
 obj-$(CONFIG_HW_RANDOM_XIPHERA) += xiphera-trng.o
 obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
 obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
+obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
diff --git a/drivers/char/hw_random/mpfs-rng.c b/drivers/char/hw_random/mpfs-rng.c
new file mode 100644
index 000000000000..5813da617a48
--- /dev/null
+++ b/drivers/char/hw_random/mpfs-rng.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip PolarFire SoC (MPFS) hardware random driver
+ *
+ * Copyright (c) 2020-2022 Microchip Corporation. All rights reserved.
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ */
+
+#include <linux/module.h>
+#include <linux/hw_random.h>
+#include <linux/platform_device.h>
+#include <soc/microchip/mpfs.h>
+
+#define CMD_OPCODE	0x21
+#define CMD_DATA_SIZE	0U
+#define CMD_DATA	NULL
+#define MBOX_OFFSET	0U
+#define RESP_OFFSET	0U
+#define RNG_RESP_BYTES	32U
+
+struct mpfs_rng {
+	struct mpfs_sys_controller *sys_controller;
+	struct hwrng rng;
+};
+
+static int mpfs_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
+{
+	struct mpfs_rng *rng_priv = container_of(rng, struct mpfs_rng, rng);
+	u32 response_msg[RNG_RESP_BYTES / sizeof(u32)];
+	unsigned int count = 0, copy_size_bytes;
+	int ret;
+
+	struct mpfs_mss_response response = {
+		.resp_status = 0U,
+		.resp_msg = (u32 *)response_msg,
+		.resp_size = RNG_RESP_BYTES
+	};
+	struct mpfs_mss_msg msg = {
+		.cmd_opcode = CMD_OPCODE,
+		.cmd_data_size = CMD_DATA_SIZE,
+		.response = &response,
+		.cmd_data = CMD_DATA,
+		.mbox_offset = MBOX_OFFSET,
+		.resp_offset = RESP_OFFSET
+	};
+
+	while (count < max) {
+		ret = mpfs_blocking_transaction(rng_priv->sys_controller, &msg);
+		if (ret)
+			return ret;
+
+		copy_size_bytes = max - count > RNG_RESP_BYTES ? RNG_RESP_BYTES : max - count;
+		memcpy(buf + count, response_msg, copy_size_bytes);
+
+		count += copy_size_bytes;
+		if (!wait)
+			break;
+	}
+
+	return count;
+}
+
+static int mpfs_rng_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mpfs_rng *rng_priv;
+	int ret;
+
+	rng_priv = devm_kzalloc(dev, sizeof(*rng_priv), GFP_KERNEL);
+	if (!rng_priv)
+		return -ENOMEM;
+
+	rng_priv->sys_controller =  mpfs_sys_controller_get(&pdev->dev);
+	if (IS_ERR(rng_priv->sys_controller))
+		return dev_err_probe(dev, PTR_ERR(rng_priv->sys_controller),
+				     "Failed to register system controller hwrng sub device\n");
+
+	rng_priv->rng.read = mpfs_rng_read;
+	rng_priv->rng.name = pdev->name;
+	rng_priv->rng.quality = 1024;
+
+	platform_set_drvdata(pdev, rng_priv);
+
+	ret = devm_hwrng_register(&pdev->dev, &rng_priv->rng);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to register MPFS hwrng\n");
+
+	dev_info(&pdev->dev, "Registered MPFS hwrng\n");
+
+	return 0;
+}
+
+static struct platform_driver mpfs_rng_driver = {
+	.driver = {
+		.name = "mpfs-rng",
+	},
+	.probe = mpfs_rng_probe,
+};
+module_platform_driver(mpfs_rng_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("PolarFire SoC (MPFS) hardware random driver");
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
