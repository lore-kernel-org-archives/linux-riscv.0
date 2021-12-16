Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86751C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCSdX4zR9d1OXEmlvIWmYEYqfkLDKzxu+nXDnn6dJlM=; b=JQHBgioQWo/RoM
	8hSx0gWjRATAUi3fxaCUm1YfUD9vPVDqGr5AbP/rIhwzHJrzaj2WLY9EqComrJMvYwZzdaB0kCRVE
	+lYAdAlB1zjsmk1sArAVwa3OPkk1lB+AWdeYS/6ASk0gnS1/FBkBXfHIwcysGeEQ2a2q44DU+UZgX
	6F4xccBAbMfbWJqOPfZuBBMD6/mEdbsHyF7VBjHNN/zseR4SFWHjwLE0EEnub2TjcOKCMCiHceKFv
	2OhO2puwJ8u5zVHlEi6io26+Uy4A8tOh0JHZzVYg22pSu4xMeCyX5pC0Uqa5DcH9r502xa9RunbCd
	QEvzLceWuvqn2ONqSPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr4O-005uYX-RE; Thu, 16 Dec 2021 13:45:16 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxB-005rJi-OQ
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:37:53 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by albert.telenet-ops.be with bizsmtp
 id X1dg2600T250X30061dgKF; Thu, 16 Dec 2021 14:37:42 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx2-005Q95-2q; Thu, 16 Dec 2021 14:37:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-009xv9-8N; Thu, 16 Dec 2021 14:37:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 11/11] riscv: dts: sifive: fu540-c000: Fix PLIC node
Date: Thu, 16 Dec 2021 14:37:35 +0100
Message-Id: <2658fb6d194ea22a8077d1475bafec43d9a39244.1639660956.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639660956.git.geert@linux-m68k.org>
References: <cover.1639660956.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_053750_012158_FA467F9B 
X-CRM114-Status: UNSURE (   9.82  )
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

Fix the device node for the Platform-Level Interrupt Controller (PLIC):
  - Add missing "#address-cells" property,
  - Sort properties according to DT bindings.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - New.
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index b1250c16816f5c9d..3eef52b1a59b5cb4 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -140,10 +140,10 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 		plic0: interrupt-controller@c000000 {
-			#interrupt-cells = <1>;
 			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
-			riscv,ndev = <53>;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
 			interrupt-controller;
 			interrupts-extended =
 				<&cpu0_intc 0xffffffff>,
@@ -151,6 +151,7 @@ plic0: interrupt-controller@c000000 {
 				<&cpu2_intc 0xffffffff>, <&cpu2_intc 9>,
 				<&cpu3_intc 0xffffffff>, <&cpu3_intc 9>,
 				<&cpu4_intc 0xffffffff>, <&cpu4_intc 9>;
+			riscv,ndev = <53>;
 		};
 		prci: clock-controller@10000000 {
 			compatible = "sifive,fu540-c000-prci";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
