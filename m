Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AEAC00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YHz4D/aJB0jf4iQ+TVbUvJ7bzHAhrqNcFfUTuDQc1zg=; b=ZYcQ0fJShthdLL
	We93tZgb0ei9iLSui5+Ejr8ISoOPCXPJeRHakiMaK82/nYXZlAwVvTQgHVGdghxgQmUczOja9+esI
	lmd161/qB9XCM/rVz6JHhAGW4G/8UPutOKmc3i6ihrwmvwXEOtQ/olh4Dl8YZ4X80clO3sp9zfDxj
	Ex/q00+issz0DqqLyNByhs+GQbZZcadXu3/2ruo3THCIaf0xlzfICjF4YqJ+1o4I/uSSFPi9uP9Q6
	evu4TbYwUISmhqy7C6RSgvnOn1gULy5gA722sqAlPbDrcp/zc301kfhZE+EpU7E9NyUTIqQs1wcxg
	IgNKVD3THMXtUBcincTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLhZh-00AuE4-95; Wed, 10 Aug 2022 09:00:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLhZd-00AuCD-5G
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 09:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660122021; x=1691658021;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c2PE8iAmkH1Oin6CAU5HGkAjPeE646cGNzdZY+RUVJE=;
  b=iMF1qZHcfnO379iNNojfYGMo1NkmbTJWCVgQtUpCF/0kw1T3UR7Oi60c
   eH/0amMKrIEMkvqbb2FObtALNzM3Cpwkasdlj8TxaOaW6K5U+nU7dMmyT
   C5GIhhG9LlEOk67IuoIeJ1oXu9RknF9v8EfLCbeAoFpktZW48sJV4pakM
   zr64wDsFSlSQ4G0UGYZ/NESjq1VHmsJj5ego5T1oQbWxclFeIUZQd/RYc
   nhIAPV1uKkitOB+DeQ5chO46Pj1kySIez++xpTQIRNfFeuOGewxknL+gs
   /4JZKjp+Qi5aIzUJtDe+d0DAPNwBcG0YXyp6MFldNbq5PHEiVZIUFFGRT
   w==;
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="108383200"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 02:00:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 02:00:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 10 Aug 2022 02:00:11 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: <nagasuresh.relli@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <broonie@kernel.org>,
	<devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: dts: microchip: add qspi compatible fallback
Date: Wed, 10 Aug 2022 09:59:15 +0100
Message-ID: <20220810085914.801170-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_020021_382722_00393A49 
X-CRM114-Status: UNSURE (   9.80  )
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

The "hard" QSPI peripheral on PolarFire SoC is derived from version 2
of the FPGA IP core. The original binding had no fallback etc, so this
device tree is valid as is. There was also no functional driver for the
QSPI IP, so no device with a devicetree from a previous mainline
release will regress.

Link: https://lore.kernel.org/linux-spi/7c9f0d96-2882-964a-cd1f-916ddb3f0410@linaro.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
See the link for binding discussion. I'll apply this at some point once
the driver makes it upstream.

CC: nagasuresh.relli@microchip.com
CC: valentina.fernandezalanis@microchip.com
CC: broonie@kernel.org
CC: devicetree@vger.kernel.org
CC: krzysztof.kozlowski+dt@linaro.org
CC: robh+dt@kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-spi@vger.kernel.org
CC: linux-riscv@lists.infradead.org
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 499c2e63ad35..45e3cc659882 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -330,7 +330,7 @@ spi1: spi@20109000 {
 		};
 
 		qspi: spi@21000000 {
-			compatible = "microchip,mpfs-qspi";
+			compatible = "microchip,mpfs-qspi", "microchip,coreqspi-rtl-v2";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x0 0x21000000 0x0 0x1000>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
