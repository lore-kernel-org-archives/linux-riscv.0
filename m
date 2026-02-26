Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B2AFC592B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sK22ZAPUwUe6c/N0lZfKJ63IMvBbzI1mA8U3JsSK4Rk=; b=EqPXMgcW6asmUd
	KZAQLGiG+G3roGNtjpF7FLfrTuAPoycmzidQ/TtFLgWRIAlQiUtVDVPS+7MsS/79Rgl45U0dX003S
	xecbzdtIfa/DAKw9OUO5H/q58BTpE15L7P3pj78WeAWudLEcw4xiM+HlnVH/mBrDRxtuSfjK2sZsI
	ytQBph55GD34wCxCbYYCfEzLtn06yjMumjzDYeoPtJWQUh7mUOi6qucbDJZBKbJJAAYSNOnlPcqbG
	JNcKdeDpdbhtW8sbfAR8vOl5se7GwZtok9Ki3GCloiDXVemtZJlt4TUE8uddDLZd5P+7wO8d2T0Pk
	QtxKa/DYkMrjRl3R/H+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZA6-00000005yuY-3vJl;
	Thu, 26 Feb 2026 11:04:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZA3-00000005ytg-3MOj
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77502417AB;
	Thu, 26 Feb 2026 11:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1075FC116C6;
	Thu, 26 Feb 2026 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103843;
	bh=cRLy02UueWkhYtPAXqzBTz1JMrUCbuvc3pWwyLTa2RQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AgsAhSG5LlZBGa6F6Ms0QXLm4aksoIvTotknOrr7O721zePHDEvwBY27NDHEpcWH0
	 Cfd/DSM1PFDTbCAEuFBG8DbPdtcx7AYEVKse4r3ombyjyWLn0kZX7AN1Hu7d5Ncehb
	 hPrjMVKefihFZXdtoGoLnJb/z8dJuPmnmPW2AQes+qiFRxTBPzO/EwAJIJzAVEP5tE
	 vuNHlN9oD9DFAJQQ+3h9Fc+g9yAA1FYPuMnxLoDpnH6CHyLVIvW384WDXZICf64Iz5
	 ZoW3KutaArRsluYmqtmH8WeqxMH/bYbkeqVYnvcqjqz6lgePJXtw45NR36YWOBhDyY
	 nWkP3bLeoWCDg==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next v2 4/8] dt-bindings: net: macb: add property indicating timer adjust mode
Date: Thu, 26 Feb 2026 11:03:19 +0000
Message-ID: <20260226-sprung-universal-b3568492b3f0@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260226-snowshoe-amusable-6716d4ddea11@spud>
References: <20260226-snowshoe-amusable-6716d4ddea11@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=h9iZgeoyt6LhJ0dyrZChFn6X/fZvC/7atHi56cOprkc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkLNMqLKxUv/BQNs1XyMVogt8VwwX3nLzv4ymWZLU898 7y8VL2yo5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZocnIcL+48M76bJPAm7xx SYcqTk6/nNsovqBsdWNEgIn19TMT9zL8r1XZpfWj/XkKb74+31LukJjIpBX/5bk6r7z+vr7J4Co zJwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_030403_879757_C5C58285 
X-CRM114-Status: GOOD (  12.02  )
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

The GEM IP has two methods for modifying the ptp timer. The first of
these, named "increment mode", relies on software controlling the timer
by setting tsu_timer_incr and tsu_timer_incr_sub_nsec and performing
once-off adjustments via the tsu_timer_adjust register. This is what the
macb driver uses. The second mechanism, "timer adjust mode" uses the
gem_tsu_inc_ctrl and gem_tsu_ms signals to control the timer. These
modes are not intended to be used in parallel, but both can be possible
on the same device and which mode is used cannot be determined from the
compatible on all devices, because some users of the GEM IP are SoC
FPGAs that permit configuring how the IP is wired up.

Add a property to indicate that gem_tsu_inc_ctrl and gem_tsu_ms are wired
up for timer adjust mode.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/net/cdns,macb.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index cb14c35ba9969..292279499d9e6 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -120,6 +120,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  cdns,timer-adjust:
+    type: boolean
+    description:
+      Set when the hardware is operating in timer-adjust mode, where the timer
+      is controlled by the gem_tsu_inc_ctrl and gem_tsu_ms inputs.
+
   cdns,refclk-ext:
     type: boolean
     description:
@@ -186,6 +192,15 @@ allOf:
       properties:
         reg:
           maxItems: 1
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: microchip,mpfs-macb
+    then:
+      properties:
+        cdns,timer-adjust: false
 
   - if:
       properties:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
