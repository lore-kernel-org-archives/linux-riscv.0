Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897E0C56202
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3916F208E4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v44FeDvA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ioChVHyc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3916F208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XsLK/EMVpaPxqassDgs7cjTL3X/mlDhyqVNhxfOOVU0=; b=v44FeDvAlARO+96gBNkG1Zjll
	LeJK2iu61htLP789pxcsetpPktRJBnE8yy2roAM5mtn1GguEls7BnNXVZYlaxDdwHS00r4962ZJik
	A78U9R5VPXh9OzNYxm21kVTC9m5DXwU79/EwSRfrN+pRdLwK8s7+0G9vupUT92IDaDpx9kPZDTjeJ
	eJg/QhBpn5m+pWutLq2nNqX42L/vXBXluPVmxUOlB7beLp8B3GBn65B6gkVHjzInkG2lhoM730Ve5
	J/oxaDicAuKTxsv7z/tvt3LlHxCyafVcoTZvT4fShoPKZGbaw9vgQMlnp9tCTWEz/QAGdjGs7s2j3
	ERSDuwcOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJMu-0000T9-CX; Sat, 07 Nov 2020 08:14:40 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMr-0000PH-VC
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736877; x=1636272877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6b+MfY7Lnw6uLwvcAlOQrQcVcVnJvNY26Ca7SXPyL/Q=;
 b=ioChVHyc7hSArtXZbt9ah29uDuB+BbTtOKe7jrQto0USnRsvOhwZlb47
 r+FT8gH8x5RfsXW6PXHrv+bSyPgfC23zHRaZtBz+JGG4f4M9UPaU8Osw7
 aKAmIVPpWj3dBY/yveKvkTJq/q+ImKJ/5eqzZZuI0ePvCCeKqvAFjLSXS
 BbUeA+VVPIzGQSg74IGGULogi7DgnayjqDG5Ji7+WRQgvKPa+Hhiw/mSW
 fBn1B2UfyvJPV3G9uVHaTxUYuTEpWBCIbjsNdGQ3Rr7Rrae5Z/HY/1jX8
 9X+T3i1n+RT1Yzfqe5rwmF1x3KvUDqvlGN66PptxsB4YiHUf1YRMBekVg A==;
IronPort-SDR: aECJ0J4nNM2ehU+iqSgXa8VyYN2geSL5GkAzSCSp+6QpXDcxDoOpOgm6iH9/ckWtXrrsOr1420
 DYVr/PQmm68XWOiMTbt4KiAql0fD90sYHe0AETUH7BlvtVSYkPZbGvCpMiv7rcP4ZgYfeCLJZd
 5iEFdY71VuVLhnougyiD/vUXvoQ3YGbLW9lUzUN34SuYYym/JT31AkdAACmQN17H75PMemfxLI
 iU2gLZQjBRA61dfHPlFovQa8ECL/NYUbcRYIBrMPhwcwJoaqtEeojUM+1FrBqLPyPVpUzoeo25
 qg4=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079268"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:37 +0800
IronPort-SDR: AmGGxsQiTEQgZDKr8a/XH/hGDOtqQdAdgzVqDMd/2TLSAkc8Ub+YcrZSI1hMt9iyvBtB6STMSj
 jOmf6vZICHib3dfG+GYOuLvz6J4Ze/eQmYHNL3RZKQxVizQfB8/DrpBN5zZJ6wBs4egjsG/yiK
 P5UtbIilIe6JcigxPhXNwyJUNxc3wHXDrXpgURfmOer+gcEUf7+6nS/k41b88+OYTyZES9c5Bw
 Qx4oE6lxFwK1dQrXwhDewnTPlZ2l/vxyqXLBrweNpa2QBvGGRVP+48+waSYbo9jPlXIRtCBzFh
 cMKYoCItQPET/jtCVnOfAXnH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:42 -0800
IronPort-SDR: NSr+fi+441D/Y1RoTNH84IS+7KXzRlrA3vPMRV0+N1CX0PR26ZSjF+sMYjPwDRUPIEcZkz2Rbf
 jOMvNeSaoWy5oTVBlfqzCSFG+qD34T8/i7rhLqC5WioI2B6JKCjiAldHzLUdDiP+K0dRgmzVR5
 G7hWuCLS6zsopefhObrpOae58CT5kaAQcUMZlbU/y2+dGZTsv1TbDx3jfSG5IMmNBjkZE5nMhn
 hSsR1Y1ir8AlX6JL+I/oSvG69ZIVrsLipi/Dyaa0esLFacgkelsNRm8M5rORI1GwilWaJfkd0d
 Ex8=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:35 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 05/32] spi: dw: Introduce DW_SPI_CAP_POLL_NODELAY
Date: Sat,  7 Nov 2020 17:13:53 +0900
Message-Id: <20201107081420.60325-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031438_212887_8893186B 
X-CRM114-Status: GOOD (  13.59  )
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

On slow systems, i.e. systems with a slow CPU resulting in slow context
switches, calling spi_delay_exec() when executing polled transfers
using dw_spi_poll_transfer() can lead to RX FIFO overflows. Allow
platforms to opt out of delayed polling by introducing the
DW_SPI_CAP_POLL_NODELAY DW SPI capability flag to disable
the execution of spi_delay_exec() in dw_spi_poll_transfer().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/spi/spi-dw-core.c | 12 ++++++++----
 drivers/spi/spi-dw.h      |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index c2ef1d8d46d5..16a6fd569145 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -385,14 +385,18 @@ static int dw_spi_poll_transfer(struct dw_spi *dws,
 	u16 nbits;
 	int ret;
 
-	delay.unit = SPI_DELAY_UNIT_SCK;
-	nbits = dws->n_bytes * BITS_PER_BYTE;
+	if (!(dws->caps & DW_SPI_CAP_POLL_NODELAY)) {
+		delay.unit = SPI_DELAY_UNIT_SCK;
+		nbits = dws->n_bytes * BITS_PER_BYTE;
+	}
 
 	do {
 		dw_writer(dws);
 
-		delay.value = nbits * (dws->rx_len - dws->tx_len);
-		spi_delay_exec(&delay, transfer);
+		if (!(dws->caps & DW_SPI_CAP_POLL_NODELAY)) {
+			delay.value = nbits * (dws->rx_len - dws->tx_len);
+			spi_delay_exec(&delay, transfer);
+		}
 
 		dw_reader(dws);
 
diff --git a/drivers/spi/spi-dw.h b/drivers/spi/spi-dw.h
index 48a11a51a407..25f6372b993a 100644
--- a/drivers/spi/spi-dw.h
+++ b/drivers/spi/spi-dw.h
@@ -130,6 +130,7 @@ enum dw_ssi_type {
 #define DW_SPI_CAP_KEEMBAY_MST		BIT(1)
 #define DW_SPI_CAP_DWC_SSI		BIT(2)
 #define DW_SPI_CAP_DFS_32		BIT(3)
+#define DW_SPI_CAP_POLL_NODELAY		BIT(4)
 
 /* Slave spi_transfer/spi_mem_op related */
 struct dw_spi_cfg {
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
