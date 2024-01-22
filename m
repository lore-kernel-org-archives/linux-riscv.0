Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E740C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKEzMAT9FgETeWkeUgwLUew548BlTbBB01sjfON5pGA=; b=HMvwe5yIFXXjV6
	8yuGRjFRfDgDE9hcizu3tQmgyRztcyxMTWfm14tcKG48HOjo0NDSA3oso7c717a2rW8Hkwbf0H8QA
	9+PnHdxjCKEg4DnCQQdiMoCYdXIfa8qwS2SvaPRoUU7UME4/NIfUyIuPZCRzbq+/NobqKLYLXyJXQ
	xza0mzhT53MlUaiADZ4Z/JHVAC4HnhHOp1HpDEvus5PMnEzX3I3mCUL2WGVpgsZy5MzPERmKjgwj/
	e9CZdhIKAy0egnI7/R+M1XGA2D/icf/p2PrsxFFT5E7pG5zDbrwFIMdsr4LOWxKgS/vj5E2RqgwuS
	TI6bV0z7oCv9sKR32K6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtIM-00C4On-1S;
	Mon, 22 Jan 2024 12:20:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtIK-00C4M3-0T
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A2C9612BB;
	Mon, 22 Jan 2024 12:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AC3C433F1;
	Mon, 22 Jan 2024 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705926021;
	bh=8d4o8b6w9hvJ+ehL0Gmci/4wXJY8BAIb5BXSCLU2izA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0+1BfKXT/Q3WTcV0v6zrkcMPc7AkN+h+88/RrAqg+eqV8RBIoaHAbJhpXzXjsRsz
	 GJl3f+fXohP8flUgMqa9BI4qS2FBiQ9dyCT4MvEbvcvBLz3u48iApRltaJxIKcKMrK
	 9s1FrXOCnW9axnQEJMkr75lPaYRkKQTCmI+xxYau+xQc/4XB5+WF01JEY4lrXX+IKV
	 eavw9YDFVtmp+zwwdxyUgPDl3objzuoXbGs+H2/1C0jlbk48f0OhDcG009hXW903xf
	 GVGQm0Mako7Pxixm/wjC2jBKo/FIiCqLRZum/bT05i32Dd8POLYXCJuaL980eBU67u
	 0o+hXceniIHhA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: can: mpfs: add missing required clock
Date: Mon, 22 Jan 2024 12:19:50 +0000
Message-ID: <20240122-breeder-lying-0d3668d98886@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-catty-roast-d3625dbb02fe@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NrajZ8DKLByCJYLOG7gevyAp2euhGy7v9GQJAOxw45A=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrYlPKSnQ17k1J/f3WvmYO46S1vI6Zc+PX+eiHL7mtm OS1+1xcRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACay9Bwjw6rOzD+StveFa45F 3lLZYsjaYnNviefhqQbpbO5Pw4zdvRj+xxjJuMotUOz7uJhffcfz6Q+9jdZdWXft3VytDs0X8uH qLAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042052_228589_EE1A470D 
X-CRM114-Status: GOOD (  10.17  )
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

The CAN controller on PolarFire SoC has an AHB peripheral clock _and_ a
CAN bus clock. The bus clock was omitted when the binding was written,
but is required for operation. Make up for lost time and add it.

Cautionary tale in adding bindings without having implemented a real
user for them perhaps.

Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN controller")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/net/can/microchip,mpfs-can.yaml     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
index 45aa3de7cf01..01e4d4a54df6 100644
--- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
+++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
@@ -24,7 +24,9 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    items:
+      - description: AHB peripheral clock
+      - description: CAN bus clock
 
 required:
   - compatible
@@ -39,7 +41,7 @@ examples:
     can@2010c000 {
         compatible = "microchip,mpfs-can";
         reg = <0x2010c000 0x1000>;
-        clocks = <&clkcfg 17>;
+        clocks = <&clkcfg 17>, <&clkcfg 37>;
         interrupt-parent = <&plic>;
         interrupts = <56>;
     };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
