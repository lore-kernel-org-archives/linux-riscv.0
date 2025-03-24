Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51D0C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jGyOoswvMv6R7Q+1jmBJloHrjDuaR/j8h3dyPIG9mc=; b=EVx9+9b0Wy0FDd
	R70lMzZLlS+JvH2U9uIZ4kda76XibZRroSuoi2vN5Tvr7AVj5q8QSdo9XVrsa1vXIJTeb6FRj+VFE
	Wjl97+X2PNVw9TRqD/C+MvvZm9DgX/U5HWkFOXmaO+RPx1HsXk8tkkSBxrYnBewmrf8vJmemjsGXF
	EgvjpBF2k2Ew4agp9jBRQC0CCPCHKDwFGC60VbaDEHVOks4W+JZt8rTsHIuworMtHlIYVewx8dyww
	kkYshlI2uBgFkltANq41w6kA2Yk/HYl0gnkQJge07ENh80rfxQuo28hY/nu+vLYoS3q7VwAmusgK8
	zSL7ArbAR69hUeeCamXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhLy-000000038I3-1emR;
	Mon, 24 Mar 2025 12:56:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhHk-000000035tE-1WPe
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 12:52:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43935d1321aso5469465e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820727; x=1743425527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1A1Q+2wy4k15GAqSgjm67tMHvqg/xX+3SaoiedBFQQ=;
        b=W/54OczHpK2Kn7xKHiw3HJ7JaUZ/gnWO1h5a5pHFJmpz8Uq9nmcHKfkXBg7dRsKKQD
         36Nlptb2QyrMKYG3q7/0PwTIxvcOgjPwSeyfYJlA5OSFORxrDw9Rn3gNdmeanmYCn8+l
         gu3107HPUiDng8WGCE0HucFUgiab/YZp3z2gbD2PUWP5XJ5r66GKl9d9ngubbEf8S1/E
         xqyHNyHRcnXt0rMVvrOO3xHlp4atFVxBhPh1fIeXTBDlPbuhn3KkWKyVNBAl30fl2Ybv
         qjY5ghNvi9tu66NJLxvUZBDfgnGA3pXNq0F90Z84/g8dGUkeNSYR7oYMSi6pF68m75bG
         hDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820727; x=1743425527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1A1Q+2wy4k15GAqSgjm67tMHvqg/xX+3SaoiedBFQQ=;
        b=iMWatzxxRk0bctrFNZkwT3REJVfG6rAW974ik7cjkePWxyWlwD1Oca7ZKJ3fuGxfhs
         YMtJkfvpq0XZGFmmZFF/g7q83JzVnbfh7SUa77UlYBw3FxxO/+ANMUqet/kxHazETWCI
         rucuOwp0Rvkg3nuMMb8O8LRf5rlHigjbX9HMv+Dwcir0E/OcXL/1TWN9fT9pjYHc9RwX
         ogf9z9Md3+iGarwBkYDeMW1XNSS8E+WpIwh/NMc3UtEQeLD+V7ZFfVG769GvRNjl8o3h
         JDkAB5PdNSLS2NqUI8+WTVhD4WV2zURwQdj6I3uEzFG2o3Mh+9Y3mKI9HZL7Pkp10imk
         XS5g==
X-Forwarded-Encrypted: i=1; AJvYcCW8Rn8h9eGmIQJVtEGsifuAvP7Az2MPZq+mM+RFlSgF95GjY3XwjOdF5bsS4CpMgNsVWfX7X7nY0YWOUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBHsGbLeBnN8rGiwQmu8cg/zfkR+0d9gawKOketykk9SnXB3UY
	RBlMjuGHlCtwdHAkwSeYze+9PQEER4MwscXyvrXRUyxZ+wnmcI8G1x9Txaej8f8=
