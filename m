Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14BEC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GEz7dxegSt0kMyZ3i6Xa4g7zcz8vSIOo4qbvU1bKQ5w=; b=ZyhL4VJllvqMe0
	BjODGwX9+ElS+x/hgCss2LZ7AT/Z3CnudyJLz0CDSN+tNkbaUE6AlNRcui2L94z1Fi5W3vPR2DHwz
	c3rT3bOBoms6ZchfJ7nzea6MTXCDVl4z5eRJYslOlsFQHPoGteVH6xtAiPi7PCrAtt3kGCDBuDqwe
	pbqxZtUAWDDszW01XCMxfAYYjODV9AfI4pwxP6mX0DYwXW/vR/wpvwMTUqWR2WN2u3T7PXZalB28V
	tIihkh0uFqe51kVTTpOV3RTuFGFEPtu+y65C27MyhKoNkLlyIDUzx+sr30n7vGi2l1khh+oS/O2JJ
	NDrr8zZQ19MsnMh/8BBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwjpa-006EA7-0S;
	Wed, 10 May 2023 13:26:10 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwjpX-006E7n-1k
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 13:26:08 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cc75:d8ef:4074:8af9])
	by laurent.telenet-ops.be with bizsmtp
	id v1S12900q3l7qvk011S1bR; Wed, 10 May 2023 15:26:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pwjpK-001nEk-0x;
	Wed, 10 May 2023 15:26:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pwjpR-00F6ue-NF;
	Wed, 10 May 2023 15:26:01 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: interrupt-controller: sifive,plic: Sort compatible values
Date: Wed, 10 May 2023 15:26:00 +0200
Message-Id: <9cbf54da1ace03d7a45f28230fd99954d8c0d141.1683725029.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_062607_717016_7453E17A 
X-CRM114-Status: UNSURE (   9.02  )
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

Restore alphabetical sort order of the supported SiFive-compatible
values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index f75736a061af7778..292556cb367dec61 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -57,10 +57,10 @@ properties:
           - const: andestech,nceplic100
       - items:
           - enum:
+              - canaan,k210-plic
               - sifive,fu540-c000-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
-              - canaan,k210-plic
           - const: sifive,plic-1.0.0
       - items:
           - enum:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
