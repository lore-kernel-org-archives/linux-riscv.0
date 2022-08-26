Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8B2ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMlDA/mndSn8Z34ZXm4eJ+v1pSa88210rDxhakzoAQI=; b=fTYHtTozTipV2q
	wn1td9UYQwayl24JeivZ0jcgruyE5EZ99/BFvSeboOxNaHT+xj7bLf2Jer/sAdolfBv2M0F05J4R3
	uyI3Li9T5aRGe3QjwiGNXLQYm8svzwW9nPI2OumaZRiKdX7GhOCcrslM0X96YjHFbnvxMIu3jdc+q
	722Qxe0HykEpG4YzWBGewiJQDCfiv+K+8XwvsveGx23DDzsUVXmOOLjXD/nWMFo2S4uwAhpxHsFuU
	t+4liqo+HY40ilvjwFr25uFSEXNLD+fkhU+qaknVicMvMja5PLNpBK8hVV83CHS202AYKh3NiPcn3
	Zy95ItTzrwg3FhX11Jdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaKb-006Cu9-9Y; Fri, 26 Aug 2022 14:29:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaKW-006Co4-3s
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 14:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661524143; x=1693060143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rZMihXhOLlKxYs0tCwQAUj7e9S0faqqljRoP4WeBM6o=;
  b=Uc3osrtrPpmBIyJRfd+YiFCj9LJF7t3p/uKItdOsmi1TYXYfDOBoLGG/
   E3g0c/0JjGcnQi0akTPchPhMPGiwq+4zdeLEWUWQlOAhP023J4OQj6p7h
   OQY6HGZaRPWP96XwZRdaZeHIrrYACjxtyaT7f7LR64dpikxve8JrhyW9r
   QCJlxVtjrNp2Vl6ywyc7yq+663km3pISOWDPXAzYAjgZLeZVjJK+0VEqp
   VXa4HXMEksLGDYW0euwgQZjqHfTR2rWdKbkUYNIE9SYZu+eFKb2d89rXD
   r7y76Z1YZ/domnJ2FpwlTjqokJfBSR/i4zGNzHmy13Q29BczH6gdY7CBp
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="188209210"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 07:29:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 07:29:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 26 Aug 2022 07:28:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 7/9] riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
Date: Fri, 26 Aug 2022 15:28:05 +0100
Message-ID: <20220826142806.3658434-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220826142806.3658434-1-conor.dooley@microchip.com>
References: <20220826142806.3658434-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_072904_202598_47034D91 
X-CRM114-Status: UNSURE (   8.79  )
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

When users try to add onto the reference design, they find that the
current addresses that peripherals connected to Fabric InterConnect
(FIC) 3 use are restrictive. For the v2022.09 reference design, the
peripherals have been shifted down, leaving more contiguous address
space for their custom IP/peripherals.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 32d51c4a5b0c..98f04be0dc6b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -6,18 +6,18 @@ / {
 	compatible = "microchip,mpfs-icicle-reference-rtlv2209", "microchip,mpfs-icicle-kit",
 		     "microchip,mpfs";
 
-	core_pwm0: pwm@41000000 {
+	core_pwm0: pwm@40000000 {
 		compatible = "microchip,corepwm-rtl-v4";
-		reg = <0x0 0x41000000 0x0 0xF0>;
+		reg = <0x0 0x40000000 0x0 0xF0>;
 		microchip,sync-update-mask = /bits/ 32 <0>;
 		#pwm-cells = <2>;
 		clocks = <&fabric_clk3>;
 		status = "disabled";
 	};
 
-	i2c2: i2c@44000000 {
+	i2c2: i2c@40000200 {
 		compatible = "microchip,corei2c-rtl-v7";
-		reg = <0x0 0x44000000 0x0 0x1000>;
+		reg = <0x0 0x40000200 0x0 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		clocks = <&fabric_clk3>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