X-Gm-Gg: ASbGnct13e91TtpE08iUlJrNRHFzJYF02p3Nz8w472YSz+++C7nzA3dzx39BT3OV/BS
	piSlq1GGEESKMIAgqRtUt5GY3CxpJFes72+zmhg2UBA1TWgPxyI2oeCax5SMl7GT235u+Jh2+R/
	EVcx5a2k6umsd05r9R4uGk7j2MpFKj0+fIOrgjwoFCF867FKQgctHqOPIxZiy+kBv/TIK4AbS5d
	HJh9qldOlChdMeXbNmTUoHtHfYKx7Zh4rhCbu0Yu+fI8zmnKdjHkgYpLAbErLP8SJ8qTZzLOaT4
	I5253iToRov+Ab03zG7PXOq2mf+CL1yPVCmvMwnvmSeXUsyMqaaZyOpC1w==
X-Google-Smtp-Source: AGHT+IGp6OoK+LL772bza4xOXI8JB/t2slrk7Xmti+PTEuocNjBZEmHgZtjGi4JTILsctkK+qOrR9Q==
X-Received: by 2002:a05:600c:b8b:b0:439:a1ce:5669 with SMTP id 5b1f17b1804b1-43d50a521f6mr48781635e9.5.1742820726497;
        Mon, 24 Mar 2025 05:52:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd2704bsm118704565e9.18.2025.03.24.05.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:52:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: PCI: Correct indentation and style in DTS example
