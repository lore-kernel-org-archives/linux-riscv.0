Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1EDCA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plK1DV4R9JuEKtdHft0Nv/egn3KV1QUZN9sQztnjgAk=; b=qs8cPDEhkiGVue
	hoHRFDCh8tCnDIx/cm3UTIpiwdXzzp0ayCsI4sg+1u3Y8bNnPg7Kdx9WPVzlb2PS6yP5Tm7YkQuW7
	9qrlxrlehGAvrsnEO3VKUfWQ4OeG1iGX+2UaHnUOZC7nlttUoS4E7PcA6cklALo0+74VorcFanXp7
	YsRHrdlobeFk1xCRZieW+mkhRTE+y1TD9hR2LC4v1QDcpwDxTPQDvGx4lRZYZsduOBIvJwYXA4Nyp
	YOt8wW77vUFEnMbhmTigL8JkGXXyT56XIdHO912sPGqN9XLizaKt2dWVvZrWorJtvlyTT3b3tcEFw
	yEsmYJhVgM5G3RpNBeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIW4-00000000loB-15CP;
	Thu, 18 Sep 2025 17:33:56 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIW2-00000000lnO-0TTk
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 17:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758216828; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kSods2vewC8Mcjemi3n5aZxmiFB3zLrOtC1xmFmctnyt/E/hnhxK3lVy/7PQDJkTF975w24i3HKeqJC9lTk9owxYH7InIpEfiWZfNNs+XWU4e5D6EU68UNzO0aZMgiaVLGkWLtFvf+752hi15eEs35x82UqYycXedyrq9miimro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758216828; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dIOj/wQCu+bG4GzEt4OQqSjsMqHBTnI0OcYbetMjGYU=; 
	b=Fg1l/VL/A5u+l1H/Ol3XZ2fD2/DvDOeolS+qiNZhBQ/CeGD5jsdpptSgdvikTe9CVga8MgVUwXS2OP1/ogzN9HVv4hQiMlkOj9/rrkTUi4u4sgQI/FUAG4F6p7Vd0LTLxjxAHuCrI15GeXHzNEOxon0kTA3cCxsC/woIir9yGM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758216828;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dIOj/wQCu+bG4GzEt4OQqSjsMqHBTnI0OcYbetMjGYU=;
	b=U5I9zyl6pdPTi62QEhUL06zgXywEdwfgOeuJFRnUVDfXcQ6gcM2CWhziSmXwrz5L
	E/FTWsky22uP+QXnslO1voodsv+X3H7FSGyfKcIuHANUw7T5cROGy28+OvqeHWGX1q+
	t9Ewnxjn8fFhtPmcBkQvB7r88ngo43ROwW+qOWRr82u4SGCOxUU7fBmnBd0M8aWcSep
	MjG09WcSK45qYlNxE/l51MTvC7tD7G97tGhK6Olm/hYT5fv6ZDqgDB66BRFSQ/x1COb
	LAdRTaO5GNXFo2eBl9cDEoLOXgMwMCUxMhpEtjtAKo9UKBxpHNctn5F9J6amduKcia5
	D1dNd89Jyw==
Received: by mx.zohomail.com with SMTPS id 175821682656261.42412979027654;
	Thu, 18 Sep 2025 10:33:46 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 1/2] driver: reset: th1520-aon: add driver for poweroff/reboot via AON FW
Date: Fri, 19 Sep 2025 01:33:22 +0800
Message-ID: <20250918173323.340738-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918173323.340738-1-uwu@icenowy.me>
References: <20250918173323.340738-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_103354_183062_4342394F 
X-CRM114-Status: GOOD (  19.35  )
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

This driver implements poweroff/reboot support for T-Head TH1520 SoCs
running the AON firmware by sending a message to the AON firmware's WDG
part.

This is a auxiliary device driver, and expects the AON channel to be
passed via the platform_data of the auxiliary device.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes in v2:
- Added Sebastian's ACK.

 MAINTAINERS                             |  1 +
 drivers/power/reset/Kconfig             |  7 ++
 drivers/power/reset/Makefile            |  1 +
 drivers/power/reset/th1520-aon-reboot.c | 98 +++++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 drivers/power/reset/th1520-aon-reboot.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f6206963efbf0..5cb0fa3792d14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21763,6 +21763,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
+F:	drivers/power/reset/th1520-aon-reboot.c
 F:	drivers/power/sequencing/pwrseq-thead-gpu.c
 F:	drivers/reset/reset-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 77ea3129c7080..8248895ca9038 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -225,6 +225,13 @@ config POWER_RESET_ST
 	help
 	  Reset support for STMicroelectronics boards.
 
