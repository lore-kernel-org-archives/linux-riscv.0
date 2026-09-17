Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2190C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xH1MLOh69jbyubovwHBjLIBzdg5l6k54aXw45Qa3EnI=; b=euqhLPvVYYQhM6
	Wv7TYteguCxL3wIBdnd64Jsnv42tMQ/D3BFsvocSgmbdIcYBdz8naFJBUoI1NUgPYT8ytE9ZnyvWk
	EjjVLLJFNqMYA+erAMqVlCW2umYxP31+Az9c+lLytbTXJDfnjUk3tbSMwZFU50gJdRIAqTcDE8mSm
	FMRvamBLLKmu61JlaPmQ8PDyXOKrcNJ2TbnidRiay7WQaslEi8bM5QOX7Sdl/LuuDMEzJTQ3jr6lQ
	cjGSuBIoyLmSwUbEHJmeqgF/fgS1cEzPiLWZX03sZAQNvwMmmEleMCOee1pgCp3ovaK++dFczOc3a
	Oznvx/LK5n4PnVhqgDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F1O-0000000BunM-1Cx2;
	Thu, 17 Sep 2026 16:31:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F1N-0000000Bumg-0ZLt
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Sep 2026 16:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qMmT5efrU6GEbjbyFNwSWTd358YOBsZsuMTs5gYFVmQ=; b=bOrpcOjixU4MqsDcgVhMWe2GpM
	LAKRvu3i67NeNYNlNJuJK4Kx411b7fedKOETXs7Tt4Pvrs+vsi0b6wUf0ZHJNynMbfsONDG64wxjW
	cE3Z67vBcxoLW+wFcnro0I3D4FLW4UjDxVzoShcRPrOBlml2NtBoERyVL541XweHv6gyhuTXkbNv7
	I2afU6qwaFB4U5uD2o/ZIRV07KUwo1RDwtEoqjJhQ7ax/FlPuJ2awZqghwkNBeRM25R+YDo2aZxZ9
	C3dsVqlhEFaiYInAKeN1ozQTAApNACdJ786a7wL7F7wd4LZHBt1zf8je7lR0Xbe/hDU3qHR18/XvA
	dn25U7xA==;
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7F1K-000000092sA-14t4
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 16:31:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789662681; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S5UeVzkete6+mf/pyYkS6UUQN02sqvper2o6VsmEBJq2Z1bQEb/un8d8wgsEmY+aiym+aZAj4Xyc6DWibtYvPlaKrVqnZo2Ncs52rcl0FREnAW93B2FV1mhqzE3XCperdyzIzVNrzepGx9SRKv/f9EVXUqo//bgi/ytvTUU0XZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662681; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qMmT5efrU6GEbjbyFNwSWTd358YOBsZsuMTs5gYFVmQ=; 
	b=TEJ5RVdqFL/g92cvS0HirTYRuwXHgTBzd85xp2aSdDTVDeUekoA9Ilx4mi7wasLrRchwtWJFbbcSwdTVqpuiPxhIe1sIzYbg13n0zGlz6A8IVaWleXKdIyknz7Lw4N5UwxQkCTHEEInED9q/35nb7Q2jqJaH1BouAf9etEuXEZY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662681;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qMmT5efrU6GEbjbyFNwSWTd358YOBsZsuMTs5gYFVmQ=;
	b=FwyKG36gf9ed0oStLwhWnLK6rCbzYXkdjnGU7m2k/KEosMbTK2ZNXME0VFh3onsK
	/j+JxYGFrVg6G4EuQePoxrN6QAlq9FFRcCUrVPm5egBWO6txfHKLPfqwuupHN+w9yMg
	2iMRVLN6IfRGw8oNa2Er/plroKf71qM4j6wcUVSg=
Received: by smtp.zohomail.com with SMTPS id 1789662680445265.30275018758016;
	Thu, 17 Sep 2026 09:31:20 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:38 +0800
Subject: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
MIME-Version: 1.0
Message-Id: <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=lv+0gzWeeU7rN8DL91wNG8xuNseGSCdetCC/tUM2Gp8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiE5cXnzsyIcP1xNmh01hWnlD+uceLe3l/d9dLb7o5
 c2uMBS/01HKwiDGxSArpsjC5S/+z1qH59sRgdb7MHNYmUCGMHBxCsBEJBIYGTZsNf61k3PNEhs/
 q4XBunPc4x9X/2To5jf8kLKkYt3qdw8YGSawOF87wvphY+/lz96bNoRMfcLc/fHN1zt7Evx8rK8
 tPswIAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_173134_598955_E37AEBFC 
X-CRM114-Status: GOOD (  10.52  )
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

The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
existing CLINT node at 0xe081c000 incorrectly describes the SSWI
register space in the non-secure window as a legacy CLINT.

The ACLINT register space is mapped at two base addresses: a secure
window at 0xf1810000 and a non-secure window at 0xe0810000. The
secure window exposes all three components, while the non-secure
window only exposes SSWI; the MSWI and MTIMER offsets are reserved
there. Moreover, depending on the eFuse configuration, the non-secure
window may be entirely inaccessible, whereas the secure window is
always available.

Replace the CLINT node with the three ACLINT devices, all using
secure-window addresses: MSWI and MTIMER for machine-level firmware
such as OpenSBI, and SSWI for supervisor software interrupts.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..74831974435e 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
 			riscv,num-sources = <512>;
 		};
 
-		clint: timer@e081c000 {
-			compatible = "spacemit,k3-clint", "sifive,clint0";
-			reg = <0x0 0xe081c000 0x0 0x4000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
-					      <&cpu1_intc 3>, <&cpu1_intc 7>,
-					      <&cpu2_intc 3>, <&cpu2_intc 7>,
-					      <&cpu3_intc 3>, <&cpu3_intc 7>,
-					      <&cpu4_intc 3>, <&cpu4_intc 7>,
-					      <&cpu5_intc 3>, <&cpu5_intc 7>,
-					      <&cpu6_intc 3>, <&cpu6_intc 7>,
-					      <&cpu7_intc 3>, <&cpu7_intc 7>;
-		};
-
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
 		mimsic: interrupt-controller@f1000000 {
@@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
 			riscv,num-sources = <512>;
 			status = "reserved";
 		};
+
+		aclint_mswi: interrupt-controller@f1810000 {
+			compatible = "spacemit,k3-aclint-mswi";
+			reg = <0x0 0xf1810000 0x0 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
+					      <&cpu2_intc 3>, <&cpu3_intc 3>,
+					      <&cpu4_intc 3>, <&cpu5_intc 3>,
+					      <&cpu6_intc 3>, <&cpu7_intc 3>;
+		};
+
+		aclint_mtimer: timer@f1814000 {
+			compatible = "spacemit,k3-aclint-mtimer";
+			reg = <0x0 0xf1814000 0x0 0x8000>;
+			reg-names = "mtimecmp";
+			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
+					      <&cpu2_intc 7>, <&cpu3_intc 7>,
+					      <&cpu4_intc 7>, <&cpu5_intc 7>,
+					      <&cpu6_intc 7>, <&cpu7_intc 7>;
+		};
+
+		aclint_sswi: interrupt-controller@f181c000 {
+			compatible = "spacemit,k3-aclint-sswi";
+			reg = <0x0 0xf181c000 0x0 0x4000>;
+			#interrupt-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 1>, <&cpu1_intc 1>,
+					      <&cpu2_intc 1>, <&cpu3_intc 1>,
+					      <&cpu4_intc 1>, <&cpu5_intc 1>,
+					      <&cpu6_intc 1>, <&cpu7_intc 1>;
+		};
 	};
 };

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
