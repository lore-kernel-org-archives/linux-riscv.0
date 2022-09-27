Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A765C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+AtQ0JxbumuPVm4P7dPiFjMEJZtPDjQo0sY1jShGRg=; b=JdSgGs2zCtm1C6
	0FnFFdLWvtimDAnqDr6x3rTwG1Rc3J3/Hmv1b3+4oAMWAnAtH6djhXjiXzXR8/XlyGER3LW2mebcM
	hu8yBlsKsxgePDexvMWUiA5fJU0vHTkhjT6jbeIO3MaHlV/iYfispeQPrJwegefYH2g7nxbMjCmnD
	HRpWyOHF0Yq1LSVQFkiZEJmSnlbe6wWHWdUg0czI7BrnEOOQIKKCgJTfZ9XcxFali3/AyQN4pk5pL
	Yyb3kCvI3s1QAPUCobwzz2Fd3+kvt4p+y9ecjUtdnzeWPyOOCdPHNkaRY0nvIdOQrJ12J66bj/I1y
	x9bYU4ujfk9yj5IVBM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dq-00AAJ4-2S; Tue, 27 Sep 2022 11:20:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dV-00AA1g-Ms
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 11:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664277625; x=1695813625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DtjFB323S4Wx5S1fAIRUAwQUn/ZVmDrcjqP1LgDfbcc=;
  b=DLyJM9l6Ts9zhUYd7iKywbUd2jC535RNe/duka/WX8SA+mk9UsM91KE7
   7Rrj4WfDTgPhhx6yr59XeJPB1GAbPXZEaANBYavbmwzbI4y1md3tNf/ie
   7tURFqJo4tIMgNm1M7UpgGiXVwQ2yFYc1+EzA11CKUus88Euv+bqP1maD
   6DFqEPGdWAYz8Wj/I7xWKsmYlyqAs+fINjpnKZ0shaeQnsaXwSVJqb4Vs
   HE+OOCTCo/VawTJWCJVXLfEbseRtiIZVUzcuFoRLVEoRECZfZ+C6CWBJ3
   IXU8Clmr/s7hXZj0W6B/taO1ODbKR/dNGCioFUVZsNpzG+KBd/hDYJ4Ty
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="179094376"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2022 04:20:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 27 Sep 2022 04:20:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 27 Sep 2022 04:20:17 -0700
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
Subject: [PATCH v6 08/11] riscv: dts: microchip: reduce the fic3 clock rate
Date: Tue, 27 Sep 2022 12:19:20 +0100
Message-ID: <20220927111922.3602838-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927111922.3602838-1-conor.dooley@microchip.com>
References: <20220927111922.3602838-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_042025_850589_AED1ED27 
X-CRM114-Status: UNSURE (   9.42  )
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

For the v2022.09 release of the reference design, the fic3 clock rate
been reduced from 62.5 MHz to 50 MHz as it allows timing to be closed
significantly more quickly by customers who chose to build the
reference design themselves.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 35030ea330ee..b6bfe177ccb2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -29,7 +29,7 @@ i2c2: i2c@40000200 {
 	fabric_clk3: fabric-clk3 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <62500000>;
+		clock-frequency = <50000000>;
 	};
 
 	fabric_clk1: fabric-clk1 {
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
