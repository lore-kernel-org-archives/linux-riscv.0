Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FE6C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 09:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p48XahplkdU6RgJtIbtEZSQpmzUU81/oPhajYha/WyA=; b=Knl9nL7NYfeauz
	VojqR3EM/tKz8z63tVZK8uYrUeAS7g1SBC06QO//O7tAqx7DNICcUX7XZbaYzV366i8vnU0edX1m+
	7NmYbxnbsbu/1TCuAPeXqhDpzLKVxgbjkKG1/d4EoMDzAUyWaLsoSUJMeSfxW5hczE5NO/1RRVEsq
	7JWA8ZsSEg1LYC+WwkMzPuiIH2BwzcSyTETzxn06cq7KJ4obhI3Zn39rrM06xCuMVGJHh1WxhMj2U
	Vbn3feeGgqZMWL1/RxVfWii/l43xqVakVhXZvRF0SFTFtOYHIwMOxNZohplU7ywmYdAvuOZaxReRA
	hNr5E2q8cwZg9GLStlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlpG-00000005KPQ-1cr2;
	Fri, 01 Aug 2025 09:13:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlpD-00000005KOR-2r0f
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 09:13:16 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6377A2072F;
	Fri,  1 Aug 2025 11:13:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIxTaEIjrnft; Fri,  1 Aug 2025 11:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754039593; bh=0a/cTE0bx1ATJ5XeKNodUXK3aNY1rEiyvhz5v3jv5T8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eFJntMlvqkYUyfSsujXcVIBs5oApoYhdSGJGyQIYLP71GO2TqgTlWq8dEJtoB/vhD
	 RftaFO0h68vB5P0f1aixtY4w+J6skwOr73EtHBvnOl0HSZly+axLy+TOvq3gaLWiSF
	 aMKQXMEkygd8H4h+L5j+j6sISNNuDCaHMMZJ0TcN11pZHWiTyDvk2J5TyGdNtiNVgf
	 G3j+CTaIBZq0F62HYmX+5K/dMYcIlVK34qIp1o69P757ZSHuwX+Aw1WqcgzbNwEw10
	 vcgk45l+5Te7bEj7vQ6/noZXUurs6g4EIxOjVUk6SfhCvcJ7grfc4dXqmGKa7L2Uov
	 uHUeGpH2E5UYg==
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
Subject: [PATCH net v2 1/3] dt-bindings: net: thead,th1520-gmac: Describe APB interface clock
Date: Fri,  1 Aug 2025 09:12:38 +0000
Message-ID: <20250801091240.46114-2-ziyao@disroot.org>
In-Reply-To: <20250801091240.46114-1-ziyao@disroot.org>
References: <20250801091240.46114-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_021315_854555_CF1FD8E5 
X-CRM114-Status: UNSURE (   7.53  )
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

Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
Signed-off-by: Yao Zi <ziyao@disroot.org>
Tested-by: Drew Fustini <fustini@kernel.org>
---
 .../devicetree/bindings/net/thead,th1520-gmac.yaml          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
index 6d9de3303762..b3492a9aa4ef 100644
--- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -62,11 +62,13 @@ properties:
     items:
       - description: GMAC main clock
       - description: Peripheral registers interface clock
+      - description: APB glue registers interface clock
 
   clock-names:
     items:
       - const: stmmaceth
       - const: pclk
+      - const: apb
 
   interrupts:
     items:
@@ -88,8 +90,8 @@ examples:
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
