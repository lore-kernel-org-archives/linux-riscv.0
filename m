Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B9FECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buE2QY7CixIUrW80vWNa8UyiJEA4IFkZVvKGtC+zyH4=; b=jo649QidYjVUhg
	nGUMEN9lz2kOJBCWomBvqKg19Es1Z3BYU8K8Nuu5/gav+DPZumRhbDrOJcmgPutldyeyzTjo7Q0om
	xRSVNZz/WQgBlA55bdIADTBsVolI8UfP7/G+LMq7LsdpTgF+PXqHK6huCNqX+JeaKc6CNBVq7Yg91
	P9eZi2lWbwY9X9LW/2ZTUeVHkaW33mbPn4K/SAUpqiiK4kiVfM1hMXc8gTPIKG0sJot753fZZHSOb
	zXLoAUJxFvNS4efnJyNNNZvFXKKeyBrXWjSR+QDkWlveuD4fWDjkdfJd2DdoCgqlN8ZMTEPYFRYPM
	RXHUjCiOcMkt/OO5U57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0lG-00H3Gd-8m; Tue, 30 Aug 2022 12:54:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0ki-00H2Eh-47
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661864041; x=1693400041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xhkGjXxUZ6UD4DKI2S418ztKaA/H6Y24X06etHrP3/c=;
  b=TkO1sbjRqF39m5zUQfVo0+Sgq2Zczaqcr44cfQyQ4S8QdpVjTwtnBhRU
   tE+8rIyx7jXWr8q4rc6O6GUSZv1vLcUXxn2QgzjE0fLZ9Raogk2IAPtTG
   DqbR/WrA+CGuHZZgaTe5nAVrnKvPJHFoa/KQQeIIYeUVYyJqZy4iAFjWf
   /WvSHra12N81be90PEuX71B60w0KjQpgCmT+IqGJlLyjgQY7yirZdykpB
   vs9dz94gwLObnhXi1/6mAXXK5PzOqF6RZx4F8wX8Tf0gPK4KsTcD0pxid
   u/O4slMQ/DADexheIohzSwTZJmsv82f3twV6yAYW/epwvd+9T95NlCGDm
   A==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="171583410"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:54:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:53:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:53:50 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 13/13] clk: microchip: mpfs: update module authorship & licencing
Date: Tue, 30 Aug 2022 13:52:50 +0100
Message-ID: <20220830125249.2373416-13-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830125110.2372514-1-conor.dooley@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_055400_283944_22CE09D2 
X-CRM114-Status: UNSURE (   8.70  )
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

Padmarao wrote the driver in its original, pre upstream form.
Daire & myself have been responsible for getting it upstreamable and
subsequent development.
Move Daire out of the blurb & into a MODULE_AUTHOR entry & add entries
for myself and Padmarao.

While we are at it, convert the MODULE_LICENSE field to its preferred
form of "GPL".

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index fa46176eb9ca..253a55a04084 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Daire McNamara,<daire.mcnamara@microchip.com>
- * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ * PolarFire SoC MSS/core complex clock control
+ *
+ * Copyright (C) 2020-2022 Microchip Technology Inc. All rights reserved.
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
@@ -505,4 +506,7 @@ static void __exit clk_mpfs_exit(void)
 module_exit(clk_mpfs_exit);
 
 MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Padmarao Begari <padmarao.begari@microchip.com>");
+MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_LICENSE("GPL");
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
