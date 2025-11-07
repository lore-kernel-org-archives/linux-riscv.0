Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A294FCCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lM8KzIQbaIHE206T73DrlqEIBYrYUVehQyX9SCq+UY=; b=tViVK2d0GLiUS5
	+ZvkW/Rp+Q8xJND2YwqJGh7/jTuo44NoG0Zw0PNnJRTKNwkrMrTpelVUL03013tzglUdCa5Q1KswQ
	V6T93ulYR9xnUxnUMVMhU0X4xvuwS3tX1Li7dXZ4XS1gbZ3MW3JJ2qzQuSvy9KRvbPX0NfBVK1cQ1
	46DZ0d7oWhpoc5+mhVZkQMgdzLmD02robxGQsusgF2VwgYwigLj0WJgVBEmmUF/eqy6wftK0vEj9e
	BLhMtzYlECFu0nbwV3QRVtnrYMdpx5jTSWsm7wdK9YwdegzdaHj4lP8zkW1VQH9XF0G5IkfGGA/Ka
	ZS3RdPVQYNLn8HJXYvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLPC-0000000HHGj-20fC;
	Fri, 07 Nov 2025 12:17:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLP9-0000000HHFo-3T90
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 12:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762517843; x=1794053843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gUnRf6n8ndiHI4YW1DJPBaLZYDQ9YnYfxMEEpRNdoGY=;
  b=LqMENhx9LdG0lY3erDSew6lZKC2r25XgW5hjQIcR5g64LXwsd7hZClOt
   91rhgyF3o0fF9KEgBPAEcHAnRslh9Bw4WRlWnwPhSGdEa8s24Z+gAmacp
   wyNBgVIkuvd8ZXvgMTp+8HC0Xitihhx4VVgrsGg8WMDbrw6ABZqN65qpX
   r98sEZpy8dx8L14elcMUTeggXfMxc1o2NMhWygdBwhIzRHz7Pa2F8Ah27
   0Om3e7zBZa77OI3n9ye9logbEmVsSlrCZ/uxtfyWH1kzJm9+zJTzkUeuH
   32foad8gd+7o8I6eKIZGk3qezvsKXlaQrfGNIrdVoBuIf5vz2lTKEAepu
   w==;
X-CSE-ConnectionGUID: sUAnbxRLSU+qM77z5K7SQw==
X-CSE-MsgGUID: mQ2FtkYrQPSnKguOdAN9ZQ==
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="55218277"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2025 05:17:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 7 Nov 2025 05:16:42 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 7 Nov 2025 05:16:40 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v3 2/3] spi: dt-binding: document Microchip CoreSPI
Date: Fri, 7 Nov 2025 12:21:03 +0000
Message-ID: <20251107122104.1389301-3-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251107122104.1389301-1-prajna.rajendrakumar@microchip.com>
References: <20251107122104.1389301-1-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_041723_868580_4366B3E6 
X-CRM114-Status: UNSURE (   9.88  )
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
