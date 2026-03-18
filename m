Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7835B103E164
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHw5LNCdF5x+rGM1dUBliTaIFymXyCIOX2p50p5IR1s=; b=GQeh1jVDEITkLK
	hSKlOo56rSLjI0v68B8h5HD/kAp0gqXERgYVo0SkHUxOQieluwH1L1WUIMmTJdI4YDMYsbgsP4m7X
	KAFp/h4LpEri7ZeazBQJbv4nuKum/wulsrbpm3MV7KJViYT4+mh97O+aO5X2wxOzwzZPbx5J6jMd9
	Tt5IdMXdpSv3M9WksX/O3EHx1ozOkQsAdsnZTnn7f3WgKBPfpX7CV61gwLIdVVs92ZT2OzkdmWnMs
	VeyKC/Y23rSCPz0XkGokouacw1aY/0/MI2Ye+cvLgjAt4z/OqPrle26iZVsjYGeVZI7lFPH/FmFFt
	7ggewy1rBex9ebRe4FmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ohq-00000008GaC-3J6q;
	Wed, 18 Mar 2026 11:04:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oho-00000008GYc-023L
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 11:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC37F43DA8;
	Wed, 18 Mar 2026 11:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D8FC2BCB2;
	Wed, 18 Mar 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831887;
	bh=7rNVad+B7+QaXsOmWf2AwAwbqZ0cbbd/BzWX6Rw2CF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gdd4xjR+aoSrnT2aU4PCaudtHFjxR/RcSD6iG2HqgqmptJBvtIdA42vqcb8Zf5ymv
	 +b+GU0vL5sb+qglnCk+0FGFxZlmXLL76DY0gNf47b8FielnC41/2nahumdQwNbXyIm
	 zXBz08HIQbrZPTPfkwARpAgopIHsIP5DStkS3r+tZAr7hIsnMYjLkXUPWuszKELxFY
	 37uOTk8mbxB1Iicn61RQ1UMIJ/PPdX43duB71ARmvbvj9IMBo+vnnuzdLZIo6DdwU1
	 4Tj12EOwvIv+CkDo8QAWsI7SBfHtwJzup/7b5QcSlWlDcIBnaMSSYoAYVbLPt8orM8
	 x64UgwTvoLvOQ==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 1/5] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation
Date: Wed, 18 Mar 2026 11:04:32 +0000
Message-ID: <20260318-fondly-tradition-90b8241f0cc8@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3190; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=27/jkLY5kQVq9jTRVF6tl1zmApScLGF112Z5WyTB0Qc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm72o6s9HuxjM2yme9l5esMlVvTJJ/PMltlw2R67ZVNw sLtZ8tedJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiecaMDP3H4mX4dWriCtXC QoqPyZYt5Lqx0FHIYLnd1G2RfIsSNjAyvJ1QGbRzAd+mrIidVtIlHwMsTP/NFNzM63p/7v/3C/b H8gEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_040452_089992_66509592 
X-CRM114-Status: GOOD (  13.42  )
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
14, 24 & 32 GPIOs each. The fabric core, CoreGPIO, can of course have
a customisable number of GPIOs.

The example is wacky too - it follows from the incorrect understanding
that the GPIO controllers are connected to the PLIC directly. They are
not however, with a mux sitting in between. Update the example to use
the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
the example - rather than the strange looking, repeated <53>.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index 184432d24ea18..9b8c58f391f40 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -62,6 +62,11 @@ allOf:
           contains:
             const: microchip,mpfs-gpio
     then:
+      properties:
+        ngpios:
+          enum: [14, 24, 32]
+        interrupts:
+          minItems: 14
       required:
         - interrupts
         - "#interrupt-cells"
@@ -82,18 +87,19 @@ examples:
         compatible = "microchip,mpfs-gpio";
         reg = <0x20122000 0x1000>;
         clocks = <&clkcfg 25>;
-        interrupt-parent = <&plic>;
+        interrupt-parent = <&irqmux>;
         gpio-controller;
         #gpio-cells = <2>;
+        ngpios = <32>;
         interrupt-controller;
         #interrupt-cells = <1>;
-        interrupts = <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>;
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
