Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08831C3DA70
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvKHU7W4+8KUMybe+drDb531FlL+RHaH+dyspDEbQRc=; b=PiNkmV4AnQe4fA
	1Sj/rmMJkTQUVjtvE7uDsTYCDDh1W+1LwRbA46Pahw5YHG3SwW+5Y74MiP5XamoGQRbl7loCDKwHp
	7le1SIg0QX1JzPYNCmL3vvZJXRG5z/a0SgS9Q+K21qrYt356LtZxN0qD9lOcsDDxxArXd6gMEMxmc
	rZUo23KYWD4FmoO67VBr6iuWeVS5JRF6xFh26wMPXTgwBdvDdgjPyHCinoSrpPjwcHn3p9rbVuSxh
	GGZVVEl1mr7A44YuOFKlEG2azo57hWWeMZQub8lVqKMt/a51UGYuruB3K73Lw1NE1UYqC0JJLeTsl
	vUMHy6ZICy0tDHvw/qFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDgz-0000000CGhH-0URx;
	Tue, 23 Jul 2024 11:28:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDgt-0000000CGet-065K
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 11:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734103; x=1753270103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6aVvjVowW9Wu+EIEcex8bxj0klOHutOMqoPmSgWOOqw=;
  b=bEXycyLTVSc8WkcuWdq2RylwJ6P9ZxKHT7BGKxa32RF5mVlzRNpsoGSa
   Ra7GyLJtDs2V5PfB40fKiFkxnJEqfUxD1s7hTnE/SDe6P43Dc3zTsrnBD
   Wwm+X9CGxYM6T0FBtjP6HH0o8Ism05rDXJix0q0DLfbrkJ/Q7AExJEJFH
   hzNT9jq3KOKPbZaHvUyC7mwDjw21wn8p4yx4M5goTQqaB69Qhmn+WO9+/
   JXppc9YRTVYoP0QgXgWf6itDrl3/u696ONtefYcHqtFrFX0qsX1F62zMB
   5VnYy93dsUhzz8d7lT53sbbf2PKNXAaIireAT/mSkhxuyzn0v9zyAIoPn
   Q==;
X-CSE-ConnectionGUID: S6DrTYNTSQStcH62wvxgTw==
X-CSE-MsgGUID: Oc+XHPzzQEGWFtnBlzp9Bg==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29574953"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:09 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:06 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 2/6] dt-bindings: interrupt-controller: document PolarFire SoC's gpio interrupt mux
Date: Tue, 23 Jul 2024 12:27:11 +0100
Message-ID: <20240723-uncouple-enforcer-7c48e4a4fefe@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3570; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6aVvjVowW9Wu+EIEcex8bxj0klOHutOMqoPmSgWOOqw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ/fvPrujVDn3ikZUmUtEaYLhwiYpk0t3l5+crHYgY5vF kpxDHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIOCfDX/mTgiFaXoHfTtVwTftw3f vEqgXved/r/tBkPM8pHCy7kYXhf6TmyUvzXJ2iP/0XkWHd6y55TPLv87iVNS+0r3JPO3CjgQUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_042823_092481_472FB013 
X-CRM114-Status: GOOD (  14.63  )
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

On PolarFire SoC there are more GPIO interrupts than there are interrupt
lines available on the PLIC, and a runtime configurable mux is used to
decide which interrupts are assigned direct connections to the PLIC &
which are relegated to sharing a line.
This mux is, in our reference configuration, written by platform
firmware during boot based on the FPGA's configuration.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-gpio-irq-mux.yaml          | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml b/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml
new file mode 100644
index 0000000000000..89ed3a630eef3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Polarfire SoC GPIO Interrupt Mux
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  There are 3 GPIO controllers on this SoC, of which:
+  - GPIO controller 0 has 14 GPIOs
+  - GPIO controller 1 has 24 GPIOs
+  - GPIO controller 2 has 32 GPIOs
+
+  All GPIOs are capable of generating interrupts, for a total of 70.
+  There are only 41 IRQs available however, so a configurable mux is used to
+  ensure all GPIOs can be used for interrupt generation.
+  38 of the 41 interrupts are in what the documentation calls "direct mode",
+  as they provide an exclusive connection from a GPIO to the PLIC.
+  The 3 remaining interrupts are used to mux the interrupts which do not have
+  a exclusive connection, one for each GPIO controller.
+
+properties:
+  compatible:
+    const: microchip,mpfs-gpio-irq-mux
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupts:
+    description:
+      The first 38 entries must be the "direct" interrupts, for exclusive
+      connections to the PLIC. The final 3 entries must be the
+      "non-direct"/muxed connections for each of GPIO controller 0, 1 & 2
+      respectively.
+    maxItems: 41
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    irqmux: interrupt-controller@20002054 {
+        compatible = "microchip,mpfs-gpio-irq-mux";
+        reg = <0x20002054 0x4>;
+        interrupt-parent = <&plic>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        status = "okay";
+        interrupts = <13>, <14>, <15>, <16>,
+                     <17>, <18>, <19>, <20>,
+                     <21>, <22>, <23>, <24>,
+                     <25>, <26>, <27>, <28>,
+                     <29>, <30>, <31>, <32>,
+                     <33>, <34>, <35>, <36>,
+                     <37>, <38>, <39>, <40>,
+                     <41>, <42>, <43>, <44>,
+                     <45>, <46>, <47>, <48>,
+                     <49>, <50>, <51>, <52>,
+                     <53>;
+    };
+...
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
