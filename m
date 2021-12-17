Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F422C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbthUvjeiruh8VtO5tPsO3r7ks+yq6bGC3sixzkk+FM=; b=D8dLrX9rG2YePX
	51fktlGKoZg6nI33vnnAxmh0//D43tjnfDDNeIhyQa+Rtz2GfWqve/GdTKl3MFTGo1G+MtzKTfAWL
	YGpGiYSWD+RBZEkCWeR7QvXL1bWft11uqjpRXB1okIztzil4L1K04pE/k0HV2czS1/imaxm+O3sT7
	pmPhYRw3Prhyt+eimCVbuca2fZq2JgyXEQoWcQ1RDBjMJZiXm66OL5tDweQVyoeal/3wdwyKAS3kr
	0KWRoEWa8yfhKqo8IljbOrYTYBPn/6yXNv4306qQda6IrUplvSO7EsPfyQux8q4IHogmtgcj79z7C
	wAd3Jsmwz7Z6jIDjuoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9c9-009BLc-MA; Fri, 17 Dec 2021 09:33:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9c4-009BH5-3r
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733595; x=1671269595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tyKmBa6H+LS4VXJh8pc0QMMYrGpUxJ+pgwPwgwEvzv8=;
 b=by6J34CCZ+qinxEpjyEU+nS4fZp4E4Z8e+s8Os7u+T1vAlkGVqVuhJcJ
 wRKCJR4iojqlmjAieUkHBMrYIy27h17DwHpvqCo/rSE73+9USAbrmabWP
 Uv+mUlzLYX9gjDQsfW8/wbC4IMPuU/VaRscGeHrzpRbYz+EThOzV2X5I9
 +Dm/JI8g8IOOjNcMl3uMcl0/JXZMoV+RTZGX0eGuZOIOtxq6U4JuxCV1/
 u/KLG0MECIPUIitsZM/2lFIfCycMdvRjuHWYef6dsYRPadXAUS6uReRrE
 RjpRvSIYnoB763D+v4/oPRaMqolSc/2C7qS2Xf6RBpFMF8eU7faes9IaN Q==;
IronPort-SDR: AxgE/Y0JrWCILgP7tM4yQ8eyHdaaKn0SDgYPf/PgmtUucz6cvdURR/NRuIbOjI2cKHmilYEwD6
 JJvZcJdvW4nV8u+LdmJ3LSLxNtCGLG8ShvHLq0eo6rtwUOs9lw6lL+zt7wi0oIoDnwymUo2lxr
 zJ77X5ySuS5gJNtzcQmCGpNlbE9MIfojfSF3bPnCn9hwG/AcNXqcy0IN3SnlzX1DTnc6CNX9eN
 doRUcwPXvYtfnLwU33Jlmo4n+coeQW7vT5cF2AgCGJ6Tz8GiqimFgbK5cGpmr14QZ1Mk8P38ma
 UZF3suAPLTqKlMkIb4Qhx49D
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147571068"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:33:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:33:08 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atish.patra@wdc.com>
Subject: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip mpfs spi
Date: Fri, 17 Dec 2021 09:33:18 +0000
Message-ID: <20211217093325.30612-11-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013316_226577_0BA95680 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the {q,}spi controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/spi/microchip,mpfs-spi.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
new file mode 100644
index 000000000000..fe257b3384a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -0,0 +1,61 @@
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
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-spi
+      - microchip,mpfs-qspi
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
+    maxItems: 1
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
+    spi0: spi@20108000 {
+        compatible = "microchip,mpfs-spi";
+        reg = <0x20108000 0x1000>;
+        clocks = <&clkcfg CLK_SPI0>;
+        interrupt-parent = <&plic>;
+        interrupts = <54>;
+        spi-max-frequency = <25000000>;
+        num-cs = <8>;
+    };
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
