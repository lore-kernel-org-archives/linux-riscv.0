Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F142C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JML+Vk6H9Ssc08J4cxoRv9JNyptFyRKcTCIGP9RFkM=; b=FgvvvJ+bVw02X0
	U1+KgmvPk8RUPOhWjWlhbJ3LIXAcY1Z5gg3tPJMbLHJRXRMvZdsUndYaWT2Ct32W2ssCaNLFs+WTG
	nIVi1hFOBf4IT1ZPCxZyDLAAV9Yjob4QJ+sffJvH+1xX7bQCo/YlfIqhA3tM7KiCe/PHty62dRsTe
	MAfNzCTeNnnAvUxYOOnPczB/cu8AxeD+NDUJgMCyorSaUZmQTjV2rQi2rwqrwmspmNEZscr8Bav9x
	v+UDJOAdqrcS5QiAaB83US67LgzbpDLFTnFB1t6wAKh93wXhPZ2f8/w9DNel9eTgAwoSInrOmrgeD
	oxYAnVoN+zSK/9a4z7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokpd-00000005qXl-461N;
	Tue, 28 Jul 2026 16:39:05 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokpb-00000005qVP-0oIa
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:39:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785256736; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OHdNVI1+D32IEMmRk6uGL3/qHJ6q7a9G5okUexeZGtAl8eEa0Dh9qrFlZZ4SkLqIr6Szj46d6fwZ0bkDOdmPWyCTih2mklNTlZWGpApjMZq4kKq5gP2LpfqTULUc2cZxuutH4dpiFDoyN0U8+0Y4cbRs3fYdWkzYV/ugSq5lxEs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256736; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lX26IaWgGPv6AK4d/vdQmCNHyUuu0BetEpcY1cG4Ddg=; 
	b=nMuKx6PK2Q877DoxTS2nGqxTI4fx33hkFtFVE5uPNJyn4x+2H0QnePVRSHVFUDnMYbmN/P86knlp/gEMhZFl1Cma9/kaEgCHHttvLg5Sf21f0HJuPEom8K8nyf7XE4E7w8phTS65CBTy4YtLv8gLPybSFJ718DeRsNrJQWYFSUk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256736;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lX26IaWgGPv6AK4d/vdQmCNHyUuu0BetEpcY1cG4Ddg=;
	b=k6yL/j7YcMkb5TCuMsqLM2zmS8iIm7bkFYG57ub/w6KLymIAajqRoGhzWo0bZEdz
	h80VBYMUOZMR00akwd/mrwZa6JJ/XjAt7KY+Qdkfv2a0xESSXRCMY1SDPq2PeVLZOVZ
	vfj/ZrFtJjKG5E5jSsAxrRlvv3oeJOG51uN2S9hc=
Received: by mx.zohomail.com with SMTPS id 1785256733497346.2892460990995;
	Tue, 28 Jul 2026 09:38:53 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:32 +0800
Subject: [PATCH RFC 6/7] riscv: dts: spacemit: k3: Fix SSWI node
 misidentified as CLINT
MIME-Version: 1.0
Message-Id: <20260729-k3-aclint-v1-6-aef88614d3a5@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=48Rep7MDs/3I3i34alcHAqQIXCCsXicgyRL/cnNNhes=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybt2un/Xx/KQrztcNcp/36Yg48MeIO1RdkfGP/X15i
 1JvBPvNjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACbyrpyRYc6BLAf/ONVp0vXN
 Uu56vhE7TXp2r/EMWLIgpNddUVhfgJGhOZknb+Etny15XcnaJa7NDRcmVHAUVZYfvnwp52f2SzU
 +AA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093903_293079_5963A8FD 
X-CRM114-Status: GOOD (  10.18  )
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

The previous Device Tree defined a legacy CLINT node at 0xe081c000.
However, this register space actually belongs to the ACLINT SSWI
controller. Correct the node definition and compatible string so that
SSWI functions properly.

The ACLINT SSWI device can be accessed at either 0xf181c000 (secure) or
0xe081c000 (non-secure). However, there is an efuse bit that controls
access to the secure alias: when enabled, it restricts access solely to
Machine mode. Therefore, the non-secure base address is chosen for the
kernel to drive SSWI reliably.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..5fb719f79467 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1261,17 +1261,15 @@ saplic: interrupt-controller@e0804000 {
 			riscv,num-sources = <512>;
 		};
 
-		clint: timer@e081c000 {
-			compatible = "spacemit,k3-clint", "sifive,clint0";
+		aclint_sswi: interrupt-controller@e081c000 {
+			compatible = "spacemit,k3-aclint-sswi", "riscv,aclint-sswi";
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

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
