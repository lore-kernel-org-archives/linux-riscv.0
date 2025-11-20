Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EE4CF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3rZwvLSgMNd8RMRR2qp00rMNbb2ubKVttFU/Hho69U=; b=2ifEZhqkUXB/Yw
	PYHjC6WE3RUrM2wKLTAwCEIWtUa7PQ32AczxXF7e5MxkhFwmgtudmlbYg3VCgAlZ9UXL5XMaz4DS5
	fAlXLQOccgpLbIlRe9LgFA9eDoWkr8ZCril03yfWqEPua/o2AadiPksonE7dTF6hoIXmIYLBFya32
	9ruz0gVLjgOzHUozvHYAACqSjIqkn22YhzeVfA/9ckJ8Oui3h+mBtMhkWZwhuyvxywHXrQ8lGkn7G
	poM94Xd4Yq29qM43PfwZy2IGrSyDnqBEFhk+YV+GyYlKbTrkNPV4dltozsxnN+oswyWh3ECZGO5WU
	VnWqSniKf2FFQLujoafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Uk-000000070Xv-29RV;
	Thu, 20 Nov 2025 16:26:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Uj-000000070XF-1yXG
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1FF2601BB;
	Thu, 20 Nov 2025 16:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E8AC4CEF1;
	Thu, 20 Nov 2025 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656012;
	bh=rkNBjbwLoFq9BqcRqqIp3a/rpQWG6VvjMT67WwIxYzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OuBwFOIQtvJZo4UvFhnNNYeKkLD2w5SzhLhRQTWxfYBdQ965AZrT+gm8T05WDE6/c
	 roNe31hpHWTh7xmbB+ZM4LrItzMwgO6mshm5Eq67KB31QjgKSGkW627WPO2DdGpYym
	 NvRXeKY9WyO8f6wTfOdew+02CiXs3iHjshf8h8V/SWdJW4JJX1tU7v293SR7p6h4kE
	 POfCwD7TGZkWoD1z8xHKlW59FVmuGGzIrO1ZpOXNGhGU1CGraNkrci4gqW7vdkzrIl
	 M/3lWIYLbAM+OTEYK+R1mTfT6f88RBRXKT+n+/7tsSWfQMn37wHz34XSPGIS3IkwZJ
	 C9VsCmHpMx3wg==
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
	Abin Joseph <abin.joseph@amd.com>
Subject: [RFC net-next v1 5/7] dt-bindings: net: macb: add property indicating timer adjust mode
Date: Thu, 20 Nov 2025 16:26:07 +0000
Message-ID: <20251120-drudge-disloyal-9b8a88079905@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
References: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NDamtq5JNE/kXNNE44aa9YujEMn703V/vjt2FaQ3+K8=; b=kA0DAAoWeLQxh6CCYtIByyZiAGkfQRuhTkDIGxVQJ8t/SMCYg4kOkb8JzlWdyFTz6FOW5pgU9 Yh1BAAWCgAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmkfQRsACgkQeLQxh6CCYtKeZAD/W+QW 1evt7Irt7dIdI65P4eITbL18e/FN8tPb5HbKQyQBANeQMpJgIgUt6nCK2WOnnI0Hu3iQkOkY8mH UTLhpneMM
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/net/cdns,macb.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 1029786a855c..4cea288412b5 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -116,6 +116,12 @@ properties:
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
@@ -182,6 +188,15 @@ allOf:
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
 
 unevaluatedProperties: false
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
