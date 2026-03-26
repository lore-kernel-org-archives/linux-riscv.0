Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF8B106F30F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgzDaau0q+xsTYrSeXUOGeNd2aJ28tAB+fNbZTZ2md0=; b=wtuAsGPd1nPi7m
	VRRsgdALhk43EIKRKxiVu1ljGEpmGJqN+Sm0J/QAicZB+MymKYjkZK/aVK13ofscNxXU8l6wh6PYv
	TFCMvEyQ/ufCvoaHajchDLCWMwDDsO2WeXjUdzjkdaT3x9jw20nzBTG8f/oS433RlAqhZmyzzHPTY
	qf0wKmm4vgsASwoE0TKrO4n8pSpufhWbXP03i4SCFAwcsyykhl96zQAPy+wB+ebafD+u0ENB5rBL3
	rnLhfDGW8djz1t/XxxubfPdDajs5miFuDCj7duPDRZtOMoJIpooMzmjlpxTpU1NeO17pVDrrg2uv/
	qV70d1zrfGqY+wGy8iEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hVv-00000005CgF-1D3x;
	Thu, 26 Mar 2026 10:00:31 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hVp-00000005Ceo-2mOn
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 10:00:29 +0000
Received: from Vostro-3710.lan (unknown [116.25.95.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38672f751;
	Thu, 26 Mar 2026 18:00:19 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Thu, 26 Mar 2026 18:00:10 +0800
Message-Id: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9d2996769503a2kunm60643231383ea9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhkaVksdT0NNGUtIQhhIGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSktKWVdZFhoPEhUdFFlBWU9LSFVKS0hLSkxLVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030025_956224_802061AA 
X-CRM114-Status: GOOD (  13.05  )
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

Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
through a controllable regulator. Add support for the optional
vbus-supply property so the regulator can be properly managed
in host mode instead of left always-on. Note that this doesn't
apply to USB Hub downstream ports with different VBUS supplies.

The enabled and disabled actions of the regulator are handled
automatically by devm_regulator_get_enable_optional().

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..64f5e9f20663 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -12,6 +12,8 @@
 #include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/otg.h>
 #include "glue.h"
 
 #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
@@ -69,6 +71,20 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 	return 0;
 }
 
+static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
+{
+	struct device *dev = dwc3g->dev;
+
+	if (usb_get_dr_mode(dev) == USB_DR_MODE_HOST) {
+		int ret = devm_regulator_get_enable_optional(dev, "vbus");
+
+		if (ret && ret != -ENODEV)
+			return dev_err_probe(dev, ret, "failed to enable VBUS\n");
+	}
+
+	return 0;
+}
+
 static int dwc3_generic_probe(struct platform_device *pdev)
 {
 	const struct dwc3_generic_config *plat_config;
@@ -201,6 +217,11 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
 		       dwc3_generic_runtime_idle)
 };
 
+static const struct dwc3_generic_config spacemit_k1_dwc3 = {
+	.init = dwc3_spacemit_k1_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct dwc3_generic_config fsl_ls1028_dwc3 = {
 	.properties.gsbuscfg0_reqinfo = 0x2222,
 };
@@ -211,7 +232,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
-	{ .compatible = "spacemit,k1-dwc3", },
+	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ /* sentinel */ }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
