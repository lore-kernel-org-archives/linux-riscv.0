Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21270EFCBD4
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GQX7/1UfQ2IS4R7PuBeU9pQPa+uRmqN7TCWyfJU9KYs=; b=yOUMQ7yLJ+DCNp
	twf9bU0VxlU5VFuqZ4r7Q/tce9r5NWNATcMzQ0qmCZvrByY9ZctQYsfa5lJVqd/NLQqVC1u8HTk7c
	3L30L5JobooXcgn/KHgK+9T7vcjY/DKBqizY2XJp/LWNV+w4JaN8XIirdBQmsFjOdFuHvb5TTJuaw
	7TIjDmLN/bYJ6RN2w+9FIgbdmHV08PRDMhOvJc0jUi/F1are4cWqqHPe8/1/qqbzCMuEwZjADJ2il
	QsQsxEsWG/TysouoHhIzjCPT0IavtqGSTCOITb2++c1ZL9y0UrMEQpyD/69yVJ+uehmrt8XjbjJw1
	ZJinPAIoOemG0+g61wHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22sA-00000003Von-3UKt;
	Mon, 16 Mar 2026 08:00:22 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22s7-00000003Vmy-3qBf
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 08:00:21 +0000
Received: from Vostro-3710.lan (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3714cc931;
	Mon, 16 Mar 2026 16:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ze Huang <huang.ze@linux.dev>,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Mon, 16 Mar 2026 16:00:00 +0800
Message-Id: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9cf5a8d34903a2kunm97eee50df009b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUIeVh9KTkkaSUxKHR9KHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_010020_145880_D58E599A 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

Some boards provide USB VBUS through a controllable regulator. Add
support for the optional vbus-supply property so the regulator can
be properly managed instead of left always-on. Note that this does
not apply to USB Hub downstream ports with different VBUS supplies.

The enabled and disabled actions of the regulator are handled
automatically by devm_regulator_get_enable_optional().

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/spacemit%2Ck1-dwc3.yaml#L71
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..83b4e4d69ba9 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/regulator/consumer.h>
 #include "glue.h"
 
 #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
@@ -113,6 +114,10 @@ static int dwc3_generic_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get clocks\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "vbus");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable VBUS\n");
+
 	dwc3g->num_clocks = ret;
 	dwc3g->dwc.dev = dev;
 	probe_data.dwc = &dwc3g->dwc;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
