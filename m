Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F43AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5oq3JPWthdHWXGYwQ5Wntgc4GLz+eTRec1TAjWJJCA=; b=pAdWdr2cyP7gaj
	Puhy5U+/3727dkRq6ImBCsuWKbkGXy1YYjTcJ23CTSf97XzSUPvN2gQriqc1Kybqgb7C0H0Y92bBk
	nfhJcHIBByn5iRhyaklmHUUrqPNUmnD9aUIe6ONZaDUwtddGSJCzscjPoL0gK3Oh3nUJpSWbVFCJw
	9e2Z9oIv2EXgfkJ0iuIGI9VVmrO46YzYHZU30kUqPw6Nt2N+QeTs2hTsG/YAduwdpF6gz2GIfJQ6N
	8vyvur5rqlXDmzUP95XbRhl43ky/dDEKKpAaD3U76siqtJaQbRRWCBLJlcy0vdLBli5E3wL3UxF0F
	zbCJN/4pJelJV05a1G1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr8q-005whp-Fl; Thu, 16 Dec 2021 13:49:52 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr0j-005swF-OM
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:41:32 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by xavier.telenet-ops.be with bizsmtp
 id X1hT2600J250X30011hT25; Thu, 16 Dec 2021 14:41:27 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxr0g-005QFe-Vs; Thu, 16 Dec 2021 14:41:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxr0g-009y1c-67; Thu, 16 Dec 2021 14:41:26 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 2/2] dt-bindings: interrupt-controller: sifive,
 plic: Group interrupt tuples
Date: Thu, 16 Dec 2021 14:41:22 +0100
Message-Id: <2f1894def1ab4fb4151357a7a0b2f66760165d72.1639661878.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639661878.git.geert@linux-m68k.org>
References: <cover.1639661878.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_054130_014362_26AC551C 
X-CRM114-Status: UNSURE (   8.44  )
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
 .../interrupt-controller/sifive,plic-1.0.0.yaml       | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 0c6687511457413e..52a3bc31a2c19c5d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -91,12 +91,11 @@ examples:
       #interrupt-cells = <1>;
       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
       interrupt-controller;
-      interrupts-extended = <
-        &cpu0_intc 11
-        &cpu1_intc 11 &cpu1_intc 9
-        &cpu2_intc 11 &cpu2_intc 9
-        &cpu3_intc 11 &cpu3_intc 9
-        &cpu4_intc 11 &cpu4_intc 9>;
+      interrupts-extended = <&cpu0_intc 11>,
+                            <&cpu1_intc 11>, <&cpu1_intc 9>,
+                            <&cpu2_intc 11>, <&cpu2_intc 9>,
+                            <&cpu3_intc 11>, <&cpu3_intc 9>,
+                            <&cpu4_intc 11>, <&cpu4_intc 9>;
       reg = <0xc000000 0x4000000>;
       riscv,ndev = <10>;
     };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
