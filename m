Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CD4CCA47C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8GFNnCfPHk72ymdsmHoqDawRlKkpUZQTF0jkXSXRLg=; b=ygeBhaHbDI9qsI
	j5lq6m9I+AQ6Lobcpl5xTAaKJmR0PeVn45mkH7l8s2nf1HQ66EioU00HCHI75B2RT1hQ02PupXj+o
	ZTnIdt2pS6i1vjYy9uNnpJlxJWNlXvNHNsC55cY+bB0hnblb6XZegBbMlClbgoXoWvp4yUFr0p2d8
	qv8ilkz0jzpeTcFCMZbJGXRD3lJZLe4uO42mM2ZcLQBPAZgLYH0nGciR/eCSWaWNYJd+zidOg4WMB
	O1mbR6osTpAOE7gJf9iOb5StItwj4Wk/IMcT6ok1NVaHUbLkm24gNUEod0SLOCCVVfRDlDAkxt0P6
	6dvntk0RF4P1ExJdcAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L0O-008fLP-6D; Mon, 04 Jul 2022 12:16:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L0L-008fIv-KM
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 12:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656937002; x=1688473002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eJyjWXL9c84MeJXb2RPk2+RjYUjKmqKhd+L3kczClrw=;
  b=cq0c38OC7I8aAcSoF+umOT0lucx45Z924q0FzNSg6tB13y2+wDcKBsff
   4hNaufAYecylmnoK6r+700zro3foj4ihLLWJUOuISdSckMmERmv8i44Kl
   qcPk9+TyVlotAtlAU/9irLC2ZZm8ixYkCyKswyXrp6BN+RA07BjPQSyth
   kgN8lOSWx2RAMlHcN6QP1XkcaSVAyaEPvEl0MZVsvAdLP21kw56c828eD
   JwZp2dTC6JFpmjeInZcjydoRr/jRTbCaIiq1ylzp6WaA7E1OS6GaLV79c
   wWp+tWJjSsavhJ/jpJ7X/8hYOUfM2CuvpPIYnUmslTCo43cnEoLDVfFD8
   w==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="163197485"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 05:16:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 05:16:38 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 05:16:35 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 06/12] clk: microchip: mpfs: add module_authors entries
Date: Mon, 4 Jul 2022 13:15:53 +0100
Message-ID: <20220704121558.2088698-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704121558.2088698-1-conor.dooley@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_051641_755636_37448256 
X-CRM114-Status: UNSURE (   9.16  )
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

Add myself and Daire as authors since we were mainly responsible for the
drivers development.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index a93f78619dc3..c7cafd61b7f7 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Daire McNamara,<daire.mcnamara@microchip.com>
- * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ * Author: Daire McNamara <daire.mcnamara@microchip.com>
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ *
+ * Copyright (C) 2020-2022 Microchip Technology Inc. All rights reserved.
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
@@ -605,4 +607,6 @@ static void __exit clk_mpfs_exit(void)
 module_exit(clk_mpfs_exit);
 
 MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Driver");
+MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
