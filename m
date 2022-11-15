Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD68C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 15:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P8BpPjjwn5/kcjnVykyvw57jRU9ghxyEzYpyBdJn5ig=; b=i4tN3yMBizHFw7
	yPqnPmEV2lz+TlIfkXpp5Zma6Eg3enNo50IQutKHe8fEZvA9d7novguwy5gn/Owun1JQwgxjSxHB+
	XtqFAY2qQPy2yNcS8McSOd2PgAPdSBdc4VSJ3O/0DfA06Q7yn9sz6tPjqDC1zlAYgL3qcwx4mjfmr
	ghVZuOlOOq6NSUFeGTI+L7eFN0E4eY5LL0Q6IbDnzGzqBO4K0GIfBywgmY3INakpZGf0p450Yb7YG
	KguixQd4PQ/W55+AzSp4RdBhHLgf43C8AKwhBBxjrjf88bytU5fR9qbh49UmaqIMESZ15xouXqzoQ
	Pp3sx9BtQYdjIfxEOUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouxpT-00CHMo-WF; Tue, 15 Nov 2022 15:26:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouxpP-00CHK8-Hu
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 15:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668525983; x=1700061983;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=97PFrgnk+DB1D9eGelLXCgNw+jakJpsENZbaBuQwyoc=;
  b=rnNlB2HMLT8HaOk5RKeM3KAlzMhwOFKnz+BdffA4WwKJZ+ndhTIyMV5H
   1qffF4voo9Kih+vMehLc6SmPy2ShGopfno7qC/BOLmcGpMILhij/gA8mn
   wV1UuXBx53bio/URcqOa+/v92e7+7Dfhjk0TcpMYy9ELTQRICUR9nn91Z
   ViN3D39zzIMtPGTlQI0kwkvyubifP+fhyZjO/GbV4Y1NojVmhCDri9aLt
   +e2Ajpyir8P1c2zU2UcXh7sld3zdcCd4CpavPq28GguB3usQxziLp7F2U
   MfuHn2nYy2Y2SHS9ShjF7P8iywfrZG5jOfWJYydwrNVAJ9lk+PTgjK1V6
   A==;
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="187073176"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Nov 2022 08:26:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 15 Nov 2022 08:26:10 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 15 Nov 2022 08:26:09 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] riscv: dts: microchip: remove pcie node from the sev kit
Date: Tue, 15 Nov 2022 15:25:46 +0000
Message-ID: <20221115152546.1425309-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_072623_700640_39F1DB1B 
X-CRM114-Status: UNSURE (   7.78  )
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

The SEV kit reference design does not hook up the PCIe root port to the
core complex including it is misleading.
The entry is a re-use mistake - I was not aware of this when I moved
the PCIe node out of mpfs.dtsi so that individual bistreams could
connect it to different fics etc.

Fixes: 978a17d1a688 ("riscv: dts: microchip: add sevkit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/mpfs-sev-kit-fabric.dtsi    | 29 -------------------
 1 file changed, 29 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
index 8545baf4d129..39a77df489ab 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
@@ -13,33 +13,4 @@ fabric_clk1: fabric-clk1 {
 		#clock-cells = <0>;
 		clock-frequency = <125000000>;
 	};
-
-	pcie: pcie@2000000000 {
-		compatible = "microchip,pcie-host-1.0";
-		#address-cells = <0x3>;
-		#interrupt-cells = <0x1>;
-		#size-cells = <0x2>;
-		device_type = "pci";
-		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-		reg-names = "cfg", "apb";
-		bus-range = <0x0 0x7f>;
-		interrupt-parent = <&plic>;
-		interrupts = <119>;
-		interrupt-map = <0 0 0 1 &pcie_intc 0>,
-				<0 0 0 2 &pcie_intc 1>,
-				<0 0 0 3 &pcie_intc 2>,
-				<0 0 0 4 &pcie_intc 3>;
-		interrupt-map-mask = <0 0 0 7>;
-		clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
-		clock-names = "fic0", "fic1", "fic3";
-		ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
-		msi-parent = <&pcie>;
-		msi-controller;
-		status = "disabled";
-		pcie_intc: interrupt-controller {
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-			interrupt-controller;
-		};
-	};
 };
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
