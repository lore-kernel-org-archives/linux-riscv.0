Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07047C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4VFWgktx8r5DbyfF1BfKtgy/puLedvMLDRUIUBN/8o=; b=IBDROJwyuThiAu
	nFYsjKiOM4Hh/RhxWNfy9+0zWeYD6AQQ+hQsaas+jjYBtrFFNMqgsYczYNa6vxGPTzS2MLYPf7Y1P
	GRNrLQYQTeETSg3yqSUNaKZ1bJQuBKf5BrNEZGfxf3cTMJf2NBkVZ9bkIL78dXKe461edqnWJmLhn
	OZdVnUNvK26MXOTiL6YaZSkPCiH3M7LV3w/Vrw/CoK+F6L3MqqOOrB/33k6t35qPX//QvHzggPlzM
	vazyf17uZLmlHk2a2bf79jJZGChrzj/hMZT7L8OuHpHwTjLajCFzh15gVqlqT4VAUcqWe7axvpRIV
	6mrZzfT/Oe1rix6PToHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrAx-005xav-1u; Thu, 16 Dec 2021 13:52:03 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr34-005tqD-SS
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:43:57 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by michel.telenet-ops.be with bizsmtp
 id X1jt26006250X30061jtUJ; Thu, 16 Dec 2021 14:43:53 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxr32-005QII-If; Thu, 16 Dec 2021 14:43:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxr31-009y7Z-GG; Thu, 16 Dec 2021 14:43:51 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 2/2] dt-bindings: timer: sifive,
 clint: Group interrupt tuples
Date: Thu, 16 Dec 2021 14:43:48 +0100
Message-Id: <2859d2377f778b592c7b52597e698abc628de8dc.1639662093.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639662093.git.geert@linux-m68k.org>
References: <cover.1639662093.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_054355_110660_D232E59E 
X-CRM114-Status: UNSURE (   8.95  )
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
brackets.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Split in two patches.
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index b75fd6f982b1ecb3..3b25ec37d81159cb 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -57,10 +57,10 @@ examples:
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
