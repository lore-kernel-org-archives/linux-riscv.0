Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA793C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 10:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HIZX+0u0lBB3BliODBRKra/fO0XcKFqzCek4uV3+WWo=; b=vkx/UUy376O63r
	DyeX2kJE5mWqychCghbr2VIBKEGf2ifqLjVEoaopZhTpvzyq97FIIAnokNbzFYlkvHH3Ar53Psr9+
	idp+7519CX9WLDhHGrxAfb18I8KE684kVU5TeFKXSF8pLuJKwtV+RBPlPKiL51SJ5rRx3N5Fqm5ZF
	Jgobb3Km2ei9P+Bmh79sIrLd0NMm6xgXbQQRoduv4avl675oRZpNYHt3PREB6n2p9wbR94PRGGy58
	RwSba1T63BLJZiZGT2P66/5aQyrTJnC5cv92VzTJlEoIVc3mZmEplYUYYA/yIDFHkYe2WKSbQmzRY
	oLu4lmaf0ZSvRSUq85gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVrRD-001Il2-2k;
	Tue, 15 Aug 2023 10:38:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVrRA-001Ik5-2V
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 10:38:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C87062A56;
	Tue, 15 Aug 2023 10:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE9AC433C8;
	Tue, 15 Aug 2023 10:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692095886;
	bh=vfsmct2um1dZLhTaTlqYJbYYd+eaE2KLf5N2UT+ZD/I=;
	h=From:To:Cc:Subject:Date:From;
	b=Yt1O6Vcx5UM0nVWWMOrDRdhKTDMhqnvZB52dla24am7J/JSe999zTqCuv/buuvh3s
	 aROgX6PedFSctcRZSrtrnZSvNmmr4PAlsTsxb/LK+8koUxnO1vUwbZDVnAVjNaKQAF
	 5YTWcZ8t6pHMhwjggz9OHEdfBT4NplX5z5Ywf18YTjMZwv5zQ+wUEY904sEXVWYbxI
	 H73QmLrDoSfSlMbzS2LljzA61ShsDzVd44jFgOSTdaOE/UVqx4BtxAPFkcZ4Kceg3e
	 uIxqEPwUdqUWwq+6JrU6D8doC/eoOqry5nt165VfTXyeTx5cTpFK0tRAv8+jUYtPgQ
	 eBSVcypfH0PrQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH] riscv: dts: starfive: fix jh7110 qspi sort order
Date: Tue, 15 Aug 2023 11:38:00 +0100
Message-Id: <20230815-scurvy-jujitsu-4fced586cffc@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+yX+JJYXRdVh0uFlwxtHL83ecUTKFlWP1WDJtrrNCrM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCm3Q9s3f5xQm+1a9OvVotoNWt2n5yx/Ziv3Scyl6fLbu 6z63EptHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIpVRGho7Y9D+zu+o2bYpK rk7hcp2tM4dzbnP7m2lmEheqWFZ4L2VkOOgw6+i2U2n/Dqg6XWU89X7qwW9h3Fre3HP1mMWPGAd G8gAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_033808_901972_827B2C2B 
X-CRM114-Status: UNSURE (   8.61  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Emil pointed out that "13010000 sorts after 12070000". Reshuffle the
entries to be in-order.

Reported-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 38 ++++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 9aa563898868..e85464c328d0 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -676,25 +676,6 @@ i2c6: i2c@12060000 {
 			status = "disabled";
 		};
 
-		qspi: spi@13010000 {
-			compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
-			reg = <0x0 0x13010000 0x0 0x10000>,
-			      <0x0 0x21000000 0x0 0x400000>;
-			interrupts = <25>;
-			clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>,
-				 <&syscrg JH7110_SYSCLK_QSPI_AHB>,
-				 <&syscrg JH7110_SYSCLK_QSPI_APB>;
-			clock-names = "ref", "ahb", "apb";
-			resets = <&syscrg JH7110_SYSRST_QSPI_APB>,
-				 <&syscrg JH7110_SYSRST_QSPI_AHB>,
-				 <&syscrg JH7110_SYSRST_QSPI_REF>;
-			reset-names = "qspi", "qspi-ocp", "rstc_ref";
-			cdns,fifo-depth = <256>;
-			cdns,fifo-width = <4>;
-			cdns,trigger-address = <0x0>;
-			status = "disabled";
-		};
-
 		spi3: spi@12070000 {
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0x0 0x12070000 0x0 0x10000>;
@@ -767,6 +748,25 @@ sfctemp: temperature-sensor@120e0000 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		qspi: spi@13010000 {
+			compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
+			reg = <0x0 0x13010000 0x0 0x10000>,
+			      <0x0 0x21000000 0x0 0x400000>;
+			interrupts = <25>;
+			clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>,
+				 <&syscrg JH7110_SYSCLK_QSPI_AHB>,
+				 <&syscrg JH7110_SYSCLK_QSPI_APB>;
+			clock-names = "ref", "ahb", "apb";
+			resets = <&syscrg JH7110_SYSRST_QSPI_APB>,
+				 <&syscrg JH7110_SYSRST_QSPI_AHB>,
+				 <&syscrg JH7110_SYSRST_QSPI_REF>;
+			reset-names = "qspi", "qspi-ocp", "rstc_ref";
+			cdns,fifo-depth = <256>;
+			cdns,fifo-width = <4>;
+			cdns,trigger-address = <0x0>;
+			status = "disabled";
+		};
+
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
