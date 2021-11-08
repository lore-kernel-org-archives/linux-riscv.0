Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6153FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265AC61053
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 265AC61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYOYahuv16ddP2RtRY3bEJSvaLSJlnk4GTYeteoZneA=; b=K9uCnnbsWvoy6M
	7TsRA3ZM17k96V8oo3psKyhB8q3dNRTF1r/iiOXcm456CxFf+Q+ar/uYnfcmTNQTj/aZ+3/cvt+av
	r6QAhFNzgWhXzvJY0ZIFvjfOvqLgSwoWdQ9o2OiGWsz0+a/jDSnWT6MqyhcDZYfH7vJx7RD8/q4Mh
	h8b8SVy4F+/E2ZD5NK5qgDp73EsI4VaAHxM56JnMFMyPelVzfd90mH7SyEVEOH80IS1PU0fGkGGPO
	0L8exNHZCzLIYx9kU4mPZKmxfFKBEq33qFiDxp1Uf8FJ78IdSC188UR5XB07c3XZ2V9fB/QfxpWz+
	mPTu+7LsPkHHu6BevJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6FH-00GmeY-Pz; Mon, 08 Nov 2021 15:07:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6FE-00GmcV-Va
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384056; x=1667920056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gPBDUHEHryuXddDlP+HH2IgvmB76SJ44PJ4f76bXn7A=;
 b=rQp6h8oxxSQ4Hcu/QSri1D4aWEr42QIuT965+o9jygxFtttAovIRX2FA
 7lXVDOdgtOc6N242SFMjsgWb2uoI4Se/AsszzMHuxuqn/++yVbnt+TfbP
 mffJGLCxyYOvyctVYdn8VfJ9uEE9r0WP27BOIFqsVW14IrpXsZBLToadf
 hPyEBnxu+HRopGFH0d4xrzoaZjyVt7LNbriq2g4mOgduYJgcrC9m6qC6I
 EafT5U/ZeUSOvd9rHla6BITR2pSlXgUqnVsL9kOwtmGASAR/9hWDpt8ZF
 l5OnGsTRqt+n0sq95ucizw0zh/PYk/m92/mAJsQZz4Ssxyy7YJVFwctw1 w==;
IronPort-SDR: GijAFQ3AR/eI2hQHdOazGp7fs6k3h/fM6DoGTF3/PI9F5jaeI+mLWWaA5/+heeXk/zOAI36I/5
 AyIIlzaiFz1zAj/XndPfJmSaVnWQyd264KIV1Ad7CnjoAmXbCajbGQl4dVtrN1OQfwiSMJIp+t
 PINcl39dudouAPo+ZM3734ygn59wCQZ3BKzZXyoQX4Nlp50uc8zxD0hWmFizPO9ZGXwmKq/nYh
 VbPAcJa5QLqcBdhJJxZY8tZlj5UK0vn4TYzdXHZnzsolTjOH2ZUVXYuD7rF1OY/prqRp6vAgLe
 W0s+ZMBC32dHW3/httigaMOp
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="151131546"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:07:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:32 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:07:28 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs spi
Date: Mon, 8 Nov 2021 15:05:51 +0000
Message-ID: <20211108150554.4457-11-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070737_060317_C8F4E5B7 
X-CRM114-Status: GOOD (  10.72  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the {q,}spi controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
new file mode 100644
index 000000000000..efed145ad029
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,mpfs-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS {Q,}SPI Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  This {Q,}SPI controller is found on the Microchip PolarFire SoC.
+
+allOf:
+  - $ref: "spi-controller.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-spi
+      - microsemi,ms-pf-mss-spi
+      - microchip,mpfs-qspi
+      - microsemi,ms-pf-mss-qspi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  num-cs:
+    description: |
+      Number of chip selects used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+    default: 8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      spi0: spi@20108000 {
+        compatible = "microchip,mpfs-spi";
+        reg = <0x0 0x20108000 0x0 0x1000>;
+        clocks = <&clkcfg CLK_SPI0>;
+        interrupt-parent = <&plic>;
+        interrupts = <PLIC_INT_SPI0>;
+        spi-max-frequency = <25000000>;
+        num-cs = <8>;
+        status = "disabled";
+      };
+    };
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
