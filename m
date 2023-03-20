Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDDFC7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoBtsRQI0AP2nVRVqumyVJhTN4lPw9zLNWPC8GLx/SI=; b=pY8b5lg4v8ao7y
	BZy1ujTFPiqLGo/DI9wPBm1tNm6bpQiT3ZgWzYGGf61dLtADy/bhM1mFM8sxBlUdisbILTwys/wvu
	17eXyFXO3zw0XxH3cgmzGUtonH0cjtnZvqWeu4S2pw7oVtfwOURsqMGwPvLKhxfu8SEZwU+M3ufj3
	XS4YNFX7ARXB0h7ypqnnboXn7lLhnjnmLdXG7UZqSm4N5vnPfVfo7EQHeXvwXceiVe4TNVLCStV0X
	992H1VA/HMRlQptRGnPU9FL6Kn2yDZQ2MIP01Js1n+8mbr2aQO/t/Re9AZXt3B6tJuAHiPWZddWB0
	ix4GcA1l+oQhRaKUzkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFz2-009FgV-0S;
	Mon, 20 Mar 2023 13:55:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFz1-009Fg3-00
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Mar 2023 13:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/w03u1tDd00rPEy2+zm9OAldouKdDX6MitKQDr9C5no=; b=ob+0cR1uQHMiuxU/mFhyqe5k0v
	Dd5RJwrpYv/sXHXIpniKK6l6PFcEvob0XO06NjcpnMFLuGx4Iu7Aa61SXQWcCzc1pR8R4TeM+TVXQ
	T9bi70XPnNNLkHoNY75x39bqun149ywDJy5DIdK3sITMOKbRnTqUvwEJIcZaD9sEklMxU6SNIX6Wd
	Ry9zyhYP8czT0L0cTCZBj8HEp1n+OAb43TCH6hrZJir5ce7NHGtsdBTVukdGj7jIlRc2ARAyi0hun
	IRK3S4wI2MpOMqtdByKJt9d2sL7HZYEC/W84U6a1NHROAbYhAmqrTatKnI7g+WBcVzSUh+BnTq/F4
	Ue0sPN5g==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFyt-003vdK-2a
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 13:55:29 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EC37E24E0B4;
	Mon, 20 Mar 2023 21:54:35 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 21:54:35 +0800
Received: from localhost.localdomain (183.27.97.64) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 21:54:34 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: timer: Add timer for StarFive JH7110 SoC
Date: Mon, 20 Mar 2023 21:54:31 +0800
Message-ID: <20230320135433.144832-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320135433.144832-1-xingyu.wu@starfivetech.com>
References: <20230320135433.144832-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_135525_300514_D2D0E723 
X-CRM114-Status: GOOD (  12.20  )
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

Add bindings for the timer on the JH7110 RISC-V SoC
by StarFive Technology Ltd.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/timer/starfive,jh7110-timer.yaml | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml b/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
new file mode 100644
index 000000000000..24b34618f2c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/starfive,jh7110-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Timer
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+  - Samin Guo <samin.guo@starfivetech.com>
+
+description:
+  This timer has four free-running 32 bit counters in StarFive JH7110 SoC.
+  And each channel(counter) triggers an interrupt when timeout. They support
+  one-shot mode and continuous-run mode.
+
+properties:
+  compatible:
+    const: starfive,jh7110-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: channel 0
+      - description: channel 1
+      - description: channel 2
+      - description: channel 3
+
+  clocks:
+    items:
+      - description: timer APB
+      - description: channel 0
+      - description: channel 1
+      - description: channel 2
+      - description: channel 3
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ch0
+      - const: ch1
+      - const: ch2
+      - const: ch3
+
+  resets:
+    items:
+      - description: timer APB
+      - description: channel 0
+      - description: channel 1
+      - description: channel 2
+      - description: channel 3
+
+  reset-names:
+    items:
+      - const: apb
+      - const: ch0
+      - const: ch1
+      - const: ch2
+      - const: ch3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@13050000 {
+        compatible = "starfive,jh7110-timer";
+        reg = <0x13050000 0x10000>;
+        interrupts = <69>, <70>, <71> ,<72>;
+        clocks = <&clk 124>,
+                 <&clk 125>,
+                 <&clk 126>,
+                 <&clk 127>,
+                 <&clk 128>;
+        clock-names = "apb", "ch0", "ch1",
+                      "ch2", "ch3";
+        resets = <&rst 117>,
+                 <&rst 118>,
+                 <&rst 119>,
+                 <&rst 120>,
+                 <&rst 121>;
+        reset-names = "apb", "ch0", "ch1",
+                      "ch2", "ch3";
+    };
+
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