Date: Mon, 24 Mar 2025 13:52:01 +0100
Message-ID: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055208_410680_0926A83B 
X-CRM114-Status: GOOD (  11.55  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pci/brcm,stb-pcie.yaml           |  81 +++++++------
 .../bindings/pci/cdns,cdns-pcie-ep.yaml       |  16 +--
 .../bindings/pci/intel,keembay-pcie-ep.yaml   |  26 ++--
 .../bindings/pci/intel,keembay-pcie.yaml      |  38 +++---
 .../bindings/pci/microchip,pcie-host.yaml     |  54 ++++-----
 .../devicetree/bindings/pci/rcar-pci-ep.yaml  |  34 +++---
 .../bindings/pci/rcar-pci-host.yaml           |  46 +++----
 .../bindings/pci/xilinx-versal-cpm.yaml       | 112 +++++++++---------
 8 files changed, 202 insertions(+), 205 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 29f0e1eb5096..c4f9674e8695 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -186,49 +186,48 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     scb {
-            #address-cells = <2>;
-            #size-cells = <1>;
-            pcie0: pcie@7d500000 {
-                    compatible = "brcm,bcm2711-pcie";
-                    reg = <0x0 0x7d500000 0x9310>;
-                    device_type = "pci";
-                    #address-cells = <3>;
-                    #size-cells = <2>;
-                    #interrupt-cells = <1>;
-                    interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-                                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
-                    interrupt-names = "pcie", "msi";
-                    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
-                    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH
-                                     0 0 0 2 &gicv2 GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH
-                                     0 0 0 3 &gicv2 GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH
-                                     0 0 0 4 &gicv2 GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <2>;
+        #size-cells = <1>;
+        pcie0: pcie@7d500000 {
+            compatible = "brcm,bcm2711-pcie";
+            reg = <0x0 0x7d500000 0x9310>;
+            device_type = "pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            #interrupt-cells = <1>;
+            interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pcie", "msi";
+            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+            interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH
+                             0 0 0 2 &gicv2 GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH
+                             0 0 0 3 &gicv2 GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH
+                             0 0 0 4 &gicv2 GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 
-                    msi-parent = <&pcie0>;
-                    msi-controller;
-                    ranges = <0x02000000 0x0 0xf8000000 0x6 0x00000000 0x0 0x04000000>;
-                    dma-ranges = <0x42000000 0x1 0x00000000 0x0 0x40000000 0x0 0x80000000>,
-                                 <0x42000000 0x1 0x80000000 0x3 0x00000000 0x0 0x80000000>;
-                    brcm,enable-ssc;
-                    brcm,scb-sizes =  <0x0000000080000000 0x0000000080000000>;
+            msi-parent = <&pcie0>;
+            msi-controller;
+            ranges = <0x02000000 0x0 0xf8000000 0x6 0x00000000 0x0 0x04000000>;
+            dma-ranges = <0x42000000 0x1 0x00000000 0x0 0x40000000 0x0 0x80000000>,
+                         <0x42000000 0x1 0x80000000 0x3 0x00000000 0x0 0x80000000>;
+            brcm,enable-ssc;
+            brcm,scb-sizes =  <0x0000000080000000 0x0000000080000000>;
 
-                    /* PCIe bridge, Root Port */
-                    pci@0,0 {
-                            #address-cells = <3>;
-                            #size-cells = <2>;
-                            reg = <0x0 0x0 0x0 0x0 0x0>;
-                            compatible = "pciclass,0604";
-                            device_type = "pci";
-                            vpcie3v3-supply = <&vreg7>;
-                            ranges;
+            /* PCIe bridge, Root Port */
+            pci@0,0 {
+                #address-cells = <3>;
+                #size-cells = <2>;
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                compatible = "pciclass,0604";
+                device_type = "pci";
+                vpcie3v3-supply = <&vreg7>;
+                ranges;
 
-                            /* PCIe endpoint */
-                            pci-ep@0,0 {
-                                    assigned-addresses =
-                                        <0x82010000 0x0 0xf8000000 0x6 0x00000000 0x0 0x2000>;
-                                    reg = <0x0 0x0 0x0 0x0 0x0>;
-                                    compatible = "pci14e4,1688";
-                            };
-                    };
+                /* PCIe endpoint */
+                pci-ep@0,0 {
+                    assigned-addresses = <0x82010000 0x0 0xf8000000 0x6 0x00000000 0x0 0x2000>;
+                    reg = <0x0 0x0 0x0 0x0 0x0>;
+                    compatible = "pci14e4,1688";
+                };
             };
+        };
     };
diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
index 98651ab22103..8735293962ee 100644
--- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
@@ -37,14 +37,14 @@ examples:
         #size-cells = <2>;
 
         pcie-ep@fc000000 {
-                compatible = "cdns,cdns-pcie-ep";
-                reg = <0x0 0xfc000000 0x0 0x01000000>,
-                      <0x0 0x80000000 0x0 0x40000000>;
-                reg-names = "reg", "mem";
-                cdns,max-outbound-regions = <16>;
-                max-functions = /bits/ 8 <8>;
-                phys = <&pcie_phy0>;
-                phy-names = "pcie-phy";
+            compatible = "cdns,cdns-pcie-ep";
+            reg = <0x0 0xfc000000 0x0 0x01000000>,
+                  <0x0 0x80000000 0x0 0x40000000>;
+            reg-names = "reg", "mem";
+            cdns,max-outbound-regions = <16>;
+            max-functions = /bits/ 8 <8>;
+            phys = <&pcie_phy0>;
+            phy-names = "pcie-phy";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
index 730e63fd7669..b19f61ae72fb 100644
--- a/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
@@ -53,17 +53,17 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     pcie-ep@37000000 {
-          compatible = "intel,keembay-pcie-ep";
-          reg = <0x37000000 0x00001000>,
-                <0x37100000 0x00001000>,
-                <0x37300000 0x00001000>,
-                <0x36000000 0x01000000>,
-                <0x37800000 0x00000200>;
-          reg-names = "dbi", "dbi2", "atu", "addr_space", "apb";
-          interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-                       <GIC_SPI 108 IRQ_TYPE_EDGE_RISING>,
-                       <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
-                       <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
-          interrupt-names = "pcie", "pcie_ev", "pcie_err", "pcie_mem_access";
-          num-lanes = <2>;
+        compatible = "intel,keembay-pcie-ep";
+        reg = <0x37000000 0x00001000>,
+              <0x37100000 0x00001000>,
+              <0x37300000 0x00001000>,
+              <0x36000000 0x01000000>,
+              <0x37800000 0x00000200>;
+        reg-names = "dbi", "dbi2", "atu", "addr_space", "apb";
+        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 108 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "pcie", "pcie_ev", "pcie_err", "pcie_mem_access";
+        num-lanes = <2>;
     };
diff --git a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
index 1fd557504b10..dd71e3d6bf94 100644
--- a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
@@ -75,23 +75,23 @@ examples:
     #define KEEM_BAY_A53_PCIE
     #define KEEM_BAY_A53_AUX_PCIE
     pcie@37000000 {
-          compatible = "intel,keembay-pcie";
-          reg = <0x37000000 0x00001000>,
-                <0x37300000 0x00001000>,
-                <0x36e00000 0x00200000>,
-                <0x37800000 0x00000200>;
-          reg-names = "dbi", "atu", "config", "apb";
-          #address-cells = <3>;
-          #size-cells = <2>;
-          device_type = "pci";
-          ranges = <0x02000000 0 0x36000000 0x36000000 0 0x00e00000>;
-          interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-                       <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
-                       <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
-          interrupt-names = "pcie", "pcie_ev", "pcie_err";
-          clocks = <&scmi_clk KEEM_BAY_A53_PCIE>,
-                   <&scmi_clk KEEM_BAY_A53_AUX_PCIE>;
-          clock-names = "master", "aux";
-          reset-gpios = <&pca2 9 GPIO_ACTIVE_LOW>;
-          num-lanes = <2>;
+        compatible = "intel,keembay-pcie";
+        reg = <0x37000000 0x00001000>,
+              <0x37300000 0x00001000>,
+              <0x36e00000 0x00200000>,
+              <0x37800000 0x00000200>;
+        reg-names = "dbi", "atu", "config", "apb";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges = <0x02000000 0 0x36000000 0x36000000 0 0x00e00000>;
+        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "pcie", "pcie_ev", "pcie_err";
+        clocks = <&scmi_clk KEEM_BAY_A53_PCIE>,
+                 <&scmi_clk KEEM_BAY_A53_AUX_PCIE>;
+        clock-names = "master", "aux";
+        reset-gpios = <&pca2 9 GPIO_ACTIVE_LOW>;
+        num-lanes = <2>;
     };
diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 103574d18dbc..1aadfdee868f 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -65,33 +65,33 @@ unevaluatedProperties: false
 examples:
   - |
     soc {
-            #address-cells = <2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pcie0: pcie@2030000000 {
+            compatible = "microchip,pcie-host-1.0";
+            reg = <0x0 0x70000000 0x0 0x08000000>,
+                  <0x0 0x43008000 0x0 0x00002000>,
+                  <0x0 0x4300a000 0x0 0x00002000>;
+            reg-names = "cfg", "bridge", "ctrl";
+            device_type = "pci";
+            #address-cells = <3>;
             #size-cells = <2>;
-            pcie0: pcie@2030000000 {
-                    compatible = "microchip,pcie-host-1.0";
-                    reg = <0x0 0x70000000 0x0 0x08000000>,
-                          <0x0 0x43008000 0x0 0x00002000>,
-                          <0x0 0x4300a000 0x0 0x00002000>;
-                    reg-names = "cfg", "bridge", "ctrl";
-                    device_type = "pci";
-                    #address-cells = <3>;
-                    #size-cells = <2>;
-                    #interrupt-cells = <1>;
-                    interrupts = <119>;
-                    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
-                    interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-                                    <0 0 0 2 &pcie_intc0 1>,
-                                    <0 0 0 3 &pcie_intc0 2>,
-                                    <0 0 0 4 &pcie_intc0 3>;
-                    interrupt-parent = <&plic0>;
-                    msi-parent = <&pcie0>;
-                    msi-controller;
-                    bus-range = <0x00 0x7f>;
-                    ranges = <0x03000000 0x0 0x78000000 0x0 0x78000000 0x0 0x04000000>;
-                    pcie_intc0: interrupt-controller {
-                        #address-cells = <0>;
-                        #interrupt-cells = <1>;
-                        interrupt-controller;
-                    };
+            #interrupt-cells = <1>;
+            interrupts = <119>;
+            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+            interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+                            <0 0 0 2 &pcie_intc0 1>,
+                            <0 0 0 3 &pcie_intc0 2>,
+                            <0 0 0 4 &pcie_intc0 3>;
+            interrupt-parent = <&plic0>;
+            msi-parent = <&pcie0>;
+            msi-controller;
+            bus-range = <0x00 0x7f>;
+            ranges = <0x03000000 0x0 0x78000000 0x0 0x78000000 0x0 0x04000000>;
+            pcie_intc0: interrupt-controller {
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+                interrupt-controller;
             };
+        };
     };
diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml b/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
index 32a3b7665ff5..6b91581c30ae 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
@@ -73,21 +73,21 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a774c0-sysc.h>
 
-     pcie0_ep: pcie-ep@fe000000 {
-            compatible = "renesas,r8a774c0-pcie-ep",
-                         "renesas,rcar-gen3-pcie-ep";
-            reg = <0xfe000000 0x80000>,
-                  <0xfe100000 0x100000>,
-                  <0xfe200000 0x200000>,
-                  <0x30000000 0x8000000>,
-                  <0x38000000 0x8000000>;
-            reg-names = "apb-base", "memory0", "memory1", "memory2", "memory3";
-            interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
-            resets = <&cpg 319>;
-            power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
-            clocks = <&cpg CPG_MOD 319>;
-            clock-names = "pcie";
-            max-functions = /bits/ 8 <1>;
+    pcie0_ep: pcie-ep@fe000000 {
+        compatible = "renesas,r8a774c0-pcie-ep",
+                     "renesas,rcar-gen3-pcie-ep";
+        reg = <0xfe000000 0x80000>,
+              <0xfe100000 0x100000>,
+              <0xfe200000 0x200000>,
+              <0x30000000 0x8000000>,
+              <0x38000000 0x8000000>;
+        reg-names = "apb-base", "memory0", "memory1", "memory2", "memory3";
+        interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&cpg 319>;
+        power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
+        clocks = <&cpg CPG_MOD 319>;
+        clock-names = "pcie";
+        max-functions = /bits/ 8 <1>;
     };
diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
index 666f013e3af8..7896576920aa 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
@@ -113,27 +113,27 @@ examples:
         pcie: pcie@fe000000 {
             compatible = "renesas,pcie-r8a7791", "renesas,pcie-rcar-gen2";
             reg = <0 0xfe000000 0 0x80000>;
-             #address-cells = <3>;
-             #size-cells = <2>;
-             bus-range = <0x00 0xff>;
-             device_type = "pci";
-             ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
-                      <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
-                      <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
-                      <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-             dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>,
-                          <0x42000000 2 0x00000000 2 0x00000000 0 0x40000000>;
-             interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-                          <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
-             #interrupt-cells = <1>;
-             interrupt-map-mask = <0 0 0 0>;
-             interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-             clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
-             clock-names = "pcie", "pcie_bus";
-             power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-             resets = <&cpg 319>;
-             vpcie3v3-supply = <&pcie_3v3>;
-             vpcie12v-supply = <&pcie_12v>;
-         };
+            #address-cells = <3>;
+            #size-cells = <2>;
+            bus-range = <0x00 0xff>;
+            device_type = "pci";
+            ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+                     <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+                     <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+                     <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+            dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>,
+                         <0x42000000 2 0x00000000 2 0x00000000 0 0x40000000>;
+            interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
+            clock-names = "pcie", "pcie_bus";
+            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+            resets = <&cpg 319>;
+            vpcie3v3-supply = <&pcie_3v3>;
+            vpcie12v-supply = <&pcie_12v>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
index d674a24c8ccc..9823456addea 100644
--- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
+++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
@@ -76,64 +76,62 @@ unevaluatedProperties: false
 
 examples:
   - |
-
     versal {
-               #address-cells = <2>;
-               #size-cells = <2>;
-               cpm_pcie: pcie@fca10000 {
-                       compatible = "xlnx,versal-cpm-host-1.00";
-                       device_type = "pci";
-                       #address-cells = <3>;
-                       #interrupt-cells = <1>;
-                       #size-cells = <2>;
-                       interrupts = <0 72 4>;
-                       interrupt-parent = <&gic>;
-                       interrupt-map-mask = <0 0 0 7>;
-                       interrupt-map = <0 0 0 1 &pcie_intc_0 0>,
-                                       <0 0 0 2 &pcie_intc_0 1>,
-                                       <0 0 0 3 &pcie_intc_0 2>,
-                                       <0 0 0 4 &pcie_intc_0 3>;
-                       bus-range = <0x00 0xff>;
-                       ranges = <0x02000000 0x0 0xe0010000 0x0 0xe0010000 0x0 0x10000000>,
-                                <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x80000000>;
-                       msi-map = <0x0 &its_gic 0x0 0x10000>;
-                       reg = <0x0 0xfca10000 0x0 0x1000>,
-                             <0x6 0x00000000 0x0 0x10000000>;
-                       reg-names = "cpm_slcr", "cfg";
-                       pcie_intc_0: interrupt-controller {
-                               #address-cells = <0>;
-                               #interrupt-cells = <1>;
-                               interrupt-controller;
-                       };
-               };
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pcie@fca10000 {
+            compatible = "xlnx,versal-cpm-host-1.00";
+            device_type = "pci";
+            #address-cells = <3>;
+            #interrupt-cells = <1>;
+            #size-cells = <2>;
+            interrupts = <0 72 4>;
+            interrupt-parent = <&gic>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc_0 0>,
+                            <0 0 0 2 &pcie_intc_0 1>,
+                            <0 0 0 3 &pcie_intc_0 2>,
+                            <0 0 0 4 &pcie_intc_0 3>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x02000000 0x0 0xe0010000 0x0 0xe0010000 0x0 0x10000000>,
+                     <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x80000000>;
+            msi-map = <0x0 &its_gic 0x0 0x10000>;
+            reg = <0x0 0xfca10000 0x0 0x1000>,
+                  <0x6 0x00000000 0x0 0x10000000>;
+            reg-names = "cpm_slcr", "cfg";
+            pcie_intc_0: interrupt-controller {
+                    #address-cells = <0>;
+                    #interrupt-cells = <1>;
+                    interrupt-controller;
+            };
+        };
 
-               cpm5_pcie: pcie@fcdd0000 {
-                       compatible = "xlnx,versal-cpm5-host";
-                       device_type = "pci";
-                       #address-cells = <3>;
-                       #interrupt-cells = <1>;
-                       #size-cells = <2>;
-                       interrupts = <0 72 4>;
-                       interrupt-parent = <&gic>;
-                       interrupt-map-mask = <0 0 0 7>;
-                       interrupt-map = <0 0 0 1 &pcie_intc_1 0>,
-                                       <0 0 0 2 &pcie_intc_1 1>,
-                                       <0 0 0 3 &pcie_intc_1 2>,
-                                       <0 0 0 4 &pcie_intc_1 3>;
-                       bus-range = <0x00 0xff>;
-                       ranges = <0x02000000 0x0 0xe0000000 0x0 0xe0000000 0x0 0x10000000>,
-                                <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x80000000>;
-                       msi-map = <0x0 &its_gic 0x0 0x10000>;
-                       reg = <0x00 0xfcdd0000 0x00 0x1000>,
-                             <0x06 0x00000000 0x00 0x1000000>,
-                             <0x00 0xfce20000 0x00 0x1000000>;
-                       reg-names = "cpm_slcr", "cfg", "cpm_csr";
-
-                       pcie_intc_1: interrupt-controller {
-                               #address-cells = <0>;
-                               #interrupt-cells = <1>;
-                               interrupt-controller;
-                       };
-               };
+        pcie@fcdd0000 {
+            compatible = "xlnx,versal-cpm5-host";
+            device_type = "pci";
+            #address-cells = <3>;
+            #interrupt-cells = <1>;
+            #size-cells = <2>;
+            interrupts = <0 72 4>;
+            interrupt-parent = <&gic>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc_1 0>,
+                            <0 0 0 2 &pcie_intc_1 1>,
+                            <0 0 0 3 &pcie_intc_1 2>,
+                            <0 0 0 4 &pcie_intc_1 3>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x02000000 0x0 0xe0000000 0x0 0xe0000000 0x0 0x10000000>,
+                     <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x80000000>;
+            msi-map = <0x0 &its_gic 0x0 0x10000>;
+            reg = <0x00 0xfcdd0000 0x00 0x1000>,
+                  <0x06 0x00000000 0x00 0x1000000>,
+                  <0x00 0xfce20000 0x00 0x1000000>;
+            reg-names = "cpm_slcr", "cfg", "cpm_csr";
 
+            pcie_intc_1: interrupt-controller {
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+                interrupt-controller;
+            };
+        };
     };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
