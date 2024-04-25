Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C112C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 08:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r1bbPoN2NCgmaFA4BOfnLDQvPWYgJMBkvODEEh2FEM=; b=tdGfWLELviJO2d
	hkOUpFvHGyyNy1Vnxw4EJpAoqudbzC8L7V4zNgSPyAx7pv+vLAU+1AZMWmpJtTXLUxFN0pHkc5qxg
	14dnPDPyo69AWVwki/ALf2XjAZ115gS/1RruTaUFTpCHLQ78f8K9A5YmKuIC7BIY7okDlR4fVVF+Z
	RUHcupaApVcBlcHS/mrE+Wga7odLWPSpD7MIbSrqeZNXnSlnbuMkIwrIsEGDiNVyTcbdsbi86/o+v
	oKnoPlg9Po6KMEZsP6D1saETIIF/Twi4wA6DMNzKqP6476aQty0RZr2kcvl3uHrKlNhwI0wmRHYlw
	yPNyaMcg8IkJiu64PzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNp-00000007Q5g-0jn8;
	Thu, 25 Apr 2024 08:23:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNl-00000007Q2m-0XAy
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 08:23:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DE9320012;
	Thu, 25 Apr 2024 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=icna0IUdSFum6K8F2ACUEdkZDLuL3oJCWinvPVNIlGM=;
	b=Mm5bY+mYxEpPYaFUZxUQnzVgxAscPIGTsiL+tv6u5/LjrBpVXauu/Cqf9LxrFLUawurJRo
	PSVBB26PfEMo4VzgnPdCFoJKCYTjAzEy8ryrENoNqd4nz4FKTukt1jUNvx/vBpG6r9UUlR
	TWsu3oqEvpkdr/dIdRzr5uCzV3XP4u4ckNsML6Rhwl3l0DwUoTRWG3M8lEwYLv3N2r5xDw
	vDFCzZdAGeoa6KV6FyhJJWeKtwouMMUgdxwz8y0DQgWCXgDDRrxOboqIaYjsVkWjguvPMk
	BfUI1S0n7uc+F/GQchsxykIzfyX/aFFQuS7j+IDL8y5qxe9y9xL0cl6STchysA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 2/4] riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
Date: Thu, 25 Apr 2024 10:21:33 +0200
Message-ID: <20240425082138.374445-3-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_012305_457635_89AA8340 
X-CRM114-Status: UNSURE (   8.29  )
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

According to the device tree coding style, nodes shall be ordered by
unit address in ascending order.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 54 +++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 8b915e206f3a..d2fa25839012 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -193,6 +193,33 @@ uart0: serial@ffe7014000 {
 			status = "disabled";
 		};
 
+		emmc: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		sdio0: mmc@ffe7090000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7090000 0x0 0x10000>;
+			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		sdio1: mmc@ffe70a0000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe70a0000 0x0 0x10000>;
+			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		uart1: serial@ffe7f00000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f00000 0x0 0x100>;
@@ -311,33 +338,6 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
-		emmc: mmc@ffe7080000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe7080000 0x0 0x10000>;
-			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
-		sdio0: mmc@ffe7090000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe7090000 0x0 0x10000>;
-			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
-		sdio1: mmc@ffe70a0000 {
-			compatible = "thead,th1520-dwcmshc";
-			reg = <0xff 0xe70a0000 0x0 0x10000>;
-			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
-			clock-names = "core";
-			status = "disabled";
-		};
-
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
