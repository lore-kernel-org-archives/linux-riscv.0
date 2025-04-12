Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D5EC369A1
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 06:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGLTUBNo9TLEBckvSQw+x/rJAqxjs1SHFdO/1Onn36A=; b=DeIEA6KVT5gzxQ
	4NnQSb0Yw7QoLQ8WKDw1qgOGvapsN3xTnPmoe0BiRCpk4i5qFZoIUokf/VGY//6r4givnaLQ+4N4I
	WaB96BXfsSDj7P2edy6WIGfHHRXWCtP4wbwqmgrsvAAXwzH07dPFLPMxtGfVS0wyya9HidWqU0CRy
	TESlKWvJ/ukcec/pIIfywo7GvDmW/A1OpZGR6eqgPRG9wGcu7UOmuDkd612GE4ShmD8G7U4MhGX9H
	3zJyuNdKhywNJAp5zkz7cEF4DBbAGyl+PMDil/SQJDtwwMCvONGomX6MhKRKZ7QhAzbU2LqJs02e5
	h3sya9R3eGWDeYCtqZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Up7-0000000FYY4-0A5j;
	Sat, 12 Apr 2025 06:58:41 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Up4-0000000FYX9-3xhF
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 06:58:40 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 65269343766;
	Sat, 12 Apr 2025 06:58:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 14:58:10 +0800
Subject: [PATCH 1/2] dt-bindings: pinctrl: spacemit: add clock and reset
 property
MIME-Version: 1.0
Message-Id: <20250412-02-k1-pinctrl-clk-v1-1-e39734419a2d@gentoo.org>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
In-Reply-To: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=uKJ1ad2lEp8x+k7QGXDQ7nI3Inkr3OfFpOyRlBwB+tk=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+g8PwS5rkTkGPv7pYBtVVDAv2Rd2NhLPo+uM7
 BU/jxS96PCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/oPD18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277VhUD/9Lb/o9rZJSPCqKda
 TIUs4eLUXx5udi7wmK98AsGxqxrv6J8oQkroLcgWMc1j8EWBIw9UASf40zfl8hNGlPVoj9xWay3
 +5qq0tpXOSoXtstuBaynI3dpinDYP6BEGs4IQMOOv5Qa9QA17uKJSJvc9+NxXRPQwad3ECrF60J
 gnDx4KXgg0fUk01V/vb5NWg1HuP1rIrxt/qdlD3ckvU9FFOhtOFAJxeEuZI57kZ/rvNSZTKa+rh
 lTfbSSg9nCzeXcNtFegVTPVJteo4sHKxrQP0mokC+y6AjfA1NRTi2AYMGXd5TpoF/EfmV7CQ7jp
 ekQ4uB8KmTpbOV6q0stc3h4i+Cg0/8SV2yi+aMEEILWz8M/XAwfaAN8CBWueJL2PY1nLI47guCq
 GxmKORVr7zdw7nfHfOH7LySOUQFf7PEPiPCpmw0e7eF9eQ+K1WxCAuA7DH5ixSFmfEoXulHm6iS
 jh1n8Ok4SttdfsrG6cqqtW8oSzPfQF4jogNZFfQkLVt1Z3bzWPLoUF5q4sXX/miHzJ0yLYrBDKt
 xpFRtr4GsGaohZObqa6pWhTQgvbYpGVoLOi5F5qN/MOH+9ETy731DphGzKR7P2w/g9ncaj9qSPU
 4x1OamCRjtQkqUdWAOiwZw15HTaGhlyVBNZ04Iy9+y/itDqxfhblmfL640LRBGHBv45w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_235839_009065_7E0D4642 
X-CRM114-Status: UNSURE (   6.08  )
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
to work propertly, also has one reset line from hardware persepective.

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
