Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42497C38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75acsT4z4JUYTuaaJA3jG4H43NHnrzLxXydgsMcWxX0=; b=oHHffuZNUPrNSz
	+/hWTh94Lmovp30yRg1500bri/Syy7sLDoOFNr3Yrqa4zSEcKpfhWUd7PqoHSPsx/2DpkyEXSBhOv
	4Dtvx0LEhnGsxkb2oDIg/p7DlnkFl8ze9lA99wQeAukBIt0lHP9SOzI9DeojFlMGcYMjhKONXA8Si
	T7ogoeYvEYmGQj3SGbOr+RAXiS/0RHxQn00xwGrx2QK/m/jeHB1DIGx+2Sf8JfyflmZOSoAbI4R+a
	5UjfGmw8KTl9BlkUBIBQgB+vDwW1lV5LGEA/lGVVHSjvn/9VE39uxdr/M0dvLxNuNIe9qo0nM5RFg
	lvyN5HVENF5K+ug5JrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7ZE-005VtG-1W; Fri, 02 Sep 2022 14:22:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7ZB-005Vr3-7K
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 14:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662128561; x=1693664561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A0wOjkGsQ3icV4sYzW6juzBiZor0CRzjl5/cGd/VbdU=;
  b=BThAM74/oZooTVHZhT6iqXBluB9Jgb1D/LVVdiUeXxgFdpTJFvmxQPNz
   fkItxkzH3KKc34rXjjH+udTD0iOURbs1PGOp3vQTa6Zlqo28xAyPAweP0
   wlid1Ey9XbhlaHM/SZUefnNDRP6MbiKMiq1RKwBoY+J9eNY4zlPlEIVL5
   Qmt6j/x7G5KqTvRt47rz3L3xFE4mSNrAgTuETsZqZrphd0y2RPk9y4+en
   111nPDzbE5TZRQhZ1pbzH2eF7dLA6UNZeVb2bsZUm98rY0fHVyKadlJi2
   D/sYqqisFh3is+jt8UDGm6QwnC1bBx+q63SoGwbjnzwtvk0s11n/B1y6i
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="175388520"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 07:22:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 07:22:31 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 07:22:28 -0700
From: <daire.mcnamara@microchip.com>
To: <aou@eecs.berkeley.edu>, <bhelgaas@google.com>,
	<conor.dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <kw@linux.com>,
	<linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<lpieralisi@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<robh+dt@kernel.org>, <robh@kernel.org>
CC: <cyril.jean@microchip.com>, <padmarao.begari@microchip.com>,
	<heinrich.schuchardt@canonical.com>, <david.abdurachmanov@gmail.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>
Subject: [PATCH v1 2/4] riscv: dts: microchip: add fabric address translation properties
Date: Fri, 2 Sep 2022 15:22:00 +0100
Message-ID: <20220902142202.2437658-3-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_072241_355758_F6532ADD 
X-CRM114-Status: UNSURE (   9.01  )
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

From: Daire McNamara <daire.mcnamara@microchip.com>

On PolarFire SoC both in- & out-bound address translations occur in two
stages. The specific translations are tightly coupled to the FPGA
designs and supplement the {dma-,}ranges properties. The first stage of
the translation is done by the FPGA fabric & the second by the root
port.
Add outbound address translation information so that the translation
tables in the root port's bridge layer can be configured to account for
the translation done by the FPGA fabric on Icicle Kit reference design.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 98f04be0dc6b..6839650e7d1b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -57,7 +57,11 @@ pcie: pcie@3000000000 {
 		interrupt-map-mask = <0 0 0 7>;
 		clocks = <&fabric_clk1>, <&fabric_clk3>;
 		clock-names = "fic1", "fic3";
-		ranges = <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
+		ranges = <0x0000000 0x0 0x0000000 0x30 0x0000000 0x0 0x8000000>,
+			 <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
+		microchip,outbound-fabric-translation-ranges =
+			 <0x0000000 0x0 0x0000000 0x30 0x0000000 0x0 0x8000000>,
+			 <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
 		dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000 0x1 0x00000000>;
 		msi-parent = <&pcie>;
 		msi-controller;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
