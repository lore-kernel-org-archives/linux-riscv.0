Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB3DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klRmbnn9SsZNZYFsxxAvxvujGvJvzbDFPed2L7WH4cI=; b=pX/2tInFEJKUmv
	ntbmhnRP/r0Gkmra4FdG8X8GabotJoDolPFxFRHVFLDw1BgPeX8MmNCLrwk86C7JFOKDE9+SvGWNg
	jjEQkN2PfBkjjjemDUdypsL5DhfUSDmQKU2tJdox3wpSyK3JcfiO1fc1n35y53pb0g0gi/hx0wo4s
	SsWqfWD5Hu88rIrebicQrY79SvzNTd+J6sbRAqGtSXwvxjF6Hz6/2dIgsbNvRBpaEzOUr7DKkQG0U
	erlZNpCAuvGSAz27myH/Gt+epFtP1kECYlzKdLFpdIXMGY/aBJeuX39cQK6KlOH1v5s/pSVUf453K
	kb4eWffNvHPWfw/vRz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muJui-005XAu-VS; Mon, 06 Dec 2021 19:44:41 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muJuX-005X6C-Az; Mon, 06 Dec 2021 19:44:31 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso15005030otj.11; 
 Mon, 06 Dec 2021 11:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOQ79x7j60T/Aoxgzg7Q/WKtgZBCeGXzkMDE3RqKJOo=;
 b=YPLaayVpb+0Sj2ah0qkuGuHqoSDJBcvCNi92kQwSDX3aYiDh9qlx752iiIDUSn9v9O
 yHFpRyo9ySa5Tc9g84+MBXscUXsC9Ivon53Oh5ewSbJj2tEryKWZgXPm7dvBkOmDqxLf
 X6qUA5Kz8M6LXCnsO08U1BZcxrpv+/u/n5MI5v4cor0BFg4kBAaNMtE/W76ZW6k4SjgJ
 S4HqKot4PlSpPSt8ouimEkwGXr2Qqa+NEUVYbTwQAYXo/x1vUFl0MsVdxEGnn/FbQO+j
 SkXF3EXGgB8klTkdMRmYLTGumDidzo5nOTDn002qB68oIOZCIJ+fZPU9AyaLE4/PHCS1
 tRrw==
X-Gm-Message-State: AOAM532rHgK6Axn9qRqWPzyanKtGsPBExPlTQOD7dBkBE63iwwv+LGP4
 aVo2/4IXikmF1joztJoNwg==
X-Google-Smtp-Source: ABdhPJz52nzCgw/hwbjYAAgjDYBEG+KdXK5nF3jLcZY0sCOmKJpTkCzBrNtc47G1zyZLA2GWcVNmwg==
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr30919009otl.329.1638819867943; 
 Mon, 06 Dec 2021 11:44:27 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id o6sm2291382oou.41.2021.12.06.11.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:44:27 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jingoo Han <jingoohan1@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: PCI: designware: Fix 'unevaluatedProperties'
 warnings
Date: Mon,  6 Dec 2021 13:44:25 -0600
Message-Id: <20211206194426.2470080-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_114429_423412_D7514D9D 
X-CRM114-Status: GOOD (  11.02  )
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

