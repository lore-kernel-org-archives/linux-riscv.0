Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2633CA5FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 06:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJYGd8LnD0dhpyqr5lasYE0/dTsXKezt1UQjs4EoUFI=; b=uClCt6E0MLUal9
	9wIW0H2iPUa70LyDUK/PMmtBOT9GXY0GnGC47TBNUxV5fC0F+vhy6LXgOIXHJo+s2aKAYhe2oPHUm
	DZ9I4Huq/ZrmfhXjHt/dQ2iQ1k8wlfBWi545MZB48cobHtVAlUhxUjiRPwTH4GWoV4x6w9v3/1gzk
	33Gf3WXb+HcGg5+surq1qfScpafGPDJyxqXz2dDD4+Nt4Znx/4GbCyqH/HbTMPTWBziA/83yr7QGT
	SbItiSfdhCXQqmeIkToy/xrHjFyWxacGN8/b507ebEBj8xM6TcHY41vC0xp3GABURZzDmgB6DCa8T
	cGenUuIRj29HJIBeK1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWS3-0000000AgVT-0GpX;
	Fri, 02 Oct 2026 06:08:59 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWRy-0000000AgUO-2sbb
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 06:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790921328; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CKvBuQIYHMUziJwUOFvaLd9kofoA3UaThkci1EHakmsNOtzbmWI995GT4DjtpmtV6qjUkC+jTorGFGzimWVJWVB42GxjWWnYpN53cpaysgYjV2AnPUshr3M6ukWscoPPmQOUkvROWicfbLPZCTi3CJrYU9y74+Qiio7egKBjrj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790921328; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4cHq1Co9HcRiqm/xFpM+Dsl9ec4MWYGgWYwgZsTisL4=; 
	b=CwIf19zDmZWbZQ+nTnf2cxYJIk/xaiItbEcQ0JtJnwFF0ghXR/6F73T7ea3DmwOSHX/4lYhZo41hIbm42Ag4mKyKAE2b+npJGGFtGDz3Qdq6xznOW8WwPA9KLyRikA5taPX31yddm8SSDSph2WeM3f3S/JXvrh5l08wNCoL8haM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790921328;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4cHq1Co9HcRiqm/xFpM+Dsl9ec4MWYGgWYwgZsTisL4=;
	b=M6686PhO3sQmFlhpVh/f4JMFBlDWYo605N+eImvbr0zlfeGsKpwPtkAyQXLm/Rb+
	rmiOMXZK+mijRKx6tGpu+ll3eJmyhN3mPq2yB543j6vIEiRoqBeKL2npoC+pM+bQCth
	twsnnYLoLjcZ0CLRBzDFz1rjuHRMmmwDbWfteulE=
Received: by smtp.zohomail.com with SMTPS id 1790921326980205.33797877040922;
	Thu, 1 Oct 2026 23:08:46 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 02 Oct 2026 14:07:00 +0800
Subject: [PATCH 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make external
 clocks optional
MIME-Version: 1.0
Message-Id: <20261002-dr1v90-cru-dt-fix-v1-1-c3e0b5d4c30d@pigmoral.tech>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
In-Reply-To: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=BIY6eHBDFTpphuNlDMZqPsrExFIMpb0TUz/VDfFcopk=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2e0X6BMzmudSmqdNmY6Sz4+bRx9mvLUrNyw8YG37J3
 fjublh1RykLgxgXg6yYIguXv/g/ax2eb0cEWu/DzGFlAhnCwMUpABPhO8jIcDPg78bHNaseWv0v
 +nZSgVuhXaW87eR2UZ5SqzN8jOFsgowME9puRFtMVJKKfRMW+n/tucd9b/eaJJfxlVp6X3vHuLS
 dEQA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_230854_913272_1ECB4EC8 
X-CRM114-Status: UNSURE (   8.13  )
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

The external CAN and WDT clocks are optional inputs routed from the
board; the main oscillator is the only required clock. The binding
currently requires all three clocks, which forces device trees to add
stub fixed-clock nodes without a clock-frequency to satisfy it.

Allow the clocks and clock-names properties to contain just "osc",
optionally followed by either or both of "can_ext" and "wdt_ext".

Fixes: 155d900e4c7d ("dt-bindings: clock: add Anlogic DR1V90 CRU")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/clock/anlogic,dr1v90-cru.yaml         | 24 +++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
index 11a92588e494..8bd7b78a58d8 100644
--- a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
@@ -17,16 +17,26 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Main oscillator
-      - description: External CAN clock
-      - description: External WDT clock
+    minItems: 1
+    maxItems: 3
+    description:
+      The main oscillator is always required. An external CAN clock and an
+      external WDT clock may additionally be provided if the board routes these
+      clocks to the SoC.
 
   clock-names:
-    items:
+    oneOf:
       - const: osc
-      - const: can_ext
-      - const: wdt_ext
+      - items:
+          - const: osc
+          - const: can_ext
+      - items:
+          - const: osc
+          - const: wdt_ext
+      - items:
+          - const: osc
+          - const: can_ext
+          - const: wdt_ext
 
   "#clock-cells":
     const: 1

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
