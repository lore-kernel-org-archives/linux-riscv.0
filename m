Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E16CC63699
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E783520872
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k66VaWsJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="edEe2bsF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E783520872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kArCKWK6duWyUeemCokuNQHitM9uoPeykr/H+rwSsdc=; b=k66VaWsJPWXuFE2bnDz0NC6XZ
	cMCI7gQNIFgdeAwKOyolVp96rxbemEpLMVV0P8XR/O57ysYEua8MraSgCe1YC5aHhNEA29vrfWbBV
	F2HiOP1F7nhB4MjXtgCKyb46gQ8D+YElnBz4jb47IcfRgqJ30cReehtyd3YsnRXyLPtSSzMe08DcG
	fRmosU4V6wICyALJXogFYKC9GZSrsMyiYf4r40SMt+jyFeptJxgUecdr4IQaPLH7equUdur1prZ6X
	0ZZzb4/B3vBsDz3+0pP4NEFBFbYyjHJ8mz5D7S24w1UZyt4Wu01boJHMPiUV4Wla9LsYKyZ6uCyR2
	BFh7Ic8Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJMm-0000QB-Jc; Sat, 07 Nov 2020 08:14:32 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMk-0000PH-1n
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736869; x=1636272869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fn84oUZ4BNOGbDuiZmuvLT5yqWitqbl3jm2qr9SJ9bI=;
 b=edEe2bsF7O2amA9pJV2t9HKaazSKyc6ecuGi9rkzU+Ra9TzEqo633C8h
 aiwZ2l56NqwtgRS0UYiZJr2uMQXXd+wGXp5hkgelJCVLbxZuvW7Qq+Yy3
 b3+g/OjNeX7lUt2t72sdLxnOCammeBeWMAcPT161Ut+t8mmcjSR5zFBxZ
 N8Fx8Gs0a+3sGvs8zCqu/k+V0m6LgZGpQs5Ewivm1AzXk6Qjg/BqXhqAD
 tQ7/3JoK4MTA6LU1aeij1tEGbG+hJLmv39k6uqdroQpBDSihMUSxRUo3K
 pqKBiM85YbF+Y/3dvAj2KDY6kAV/oDE2xpvfX3a97lbagU5ohhw9HzBGW g==;
IronPort-SDR: T7vymOWrcpeS1r631bFgeAOH18+Qu3SjmlFD48QpQbiRFosAIW5Y/vE/TFq21RvOHPwZACYMpw
 nTR2I7/WN9Gs7DIxBnlxNlx7xL7u/LG7kMQhUPz3FMRZGQxTsL7WZdwUlYqXOiKvw5A4/8t82+
 XKWu8kU900dFr2L6OPVZhm74rglNKE7aErYtS2yDGuHeB6dl5XlldTZKapzTQKHNgah7j7zB/S
 2ricZnXmXiwfVOiqB24OKC+mzfodv+mx9LEChUrEzlbZ1+9985CXVGoeiSA4GIoxrISsDode2E
 0wQ=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079256"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:29 +0800
IronPort-SDR: rAprdR58G6RhFjjmzwD6th1EisMHCCx4vO3+8B6wk8eTWzdG0+htnsTrgNE6ZkS5JlEcnicm7C
 0bsNJDyq5HeJZV0RMvSlC3OTqPEWuw6sGu3hZ1+QwIT4/vgbqQX3TH1wIddnDz58kIQXHjOJYB
 WW/1YsRIR3ntZjFqS9q/CN1Jbkoe2GmsmtEdgAhQIdus5G7mOuZ8WmBdn130mzHFlwOJ6B2upM
 0ZSobnpQXBW95M+lg8CcLdHI41DiwkdBDNb47u26Lhqnr752MsmBfppu6OtEsn1MzOJqbW9wvV
 2dMXEEKqlBHCr4Ta6A6PzOdm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:33 -0800