+config POWER_RESET_TH1520_AON
+	tristate "T-Head TH1520 AON firmware poweroff and reset driver"
+	depends on TH1520_PM_DOMAINS
+	help
+	  This driver supports power-off and reset operations for T-Head
+	  TH1520 SoCs running the AON firmware.
+
 config POWER_RESET_TORADEX_EC
 	tristate "Toradex Embedded Controller power-off and reset driver"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index b7c2b5940be99..51da87e05ce76 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_POWER_RESET_QNAP) += qnap-poweroff.o
 obj-$(CONFIG_POWER_RESET_REGULATOR) += regulator-poweroff.o
 obj-$(CONFIG_POWER_RESET_RESTART) += restart-poweroff.o
 obj-$(CONFIG_POWER_RESET_ST) += st-poweroff.o
+obj-$(CONFIG_POWER_RESET_TH1520_AON) += th1520-aon-reboot.o
 obj-$(CONFIG_POWER_RESET_TORADEX_EC) += tdx-ec-poweroff.o
 obj-$(CONFIG_POWER_RESET_TPS65086) += tps65086-restart.o
 obj-$(CONFIG_POWER_RESET_VERSATILE) += arm-versatile-reboot.o
diff --git a/drivers/power/reset/th1520-aon-reboot.c b/drivers/power/reset/th1520-aon-reboot.c
new file mode 100644
index 0000000000000..ec249667a0ffd
--- /dev/null
+++ b/drivers/power/reset/th1520-aon-reboot.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * T-HEAD TH1520 AON Firmware Reboot Driver
+ *
+ * Copyright (c) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/firmware/thead/thead,th1520-aon.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/reboot.h>
+#include <linux/slab.h>
+
+#define TH1520_AON_REBOOT_PRIORITY 200
+
+struct th1520_aon_msg_empty_body {
+	struct th1520_aon_rpc_msg_hdr hdr;
+	u16 reserved[12];
+} __packed __aligned(1);
+
+static int th1520_aon_pwroff_handler(struct sys_off_data *data)
+{
+	struct th1520_aon_chan *aon_chan = data->cb_data;
+	struct th1520_aon_msg_empty_body msg = {};
+
+	msg.hdr.svc = TH1520_AON_RPC_SVC_WDG;
+	msg.hdr.func = TH1520_AON_WDG_FUNC_POWER_OFF;
+	msg.hdr.size = TH1520_AON_RPC_MSG_NUM;
+
+	th1520_aon_call_rpc(aon_chan, &msg);
+
+	return NOTIFY_DONE;
+}
+
+static int th1520_aon_restart_handler(struct sys_off_data *data)
+{
+	struct th1520_aon_chan *aon_chan = data->cb_data;
+	struct th1520_aon_msg_empty_body msg = {};
+
+	msg.hdr.svc = TH1520_AON_RPC_SVC_WDG;
+	msg.hdr.func = TH1520_AON_WDG_FUNC_RESTART;
+	msg.hdr.size = TH1520_AON_RPC_MSG_NUM;
+
+	th1520_aon_call_rpc(aon_chan, &msg);
+
+	return NOTIFY_DONE;
+}
+
+static int th1520_aon_reboot_probe(struct auxiliary_device *adev,
+				  const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	int ret;
+
+	/* Expect struct th1520_aon_chan to be passed via platform_data */
+	ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
+					    TH1520_AON_REBOOT_PRIORITY,
+					    th1520_aon_pwroff_handler,
+					    adev->dev.platform_data);
+
+	if (ret) {
+		dev_err(dev, "Failed to register power off handler\n");
+		return ret;
+	}
+
+	ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
+					    TH1520_AON_REBOOT_PRIORITY,
+					    th1520_aon_restart_handler,
+					    adev->dev.platform_data);
+
+	if (ret) {
+		dev_err(dev, "Failed to register restart handler\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct auxiliary_device_id th1520_aon_reboot_id_table[] = {
+	{ .name = "th1520_pm_domains.reboot" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, th1520_aon_reboot_id_table);
+
+static struct auxiliary_driver th1520_aon_reboot_driver = {
+	.driver = {
+		.name = "th1520-aon-reboot",
+	},
+	.probe = th1520_aon_reboot_probe,
+	.id_table = th1520_aon_reboot_id_table,
+};
+module_auxiliary_driver(th1520_aon_reboot_driver);
+
+MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
+MODULE_DESCRIPTION("T-HEAD TH1520 AON-firmware-based reboot driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
