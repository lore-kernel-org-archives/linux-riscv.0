Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CDBC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bEomYUgVYK6o+UzH9v5+sesukmYYtd9Rq0LIXiRvxO0=; b=ZgbgwD8g7O4UJY
	3L1bkpZVFKhi5aMNv8OLQAcHeILwpJru5/rBe4ye5iJqpmeIQTNlqbfJ7Jh+zpeC1Uhm+B2xuqjHX
	v0J4/pfd8isf/Im+qDAiIgT9CiGThKPL8BAGq5M+5OffcTw3G8JaJifVVvYDkKbvTfuvrp8MFuXL9
	TBzY6n9Zmj2oGi8cmsaoVJxilOSwFv2AWBHPRvofpqd4OJba8re6qE6VfaesXbIOBPVqkJ6WFUYZZ
	dy5he1HLP88kNAWgjC0NIudjcWyuROorM9eKrru6/XcJp8fKYfnuJL9rSLEvdU4AMe8295egG2xB6
	qfL3y1vpFWfH+bii3QuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8PC-00Fset-P3; Fri, 03 Dec 2021 13:15:14 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8P9-00Fsdj-AC
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 13:15:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
 by xavier.telenet-ops.be with bizsmtp
 id RpF62600W3eLghq01pF6sw; Fri, 03 Dec 2021 14:15:06 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mt8P4-002LBO-0E; Fri, 03 Dec 2021 14:15:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mt8P3-000kOE-8Y; Fri, 03 Dec 2021 14:15:05 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] riscv: dts: sifive: fu540-c000: Fix PLIC node
Date: Fri,  3 Dec 2021 14:15:04 +0100
Message-Id: <ac53e34cf12a24aa4fe1dc206d4e0ffce71234f9.1638537275.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_051511_523692_1A3D8A1A 
X-CRM114-Status: UNSURE (   9.04  )
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
