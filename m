Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60787C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYdMCHS163p4Jfgx/SPbfBiVz6fq6jk7itxsXH9d6hg=; b=vaz5foLfLFv/h3
	ra/pAr2xFvKW2I9WvwwvXs1HPpX94krNATniU70vxIQcZO2deo50nCWQyaeAZLaZYNUSdKaM7r9tF
	wl0pnBpe33oJQXVq8KQ7crFa0SIlddh2nuZ37kQt8ZK6c8LScoAw/3VaGvClVNHKvgoIWWg/pvaNh
	KmZSldX43hG83p5ai7qMXHNC10mphYDefndxYzFzpC8G2DqL9zD62UjVNhDDLmYMV+TtytFRngLil
	CKy7aAvIquqqk5iTC4W5GVaG+R0Gefq8CTqUXDNRoUrrgKINMa86Og2N2M3NXXJkBLAYorv/qHFbW
	NxG8jqyhcChNhdT8N4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV7u-009BXU-Gg; Mon, 31 Jan 2022 11:45:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV7r-009BWJ-KU
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629539; x=1675165539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FOsmUbbny+ixBX3cWHAy4nowHDLKpppGZfGFKSKvMPc=;
 b=jvceUDF/LGMutoP1omwFr++y2Jy0knVJ/MLHt6GVcM8HmZhMyq/JW+G/
 3c6GkPpY53iuwsXZJUU4KszIfGHABqzoxR2cYUX4IBRDvFrrObli18Ac6
 iWcuK6FNX8P9UnEvGy7INuq9FLOAWYvkW8d6gGJ6yL4YsHot7T+d/s7rZ
 AR+gBCf+QqQjB/MxtMUzcI/1opC4DWeqPEAPaud54z/il6PcjjEzzWvFi
 Ugw0rfTxAx6tCufgAq7ws6PAvBJPEFEB+bbIHw2N0Dv7ShXLrvnXMkLoL
 6pKAozSN0nOuD8rmz/ZxGkqbOAxhdJ5y+Mr/dJ0RVhf63dR0BNdBJ75E0 Q==;
IronPort-SDR: F454A3WrrP8zSsgW3ADCsbQeZhdF0hDc2QcfhGt472B+aWTLyRd2sPpc/qMB00RBaf6hAiq5c7
 4Y9Xe11uJzqwn7kvCCNfnf46JQniG15U8spYFCWBsT22nhp2fGgCiZWzeUwK59cxZwTjUTLCpQ
 2g1CsJTTWvJfeUwjBkKCvTG9i8WMUbEhbCUVyImilxodHg03mRISqYXQd+PQ9Nv2xKP7hoJpS9
 2b1/KckhxINvpgmMQWNOA+HzyVasrWS4pJqT2J0YzUZSR+JVoLJN1wAtt0X+tw7OetXxGulFw+
 LPFiuYwUjS4NOgKalW335jUa
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="144390590"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:45:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:45:37 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:45:31 -0700
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
Subject: [PATCH v5 01/12] dt-bindings: soc/microchip: update syscontroller
 compatibles
Date: Mon, 31 Jan 2022 11:47:16 +0000
Message-ID: <20220131114726.973690-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034539_791637_B1A9DA16 
X-CRM114-Status: UNSURE (   8.75  )
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

The Polarfire SoC is currently using two different compatible string
prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
its system controller in order to match the compatible string used in
the soc binding and device tree

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
 ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
rename to Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index bbb173ea483c..082d397d3e89 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/microchip,polarfire-soc-mailbox.yaml#"
+$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
@@ -11,7 +11,7 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,polarfire-soc-mailbox
+    const: microchip,mpfs-mailbox
 
   reg:
     items:
@@ -38,7 +38,7 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
       mbox: mailbox@37020000 {
-        compatible = "microchip,polarfire-soc-mailbox";
+        compatible = "microchip,mpfs-mailbox";
         reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
         interrupt-parent = <&L1>;
         interrupts = <96>;
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
similarity index 75%
rename from Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
rename to Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index 2cd3bc6bd8d6..f699772fedf3 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/microchip/microchip,polarfire-soc-sys-controller.yaml#"
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-sys-controller.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) system controller
@@ -19,7 +19,7 @@ properties:
     maxItems: 1
 
   compatible:
-    const: microchip,polarfire-soc-sys-controller
+    const: microchip,mpfs-sys-controller
 
 required:
   - compatible
@@ -30,6 +30,6 @@ additionalProperties: false
 examples:
   - |
     syscontroller: syscontroller {
-      compatible = "microchip,polarfire-soc-sys-controller";
+      compatible = "microchip,mpfs-sys-controller";
       mboxes = <&mbox 0>;
     };
-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
