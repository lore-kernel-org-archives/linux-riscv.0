Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A61AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YEqL2lni9OTpdcF7+8qdmgzoYbafzKdg8BZpd8LJ+gg=; b=eAwVbOXA2wC3QY
	LHUPg4gZJ/PO4zY2JbyxU94H2ul89P7iVzuFO3QbJmCEZomnx2YkC6aRJ7r4kv5OWIZt7gxFfg2ze
	K0St3wQhUr+Z0NdR3ZFf8Sh+mCTsNMw0eieF8IqY5uPkhwelg/J21eB/BBYrc0+XeeMTuQ0XN1P82
	R4HnneARVdihbyaxZURPc775tGYN99kppcRVps02stBpBMKNsz01zMw7rLvv0eQxDp2U2JGsATFi8
	Irue+yRLCbeaXsktOwGwlrbBmw1HoMGk0Cadgjptf4/QnYUl+tB5pGUYy7It8BAX3036Hs1Y2DSmB
	geCkhOPviX52/Hk7mtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGap-007zgb-AQ; Thu, 25 Nov 2021 15:23:23 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGam-007zEH-ST
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:23:22 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by andre.telenet-ops.be with bizsmtp
 id NfPL2600N5CGg7701fPLHZ; Thu, 25 Nov 2021 16:23:20 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGal-000DNq-Oi; Thu, 25 Nov 2021 16:23:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGal-000gP7-Bs; Thu, 25 Nov 2021 16:23:19 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dt-bindings: timer: sifive,clint: Fix number of interrupts
Date: Thu, 25 Nov 2021 16:23:17 +0100
Message-Id: <20211125152317.162958-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_072321_090115_BA846ADE 
X-CRM114-Status: UNSURE (   9.95  )
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

To improve human readability and enable automatic validation, the tuples
in "interrupts-extended" properties should be grouped using angle
brackets.  As the DT bindings lack an upper bound on the number of
interrupts, thus assuming one, proper grouping is currently flagged as
an error.

Fix this by adding the missing "maxItems", limiting it to 10 interrupts
(two interrupts for a system management core, and two interrupts per
core for other cores), which should be sufficient for now.

Group the tuples in the example.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f487426988..55bec2d059807c48 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -43,6 +43,7 @@ properties:
 
   interrupts-extended:
     minItems: 1
+    maxItems: 10
 
 additionalProperties: false
 
@@ -55,10 +56,10 @@ examples:
   - |
     timer@2000000 {
       compatible = "sifive,fu540-c000-clint", "sifive,clint0";
-      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
-                             &cpu2intc 3 &cpu2intc 7
-                             &cpu3intc 3 &cpu3intc 7
-                             &cpu4intc 3 &cpu4intc 7>;
+      interrupts-extended = <&cpu1intc 3>, <&cpu1intc 7>,
+                            <&cpu2intc 3>, <&cpu2intc 7>,
+                            <&cpu3intc 3>, <&cpu3intc 7>,
+                            <&cpu4intc 3>, <&cpu4intc 7>;
        reg = <0x2000000 0x10000>;
     };
 ...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
