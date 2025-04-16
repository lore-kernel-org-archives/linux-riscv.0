Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E7BC369BD
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 00:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJNdaVEtmPccBDvXRulGkYx+Y/Wy1Ev0ThzWZ15ZKyY=; b=iLqQsQFd5Is6hc
	Q/upESxSLt4+lsBH9CejvJAXacf1zeMLFtNvbY/P6NJEdaOnRToMAoFp/Y1Ucc5eav44F8HX+U6fQ
	PVmhqB1/miXrIphcUX+uMwvdFxp3zKFrvqW2NB3GY2svcsNN6VVlTCvORMNOD7UN9GdHAsxsgrwev
	L1wJI0vAs+gsT76AMSIcuJUNMhGHAdTfm/PAlj9X2ttzDSVbUgmGdiPopklu0Tz3LIWPc9kmlRHFk
	fD5jpuv96vYEWN0Lt7Q9EKnKLxGD0/pF0CtL0qFdJvqu5GWmVyh/aQg+G4bXWHw0Kjxjo4KSW6au9
	albLmMdEJ19x/tDvePPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qT8-00000007cXo-0Zml;
	Wed, 16 Apr 2025 00:17:34 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qRb-00000007cDj-1zdM
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 00:16:00 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8AEB0343029;
	Wed, 16 Apr 2025 00:15:55 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 16 Apr 2025 08:15:27 +0800
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: spacemit: add clock and reset
 property
MIME-Version: 1.0
Message-Id: <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=fq5AgxXL/Rbjv2xhS5kCE8LhEurOI0DQa//wPMhgu/0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn/vawMQPl39xdOBu0MVmeiRBAO6QN71bJ05Fhj
 KvIKdPMxXSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/72sF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277bYOD/9psoPxRAYyY97+cr
 7B9lUH1knhfElEXQUcSNxBUIyoXXnLi7sZLtF42kZNoO404rmnH0HGsi7tdXcDmhWsqz1x4yUUX
 NpL33+zkZYaWDQvGX6pcmjuUCQNAjjYqP5UhVKf+HWjVty6XasLtMJleKmK+AnU+J3byeAWNkUh
 5Z2Pq8RpNjjmBifqytwbRp++wb2wlDpYDdEvhzvWmEOTQaIhH+6L4z6snkVzPVo5sUSRyJVUZBL
 U1YKLUNTYJKxBiXmeGTgMB5f0Vy9v4oOL63buQh5aplEho7JyZUdGj0XUDG2BYkIm/kbwiSWK0p
 8B0Pu6kplkMWHhG5afP1x9Lp3HKUdCoQLz46LHElcBT6+MCnaRN0dhOfmZEg9HG9+7sty8mSPSI
 nAO9I3WHclWHOcmUVRuB77h5rpaR7zrbUoa15NzLun0RCRETgYV9u3pXuuAEpVrU4aOF+54fBev
 ta5tJUDEtBNrCGnNrjtgJ5Qfs449iSCxbm/eLP7zZ5q5r4+VLl3mHh2Q/kMKmU+HyUkli1m/zQH
 iDssGyfdIK3uMIpfTQPQZBsS46V6ua2FKRt/iI5K+B/FtsvTQ4DLSjtC+6kD0/WmoF80H/B0ftc
 SKAuBcBorwsNVek2eDeT8S2R+yRMV9u4/O/U0lziDao9tiIe4MEhoNQeuUNJEVUC1qRQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_171559_551209_D44923A6 
X-CRM114-Status: UNSURE (   6.25  )
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

SpacemiT K1 SoC's pinctrl controller requires two clocks in order
to work properly, also has one reset line from hardware perspective.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index b01ecd83b71b5e9f47256adde23bc8b183bef05e..d80e88aa07b45f4a3d90e8217caf93d32655927d 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -17,6 +17,19 @@ properties:
     items:
       - description: pinctrl io memory base
 
+  clocks:
+    items:
+      - description: Functional Clock
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: func
+      - const: bus
+
+  resets:
+    maxItems: 1
+
 patternProperties:
   '-cfg$':
     type: object
@@ -94,6 +107,8 @@ patternProperties:
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
 
 additionalProperties: false
 
@@ -108,6 +123,9 @@ examples:
         pinctrl@d401e000 {
             compatible = "spacemit,k1-pinctrl";
             reg = <0x0 0xd401e000 0x0 0x400>;
+            clocks = <&syscon_apbc 42>,
+                     <&syscon_apbc 94>;
+            clock-names = "func", "bus";
 
             uart0_2_cfg: uart0-2-cfg {
                 uart0-2-pins {

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
