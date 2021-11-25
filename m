Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDD7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZ7FNw3c8a3b6eGArNUq5cVbXWhhQQ7CFln33QjsbAo=; b=erNtnytPRZE9Ts
	D3Jw6WKA5I6v2/SeiFX58bBnZIQSpukK/2AZDdqa9CCUoog+JWbaXBCAq209Lt/G8imbche3PUMRn
	TNkg2Qf8LajaJOCwA/F8dstMtey3wB7byCIVQeMhAm5tIhh1KfWYw3lItWzW6GjH8WBsnhEkXObfI
	cweF98IyRE3ELcI16YDqeF7TRjOE5ok1OotMuK7LIUEg5Pzu6H5awX41NS70Z4BZP37qS68Mb8+Pw
	qRwTaaOuTulnUNW5C9Cwp0z1IskJGKxW5wXhQCih4S08BgnLQbS6PfLB4fj+Q/T1p5NgT0GIXWjrA
	LyY1Hqk+E6dP8xmL0fCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGYQ-007yxa-Dt; Thu, 25 Nov 2021 15:20:54 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGYM-007yvK-Rb
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:20:52 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by xavier.telenet-ops.be with bizsmtp
 id NfLl2600q5CGg7701fLlNC; Thu, 25 Nov 2021 16:20:46 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGYH-000DKV-EX; Thu, 25 Nov 2021 16:20:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGYG-000gKE-MT; Thu, 25 Nov 2021 16:20:44 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Yash Shah <yash.shah@sifive.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dt-bindings: gpio: sifive,gpio: Group interrupt tuples
Date: Thu, 25 Nov 2021 16:20:43 +0100
Message-Id: <20211125152043.162655-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_072051_429152_B67D7373 
X-CRM114-Status: UNSURE (   8.18  )
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

To improve human readability and enable automatic validation, the tuples
in "interrupts" properties should be grouped using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index c2902aac25145205..e04349567eebb72c 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -77,7 +77,8 @@ examples:
       gpio@10060000 {
         compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
         interrupt-parent = <&plic>;
-        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
+        interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
+                     <17>, <18>, <19>, <20>, <21>, <22>;
         reg = <0x10060000 0x1000>;
         clocks = <&tlclk PRCI_CLK_TLCLK>;
         gpio-controller;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
