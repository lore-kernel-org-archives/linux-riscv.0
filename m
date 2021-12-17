Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02997C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZnznRvKHZ+/Q34Cd7gX49Z1P7eNjtmXzOILbv1RgkI=; b=CEbT6G7rcD4g0A
	DE52Tsetgbogbv+jWQPsNe05O3VTkCZeXHqZHoeERCOkUB5eJbC50gTD5Ob8mtjaAYDpCkEKw2jqd
	2g2/5k/y/wpcI7XeHbMbewxwVaWDJtWqfysw+4jrWCuSIR8ZCD/SctRbWpnWcZgh7AaKIIn1tH/s3
	rBymjSkG1cOzSQHJ8QYzcKYedyk1uAMSb9mI19dX+E3Qv4IytU+SCIYT5/ggUYFYuIV0QPVYjov4c
	KrZUhdpoWsYvIadnJl/nIEenZ7AEEssb/jpnMVM0P9i9fGVEXvkV1r6bEEyW/Tej51ATD/HCri4zK
	XIZC3vm5bt1lLGaHLPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCRN-00A9xR-4e; Fri, 17 Dec 2021 12:34:25 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCRC-00A9tC-Ks
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:34:16 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by andre.telenet-ops.be with bizsmtp
 id XQaB2600X250X3001QaBJ7; Fri, 17 Dec 2021 13:34:12 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCR9-005Yoh-75; Fri, 17 Dec 2021 13:34:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCR8-00ASKo-ON; Fri, 17 Dec 2021 13:34:10 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/2] dt-bindings: interrupt-controller: sifive,
 plic: Group interrupt tuples
Date: Fri, 17 Dec 2021 13:34:04 +0100
Message-Id: <33c1526be595c933ddf7f2583fdb5e23e69968a7.1639744106.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639744106.git.geert@linux-m68k.org>
References: <cover.1639744106.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_043414_884506_07545AD8 
X-CRM114-Status: UNSURE (   8.04  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3:
  - Add Reviewed-by,

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
