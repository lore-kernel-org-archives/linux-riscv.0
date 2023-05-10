Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AFFC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/yiehwTFv3kM9NfNDRUmqb6WGZ2NvoVXLKjB/kmJ1gM=; b=JIYCYorWtUftEv
	+EOudWbt2EP/o6waR31F8LIlUU2chp+JUJZ5bDCKt4NX+caU9078LEqQPlZU8AQTXbwhyRBT+Fse8
	Jn4CUWCBDEtVDMaME/aoVeayJ7EOg7JgYal5ZvB+RwPAZwA2qaOLdk59kLil14uQwIlpXI4cdsIkW
	KkgTbO4GM+1zg6LC9y3AFDF7qo9npOa5uPOAriV8WaBx0OZo9z+FH/EC0UMKXHMniqsW9esPJASez
	QDiP3vuTlgXkYPGkCWOIT7A2XWNuE4PAkEMgA8ONvwK9HfOplhwBR2icjsRAmUfKUgY3xOH0rOuHa
	2Jj9rWfVKlGUnEkdXMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwjqw-006EJY-09;
	Wed, 10 May 2023 13:27:34 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwjqs-006EIv-2m
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 13:27:32 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cc75:d8ef:4074:8af9])
	by andre.telenet-ops.be with bizsmtp
	id v1TS2900R3l7qvk011TSVa; Wed, 10 May 2023 15:27:28 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pwjqg-001nF6-HV;
	Wed, 10 May 2023 15:27:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pwjqo-00F6wY-8K;
	Wed, 10 May 2023 15:27:26 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: timer: sifive,clint: Clean up compatible value section
Date: Wed, 10 May 2023 15:27:24 +0200
Message-Id: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_062731_060811_5ED94EDC 
X-CRM114-Status: UNSURE (   9.94  )
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

Replace the sentences in the description listing some supported variants
by comments on the individual compatible values, to ease future
maintenance.  While at it, restore alphabetical sort order.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/timer/sifive,clint.yaml          | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 94bef9424df1bc6a..34a81510678134eb 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -29,11 +29,11 @@ properties:
     oneOf:
       - items:
           - enum:
-              - sifive,fu540-c000-clint
-              - starfive,jh7100-clint
-              - starfive,jh7110-clint
-              - canaan,k210-clint
-          - const: sifive,clint0
+              - canaan,k210-clint       # Canaan Kendryte K210
+              - sifive,fu540-c000-clint # SiFive FU540
+              - starfive,jh7100-clint   # StarFive JH7100
+              - starfive,jh7110-clint   # StarFive JH7110
+          - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
@@ -45,14 +45,9 @@ properties:
         description: For the QEMU virt machine only
 
     description:
-      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
-      Supported compatible strings are -
-      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
-      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
-      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
-      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
-      integration tweaks.
-      Please refer to sifive-blocks-ip-versioning.txt for details
+      Should be "<vendor>,<chip>-clint", followed by "sifive,clint<version>"
+      when compatible with a SiFive CLINT.  Please refer to
+      sifive-blocks-ip-versioning.txt for details regarding the latter.
 
   reg:
     maxItems: 1
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
