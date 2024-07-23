Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1FDC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0MG5VrsFJdwf7tD+nA7yTlY0M2XkufDhJpboYnyC8A=; b=g1tLJHfJpZPFiD
	XSTawA0VnkjzEPJ2HeKvDHzwbwvOj5hq/6W4cae0knnfZ6SkZSZzQuayhxRKfC1LK2BuwnY9V0czI
	BkXLgmloWKt6qViS7gHHxtWeaoUWAfMWXQNBMaeRUL7lNrnaugZhlONWmilr/k8q2WtVc3U2vDAAx
	BZdPWTzROiHxehFfsB/MpkjSnWtYfWHaprlB6yjLZUZNsCb8p0Jdx76fCnTC4oHZzENm9V8Xn01X8
	D1rFCBdZb+55f2gmMTdcyJiQoEJdn+CXWr8fRwbIY62OOAiOQoJsHvM0QyrJAavITrzZ/ONjw50uo
	6Ley7Orp0atM/UmObt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDgy-0000000CGh0-22jN;
	Tue, 23 Jul 2024 11:28:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDgs-0000000CGeE-47KA
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 11:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734103; x=1753270103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BY9RX9OmhdiwEixbfaIsfq/KameCCnfNFWrW+iwHgQc=;
  b=gJQlAFSFj9oKlsYUJGhAHsiYtUwlQnIptQtXx6XMrR7keKMppC/BxjbP
   n/ETSI5DT2oLVB8kkEH7x2+EocLxMlnJ5uu8ZF/Q5cYySyN9V6GDFPO1Y
   L3KUyy3T7UAej2XROdYDpAGZNEGyyUFnkM83NEnCTyqh6FGpTdFLqPFIv
   znlol2j3pQZdRhlqBaNr1VcovHGQzTfgNA93O2yPvLA6p5thB1eT0HwkI
   zzJEAKR2UAtgD8/HFWSpBYU46ZnEC6O001UOh/S4KkB66sh4M5Hf5eJ5z
   rYiXltpdfrbfB6eP4VOAw5ugwUBX5ozeyPjez2E2R+JPC2d7AAEOeyqnl
   g==;
X-CSE-ConnectionGUID: S6DrTYNTSQStcH62wvxgTw==
X-CSE-MsgGUID: jdFJGOP4SlSGNjM3ngZfIA==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29574952"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:02 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:00 -0700
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
Subject: [RFC v7 1/6] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt descriptions
Date: Tue, 23 Jul 2024 12:27:10 +0100
Message-ID: <20240723-trash-issuing-e2bdd55b764e@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3445; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=BY9RX9OmhdiwEixbfaIsfq/KameCCnfNFWrW+iwHgQc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ/cH1BazWMXpyim07n7hOkPoNHPk80lTHsj7HORz/Txn X3pfRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZydQ8jw5opU+9Y9M4u2LPv/8//zt 80r9z9cjhU3Vbv4iozjXpb8xsM//Qm2gm97fJ0+PxJ7UaT+zEJtsfXr+wySp17hnG/9710TSYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_042823_057980_6D119581 
X-CRM114-Status: GOOD (  12.57  )
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

The microchip,mpfs-gpio binding suffered greatly due to being written
with a narrow minded view of the controller, and the interrupt bits
ended up incorrect. It was mistakenly assumed that the interrupt
configuration was set by platform firmware, based on the FPGA
configuration, and that the GPIO DT nodes were the only way to really
communicate interrupt configuration to software.

Instead, the mux should be a device in its own right, and the GPIO
controllers should be connected to it, rather than to the PLIC.
Now that a binding exists for that mux, try to fix the misconceptions
in the GPIO controller binding.

Firstly, it's not possible for this controller to have fewer than 14
GPIOs, and thus 14 interrupts also. There are three controllers, with
14, 24 & 32 GPIOs each.

The example is wacky too - it follows from the incorrect understanding
that the GPIO controllers are connected to the PLIC directly. They are
not however, with a mux sitting in between. Update the example to use
the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
the example - rather than the strange looking, repeated <53>.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d61569b3f15b2..eb7dbf1668285 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -22,7 +22,7 @@ properties:
   interrupts:
     description:
       Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
-    minItems: 1
+    minItems: 14
     maxItems: 32
 
   interrupt-controller: true
@@ -39,9 +39,7 @@ properties:
   ngpios:
     description:
       The number of GPIOs available.
-    minimum: 1
-    maximum: 32
-    default: 32
+    enum: [14, 24, 32]
 
   gpio-controller: true
   gpio-line-names: true
@@ -81,6 +79,7 @@ required:
   - reg
   - "#gpio-cells"
   - gpio-controller
+  - ngpios
   - clocks
 
 additionalProperties: false
@@ -91,18 +90,19 @@ examples:
         compatible = "microchip,mpfs-gpio";
         reg = <0x20122000 0x1000>;
         clocks = <&clkcfg 25>;
-        interrupt-parent = <&plic>;
+        interrupt-parent = <&irqmux>;
         gpio-controller;
         #gpio-cells = <2>;
+        ngpios = <32>;
         interrupt-controller;
-        #interrupt-cells = <1>;
-        interrupts = <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>;
+        #interrupt-cells = <2>;
+        interrupts = <64>, <65>, <66>, <67>,
+                     <68>, <69>, <70>, <71>,
+                     <72>, <73>, <74>, <75>,
+                     <76>, <77>, <78>, <79>,
+                     <80>, <81>, <82>, <83>,
+                     <84>, <85>, <86>, <87>,
+                     <88>, <89>, <90>, <91>,
+                     <92>, <93>, <94>, <95>;
     };
 ...
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
