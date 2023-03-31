Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA142C77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uD0Hnc6zfund88RLdjqZCLkEWqZfgjhYm4vAAzHnkIA=; b=LrSEQMh6d9LiT8
	ql6igcErzL93gtcwqbvsaaOELBk+XnE2gCDhy3fYa4QKBvikgota4EfvPfX9LI4W0auYQOq/zRoTN
	/WeoPpAxmCLOtAWWpeII+D3P0SROd64ddGI8vWipbrXY2zeoSAGCc6Kq+OkqL+jx0uay7kMFLeW2b
	cCFj5DPgSRsBPdwbaiHYy1aBao+d8N2NdGLPPX231bEiYEpmj20itXh77dsSPFRqIi/3oz5aign9i
	HHFXt+1zC1tG3XvWoy4aZmMwF6BmXyYUdJip8fTsb3TRLzVzscTsJ1k+FRFURWmqt/Z5YpVE0ZYJx
	X5EP8+sbyP9hbb8FwUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92H-00680n-2I;
	Fri, 31 Mar 2023 07:18:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92C-0067zK-2A
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680247132; x=1711783132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0RxSmjLFLGNqYDQT3XMLRg36TkNHpX++EBfYDoIpS48=;
  b=cvlVVTSy/GOCG8DO8yB78DEqu0q1TUbdvyz/quRG5ofJw5vvEzQpBzLw
   x9/d10fBqz+D+JPPn0EMg6UL9y/Dv2pBBBgr+P9lFL/ywjE2edAsdBGkv
   8TUozr0ZCU2kpSJ6aVxqwjXGa+cbQWsxw5FjUcGHoiENiR7mqECGCn5Zq
   51JvA35+9KBPEdJT+ZDgHC+EZYjCM3F0SJ49RIToxMFwnCvAMj/zkUsDR
   jsV1ktaG35NPHnsFW4iD4sxtcTFSsgy+PZsNHleP0VpoM+o0ZdsW3GHRd
   EVS5NtxHHCHOSp35GtMfHoASXLG42ztg3Owjb65HMsiPXfaMZ2j2avWYL
   A==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="scan'208";a="207148827"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 00:18:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 00:18:51 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 00:18:49 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-fpga@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/7] soc: microchip: mpfs: enable access to the system controller's flash
Date: Fri, 31 Mar 2023 08:18:19 +0100
Message-ID: <20230331071823.956087-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331071823.956087-1-conor.dooley@microchip.com>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442; i=conor.dooley@microchip.com; h=from:subject; bh=0RxSmjLFLGNqYDQT3XMLRg36TkNHpX++EBfYDoIpS48=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClqnZYaQq89GQLW/gz9d7uWaaWFgdwO3sQVd7Ysve3rlySr c/J2RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACayRIHhf/hTuSnNfJELc4RXvrfJT7 96cfqVBzv+v9zd4P/csfxTYTTDf7+t3RJfP8xedWqDsl1Gh11v5aIP/beaL+y4LHrYxeG2GisA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_001852_715074_CDFD6D68 
X-CRM114-Status: GOOD (  17.69  )
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

The system controller has a flash that contains images used to reprogram
the FPGA using IAP (In-Application Programming).
Introduce a function that allows a driver with a reference to the system
controller to get one to a flash device attached to it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/Kconfig               |  1 +
 drivers/soc/microchip/mpfs-sys-controller.c | 20 ++++++++++++++++++++
 include/soc/microchip/mpfs.h                |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
index eb656b33156b..9b0fdd95276e 100644
--- a/drivers/soc/microchip/Kconfig
+++ b/drivers/soc/microchip/Kconfig
@@ -1,6 +1,7 @@
 config POLARFIRE_SOC_SYS_CTRL
 	tristate "POLARFIRE_SOC_SYS_CTRL"
 	depends on POLARFIRE_SOC_MAILBOX
+	depends on MTD
 	help
 	  This driver adds support for the PolarFire SoC (MPFS) system controller.
 
diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 216d9f4ea0ce..5270630c52bf 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -12,6 +12,8 @@
 #include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/jiffies.h>
+#include <linux/mtd/mtd.h>
+#include <linux/spi/spi.h>
 #include <linux/interrupt.h>
 #include <linux/of_platform.h>
 #include <linux/mailbox_client.h>
@@ -30,6 +32,7 @@ struct mpfs_sys_controller {
 	struct mbox_client client;
 	struct mbox_chan *chan;
 	struct completion c;
+	struct mtd_info *flash;
 	struct kref consumers;
 };
 
@@ -99,6 +102,12 @@ static void mpfs_sys_controller_put(void *data)
 	kref_put(&sys_controller->consumers, mpfs_sys_controller_delete);
 }
 
+struct mtd_info *mpfs_sys_controller_get_flash(struct mpfs_sys_controller *mpfs_client)
+{
+	return mpfs_client->flash;
+}
+EXPORT_SYMBOL(mpfs_sys_controller_get_flash);
+
 static struct platform_device subdevs[] = {
 	{
 		.name		= "mpfs-rng",
@@ -114,12 +123,23 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpfs_sys_controller *sys_controller;
+	struct device_node *np;
 	int i, ret;
 
 	sys_controller = kzalloc(sizeof(*sys_controller), GFP_KERNEL);
 	if (!sys_controller)
 		return -ENOMEM;
 
+	np = of_parse_phandle(dev->of_node, "microchip,bitstream-flash", 0);
+	if (!np)
+		goto no_flash;
+
+	sys_controller->flash = of_get_mtd_device_by_node(np);
+	of_node_put(np);
+	if (IS_ERR(sys_controller->flash))
+		return dev_err_probe(dev, PTR_ERR(sys_controller->flash), "Failed to get flash\n");
+
+no_flash:
 	sys_controller->client.dev = dev;
 	sys_controller->client.rx_callback = mpfs_sys_controller_rx_callback;
 	sys_controller->client.tx_block = 1U;
diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
index f916dcde457f..09722f83b0ca 100644
--- a/include/soc/microchip/mpfs.h
+++ b/include/soc/microchip/mpfs.h
@@ -38,6 +38,8 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, struct mp
 
 struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
 
+struct mtd_info *mpfs_sys_controller_get_flash(struct mpfs_sys_controller *mpfs_client);
+
 #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
 
 #if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
