Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F97EC43219
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zj3qetU6DserkZDABQ4/wSRZGq6HRuoFe9H/7a4Uj9o=; b=28YPqqKlCI46wc
	575KLKCIJsN/vWQjAHs/WhI/CCTBD5Vzf+CKL11ZVHhshaMgmvtRtzExl02sU10So+Fq8x0hiq7/8
	3BdqFfzXEoouzVyIdnt+roWtw5fz8tjxe8KxQm2smm/b4XAxWu0NoCuFNY+EExqcfbNbyLfg1Fplk
	Xm58+FkvG7RED3+X2/PGv+D8d/BjLUi46B3+KhcHcKy+gx/5DGg2BlUyuScTkW3NiqCbAQM58y7KM
	oXeBZvjFiKa8cDkazekg4qVE5RvFtvub4vkprf2c3vPfrNR68wXH+vRxm4dHSmgguntWfSsjcoaA6
	RKDW60luzyKLG4oFmYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8OKK-009YBG-EW; Fri, 14 Jan 2022 15:17:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8OKG-009Y30-Mj
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 15:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642173432; x=1673709432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+qPRXox7zPzI+myjQz8NC5TP9D5voUl5Cp51OFrTMa8=;
 b=XTHsGst4bMv67gKdofTTX809TGBjhF4Gpfmf3UrdSIs0vtsSld11U6Zm
 rQ3liVj14/yxBknT08D0OCFeEn6Qv2ZRbNI6h+klFB0TCnL6mCT/Kc8T6
 yWMTiQ93eO+L8UV8WQPBYABR/tZSVHNgDG6gZTsyvJCfovLiJ7iazgGzW
 ojAT5yUuRj5hc8XtLqeA31s2NIcz0Yke0ZcHbgoofyoRJ1647XQkbtf9J
 5H80p4CCDmyx1GIO3V145M+k5InmSE0ACqrpk5XgFp4OXWX303XZYe3B0
 nlLBAirVwc4JBKZbIj58rV6Q0IldsLK+NXI6d/NZeP1h3pLX1p5TomRVL Q==;
IronPort-SDR: pv1M3xpiwF4GwIuMI+y3FQnMDgMJogxLnT3187uonLweWF6/G9UfkbLepORDDd8bG7yn6jm5tN
 nnMJ0cJN8/lPD3bLaAqcKsxlY+1fjVJNOiTqp0AsC866FkUOV3Re+icAsmeST3PVp2GDkEmz25
 cygmWSJNt2M953p0ZcLMS2RhhS3BKDLyC5yPmIrMf1Z+o5cBEqvowR9hCdkwPIGTvLOlVfnxCb
 Tq2y8igpUDBnvAIpvhifRPFWsZbndr2Y5Gxf7JH4c5SMptzcx9uSP00enpXLKeWowUmQSFnk20
 z76AZYgCSKNnCqs25q1nTtTz
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="142730887"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jan 2022 08:17:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:17:11 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 14 Jan 2022 08:17:05 -0700
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
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v3 08/15] dt-bindings: usb: add bindings for microchip mpfs
 musb
Date: Fri, 14 Jan 2022 15:17:20 +0000
Message-ID: <20220114151727.2319915-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_071712_886170_9599DD85 
X-CRM114-Status: UNSURE (   9.89  )
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

Add device tree bindings for the usb controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/usb/microchip,mpfs-musb.yaml     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
new file mode 100644
index 000000000000..48c458c65848
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,mpfs-musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS USB Controller Device Tree Bindings
+
+allOf:
+  - $ref: usb-drd.yaml#
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-musb
+
+  dr_mode: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: dma
+      - const: mc
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    usb@20201000 {
+        compatible = "microchip,mpfs-musb";
+        reg = <0x20201000 0x1000>;
+        clocks = <&clkcfg CLK_USB>;
+        interrupt-parent = <&plic>;
+        interrupts = <86>, <87>;
+        interrupt-names = "dma", "mc";
+        dr_mode = "host";
+    };
+
+...
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
