Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1F7C636D6
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iqeGdDYAVIMks93L4m+5XMpffyXEyvoIdwrx5n/Fc4=; b=GBFjB5pBpZ0WFd
	pPByiTnLOqV71+OOO0AECQxEkEO/kcq8lcanyXHlPODlHpN9DUdmdQWkac9Mx+3o7ipQ/8ugkm3QF
	7ySyvcxzfF5/2EC/A5IvskYcUEzFIJFAQVai9BWxWntsSO0dhmC5zFe/afcQWYOTTcBO/fsSy20zS
	k6jZFWJ24jcAHg/8hx0RbLTjC/13oLx34Kl4+0mOEQVOXO8VcOWI+68j8Y4FeG1wrYUCXKDCI3mv3
	8uW4uSrqbTy44nXixnRmTxVzVWa2q+lonAokHkK3nyvUt8tQ30hIej82g6E+AKEMYY0SFBWuVBz0A
	IcX0oAiTTshlzm8aHuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3n8-00F7JU-0H; Fri, 17 Feb 2023 16:40:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3n0-00F7Fb-Nv
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 16:40:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D97E61F0D;
	Fri, 17 Feb 2023 16:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B645C4339B;
	Fri, 17 Feb 2023 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676652050;
	bh=s71zhhs0wecI4Nj/TiJBEe21bHckcl5t2kj31eKsk2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o5dlIZsDSWDbpNjmUXNT8rcYz8bORxiOy20ztT1YlygZebRA6cwJZ0zlH53KP9xL2
	 LPMUCAIVA/svO57gelYC4fUpHVsQooUFMOTxgXWa79tk2fWJJ97r+tD8t9Dm5nzgNw
	 8GXP0ExwYEjcPc/cKFTCDmAz19idenfJc09u8vul9BfbIxXE8EqprlA3oUEhniMqyf
	 q194fEcuGqMy2Y/dxmXbDY/9Vjen8KVI7ppHnwqkrHFPqcK7l7oGEp2czGyogtTGMA
	 r+CWKMpmMuFey66/FSkOIlydAp4eBUpoP/StaIuMSwuxec6Ncx4DmMF/70aJ8Tu1lH
	 VYwTs7M+uyosQ==
From: Conor Dooley <conor@kernel.org>
To: Xu Yilun <yilun.xu@intel.com>,
	conor@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v1 3/6] soc: microchip: mpfs: enable access to the system controller's flash
Date: Fri, 17 Feb 2023 16:40:20 +0000
Message-Id: <20230217164023.14255-4-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217164023.14255-1-conor@kernel.org>
References: <20230217164023.14255-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442; i=conor.dooley@microchip.com; h=from:subject; bh=OKHGlsPAKNTTp6NanBTdt/Ki4XURpI/Var46Ky0xqoU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnv1769ftcuntsoS4VZu9G6U0llpoLaY6XHgiV3Gvv1dRvu bQvrKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETmHWX4K/Yxb6tE2OVJ3mZHFsyUTk n9IDXp5KwpC8Tn7WlY9NLDtoCRYbHNZw6xP3NOLFr9Wzxu977bCZdMTtk0xj2zCQiwdNzNyQYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_084050_909890_8321E9CB 
X-CRM114-Status: GOOD (  20.16  )
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
index 11616e3c9ac8..bcbb4bab09e5 100644
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
 
@@ -97,6 +100,12 @@ static void mpfs_sys_controller_put(void *data)
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
@@ -112,12 +121,23 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
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
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
