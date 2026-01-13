Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD51BD30CEF
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 22:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wo2sE4nWb8lA2jgfGJkyzCGcCS00WG5q4RIiGq7acZs=; b=rwSjKHo130s1bN
	tROO2wiRflz7WUqijxVNZFTqQe1Hrn7PD7ti2scL78qs9Tgp4DJiH9WQopOnlIOGmsN/VP+zMCVw9
	JDAt7bWG8HA1OXsaKFzh4scokZz8HNO5NcCrpepQAUBl7fFhsbYx/uqYIqlSODUqMMTIyblk4o6wm
	UwauN3rHhI5+EqcFHrsDCEs4k3lVvrfI2aJyM2UvnemAFbrr9PphapwriOa5Kr7pFDOXhwP31ITXB
	dweboUQc2SYM1sWEye+I/77DGcMjfKs3FkshbSZ6reUXv9X+083EaM8gbQZHua/niA+eG6AbwYIhw
	vsEAxgARURLNYDJEXv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmcX-00000007npc-1mzy;
	Tue, 13 Jan 2026 22:12:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmcV-00000007nox-4Bvj
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 22:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42E7941633;
	Tue, 13 Jan 2026 22:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81689C116C6;
	Tue, 13 Jan 2026 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342331;
	bh=28SFQN8Tnumdev8ylgHSFbtz98QUFPG1RsovO8KRHrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ckhfq/suIKuhvaMuOr780x/hkTKkcGahNklE+Tr1T6YGG9oi7RpP+4esk/EI7tx93
	 QECxZEXR+th+48q2IV7UMsYRuIDeAhh5x3d020i/9AeA8fICKHicO212HYVVv0YIqI
	 5SFy829TBOT2hKZIM37JngyOyyHSFK3YyJd5DQ34OcIKHMVfTYhEYYTONeTxJcReDK
	 b1LjmVughVgH7w7POgNaJMnfi9k+lW/zqpWojftXYxWMYKeHsZBcymGX/+7OUTc/wQ
	 63NKLrBxKWmX/7vidKEriZgQHLrceTIMW0yAk22fGDnjzmWMZ82YrT914C76jHHLK0
	 /Xjdlf/izYsgQ==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility
Date: Tue, 13 Jan 2026 22:11:47 +0000
Message-ID: <20260113-glue-justifier-566ffab2ffd3@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113-snagged-blemish-52af3d00d88e@spud>
References: <20260113-snagged-blemish-52af3d00d88e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=2bDhTZLUYJ0LPw3YfkkGQ1+HBQ8bn68ICCZRyZt/Obw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlph9V76l4sco0wN/9lWFc8b7v8FgPLz81zs5WiUx59X 9DZu6++o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABMxDWP4K5x28LrNFyPdFS/b 2OLDAu9o75zuuX6TS0ho/LMdVoZMsgz/M/VZznJtKj1+faqk3vfy2ZH12iq95jW8VwV3L2LzUHr FBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_141212_059138_3853C81E 
X-CRM114-Status: UNSURE (   8.38  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
the deprecated configuration that was never supported for this SoC.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-clkcfg.yaml    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index ee4f31596d97..a23703c281d1 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-clkcfg
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-clkcfg
+          - const: microchip,mpfs-clkcfg
+      - const: microchip,mpfs-clkcfg
 
   reg:
     oneOf:
@@ -69,6 +73,16 @@ required:
   - clocks
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: microchip,pic64gx-clkcfg
+then:
+  properties:
+    reg:
+      maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
