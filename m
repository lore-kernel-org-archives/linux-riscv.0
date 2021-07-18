Return-Path: <SRS0=1tpi=MK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073B9C636C8
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 11:41:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC40461181
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 11:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC40461181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dx5nnhj73rFBBUC0JhKCtpsOzlbvbCrrbkmjfppsQ4=; b=WjofQwcUIBQF1f
	wSmv3jLMETjt/lD66IoO1Cnyn1oZwZdybEB8KetjQDkWuJeaLbTRQm3wEw5Nxdvl1gkvG25cHgZjs
	B1fUEDPiHv1mshBRxOTpAdbr3HeipvzTpvPaWIvsdZnxBSDe0fqLovQIIKJ5YVygzAv484V4bjMIM
	BSrVCmK/dqJy47A8GOC1vudYvGd8LN8wj4eJlqFG9Wn/WQbDVxQtmNFGye0dqeoepimdc/BYE0At5
	XjohQxWjMS9vxmG6YpAHeT56n6eWS2+r9JYSTb/xSxwVnQFBQiAeTyDElL8D4penaAuv1WKk77PQu
	YpgBRA8rSluKJB2w3zBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m55Ao-007dht-CO; Sun, 18 Jul 2021 11:41:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m55AK-007dXL-Hv; Sun, 18 Jul 2021 11:41:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8B061186;
 Sun, 18 Jul 2021 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626608459;
 bh=isbbNOQYmMDdvoK8/v5zZiC6f8zoovqrif/IUzFrOtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fZ+TnhVk5WQ7OgZ/XAp9/kyEgPAHm6CEvCQE6m/kqfRM4TxMcUi2oB9ONJ/0Ky8Wj
 IBRPCKSr6YfSpRPntymO9wuDgb2bUGi98OFk/2+qn+uEGUP9WvBmcfbDZwEQ6q+45x
 Uj/oDZw6zyykBMSIbQzRcIqGYGQKreSlRp936Dli4042JkKLf0n3bqxU0d+llObG7l
 Wc3LWNneu4HoboVSgLeTN/cOl4SToFKH3rxFiv7u0jiqb2z74famOmexw8xiEF9Dek
 x+6ZfCudCHP2oDDBvM0kEg5/6ySn76HPsHgCPdZtUiOXjNF95kLnmvz1WvFA3tPQrn
 K5D+0x/KQo/ag==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1m55AE-001Dw5-Ay; Sun, 18 Jul 2021 13:40:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andy Gross <agross@kernel.org>, Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <festevam@gmail.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Jonathan Chocron <jonnyc@amazon.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v5 3/5] dt-bindings: PCI: update references to Designware
 schema
Date: Sun, 18 Jul 2021 13:40:50 +0200
Message-Id: <dfff4d94631546c53450d1baeddc694dd26b5c36.1626608375.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626608375.git.mchehab+huawei@kernel.org>
References: <cover.1626608375.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_044100_835411_31D819AE 
X-CRM114-Status: GOOD (  13.65  )
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

Now that its contents were converted to a DT schema, replace
the references for the old file on existing properties.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  4 ++--
 .../devicetree/bindings/pci/axis,artpec6-pcie.txt  |  2 +-
 .../devicetree/bindings/pci/fsl,imx6q-pcie.txt     |  2 +-
 .../bindings/pci/hisilicon-histb-pcie.txt          |  2 +-
 .../devicetree/bindings/pci/kirin-pcie.txt         |  2 +-
 .../devicetree/bindings/pci/layerscape-pci.txt     |  2 +-
 .../bindings/pci/nvidia,tegra194-pcie.txt          |  5 +++--
 .../devicetree/bindings/pci/pci-armada8k.txt       |  2 +-
 Documentation/devicetree/bindings/pci/pcie-al.txt  |  2 +-
 .../devicetree/bindings/pci/qcom,pcie.txt          | 14 +++++++-------
 .../bindings/pci/samsung,exynos-pcie.yaml          |  4 ++--
 .../devicetree/bindings/pci/sifive,fu740-pcie.yaml |  4 ++--
 .../bindings/pci/socionext,uniphier-pcie-ep.yaml   |  4 ++--
 Documentation/devicetree/bindings/pci/ti-pci.txt   |  4 ++--
 .../devicetree/bindings/pci/uniphier-pcie.txt      |  2 +-
 15 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
index b6acbe694ffb..c3a75ac6e59d 100644
--- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
@@ -3,7 +3,7 @@ Amlogic Meson AXG DWC PCIE SoC controller
 Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
 It shares common functions with the PCIe DesignWare core driver and
 inherits common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
 
 Additional properties are described here:
 