With 'unevaluatedProperties' support implemented, there's a number of
warnings from the Designware PCIe based bindings:

Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.example.dt.yaml: pcie@1ffc000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'device_type', 'bus-range', 'ranges', '#interrupt-cells', 'interrupt-map-mask', 'interrupt-map' were unexpected)
Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.example.dt.yaml: pcie@1ffc000: Unevaluated properties are not allowed ('clock-names' was unexpected)
Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f4000000: Unevaluated properties are not allowed ('bus-range', '#address-cells', '#size-cells', 'device_type', 'ranges', 'num-lanes', '#interrupt-cells', 'interrupts', 'interrupt-names', 'interrupt-map-mask', 'interrupt-map', 'clocks', 'clock-names' were unexpected)
Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f4000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f5000000: Unevaluated properties are not allowed ('bus-range', '#address-cells', '#size-cells', 'device_type', 'phys', 'ranges', 'num-lanes', '#interrupt-cells', 'interrupts', 'interrupt-names', 'interrupt-map-mask', 'interrupt-map', 'reset-gpios', 'pcie@0,0' were unexpected)
Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f5000000: Unevaluated properties are not allowed ('phys', 'hisilicon,clken-gpios' were unexpected)
Documentation/devicetree/bindings/pci/intel-gw-pcie.example.dt.yaml: pcie@d0e00000: Unevaluated properties are not allowed ('device_type', '#address-cells', '#size-cells', 'linux,pci-domain', 'bus-range', '#interrupt-cells', 'interrupt-map-mask', 'interrupt-map' were unexpected)
Documentation/devicetree/bindings/pci/intel-gw-pcie.example.dt.yaml: pcie@d0e00000: Unevaluated properties are not allowed ('resets', 'phys', 'phy-names', 'reset-assert-ms' were unexpected)
Documentation/devicetree/bindings/pci/rockchip-dw-pcie.example.dt.yaml: pcie@fe280000: Unevaluated properties are not allowed ('clock-names', 'msi-map', 'phys', 'phy-names', 'power-domains', 'resets', 'reset-names' were unexpected)
Documentation/devicetree/bindings/pci/samsung,exynos-pcie.example.dt.yaml: pcie@15700000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', '#interrupt-cells', 'device_type', 'bus-range', 'ranges', 'interrupt-map-mask', 'interrupt-map' were unexpected)
Documentation/devicetree/bindings/pci/samsung,exynos-pcie.example.dt.yaml: pcie@15700000: Unevaluated properties are not allowed ('clock-names', 'phys', 'vdd10-supply', 'vdd18-supply' were unexpected)
Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dt.yaml: pcie@e00000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', '#interrupt-cells', 'device_type', 'dma-coherent', 'bus-range', 'ranges', 'interrupts', 'interrupt-parent', 'interrupt-map-mask', 'interrupt-map', 'clock-names', 'clocks' were unexpected)
Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dt.yaml: pcie@e00000000: Unevaluated properties are not allowed ('dma-coherent', 'clock-names', 'resets', 'pwren-gpios' were unexpected)
Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.example.dt.yaml: pcie-ep@66000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'reset-names', 'resets', 'phy-names', 'phys' were unexpected)
Documentation/devicetree/bindings/pci/toshiba,visconti-pcie.example.dt.yaml: pcie@28400000: Unevaluated properties are not allowed ('clock-names' was unexpected)
Documentation/devicetree/bindings/pci/toshiba,visconti-pcie.example.dt.yaml: pcie@28400000: Unevaluated properties are not allowed ('device_type', 'bus-range', 'num-viewport', '#address-cells', '#size-cells', '#interrupt-cells', 'ranges', 'interrupt-names', 'interrupt-map-mask', 'interrupt-map', 'max-link-speed' were unexpected)

The main problem is that snps,dw-pcie.yaml and snps,dw-pcie-ep.yaml
shouldn't set 'unevaluatedProperties: false'. Otherwise, bindings that
reference them cannot add additional properties. With that addressed,
there's a handful of other undocumented properties to add.

Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Greentime Hu <greentime.hu@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pci/hisilicon,kirin-pcie.yaml          | 13 +++++++++++++
 .../devicetree/bindings/pci/sifive,fu740-pcie.yaml  |  4 ++--
 .../devicetree/bindings/pci/snps,dw-pcie-ep.yaml    |  2 +-
 .../devicetree/bindings/pci/snps,dw-pcie.yaml       |  2 +-
 .../bindings/pci/socionext,uniphier-pcie-ep.yaml    |  2 +-
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml b/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
index cbee87802559..c9f04999c9cf 100644
--- a/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
@@ -37,6 +37,19 @@ properties:
     minItems: 3
     maxItems: 4
 
+  clocks: true
+
+  clock-names:
+    items:
+      - const: pcie_phy_ref
+      - const: pcie_aux
+      - const: pcie_apb_phy
+      - const: pcie_apb_sys
+      - const: pcie_aclk
+
+  phys:
+    maxItems: 1
+
   hisilicon,clken-gpios:
     description: |
       Clock input enablement GPIOs from PCI devices like Ethernet, M.2 and
diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 2b9d1d6fc661..9215c6ee24a0 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -32,6 +32,8 @@ properties:
       - const: config
       - const: mgmt
 
+  dma-coherent: true
+
   num-lanes:
     const: 8
 
@@ -64,7 +66,6 @@ required:
   - interrupt-parent
   - interrupt-map-mask
   - interrupt-map
-  - clock-names
   - clocks
   - resets
   - pwren-gpios
@@ -104,7 +105,6 @@ examples:
                             <0x0 0x0 0x0 0x2 &plic0 58>,
                             <0x0 0x0 0x0 0x3 &plic0 59>,
                             <0x0 0x0 0x0 0x4 &plic0 60>;
-            clock-names = "pcie_aux";
             clocks = <&prci PRCI_CLK_PCIE_AUX>;
             resets = <&prci 4>;
             pwren-gpios = <&gpio 5 0>;
diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
index b5935b1b153f..b3b544eaf5aa 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
@@ -73,7 +73,7 @@ required:
   - reg-names
   - compatible
 
-unevaluatedProperties: false
+additionalProperties: true
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index 9ed0dfba7f89..a5345c494744 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -73,7 +73,7 @@ properties:
       does not specify it, the driver autodetects it.
     deprecated: true
 
-unevaluatedProperties: false
+additionalProperties: true
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
index 144cbcd60a1c..179ab0858482 100644
--- a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
@@ -79,7 +79,7 @@ required:
   - resets
   - reset-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
