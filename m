Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45169606A887
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MlrebMea;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FV2QCBUk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tifk8gfCltcVWZSaPqvKh20S8fi8dwSSxlWhkjsidJY=; b=MlrebMeaweFUfQYrLeb22MDI1K
	z9gcBD0F4Ztxgf3jURI/pPE4ih+wzpLtR7WipBrdqIHR8hx2CRQOFERQW5e9Il0V4ufIfF/RyHZ02
	n6x0YLgBGNPPYkF4vo5w+deMWZuLpfMFPR7FQO/wTbHvFc8ShBXiyzhnOnYk97ARWPHjzIL7MqQQf
	AsqWVx9cfeqyy15rWch8URqM4INAu8jTyiqpbEBcS5JzSpiLIsJshLxGDdGO2b5V7tzTrx9CR9tJ4
	ECSiWLzClY7HXLe7BHlE9qGZ1/tMQ+5g1YAPuCApt+FNwLJJ3ZTLKTjnBL9Gx8Py8mIJ2ywEP4XdT
	0GOCLM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzqI-0000000EiAM-3RPq;
	Fri, 13 Nov 2026 22:33:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpz-0000000Ehk4-0BBe;
	Fri, 13 Nov 2026 22:33:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 778CD62411;
	Fri, 13 Nov 2026 22:33:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609218;
	b=dzzmXe6EOZUnCWCtCyX6KvaZZaIqecjvSw7Ihx+zuBvWbgLp6gh64xyKX8TpcHXvjvw9
	 v76KpEGQ5KwrM9KjwjFczpr7r9p2d9Bc+rKZY4nuQx86unFW/JG0KQxh76wWozyyw20Bh
	 IBoAzxPvDb8O7C8PnVqBroByWv5+M8CijlDTt8bTke3UpPx0GzRu2TpvLbyAmPWS4r/Au
	 1LfHnALVFJw925Z6S6z2U//9BtiJ877BBlRqM81JeVHhDGEt6hSN4mbD4YddwsncRNtNN
	 SeXQogDJc8npcvFZvmcbuZR/US9JKdABR6pCL+W5tFUzW+SwMo+7cUMKZbKkaUZ/qmg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609218;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2hAcwHHxwsuzZBb2Xr9VuIK0jqUogfFZXLMnVu53bds=;
	b=zkdvl/0ZFb1FpxlIGKUO7fJ149Hb8jHBh3fjEDiS+tlD+6Bm9yVWE0pc+CIAyGAObLHB
	 wkUkfOTEZDjnrUNLLH0VRplDT7PvTkcjp5RByloPTX01PJR63jYuO26QKH0EfBtboSvAL
	 sW5g7GUxkInSp7HUe/Ixhu4AkEOj4/3M+rMBEddznGcKAgGjD5IU5AGlPPNxZcsZUnZt4
	 vmeVMJD5Z+Fn4YjmTdZnfSHiPsnmXhb7vBE6MYjp4Drgc1lk5JytVbI1KX88QK34Qn7kX
	 9LiyzDmDKUIur/nZDByJJKecbyn4vGw+VHUV5qCGCTjhhamqLVZKj2Gtb929+g9hDgw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 359C41F0089E;
	Fri, 13 Nov 2026 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609218;
	bh=2hAcwHHxwsuzZBb2Xr9VuIK0jqUogfFZXLMnVu53bds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FV2QCBUk2dFIqW9Sn4MhR5LOeAQRxbIE+193UXDCtDilblOtjVZQX+pjVDAu+XwtV
	 9VgSVlAhu8ZSOkTKE4r4jxC/PuTMcu05YxHbiE/o2xhMHZ8tFFalM5sJJnIsuvMTz2
	 XlkOYVkefUoz4DukDyaLwYyRI2SvzBUnJD6OfOpfHrhLTZP455+y2WilPeyHpFfANd
	 SZ4MN2BNr+UjHclc+2wsrCMV9wKFVR1cvv5iGkVUT7M43u0hoiZARcjPne5SrlaoGk
	 4C+0yT60mFBEQyJz5U+rG31MOjFxtqA+odRqx+fQ0GIEARrHcFqISuP40NlsGzrvBD
	 ro/5salgoOc/Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 937C549B84;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:38 +0800
Subject: [PATCH 12/19] dt-bindings: pinctrl: add the Allwinner V861 pin
 controllers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-12-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=2426;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=OVFVAovojWhCjL1CcvpMpyxRiwB/0HvBnEwl/vSd8Os=;
 b=I8y5zq/wfjE0lbgnncurtQ07hgFzNrVSMhKq4SHgkIBrpZNMZEux/+meGG5waFVfmHGj730hC
 i4FabMIA2qFD386KAufZP4MB4on1RyqcbMFigp86/eUPgTrGQwyuMCx
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

The V861 main and always-on pin controllers follow the A523 binding.
The always-on one has a single interrupt bank, so also allow a single
debounce value.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../pinctrl/allwinner,sun55i-a523-pinctrl.yaml     | 31 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..3c2924df17b9 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Allwinner A523 & A733 Pin Controller
+title: Allwinner A523, A733 & V861 Pin Controller
 
 maintainers:
   - Andre Przywara <andre.przywara@arm.com>
@@ -26,6 +26,8 @@ properties:
 
   compatible:
     enum:
+      - allwinner,sun252i-v861-pinctrl
+      - allwinner,sun252i-v861-r-pinctrl
       - allwinner,sun55i-a523-pinctrl
       - allwinner,sun55i-a523-r-pinctrl
       - allwinner,sun60i-a733-pinctrl
@@ -35,7 +37,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    minItems: 2
+    minItems: 1
     maxItems: 11
     description:
       One interrupt per external interrupt bank supported on the
@@ -62,7 +64,7 @@ properties:
       Debouncing periods in microseconds, one period per interrupt
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 2
+    minItems: 1
     maxItems: 11
 
 patternProperties:
@@ -149,6 +151,29 @@ allOf:
           minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun252i-v861-pinctrl
+    then:
+      properties:
+        interrupts:
+          minItems: 7
+          maxItems: 7
+        input-debounce:
+          maxItems: 7
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun252i-v861-r-pinctrl
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        input-debounce:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
