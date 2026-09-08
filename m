Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4739C79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IX4d3TJzkNKipLUjq8heeF1qlc5S/Qy+SlJXMbaUN30=; b=VfLrYh+AVqIBiU
	N070TnG8TeawEWAB9CFK6D/u7629x0wbca+rTjqJc+QQZq4pTgtUyPFpTViqUGC7+KbMn9YjrdM6Q
	o3Eng6aGqAz6KNV0dLjsFgI7Mn8fpbwh0AiGxNFmJt+qnUEShzUIDeydsoHBdP/ky5LgrhKO/LKqh
	9cNCPeUfbFxJsWznwE9pKyl5KsVYARc1lwPzvcLeZ6QM3dpWU8dV53IyIMv5Ws7Ig9Cw62acZ+nqy
	CE0eHyc69fG6tfWl/mPdR4snNppdAEPCju+NGx+G2t38grhoN9wH2HYt25XtwaVYQVatxnvqKogZq
	v46dOUnX3Fz/+5r4XpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yiN-00000009gDe-2Z3p;
	Tue, 08 Sep 2026 16:30:34 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yiE-00000009g77-3Gfj
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 16:30:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788885009; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A78XGafLDFq/hA6y+C4/VdxktzVIi9IxmXy+55XFuE4L7Ehi7SDsGaBs1fWKo6vCZb2bd7s4nhkxES1vViqoqb57pMG26uW2z04QuE1+g2UbDy8EpTBe9c1IkKgTRzBB+dh9/XQB2uEmxa5/wWB4hSe66Y9TxjYRudAyT5UaWOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788885009; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XRqgXkSF0hdJubvDrWL/fRamzT/dwFoSEjwRXMrvAcg=; 
	b=P13W4BPbvWRYzuSf7WMIT3HZke3X/nh4FLntXfQ756mEv6oj9uE6ZTdf6lA/RKHCwmJMw8kCH0X6DB3bf5K2J1xwXVk8ExUJ8UmNE3xMJMgXIJ+bsvab8j6vdMoBDyqD30Ofh+ozNLZChnV9wkFBXkha02W4wBLinPp2MBEvgM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788885009;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=XRqgXkSF0hdJubvDrWL/fRamzT/dwFoSEjwRXMrvAcg=;
	b=h5L6VwQfZ4sxFHUpat31iaj+dLwdjHrTv/EJWgnMkZupwOmuZ+cLPzZVguz9Tsx9
	sMe5tfmcUxWVyk4t+QvXcxispHN2BvqlvbCxjTEN9a3O1AuIk2Pzv882YDF4eR4F8gb
	XfdwfAkwHewGGxFsfhPTgtFTh2bhWcusl5TzquVY=
Received: by mx.zohomail.com with SMTPS id 178888500800317.84862533376429;
	Tue, 8 Sep 2026 09:30:08 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:49 +0800
Subject: [PATCH v2 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
MIME-Version: 1.0
Message-Id: <20260909-k3-aclint-v2-6-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=Hpr95jbM/sR2JxMTRY4YvEG+OTtC4teW4pez2f5B6YI=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmF+yXT8rKffb1oBYGQ39Qxc/e8/8mxrJ8dRlOV9XS
 NgyN5/CjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACayIJThf6bl2vlCbe46Llwf
 HH22Skj669qF3L3nt4ojWbel646/C8P/8uf3J0cXb2XzjWitvv149i9G30T18CWyT77nHtu88/I
 mZgA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_093023_030772_920F94D3 
X-CRM114-Status: UNSURE (   9.81  )
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

The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices.
The existing CLINT node at 0xe081c000 incorrectly describes the SSWI
register space as a legacy CLINT.

Replace the CLINT node with an SSWI interrupt controller using the
K3-specific compatible and supervisor software interrupt IDs. Add
the MSWI and MTIMER nodes to describe the machine-level devices
for firmware such as OpenSBI.

Use the secure addresses for MSWI and MTIMER, as their non-secure
aliases are inaccessible. Keep SSWI at its non-secure address,
0xe081c000, because an efuse bit can restrict access to its secure
alias at 0xf181c000 to Machine mode.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 37 ++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..7ca662fe4cbe 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1261,17 +1261,15 @@ saplic: interrupt-controller@e0804000 {
 			riscv,num-sources = <512>;
 		};
 
-		clint: timer@e081c000 {
-			compatible = "spacemit,k3-clint", "sifive,clint0";
+		aclint_sswi: interrupt-controller@e081c000 {
+			compatible = "spacemit,k3-aclint-sswi";
 			reg = <0x0 0xe081c000 0x0 0x4000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
-					      <&cpu1_intc 3>, <&cpu1_intc 7>,
-					      <&cpu2_intc 3>, <&cpu2_intc 7>,
-					      <&cpu3_intc 3>, <&cpu3_intc 7>,
-					      <&cpu4_intc 3>, <&cpu4_intc 7>,
-					      <&cpu5_intc 3>, <&cpu5_intc 7>,
-					      <&cpu6_intc 3>, <&cpu6_intc 7>,
-					      <&cpu7_intc 3>, <&cpu7_intc 7>;
+			#interrupt-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 1>, <&cpu1_intc 1>,
+					      <&cpu2_intc 1>, <&cpu3_intc 1>,
+					      <&cpu4_intc 1>, <&cpu5_intc 1>,
+					      <&cpu6_intc 1>, <&cpu7_intc 1>;
 		};
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
@@ -1305,5 +1303,24 @@ maplic: interrupt-controller@f1800000 {
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
 	};
 };

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
