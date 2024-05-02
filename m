Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB4CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mF1WUPBulOhNPMotIjkLJvV4/3UVkjY0v1LgZpfuBI=; b=L2x/DzDEBSdW4H
	09rx1sO/A9uUn4gZgGA9ZYxGwTV2Qq1ehQLWhuZ0cXoVO4U6CAMF+aqPmX/f5RppK4n0wpMvIqXqx
	qrLxlWXsAA4gXLEcOBjJGlyQ0/Pfrw2NSyzZqk6G46x3Ev66GTKk1EJC1KsFqvRyknzexJf4WL09X
	oQ113Cr+RjCo0Hr++9CwnsdhDXwk8q0bYYSzw5rdbLN8wU2XvGjcxB9sXxeTSm0vzW+k6sYbBT37W
	Smmeg+K1gxphGx4/4uM74gcNYjE4NmjAHGLDDWJj3u5zs58BfYJXrkfId8CStAauIpYYACuE6Naua
	mpZmd+2yTdjJ91gqT11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2XWb-0000000CvvU-0PgD;
	Thu, 02 May 2024 14:35:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2XWX-0000000Cvtw-16XK
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 14:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714660501; x=1746196501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=az+H6CKJ3JtshNX3ivWDCWH1KSrZJLRxlg2naRmB0/8=;
  b=eTjI4DAkrIj6pSzQivK0RFjEqmJz4warTqYV660NWcGlde4BXbJO/dQ6
   Pcw1NB9y+25fMzjFSfWGz0ay39SOXnn5HxC+5AdRzX/SuA/Qy8xkHKTHC
   Y/Zs8birI4s10Sh+xZZ0N98mCN2SfTKbSczFERrFGLrAwX3uIOwNVYTpP
   ZhOKVPqTHff/B9btMJO7uAW/Tohpn8+K3YhcbjEP7o59uEgQj7poHx1sT
   Z9ywk3T20emDoJxHSRDt1vrV5fQYkfioD7PAanNOT+aEPxSuqkRefwOfm
   FZnKmR5mGLhk7X3rmvpj698cDpUyShz8UL45OiQLiJpyIh6CuCZHitVUh
   A==;
X-CSE-ConnectionGUID: 6Y5bhyOoSXq5FFQlA0lIog==
X-CSE-MsgGUID: bmojybWRRfSEIw4Ew2+m2g==
X-IronPort-AV: E=Sophos;i="6.07,247,1708412400"; 
   d="scan'208";a="23394532"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 May 2024 07:34:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 07:34:55 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 2 May 2024 07:34:53 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH 3/3] spi: spi-microchip-core: Fix the number of chip selects supported
Date: Thu, 2 May 2024 15:34:10 +0100
Message-ID: <20240502143410.12629-4-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_073501_334469_7993A61B 
X-CRM114-Status: GOOD (  11.05  )
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

The SPI controller in PolarFire SoC has multiple chip selects, but only
one is wired up in the MSS. Therefore, fix the driver to chose one
chip select.

Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 drivers/spi/spi-microchip-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 71886c27bca3..4289dfba9af5 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -21,7 +21,7 @@
 #include <linux/spi/spi.h>
 
 #define MAX_LEN				(0xffff)
-#define MAX_CS				(8)
+#define MAX_CS				(1)
 #define DEFAULT_FRAMESIZE		(8)
 #define FIFO_DEPTH			(32)
 #define CLK_GEN_MODE1_MAX		(255)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
