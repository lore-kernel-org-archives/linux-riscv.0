Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA3DCE7AAB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lM8KzIQbaIHE206T73DrlqEIBYrYUVehQyX9SCq+UY=; b=SDoM3wTudwqDQO
	hlRyTPg1F+rT+uPoChg60ZAb/os+fbnLaKkvL+vSUUKQrK2r4wwxUv4SULCzaiG/giGuZdhmdk1YA
	mo6IGyr9cdV8BSZ3F5Q8p1DknjKHgzi9tQ3kv8+K7/DRyMjTUREkTwhiuvLAaxTI8V11OtYuzvfFh
	w6tyK50r7eRUO52uR+H0YQAaRGizvWmoLRFosWMR8FmqPXaCMUGMm1t2wNTydkWUAv+k94J6Fy3Ih
	ifx/8/01MReXgWDzJLJBnrEZPDvfY57EiurDTBdbrNYW78rHbXAwBZWzKc86s6eCF7V8LgQptJxSt
	1XcVHHOtYYJe2PnwK5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr8n-0000000C207-2ste;
	Fri, 14 Nov 2025 10:34:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr8j-0000000C1xd-0l56
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 10:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763116489; x=1794652489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gUnRf6n8ndiHI4YW1DJPBaLZYDQ9YnYfxMEEpRNdoGY=;
  b=ZQGzeXjmS7Zhm01byVgR6N3nLSGNfwvwmXTvo2L9NQ+OiekHPxqnLqYe
   SRrtXJ64DUxZM4P7bY5O3G4S95RNVoq+jVID/e1wYW35lxB+LBBbbyH93
   G7KwcSTqN0G7ziJCLkJWUPLjd35CzwFevb9zjtBnmSvVO16NaST4T7sRq
   8DKTLC7IiR1Mo6yiS3L+2EJsmKOCU+aluKgQXrFV1Ep6rCP0KwlW5m2va
   ffGbE0YisEqTGRxINK36PmLZeFezW16+6MLKpo1bTXk1vbcX9jqbTbb3P
   BTlhdiEKAoVV0hRBPJrXvdo7vYKcvRYOSQucE4UR3nJYhl5/VWxlU3Hpr
   g==;
X-CSE-ConnectionGUID: vmddLFM+TxWWaTCTVpQ/Sw==
X-CSE-MsgGUID: D1U5If6LSZ2SSnBw6de3uA==
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="49141521"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Nov 2025 03:34:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 03:34:25 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 03:34:22 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v4 2/3] spi: dt-binding: document Microchip CoreSPI
Date: Fri, 14 Nov 2025 10:45:44 +0000
Message-ID: <20251114104545.284765-3-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114104545.284765-1-prajna.rajendrakumar@microchip.com>
References: <20251114104545.284765-1-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023449_243650_2E712DF5 
X-CRM114-Status: UNSURE (   9.69  )
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

Add device tree bindings for Microchip's CoreSPI controller.

CoreSPI is a "soft" IP core intended for FPGA implementations. Its
configurations are set in Libero. These properties represent
non-discoverable configurations determined by Verilog parameters to the
IP.

Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/spi/microchip,mpfs-spi.yaml      | 70 ++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
index 62a568bdbfa0..636338d24bdf 100644
--- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -21,11 +21,13 @@ properties:
               - microchip,mpfs-qspi
               - microchip,pic64gx-qspi
           - const: microchip,coreqspi-rtl-v2
-      - const: microchip,coreqspi-rtl-v2 # FPGA QSPI
+      - enum:
+          - microchip,coreqspi-rtl-v2 # FPGA QSPI
+          - microchip,corespi-rtl-v5 # FPGA CoreSPI
+          - microchip,mpfs-spi
       - items:
           - const: microchip,pic64gx-spi
           - const: microchip,mpfs-spi
-      - const: microchip,mpfs-spi
 
   reg:
     maxItems: 1
@@ -39,6 +41,45 @@ properties:
   clocks:
     maxItems: 1
 
+  microchip,apb-datawidth:
+    description: APB bus data width in bits.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16, 32]
+    default: 8
+
+  microchip,frame-size:
+    description: |
+      Number of bits per SPI frame, as configured in Libero.
+      In Motorola and TI modes, this corresponds directly
+      to the requested frame size. For NSC mode this is set
+      to 9 + the required data frame size.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 4
+    maximum: 32
+    default: 8
+
+  microchip,protocol-configuration:
+    description: CoreSPI protocol selection. Determines operating mode
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - motorola
+      - ti
+      - nsc
+    default: motorola
+
+  microchip,motorola-mode:
+    description: Motorola SPI mode selection
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 3
+
+  microchip,ssel-active:
+    description: |
+      Keep SSEL asserted between frames when using the Motorola protocol.
+      When present, the controller keeps SSEL active across contiguous
+      transfers and deasserts only when the overall transfer completes.
+    type: boolean
+
 required:
   - compatible
   - reg
@@ -71,6 +112,31 @@ allOf:
         num-cs:
           maximum: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,corespi-rtl-v5
+    then:
+      properties:
+        num-cs:
+          minimum: 1
+          maximum: 8
+          default: 8
+
+        fifo-depth:
+          minimum: 1
+          maximum: 32
+          default: 4
+
+    else:
+      properties:
+        microchip,apb-datawidth: false
+        microchip,frame-size: false
+        microchip,protocol-configuration: false
+        microchip,motorola-mode: false
+        microchip,ssel-active: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
