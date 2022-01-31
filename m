Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18794C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xg9i91Opl0fPi1vjB9L/rD7AjjtsxXkxfbobhZMYjeE=; b=bq2A96aCT13qgi
	S6sbmY2SBQJAxVABHnJfwkFnIYenBzSwk/t7JntWNG2DJn0ZJFVISrNxF0/1aOfbKaeLkyu/iWdKX
	SdphSbHFBXFmnsv5Xoy2p3nl5MvlpbTnPNT/DtH2OEBdSFWUOGuK0Cc6fwZrl+xmiXEmNacgQPR2r
	KlxZtrQGPiVyKHf2yCZtoq6MQxx8Y8AIwV1+vtLZugjlCe1H9rf9rNjWkZz30EgPaWyzmzAcdx4ou
	X4Pu86bRj4zQVo6kzVpqLdITE3pdMtmgchd0k46SB8rVk7+aLMaiwII+HNNo9PTHYWIVVtwVs+CJ/
	Y8FGUdV/Ah6HjWrJ+YiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV8D-009BkJ-Hg; Mon, 31 Jan 2022 11:46:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV87-009BfZ-79
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629555; x=1675165555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L1ZdOLAp63V4mK0822g6z+RPsvXKy/oiu4gWC+apcYE=;
 b=a80wVHZ1IsiFGw5xpxbiyDbNs8v2hKOlfeRH0v/4xyGvJWF7hZWtIFxB
 /1emD9VMhxwlJX1Ta8QvnynzQDfhAnVLHe/Fhq61oiF+K81aRb+kOufgp
 GnFc6scGe7isZ3u8bo3at6LCVmi0XVpKPAgp/yZZvNhWVxYS7a1S3/kKR
 gxU2HhjVR9xt5BcEeoGIa8yRxgHkAvteSS+845E8fP670zDBGseK4gZSJ
 sNuLaMqv9ELbDJzkoRmfuUPDs54KVqG/t/5zQYEQPXtqoIW4TsLgIUNdq
 ywt7mF4Nm4bX5zUaIs18xCDpLF/uoJsDIR8ni4Pz4MLLdT9I/xWGsk0AK Q==;
IronPort-SDR: 9BwHxWjbaGwoNNhJc6vgGJnZmweYL1ZpuGThJFVbaes58S7jX6TfnmZQaY+q8CZAw5oAc2ZAZd
 tXVZvHMBVepavqLwgqJj5BCCcA7QNpWUtFIEfDiVHtplhoaXpFMc4M5VNqmivTpelW68iKlsXZ
 CkZmITySi9yPNoB2H+3u6qP8OArffQLoY4lr5QUjzo0804b4HWg27fTy6prLr40VwJQQdJG9wr
 UtbbaBueivzKvIgKY5E2gNBjyO1xFQ4J3/0qvMnn+rm3zGVKbZk+RORiqRVr/IrRd0anZtgCdQ
 0JzYr12Z+9phx19uWcBecC7q
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="147115858"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:45:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:45:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:45:48 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
 <heiko@sntech.de>, <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>, 
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: [PATCH v5 04/12] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date: Mon, 31 Jan 2022 11:47:19 +0000
Message-ID: <20220131114726.973690-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034555_392773_D93A4ADE 
X-CRM114-Status: GOOD (  11.83  )
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

Add device tree bindings for the real time clock on
the Microchip PolarFire SoC.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
new file mode 100644
index 000000000000..f35cca4e8656
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
+
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+  - Lewis Hanly <lewis.hanly@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      The RTC on the PolarFire SoC has a pair of interrupts. The first is the
+      RTC_WAKEUP interrupt. The second, RTC_MATCH, is asserted when the
+      content of the Alarm register is equal to that of the RTC's count.
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rtc
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    rtc@20124000 {
+        compatible = "microchip,mpfs-rtc";
+        reg = <0x20124000 0x1000>;
+        clocks = <&clkcfg CLK_RTC>;
+        clock-names = "rtc";
+        interrupts = <80>, <81>;
+    };
+...
-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
