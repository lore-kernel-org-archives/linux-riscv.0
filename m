Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C478CD11DD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHV7vpFiFtSWKwde1yXA+DyvqXhT6JpM798LuEHs1i8=; b=pKTJPtbnXRZRSh
	fDym7mUBICM1PhXbDBhU6FchKiT8rgEk0bCsc0iXH73PPPVkghzWXIvS6KTUpzfcIbtfsA97MLO42
	f1Uqhhli7hC0z551rnSovzUe71MKiXR2Ljc3BuLIMxjDHJnf4cFN7Efh7FW2KIC3VvpcGeHqeMdd9
	R08Yej9XvTx4J9DSDMjoFSZyiyXWpWk8bsAcIHNfT0DiDRpMSJ+0SDsQlBeBrpEbCvrm6YDkQpCVe
	HzkzhzozN9Yl02KFmLa2kZFh9zocBPwMBXsfENJOnMueC5VjsEJFKOVos2yRXZo/Hja6umhzoKwGb
	OPfExbOVFQOSEAq5OkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSLL-00000008qZZ-3EwG;
	Wed, 27 Mar 2024 12:25:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSLA-00000008qTl-0p9n
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 713C4CE178E;
	Wed, 27 Mar 2024 12:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C66DC43394;
	Wed, 27 Mar 2024 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711542309;
	bh=gPsBJl3+lGsrZ281LklEHOtcSRqfcnJMec/DLgQQb8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZW0wI5TcjqElnMJHmeOioieZAl/zxdpw5U71hNTwAiAOmdOqr5q57K4xXpMTNQlBJ
	 6e+ut/LCN1zr7rhWDODQTIhyaGsz/yh0n0UwnqPd2EMLtSGSTH2JBnm0p8kF8FTUWF
	 F/3Gvz8GPQ+FkMlTLULmuhkOMb4LUvPzx++1I+ojrCBvOAX1do3NRcymbivSJA7D2H
	 OX+QqBB06vYQxtVrF3KHwgrhGaxnrPU3HS6SK11uiB0QF3caMzPMbuu+pVKBYNfTzz
	 pvSOT4kzC3+TfCifJDNMaRLnoaXfWC2tpSig0c7hZlBJfYf3zUa7w20oWjayF8El8t
	 MOnvJgJ3IHZ8g==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v1 2/5] dt-bindings: gpio: mpfs: add coreGPIO support
Date: Wed, 27 Mar 2024 12:24:37 +0000
Message-ID: <20240327-procurer-rascal-33bca7d5d14b@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327-parkway-dodgy-f0fe1fa20892@spud>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IMTT4E9wFHswzy76N6YWQpUY7X5/7P9UPRxEwIXGGcY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGksAqwlMoeOTjkgsrLk+pXsCh2fyQc/lKY92M0gOH2W/ 432/QYKHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI/XdGhuN8d3y0a4TunTev fNci3W7XI797eZTd4m2zI8QWsjrJPWdkmBsmwLN97pkHCSZ/pzQrpjxmr73q8vSSXd9OEc71i/1 k2AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_052512_446092_056E03D9 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Jamie Gibbons <jamie.gibbons@microchip.com>

The GPIO controllers on PolarFire SoC were based on the "soft" IP
CoreGPIO, but the inp/outp registers are at different offsets. Add
compatible to allow for support of both sets of offsets. The soft
core will not always have interrupts wired up, so only enforce them for
the "hard" core on PolarFire SoC.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml       | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d481e78958a7..6884dacb2865 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - microchip,mpfs-gpio
+          - microchip,coregpio-rtl-v3
 
   reg:
     maxItems: 1
@@ -62,12 +63,21 @@ patternProperties:
       - gpio-hog
       - gpios
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,mpfs-gpio
+    then:
+      required:
+        - interrupts
+        - "#interrupt-cells"
+        - interrupt-controller
+
 required:
   - compatible
   - reg
-  - interrupts
-  - "#interrupt-cells"
-  - interrupt-controller
   - "#gpio-cells"
   - gpio-controller
   - clocks
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
