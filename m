Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCB2CCA47A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BHUO6puW1J/hSmLO+TRENLzgoBpAX5D8jVz3QB5AeM=; b=hnY09M4L8OXGOp
	hJflLb2/pHawHrYG3Z9dF1Hl2yidc13V5w5JisALz5DUiE5ubEui8jmMOVcJ1SS/mv5fJWo2IvqCz
	LTq5vbzJVUo7CvEXJQqQmn4SvsPq7xQwta4jWR2TXiqj4864vok+728BJKQ4PM2WDWqriMdwJpHTH
	fYM63+v56tyK+HJQx+f7EX+FQESdMf3SC8WdKe0NMIoHL6VNggO1iPAIR8LNf88Pi06AeJn7uBokJ
	5LulU4EHp68s77Qg5FhiKneSlzvulmrh/roTMFQkmEfGg5AeElKvDr8S/rtD0FSOmgXSCAiJ5w13f
	qukTh17sf3ATP2Ps5wHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y89-00EjSO-Gh; Sun, 19 Jun 2022 16:50:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y81-00EjOj-Lp
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 16:50:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so6699336wmq.0
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HNXopq52OdPOW8hnENMbdffTvgekfwjZqRQxiWITItA=;
        b=UXseDhSOx0rUAEvMqPdKjoNX6iw9kl3ksS1KhacDVTvFn9tN8JSbBObzwz8gdyDzQg
         uQJkGfWZksWFLd0JITNB4k8Lp+jk+Tb4Jco9WbPkapDV40a/UXo94H0yAwxGoAu8j4Vg
         KwVUHLnxGxGypw8UpX7J2FHUCRkPpv7drdKjkZfhGI/gTAirqZbp2sUhgpyPIL9pmLIj
         qlkBRg4NNpCccrXRS+RduITB9GoWEe29/VUCSe5YbbNnsbABBPX8VNSs+PUJET+TxzYp
         HnkLC3Qc4N0cRB7whR+tm0GM/2NItv0jxMP8CQW86kPt2rl2M6rnavs5s0wUyftzUI9k
         +Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HNXopq52OdPOW8hnENMbdffTvgekfwjZqRQxiWITItA=;
        b=xpneK5MRQUw7kwQzmab5SsT4Mj2gQAjbvzicWQ+GMCmWl5aXujc3G6cp/dufkh841p
         cGM7G+AGVcuCjIILsA2JFGX50riNwdu+Z3Jag12LCHq88Sx/xgEjjlYKZcephgNG7Sg/
         6DYBXDkyJpP412WhT/mZCNaq8GDIRb/NwXZ0xE9pV2ROi6tqp5vXApd7U4/RlSgj/+sN
         aN0pvLD14OX/5yB6CErO9K006fFW41sGHUIC7w58wS+Yer9ZQd9g2sZmaZlfOMqRtLX6
         hvd3oDPBz9/K7Ic8fTGtUUS6YFXk2BZkPYLKzbAU7Bb3haHkzQQ43/4Nw6VMsYG2+Oli
         JO9Q==
X-Gm-Message-State: AOAM531p/dscos89sQYi53y+Ktn73/21C0Q03rdQP25QQCYSxjOdbXGS
	OHAppOp7OcRZ+uMWOgnajNJvpw==
X-Google-Smtp-Source: ABdhPJxL+7m5XLx2s4xgfyyeKIsKdf3d5gNOY2UtvWLXs/QJRThfo178XdMRDOR1NdK/T7YB6xi5OQ==
X-Received: by 2002:a1c:4682:0:b0:39c:4459:6a84 with SMTP id t124-20020a1c4682000000b0039c44596a84mr30464743wma.167.1655657424029;
        Sun, 19 Jun 2022 09:50:24 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:23 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC 6/6] riscv: dts: microchip: add mpfs specific macb reset support
Date: Sun, 19 Jun 2022 17:49:36 +0100
Message-Id: <20220619164935.1492823-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_095025_752004_6A14764C 
X-CRM114-Status: GOOD (  10.77  )
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

The macb on PolarFire SoC has reset support which the generic compatible
does not use. Add the newly introduced MPFS specific compatible as the
primary compatible to avail of this support & wire up the reset to the
clock controllers devicetree entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 8c3259134194..5a33cbf9467a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -197,6 +197,7 @@ clkcfg: clkcfg@20002000 {
 			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
 			clocks = <&refclk>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		mmuart0: serial@20000000 {
@@ -331,7 +332,7 @@ i2c1: i2c@2010b000 {
 		};
 
 		mac0: ethernet@20110000 {
-			compatible = "cdns,macb";
+			compatible = "microchip,mpfs-macb", "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -340,11 +341,12 @@ mac0: ethernet@20110000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			resets = <&clkcfg CLK_MAC0>;
 			status = "disabled";
 		};
 
 		mac1: ethernet@20112000 {
-			compatible = "cdns,macb";
+			compatible = "microchip,mpfs-macb", "cdns,macb";
 			reg = <0x0 0x20112000 0x0 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -353,6 +355,7 @@ mac1: ethernet@20112000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
+			resets = <&clkcfg CLK_MAC1>;
 			status = "disabled";
 		};
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
