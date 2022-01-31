Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B76EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8jZxmvoLiiGqOWn66Cm0OJI2YhjlLUCfD2R0zA11kw=; b=hL1C8c9j039THq
	tD2p5l5mcn6Z2VUS20nTVnKOPDwfa0T9BmeJq+WPqH9S8Ekc9rCAxStqRYTcyDfsJJ/jtZZ3ip2bg
	uKUEI6kRcuOwPzXXsoNc6qeJK2IiJFtZpsnm7KzVhuMWs362F5dDeEGAycEW6XTLLpxNKeZQBbybL
	PSMMAfaYsfmVrII7wGDzOtpzSWSVbbwcfWtyNX25DNcIC6Vhb6YBUYuX9tqDRSIs+73HBiQfqCb1b
	DNtgv6TAjaf+BywmhIwPl2CTNKU+oaKjzUM5Lg6WuSKyhEMJ12WfHBjXnPtDc29YAQqlDbvYK38MP
	EuL0KmUZz3JoeDDpr8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV8O-009Bt4-L8; Mon, 31 Jan 2022 11:46:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV8I-009BoN-3s
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629566; x=1675165566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S66zZt/+ui7EQlWOoikvRADc+Ifcwneiyi9IADvVOwc=;
 b=108K2roXgSMDdnZwWdMvhj11o0t+4s5HXM36gKejgOaPs36p7IUac6J4
 Bk50VQNk5bU0Zk1y4M6/PVA97AvGkxFp38nUWY/FbzoOdp89vOWi08tJJ
 OSoY2aG892lpCP/Ne7OS/O4y0ev2vDxUbCXRVOsvnNWi3II+m+e8eOBNO
 IsjzhT6TQzl6g23pYLSvg9hc0MHmFSw57YXxJrhVqpBV+4pg3KjqUNeb9
 /zsYbNKNqgErp+QktP3HTmHm4vRonVBLDR0/g5UxRwQh2r5iqxYS5CP7I
 +hTGElfYVLPg7NLsPieHtmoxbhd0cB/o0TkHL1Azu5myMSRIy3c0szJfC A==;
IronPort-SDR: f3Nj64c6XQEA8xZt0eSa2tWUpnDpZ4hYpritoq44wYoxieLDLgTOwml9h2+ug4H1rrWZMPcUwo
 n44bHpBMY2oLQ1p6MucAjbomfy70nj3x0ZUNTvSyifrjmWWCnVBy6CCjqniCFDkJYPz0j29+ID
 9sfLUOIvYScXfSK5oEWkMmeBaAifp5jxwm9aYFf/+5ZQIpcEzn+BVbNCE707wyVkk/lSm9Veb2
 scxctBehJHUSdmfXsYZ4H66Bum8IQnxeurM8rLENTBqewBiPsIqG3kUxN+M1HKenu1IcGUG9fG
 O1J3VvKFVdba/xVxtH6jZotS
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="147115877"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:46:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:46:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:45:59 -0700
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
 <atishp@rivosinc.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Date: Mon, 31 Jan 2022 11:47:21 +0000
Message-ID: <20220131114726.973690-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034606_277956_76A8B886 
X-CRM114-Status: GOOD (  14.12  )
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
---
 .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
new file mode 100644
index 000000000000..26a77cde2465
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/microchip,corepwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip ip core PWM controller bindings
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
+  microchip,sync-update:
+    description: |
+      In synchronous mode, all channels are updated at the beginning of the PWM period.
+      Asynchronous mode is relevant to applications such as LED control, where
+      synchronous updates are not required. Asynchronous mode lowers the area size,
+      reducing shadow register requirements. This can be set at run time, provided
+      SHADOW_REG_EN is asserted. SHADOW_REG_EN is set by the FPGA bitstream programmed
+      to the device.
+      Each bit corresponds to a PWM channel & represents whether synchronous mode is
+      possible for the PWM channel.
+
+    $ref: /schemas/types.yaml#/definitions/uint16
+    default: 0
+
+  microchip,dac-mode:
+    description: |
+      Optional, per-channel Low Ripple DAC mode is possible on this IP core. It creates
+      a minimum period pulse train whose High/Low average is that of the chosen duty
+      cycle. This "DAC" will have far better bandwidth and ripple performance than the
+      standard PWM algorithm can achieve.
+      Each bit corresponds to a PWM channel & represents whether dac mode is enabled
+      that PWM channel.
+
+    $ref: /schemas/types.yaml#/definitions/uint16
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
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    pwm@41000000 {
+      compatible = "microchip,corepwm-rtl-v4";
+      microchip,sync-update = /bits/ 16 <0>;
+      clocks = <&clkcfg CLK_FIC3>;
+      reg = <0x41000000 0xF0>;
+      #pwm-cells = <2>;
+    };
-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
