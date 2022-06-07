Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5831FC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eMrr0U8pvbu4xDZFQWuDDa2tJx0dH1ryI+h4oRswVw=; b=1z2ac7F3/jP9ur
	paX1mTwHj5jXUQAsmGGBm4feV8D37CyI0l6oC0eJmS7iNm9te6UfG6JRTjAjTW4BZGmxYe76YRkIg
	QsqofE1RbxAG8xwKuOLaECs5kLabG9G9+E//RH24FyR41SrEMtQcoO6hs8pYfahUOqXy7KdHo7dN1
	vpKrxy2NJKSNncEE3/kOscnozp9+EsMzoHB9uAU6QByjx+s/TLTLhG/5jCmpAX7UYJ3zaL+Hj+ipO
	Vjuq0REvyxB67GP89Q9JhBiLWHQoC2XEm6LpkIpEZnq7XI6JCi+9mJmiDKNBzHUUHsbVPN1frei4j
	hAcYyXsKiahIPK85kDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTBf-005Gbb-JL; Tue, 07 Jun 2022 06:59:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyT9C-005FM9-Dt
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 06:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654585022; x=1686121022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+1xGChpqZuNDz0197+AGmRutrzG/VT3GEtYD/psoI14=;
  b=0linqtrBWmCQcHMdkYHfKOkx5Phj7/1mU59sKRohlTwL5s53kJZHlEfb
   G3XVSPsGRpliwc7dThRqErU4jFsY1bezaDQEkaW7h/OZQw6BPy2bCaUbE
   FcPmgV+tzayrG7mqSFVnaRHaVnh4DKjlRk0Fo+Lgc19EfEPTrytGEDqib
   ZoXfJ1pNkvVAzB3TdH6ug7lKxo4KmYY/EwHStB1dneEOiS94o2UPHt/Qn
   8f3YT8ySY+oMVxf8mafRDxXwIV9YaJPsqE7H1SEP6tZlDLslzvjdl7jPJ
   ga0bMOWc3rSEDFjb0dZWCi21IX+d2Dw9dUFBEBMpFTNdAHrEnaGQGnip3
   A==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="98872876"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 23:57:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 23:57:00 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 6 Jun 2022 23:56:57 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde
	<mkl@pengutronix.de>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH net-next 2/2] riscv: dts: microchip: add mpfs's can controllers
Date: Tue, 7 Jun 2022 07:55:00 +0100
Message-ID: <20220607065459.2035746-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607065459.2035746-1-conor.dooley@microchip.com>
References: <20220607065459.2035746-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_235702_606143_A84A467C 
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

PolarFire SoC has a pair of can controllers, but as they were
undocumented there were omitted from the device tree. Add them.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/microchip-mpfs.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index cf2f55e1dcb6..059a671314bf 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -326,6 +326,24 @@ i2c1: i2c@2010b000 {
 			status = "disabled";
 		};
 
+		can0: can@2010c000 {
+			compatible = "microchip,mpfs-can";
+			reg = <0x0 0x2010c000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_CAN0>;
+			interrupt-parent = <&plic>;
+			interrupts = <56>;
+			status = "disabled";
+		};
+
+		can1: can@2010d000 {
+			compatible = "microchip,mpfs-can";
+			reg = <0x0 0x2010d000 0x0 0x1000>;
+			clocks = <&clkcfg CLK_CAN1>;
+			interrupt-parent = <&plic>;
+			interrupts = <57>;
+			status = "disabled";
+		};
+
 		mac0: ethernet@20110000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
