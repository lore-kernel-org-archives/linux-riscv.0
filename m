Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809EFC87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OT6mJw0kg+/g/yiccQ9Kmmtdua/7QzYma2+4S4JrJ2I=; b=Sx4M5yjeGYKEW5
	T2yC4VanxWadnYCdLrkHc0Pwq02Ge2Nbv00Uqgk1NnXIJpxex2enYjyn/IBXCxFurdw8ZWbaU28hq
	+jVA1dmizrsBzT21UqTNorGbuZkABf5WwUibxWkRyKyLxZchqK4r4ueD4EstMayqC5XiimkwH7/dG
	wf+oviWBWpqk7MuactR1cXsD+kLXASedIVsfYOCpOhs7gz0zECjPCK/YUT1zPnaJ48vWxyY+fvCRi
	TwWCFCuXACHicBGGpqj/U0dPMeRKPqNtt2t9xlMQUBs16ixK1RP2NlkPH57ZXwpwwQzsfSeN4kXoK
	5dg+gny++taVbrfLavAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugh33-0000000GS7j-2vA5;
	Tue, 29 Jul 2025 09:55:05 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggmg-0000000GPnJ-1gm5
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 09:38:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0EF442047B;
	Tue, 29 Jul 2025 11:38:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msMHQLLUizam; Tue, 29 Jul 2025 11:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753781888; bh=KckubxbZ+pvtLSm9LYRkKrPsFoinp6cu370w3zIGmtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YXLWxqz/tf0VbrkuyE6TpM6Wc6BNMKRNLm//4y/sVJGdvwV4giddqf94ptF4lG07a
	 yVCMtn86CcTdR06cI3HgX1u5w4uNHWW8SErTcEymAhRkb18KLGD8/HB2Pt4yVCB/aW
	 40hWtan3L5szusC0X8X1TFYzgtFT9vnee6UvE7vzMqqi02sGMh4dN+ye0OyP3YlZb+
	 3jhBFgFHXq7lbtRhveJY2Qrnms/odgyc57B4FjrbfPNd8yBKUQ9wrtPJSIll5P3AA4
	 l9ykh3o7FozLnzmFNRitHCmCjdq0xW9USV3ssvre2Ri8nE7c7Qa+699SdYUJUuDKL9
	 bA0uNDHwjwTDA==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH net 1/3] dt-bindings: net: thead,th1520-gmac: Describe APB interface clock
Date: Tue, 29 Jul 2025 09:37:32 +0000
Message-ID: <20250729093734.40132-2-ziyao@disroot.org>
In-Reply-To: <20250729093734.40132-1-ziyao@disroot.org>
References: <20250729093734.40132-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_023810_572878_9AB480D6 
X-CRM114-Status: UNSURE (   8.62  )
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

Besides ones for GMAC core and peripheral registers, the TH1520 GMAC
requires one more clock for configuring APB glue registers. Describe
it in the binding.

Though the clock is essential for operation, it's not marked as required
for now to avoid introducing new dt-binding warnings to existing dts.

Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../devicetree/bindings/net/thead,th1520-gmac.yaml        | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
index 6d9de3303762..fea9fbc1d006 100644
--- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -59,14 +59,18 @@ properties:
       - const: apb
 
   clocks:
+    minItems: 2
     items:
       - description: GMAC main clock
       - description: Peripheral registers interface clock
+      - description: APB glue registers interface clock
 
   clock-names:
+    minItems: 2
     items:
       - const: stmmaceth
       - const: pclk
+      - const: apb
 
   interrupts:
     items:
@@ -88,8 +92,8 @@ examples:
         compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
         reg = <0xe7070000 0x2000>, <0xec003000 0x1000>;
         reg-names = "dwmac", "apb";
-        clocks = <&clk 1>, <&clk 2>;
-        clock-names = "stmmaceth", "pclk";
+        clocks = <&clk 1>, <&clk 2>, <&clk 3>;
+        clock-names = "stmmaceth", "pclk", "apb";
         interrupts = <66>;
         interrupt-names = "macirq";
         phy-mode = "rgmii-id";
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
