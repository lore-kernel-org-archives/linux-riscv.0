Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D70EC53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxoSv72iQd4y//bKBa8OwE7mAnIqISw7dNdfJ+PbP1w=; b=tJbw5hcxYG/ZhS
	qvY3NaCxMQ49vdPq6GeWxUL/PEkSEq9EOfsqfpxwkWdEmNiFqFzkRjk8IGo3oyrw0q/B9cAUObkmw
	UKNqcrumF8kO7ZXtQQifY+MqD/2ttrEofyDozLopKntgQ5DOamt/ZtScVYT086oQuyzqWnlSm/Itz
	hKFoKhM7ON+t4jGKkDRSx0bYJn1j40M+QQ4/TcToQQLAU+U8ouGmB0wqKJ7iylOlNbsryIs9L94Ib
	ybeD/MbKFye+DPDYfzfwfQJLj9MlthF/gjvG4M9ChR85TA7p37VCdoPZ3uF+G5MN27n0MSVtb7bLY
	CsUrLCmdL62gkM3/b+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokps-00000005qdK-0MLw;
	Tue, 28 Jul 2026 16:39:20 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokpq-00000005qcN-0lGz
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785256750; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BOZrot9dbb1uHAR9gWmq5se+r3KOMZs+yKLYt1L8X5LdzyDvG9twk8HdvFCoVuZ72kOukEePd5+JrWDz+/cNTbR+/dX07FCRdKpSjj2vsBqItAWwkRxb5Duub9gY9j4pAA76Rz+jVVBTElhhqnzr1opEkUJWM02lC2G1KxrUKvA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256750; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X2S+idwzoGger5xZU/BVBMwhfPT9h32JuWpjJHcVuJ0=; 
	b=Aj9UzEYcQxVEtVzDDy3BEITXP09w21P2crcHtpnydS05CK+YUfKBne/KSOme2ItJnvy9qiYg1CEyCaxwGuYopnzXIntiMGee6M35OxDj6iBHTaQu8IE4UIEuA4oq+FVfCYs9A9h9Rf0Ff+26IjvHN4nzHJ8/LoenD5cqsJapdrs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256750;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=X2S+idwzoGger5xZU/BVBMwhfPT9h32JuWpjJHcVuJ0=;
	b=rBjNWlU693oaZlircDdM47C+TGSeYHdyUKrGkJmWkpOc19OUo4MKzU1ccL3qznYJ
	9qOlRzKesu82W1dKSO+g7Yxfu8qFCpam5/aDvlZTblN/oBforXBo6J0JUtrrO2PnG0A
	tAk70QcSQdliyyQ1sNBOvjQXn3AzU9GKWcieKov0=
Received: by mx.zohomail.com with SMTPS id 1785256749033781.8640098721687;
	Tue, 28 Jul 2026 09:39:09 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:33 +0800
Subject: [PATCH RFC 7/7] riscv: dts: spacemit: k3: Add ACLINT MSWI and
 MTIMER nodes
MIME-Version: 1.0
Message-Id: <20260729-k3-aclint-v1-7-aef88614d3a5@pigmoral.tech>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
In-Reply-To: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=FN8Vnkhxoqla2OthuLvn5E8IS2SHFT42d30jgVTbcK8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybt3b13fyfdaj/ZK1kx5raO+eH3nl7kOtntSuP18+N
 W6R96+w7yhlYRDjYpAVU2Th8hf/Z63D8+2IQOt9mDmsTCBDGLg4BWAiBj2MDB/2xaok3FkX4Ppc
 Npvl7tO7H7geLX1xwI/b6XztOsZjZ7gZ/pfEMr3xt3pq+H2Ni2/mcqVlz+Kfl65fvXLi9EjZAw2
 n9BgB
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093918_274486_48D9201A 
X-CRM114-Status: UNSURE (   7.61  )
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

The SpacemiT K3 SoC provides ACLINT MSWI and MTIMER controllers. Add
these nodes to complete the ACLINT description in the Device Tree for
M-mode firmware such as OpenSBI.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 5fb719f79467..ecb5f4fcd8fd 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1303,5 +1303,24 @@ maplic: interrupt-controller@f1800000 {
 			riscv,num-sources = <512>;
 			status = "reserved";
 		};
+
+		aclint_mswi: interrupt-controller@f1810000 {
+			compatible = "spacemit,k3-aclint-mswi", "riscv,aclint-mswi";
+			reg = <0x0 0xf1810000 0x0 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
+					      <&cpu2_intc 3>, <&cpu3_intc 3>,
+					      <&cpu4_intc 3>, <&cpu5_intc 3>,
+					      <&cpu6_intc 3>, <&cpu7_intc 3>;
+		};
+
+		aclint_mtimer: timer@f1814000 {
+			compatible = "spacemit,k3-aclint-mtimer", "riscv,aclint-mtimer";
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
