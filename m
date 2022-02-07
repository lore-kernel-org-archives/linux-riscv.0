Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7B8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sg+LHIwL0EcIMVeQlvdMPcI05YATcCXN+UKPEbXxU8M=; b=pvTizM/ZwoFhQ0
	SXVVJTMYqRCSjWDHCySf6WjNjUl2XFDzYKdcXUyoViikElcxz6HnPzUkFPwZ5TaNiB3Vl4aIfaY1h
	nMuWZBNl1sY7XmYW2k9nRgSyQ0YUZiYmncpUb10qyqgVweVFJiujdFXE4Cn+/HmvLCTvV+BpGvoIw
	cXzuGIjFqBvZk2UKGhqIKnwwl+DyZIjZ5jG+7XWoTPqb+W8bNElu8XyuLLWHZ6VD6a6JRfmimuUBY
	rzAahXb150U4sMaRCPPR+5ghtMWGUZe04sbzYGlmSZ4H7ouVBX/+u3xJ6DsQWDWWztsnOvCSLBGvj
	58vo4RmcpkAHuRpyB+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6xT-00B78d-Ik; Mon, 07 Feb 2022 16:33:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6oZ-00B3zr-KD
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 16:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644251071; x=1675787071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UgAsg9TlIrDzEqjVIYSY7g9vpEQeRY9RvW+oM1/ooF0=;
 b=Y6EzvARZf1MYGeZdtq9ka8n3vWm+rWVIUS5nmKFcaBfwXclYiw7Qjd5I
 Sds83A0LCOSpAvsRB+WrcasheqC4LM7RSzoSe6MxTDYMQdHEoprT0ltqN
 ths8h0mllnfA15AmuedKPJxtEjgjt3ye5cxw8tGc6qNCk+czDDGWqVIfD
 zyFGet3mRHsVaKk+DNX9AzJY4GB4N0UBtgOtwP74cq2YEC9wdsO1LI8tE
 oPPJYWFUNVh8TeWKlyxEFuomH6PYpEqxml2UjMypAzP+PEXr2/scJ9CAR
 8bblgXzC8DE8jEk6WWuqtwxcX6bqUNoqSS1vaN2xxCffVjX14AZY86LvF Q==;
IronPort-SDR: a5kwyl98BaeJDDdVDl5yUbw7rcuwyz/E9FtbOJijPgB9dt43zfaMptiY3NIHux370393lzmFLU
 lzWz2ZEqSQH/HZ1VfAY8nqH5lXPP3+LCjLuzIWQQUnOq+LbNCiLbIAbjkkHMrJqOt9joT9Unk7
 YJ/bfwhQjZXo5sAEDz5hJSqdcwZCClNOiHqx0yaQMyGtVaVpTfLWLhw8eh0GvO+h5Qu/4xJCB/
 I5TYpZlnOnLtZf15L/GmvsWalzfssFDfTE3+P7MBfH0yoj71s2cawwSQ6ZpxD+DOhQDRcD07g/
 MR2ujyQQJQOB9peCG1uyptaR
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="145140011"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 09:24:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:24:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 7 Feb 2022 09:24:17 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>, 
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>, Rob Herring
 <robh@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 06/12] dt-bindings: pwm: add microchip corepwm binding
Date: Mon, 7 Feb 2022 16:26:32 +0000
Message-ID: <20220207162637.1658677-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207162637.1658677-1-conor.dooley@microchip.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_082431_760903_248974E6 
X-CRM114-Status: GOOD (  16.66  )
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

Add device tree bindings for the Microchip fpga fabric based "core" PWM
controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../bindings/pwm/microchip,corepwm.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
new file mode 100644
index 000000000000..30ec70ac5c44
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/microchip,corepwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip IP corePWM controller bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  corePWM is an 16 channel pulse width modulator FPGA IP
+
+  https://www.microsemi.com/existing-parts/parts/152118
+
+properties:
+  compatible:
+    items:
+      - const: microchip,corepwm-rtl-v4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+  microchip,sync-update-mask:
+    description: |
+      Depending on how the IP is instantiated, there are two modes of operation.
+      In synchronous mode, all channels are updated at the beginning of the PWM period,
+      and in asynchronous mode updates happen as the control registers are written.
+      A 16 bit wide "SHADOW_REG_EN" parameter of the IP core controls whether synchronous
+      mode is possible for each channel, and is set by the bitstream programmed to the
+      FPGA. If the IP core is instantiated with SHADOW_REG_ENx=1, both registers that
+      control the duty cycle for channel x have a second "shadow"/buffer reg synthesised.
+      At runtime a bit wide register exposed to APB can be used to toggle on/off
+      synchronised mode for all channels it has been synthesised for.
+      Each bit of "microchip,sync-update-mask" corresponds to a PWM channel & represents
+      whether synchronous mode is possible for the PWM channel.
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  microchip,dac-mode-mask:
+    description: |
+      Optional, per-channel Low Ripple DAC mode is possible on this IP core. It creates
+      a minimum period pulse train whose High/Low average is that of the chosen duty
+      cycle. This "DAC" will have far better bandwidth and ripple performance than the
+      standard PWM algorithm can achieve. A 16 bit DAC_MODE module parameter of the IP
+      core, set at instantiation and by the bitstream programmed to the FPGA, determines
+      whether a given channel operates in regular PWM or DAC mode.
+      Each bit corresponds to a PWM channel & represents whether DAC mode is enabled
+      for that channel.
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@41000000 {
+      compatible = "microchip,corepwm-rtl-v4";
+      microchip,sync-update-mask = /bits/ 32 <0>;
+      clocks = <&clkcfg 30>;
+      reg = <0x41000000 0xF0>;
+      #pwm-cells = <2>;
+    };
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
