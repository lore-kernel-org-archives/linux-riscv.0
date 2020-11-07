Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24A9C63699
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5529F20704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZJXdXJL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YK3FRLza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5529F20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=89aJprTaL8ZKe20aA0llcFRlovan6QY10FimnDkaMJ0=; b=UZJXdXJLM3qQk6sAgCN9MV+T1
	O2t3uq5NV4UoGK8QgvpfcnMF1YuskqQ7hNvcewTjXAsg7OA68/ubGjT8yE+GztPYUnGG4f5l5cDGs
	x/dzTNLn/scC0Y2cDSU3jnhzzbwArufO5RInvNPhAenbH3CotgFh3pWEknxC/6W33LBuQgqDifM5P
	MA6DCpVn1etmB7CjXFD9ajkMSsId5lSsYcTY2Gw5h/GPxT1tiGZzfQKse8WThcrXE61QvVDbMCLkU
	QyFhURmhhj0J7nSjxeLUeKsU2VdECzkeJggej0HYKZ2ZgiJEGPj0bTFtAkNHIlDKCdYg3XHhayVwL
	DSLjQHPCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJMo-0000Qk-4U; Sat, 07 Nov 2020 08:14:34 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMm-0000PH-54
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736872; x=1636272872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zXOUn4luDWiHlH2xEcGo8nQgZxG+Qoj008WbUn42J5Y=;
 b=YK3FRLza2B1oaXtVJkh5m4l5pQ/dnIQAv9U9i1ADEQbPADJKuTvDsi2H
 RUHnBzIsM8vyfkFhYfVk61th3k1iWA+JxcbQMUrtoK3ZnIaQe+X8kG+wo
 fTpMOWBvefy8GDpA60BQznzkcT7pnOel23tmI1OSkdHRx5vZ0LUogs4n4
 Bp2D74gr4FoSyxAGmffWKTiNcwB2LzqTBidP6eecwcYLeP96ihINaLS/f
 EwZ1oE7dSpK8hEzsipqntdiAWy/TD4a2uoRiRwzYU9n8U8OohhZ61QHJk
 h5qA4CC96Wm0v9O/LZkAN+sIvhToAKqtZBOiQXQ96uACorqGe/NxxLrZC A==;
IronPort-SDR: NfCZk39rwjvKisptECAbLCvodxoC3KF6tfHIySVgVDg1z2rnvMQMPmnEHj/v7th1ga7vYo9WhZ
 rYx9vZgstJRKvA/iqnb0W1wlbWAD0CmKmvSioPDkP9uxgzM5fB+oxWWmpz0OaSFez6nkOqI37D
 icCVEQlsL+2Hw/bXHNvHHPOlU0DSwTxkF5SCm1bc2z5Br/1MKCkR/Cgqpg+iyA+TOO91gh2YSy
 GYRF0m+VN04dJtG78sokXvvYZBkMmdlR6FQyLb/VOWjl1R7SreHWGw2vBZKxr4a3SmMczDHrQT
 5WY=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079260"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:31 +0800
IronPort-SDR: ek3a1g/ff1AXmnnSc60PJbWdOWqsCID25JOkIei9/rPSnhiUT9SnVLMGAXRa2HhnPVa9Pog59H
 TBg8wvXxSqBSh1ZVqsvb1dj4IIbeiOo57u3pE2pF72apWnkgKvmWzHrDBGV6DKBtIWMXz9juea
 YRGkCqYt7RAdsjpvmtZwNdSwZHEtkLc3Ag4eSjVIfnU9cfziTsce35YjP95KldZT6gecLEoEtl
 rWgZUz/hs5yl2HZNzzzJuSLDQ4NZGdkrkACfj/92FhusmxrzKZVI1IVQv++gLKqnzsXs2Vw9s7
 hXZaiWtD8LkG3L+JlLu6+YA2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:36 -0800
IronPort-SDR: 5bMS7b8/oLSlphvaD4IRhBm6Eo/58VNOp/fpJO2woBA813YdnNsPHPyJK/Z/P5Qjuvf5fIKXww
 +hPXtu1SxJzByuUOQ/9GIaSKjctTWWsy2g3FaIZMcFDPX5XqJTMQTKHQldpOI/+AQzkPQddNjN
 nM8wKRoWn59ma3g0/DCaPbkXtaaxsTWHTXKmGM3YPZk/xAfSVJAhfiTaHkKcAoxX0QD5ShtmUR
 9+mCVSuTOeM6wmBgCiaK4xvFT9GmfT2ZkxTHkPv9DxFfMkqn+T3ghAnlBxLxwx/ArefX6JBG8s
 NPA=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:30 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Date: Sat,  7 Nov 2020 17:13:51 +0900
Message-Id: <20201107081420.60325-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031432_472873_8717037C 
X-CRM114-Status: GOOD (  15.78  )
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

Fix for the Synopsis DesignWare SPI mmio driver taken from the work
by Sean Anderson for the U-Boot project. Sean comments:

The resting state of MOSI is high when nothing is driving it. If we
drive it low while recieving, it looks like we are transmitting 0x00
instead of transmitting nothing. This can confuse slaves (like SD cards)
which allow new commands to be sent over MOSI while they are returning
data over MISO. The return of MOSI from 0 to 1 at the end of recieving
a byte can look like a start bit and a transmission bit to an SD card.
This will cause the card to become out-of-sync with the SPI device, as
it thinks the device has already started transmitting two bytes of a new
command. The mmc-spi driver will not detect the R1 response from the SD
card, since it is sent too early, and offset by two bits. This patch
fixes transfer errors when using SD cards with dw spi.

Signed-off-by: Sean Anderson <seanga2@gmail.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/spi/spi-dw-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index 841c85247f01..c2ef1d8d46d5 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -137,7 +137,7 @@ static inline u32 rx_max(struct dw_spi *dws)
 static void dw_writer(struct dw_spi *dws)
 {
 	u32 max = tx_max(dws);
-	u16 txw = 0;
+	u16 txw = 0xffff;
 
 	while (max--) {
 		if (dws->tx) {
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