@@ -33,7 +33,7 @@ Required properties:
 - phy-names: must contain "pcie"
 
 - device_type:
-	should be "pci". As specified in designware-pcie.txt
+	should be "pci". As specified in snps,dw-pcie.yaml
 
 
 Example configuration:
diff --git a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
index 979dc7b6cfe8..cc6dcdb676b9 100644
--- a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
@@ -1,7 +1,7 @@
 * Axis ARTPEC-6 PCIe interface
 
 This PCIe host controller is based on the Synopsys DesignWare PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,dw-pcie.yaml.
 
 Required properties:
 - compatible: "axis,artpec6-pcie", "snps,dw-pcie" for ARTPEC-6 in RC mode;
diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
index d8971ab99274..5e6eb44c81b5 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
@@ -1,7 +1,7 @@
 * Freescale i.MX6 PCIe interface
 
 This PCIe host controller is based on the Synopsys DesignWare PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,dw-pcie.yaml.
 
 Required properties:
 - compatible:
diff --git a/Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt b/Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt
index 760b4d740616..5f0cf6c2fef3 100644
--- a/Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt
@@ -3,7 +3,7 @@ HiSilicon STB PCIe host bridge DT description
 The HiSilicon STB PCIe host controller is based on the DesignWare PCIe core.
 It shares common functions with the DesignWare PCIe core driver and inherits
 common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
 
 Additional properties are described here:
 
diff --git a/Documentation/devicetree/bindings/pci/kirin-pcie.txt b/Documentation/devicetree/bindings/pci/kirin-pcie.txt
index 6bbe43818ad5..7db30534498f 100644
--- a/Documentation/devicetree/bindings/pci/kirin-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/kirin-pcie.txt
@@ -3,7 +3,7 @@ HiSilicon Kirin SoCs PCIe host DT description
 Kirin PCIe host controller is based on the Synopsys DesignWare PCI core.
 It shares common functions with the PCIe DesignWare core driver and
 inherits common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
 
 Additional properties are described here:
 
diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index 6d898dd4a8e2..f36efa73a470 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -1,7 +1,7 @@
 Freescale Layerscape PCIe controller
 
 This PCIe host controller is based on the Synopsys DesignWare PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,dw-pcie.yaml.
 
 This controller derives its clocks from the Reset Configuration Word (RCW)
 which is used to describe the PLL settings at the time of chip-reset.
diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
index bd43f3c3ece4..6a99d2aa8075 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
@@ -1,7 +1,8 @@
 NVIDIA Tegra PCIe controller (Synopsys DesignWare Core based)
 
 This PCIe controller is based on the Synopsis Designware PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,dw-pcie.yaml and
+snps,dw-pcie-ep.yaml.
 Some of the controller instances are dual mode where in they can work either
 in root port mode or endpoint mode but one at a time.
 
@@ -22,7 +23,7 @@ Required properties:
   property.
 - reg-names: Must include the following entries:
   "appl": Controller's application logic registers
-  "config": As per the definition in designware-pcie.txt
+  "config": As per the definition in snps,dw-pcie.yaml
   "atu_dma": iATU and DMA registers. This is where the iATU (internal Address
              Translation Unit) registers of the PCIe core are made available
              for SW access.
diff --git a/Documentation/devicetree/bindings/pci/pci-armada8k.txt b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
index 7a813d0e6d63..ff25a134befa 100644
--- a/Documentation/devicetree/bindings/pci/pci-armada8k.txt
+++ b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
@@ -1,7 +1,7 @@
 * Marvell Armada 7K/8K PCIe interface
 
 This PCIe host controller is based on the Synopsys DesignWare PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,dw-pcie.yaml.
 
 Required properties:
 - compatible: "marvell,armada8k-pcie"
diff --git a/Documentation/devicetree/bindings/pci/pcie-al.txt b/Documentation/devicetree/bindings/pci/pcie-al.txt
index 557a5089229d..2ad1fe466eab 100644
--- a/Documentation/devicetree/bindings/pci/pcie-al.txt
+++ b/Documentation/devicetree/bindings/pci/pcie-al.txt
@@ -2,7 +2,7 @@
 
 Amazon's Annapurna Labs PCIe Host Controller is based on the Synopsys DesignWare
 PCI core. It inherits common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
 
 Properties of the host controller node that differ from it are:
 
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index 25f4def468bf..3f646875f8c2 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -34,22 +34,22 @@
 - device_type:
 	Usage: required
 	Value type: <string>