IronPort-SDR: Pjy+CvffHDUeaBXBpKnVSfEEU+ksIQROzGmmXPC5PVw7W7LyOuXXasEaoNM6f2hnV3YBECU9iq
 LnhkeIJzWOWBBFB12SV915WaNLKoDeKBQAlm7wE6ylqZDcZgeX7vg18qvU4TLQeIZea9IAf/N5
 I/Z9Kje7pGer8lGFz4ym/VEXgpvR8GX9vS6cccuowARmvkDKv4pwcaXx6DsKcVZyvwULF4rSo7
 tgkrLgReXXsDTAjMXLh8x2qgfjYOktPdjaRoIl6Ew59pEikbYpOPsXvP7jJ5M1w1uqP8qplYF+
 tQY=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:27 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
Date: Sat,  7 Nov 2020 17:13:50 +0900
Message-Id: <20201107081420.60325-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031430_274838_CCFB3ECF 
X-CRM114-Status: GOOD (  17.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Synopsis DesignWare DW_apb_ssi version 4 defines a 32-bit layout of
the ctrlr0 register for SPI masters. The layout of ctrlr0 is:

|   31 .. 23  | 22 .. 21 | 20 .. 16 |
| other stuff | spi_frf  |  dfs_32  |

|   15 .. 10  | 9 .. 8 | 7 .. 6 | 5 .. 4 | 3 .. 0 |
| other stuff |  tmod  |  mode  |  frf   |  dfs   |

Th main difference of this layout with the 16-bits version is the data
frame format field which resides in bits 16..20 instead of bits 3..0.

Introduce the DW SPI capability flag DW_SPI_CAP_DFS_32 to let a
platform signal that this layout is in use. Modify
dw_spi_update_config() to test this capability flag to set the data
frame format field at the correct register location.

Suggested-by: Sean Anderson <seanga2@gmail.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/spi/spi-dw-core.c | 8 ++++++--
 drivers/spi/spi-dw.h      | 9 +++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index 2e50cc0a9291..841c85247f01 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -311,8 +311,12 @@ void dw_spi_update_config(struct dw_spi *dws, struct spi_device *spi,
 	u32 speed_hz;
 	u16 clk_div;
 
-	/* CTRLR0[ 4/3: 0] Data Frame Size */
-	cr0 |= (cfg->dfs - 1);
+	if (!(dws->caps & DW_SPI_CAP_DFS_32))
+		/* CTRLR0[ 4/3: 0] Data Frame Size */
+		cr0 |= (cfg->dfs - 1);
+	else
+		/* CTRLR0[20: 16] Data Frame Size */
+		cr0 |= (cfg->dfs - 1) << DWC_APB_CTRLR0_32_DFS_OFFSET;
 
 	if (!(dws->caps & DW_SPI_CAP_DWC_SSI))
 		/* CTRLR0[ 9:8] Transfer Mode */
diff --git a/drivers/spi/spi-dw.h b/drivers/spi/spi-dw.h
index faf40cb66498..48a11a51a407 100644
--- a/drivers/spi/spi-dw.h
+++ b/drivers/spi/spi-dw.h
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/scatterlist.h>
 #include <linux/spi/spi-mem.h>
+#include <linux/bitfield.h>
 
 /* Register offsets */
 #define DW_SPI_CTRLR0			0x00
@@ -72,6 +73,13 @@
 #define DWC_SSI_CTRLR0_FRF_OFFSET	6
 #define DWC_SSI_CTRLR0_DFS_OFFSET	0
 
+/*
+ * Bit fields in CTRLR0 for DWC_apb_ssi v4 32-bits ctrlr0.
+ * Based on DW_apb_ssi Databook v4.02a.
+ */
+#define DWC_APB_CTRLR0_32_DFS_OFFSET	16
+#define DWC_APB_CTRLR0_32_DFS_MASK	GENMASK(20, 16)
+
 /*
  * For Keem Bay, CTRLR0[31] is used to select controller mode.
  * 0: SSI is slave
@@ -121,6 +129,7 @@ enum dw_ssi_type {
 #define DW_SPI_CAP_CS_OVERRIDE		BIT(0)
 #define DW_SPI_CAP_KEEMBAY_MST		BIT(1)
 #define DW_SPI_CAP_DWC_SSI		BIT(2)
+#define DW_SPI_CAP_DFS_32		BIT(3)
 
 /* Slave spi_transfer/spi_mem_op related */
 struct dw_spi_cfg {
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
