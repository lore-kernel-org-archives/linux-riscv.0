Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0080FECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 13:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMlDA/mndSn8Z34ZXm4eJ+v1pSa88210rDxhakzoAQI=; b=AdpRRwWF1FqHTW
	tiTiQC6Mqqk8rflInhIDcGRQ1gAnwIWvTQe5KTKB2J5yIsoztOe8mqvj+FfXcT76T/KCXPU6biQLu
	2SYWMJS9cmfDnH6SZF/k0DRQMsGhYTB16vwp1RubCONe3BNP3+HYDzsVMGMG9MA4V78lKCt4uJLgT
	h4NrGzMqFxUiBmUolQvZx2N2KkbbZZ3mylVqnqRee3OPkK/DjPUUNsYXC3dXvY0eMcbFsZxTm+P02
	yExE+LJuG0S5mWa3KlEly05h1nul89Erp++FYH56hrSdAyGin22OIn2JmU/k7z8ouCy0BGBIty1Qw
	dNb7Cd9Fw/KN1Ocbj2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkOw-00C7zc-86; Thu, 01 Sep 2022 13:38:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkLg-00C5wN-Se
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 13:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662039313; x=1693575313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rZMihXhOLlKxYs0tCwQAUj7e9S0faqqljRoP4WeBM6o=;
  b=wRIwjWE2tW7aDgSqDbrfMP0MTs6+RTetCvZTZjY0scPbWKn9/Jxu/7Kn
   64DWeUdmT1hLeea0eDqwAs4K3x7dvh7A4/NHS4Mpn5ON+9y6OkslV/Cya
   WwwYV78c9p8IUCs+NctWF4V2nJ6W5XEmtwEpQUZ/OdpZ2FhW1pYnVrYuU
   uoA8pRIvRpnFdm6MndK5GIcbRRwhQbIG/8sFLQiG0fUeRdBNxeLhXtxQz
   QtXFNPH+nJ1MzGvx8+9DOZ0mSFspiBKus6eOzrNYuhMhOHmQ76zpx9e2+
   32Ioj1gWRqBNoXltEBbhlgjI9HdoVYthrkZ7HxfKE24zEj/EO+PeP10AD
   w==;
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="178641861"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Sep 2022 06:35:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Sep 2022 06:35:07 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Sep 2022 06:35:04 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 7/9] riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
Date: Thu, 1 Sep 2022 14:34:02 +0100
Message-ID: <20220901133403.3392291-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901133403.3392291-1-conor.dooley@microchip.com>
References: <20220901133403.3392291-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_063512_980578_55D21BB4 
X-CRM114-Status: UNSURE (   9.35  )
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