-	Definition: Should be "pci". As specified in designware-pcie.txt
+	Definition: Should be "pci". As specified in snps,dw-pcie.yaml
 
 - #address-cells:
 	Usage: required
 	Value type: <u32>
-	Definition: Should be 3. As specified in designware-pcie.txt
+	Definition: Should be 3. As specified in snps,dw-pcie.yaml
 
 - #size-cells:
 	Usage: required
 	Value type: <u32>
-	Definition: Should be 2. As specified in designware-pcie.txt
+	Definition: Should be 2. As specified in snps,dw-pcie.yaml
 
 - ranges:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: As specified in designware-pcie.txt
+	Definition: As specified in snps,dw-pcie.yaml
 
 - interrupts:
 	Usage: required
@@ -64,17 +64,17 @@
 - #interrupt-cells:
 	Usage: required
 	Value type: <u32>
-	Definition: Should be 1. As specified in designware-pcie.txt
+	Definition: Should be 1. As specified in snps,dw-pcie.yaml
 
 - interrupt-map-mask:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: As specified in designware-pcie.txt
+	Definition: As specified in snps,dw-pcie.yaml
 
 - interrupt-map:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: As specified in designware-pcie.txt
+	Definition: As specified in snps,dw-pcie.yaml
 
 - clocks:
 	Usage: required
diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
index 1810bf722350..445eed94b53f 100644
--- a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
@@ -13,10 +13,10 @@ maintainers:
 description: |+
   Exynos5433 SoC PCIe host controller is based on the Synopsys DesignWare
   PCIe IP and thus inherits all the common properties defined in
-  designware-pcie.txt.
+  snps,dw-pcie.yaml.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index b03cbb9b6602..2b9d1d6fc661 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -10,14 +10,14 @@ description: |+
   SiFive FU740 PCIe host controller is based on the Synopsys DesignWare
   PCI core. It shares common features with the PCIe DesignWare core and
   inherits common properties defined in
-  Documentation/devicetree/bindings/pci/designware-pcie.txt.
+  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
 
 maintainers:
   - Paul Walmsley <paul.walmsley@sifive.com>
   - Greentime Hu <greentime.hu@sifive.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
index d6cf8a560ef0..144cbcd60a1c 100644
--- a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
@@ -10,13 +10,13 @@ description: |
   UniPhier PCIe endpoint controller is based on the Synopsys DesignWare
   PCI core. It shares common features with the PCIe DesignWare core and
   inherits common properties defined in
-  Documentation/devicetree/bindings/pci/designware-pcie.txt.
+  Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml.
 
 maintainers:
   - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
 
 allOf:
-  - $ref: "pci-ep.yaml#"
+  - $ref: /schemas/pci/snps,dw-pcie-ep.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/ti-pci.txt b/Documentation/devicetree/bindings/pci/ti-pci.txt
index d5cbfe6b0d89..8147e3e3e29b 100644
--- a/Documentation/devicetree/bindings/pci/ti-pci.txt
+++ b/Documentation/devicetree/bindings/pci/ti-pci.txt
@@ -12,7 +12,7 @@ PCIe DesignWare Controller
 	       number of PHYs as specified in *phys* property.
  - ti,hwmods : Name of the hwmod associated to the pcie, "pcie<X>",
 	       where <X> is the instance number of the pcie from the HW spec.
- - num-lanes as specified in ../designware-pcie.txt
+ - num-lanes as specified in ../snps,dw-pcie.yaml
  - ti,syscon-lane-sel : phandle/offset pair. Phandle to the system control
 			module and the register offset to specify lane
 			selection.
@@ -32,7 +32,7 @@ HOST MODE
    device_type,
    ranges,
    interrupt-map-mask,
-   interrupt-map : as specified in ../designware-pcie.txt
+   interrupt-map : as specified in ../snps,dw-pcie.yaml
  - ti,syscon-unaligned-access: phandle to the syscon DT node. The 1st argument
 			       should contain the register offset within syscon
 			       and the 2nd argument should contain the bit field
diff --git a/Documentation/devicetree/bindings/pci/uniphier-pcie.txt b/Documentation/devicetree/bindings/pci/uniphier-pcie.txt
index c4b7381733a0..359585db049f 100644
--- a/Documentation/devicetree/bindings/pci/uniphier-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/uniphier-pcie.txt
@@ -6,7 +6,7 @@ on Socionext UniPhier SoCs.
 UniPhier PCIe host controller is based on the Synopsys DesignWare PCI core.
 It shares common functions with the PCIe DesignWare core driver and inherits
 common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
 
 Required properties:
 - compatible: Should be "socionext,uniphier-pcie".
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
