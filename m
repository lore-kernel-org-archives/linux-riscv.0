Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CAAC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 20:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iP1M1HHckWPl9XCCvPqz8YPgAIb4FY+j1kDwkv1plhA=; b=3qRpd6ou8mMSWB
	vTx+aI6hJK7RIhF/62uHuFLAqjhzU1QJK+Lahao62BmT0GVW2kc+jDPqgQEDIrCJiQWuDpOanF8Mt
	qB8e2/SY3MXWI0f5Ve/caU9NRIaVADh2A5Vnar/a7bj1hbiVStWvA4tY6BWnV/oXvLIAI+CoYrh7g
	UbVNaZv1tzioo/+4awt9gKq9mL3qDi3D3O+0NHzJz34ngnEgK16ptrQnqsNfSr56fMk/fzgPG6DAg
	2e5eqjUO9Qp0PXwr05hY/PGFqCTPEp1BU+V3YLiGiJZehHTmnRSqhSoiUHYGukWJRbXvtiSz61J8q
	Xxqvsk3zePPTCVkR3hEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6e2G-00DwTf-5E; Wed, 29 Jun 2022 20:11:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6e2D-00DwSr-8W
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 20:11:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D33C162094;
	Wed, 29 Jun 2022 20:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649DFC341C8;
	Wed, 29 Jun 2022 20:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656533495;
	bh=cvPYtRkUJkulvF6B5y9/eaTzMux14ZpS/4VidSoHfTw=;
	h=From:To:Cc:Subject:Date:From;
	b=Q2mBj6uWK3w/qZRbR2RL1/xLSLuKTWZAG20AhWAIlx5ImSxTk01+Grad9iYvlCQ2M
	 in6F9dSHbCuUFchM+Bqaxmdx6G2fEYTdksO9naSgJXxbXXG6aEW0n6tVX0xNBG5LC2
	 nWj8MQo/EhS/l/bw53az06UtPuyhUJ8DkS/1Bv6XBuYLsIxpUfVo1BLSjl1TtMS4mC
	 XN0WSDwAyQB+lyW+LqlrM5swx3vyRC5823oX3Zxjnpca073L4k8+0rVL6SSh/KzxTq
	 pPTrlzbOcS58UlolY/H0SUckJmQJFVfugsH5K0bpEEGKvng5iFAWtxyNS+ZN3Q7R0W
	 +Y1rmPjVss1Vw==
From: Conor Dooley <conor@kernel.org>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Ivan Griffin <ivan.griffin@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: hook up the mpfs' l2cache
Date: Wed, 29 Jun 2022 21:07:33 +0100
Message-Id: <20220629200732.4039258-1-conor@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_131137_378653_233EA238 
X-CRM114-Status: GOOD (  10.64  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The initial PolarFire SoC devicetree must have been forked off from
the fu540 one prior to the addition of l2cache controller support being
added there. When the controller node was added to mpfs.dtsi, it was
not hooked up to the CPUs & thus sysfs reports an incorrect cache
configuration. Hook it up.

Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 3095d08453a1..496d3b7642bd 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -50,6 +50,7 @@ cpu1: cpu@1 {
 			riscv,isa = "rv64imafdc";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
+			next-level-cache = <&cctrllr>;
 			status = "okay";
 
 			cpu1_intc: interrupt-controller {
@@ -77,6 +78,7 @@ cpu2: cpu@2 {
 			riscv,isa = "rv64imafdc";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
+			next-level-cache = <&cctrllr>;
 			status = "okay";
 
 			cpu2_intc: interrupt-controller {
@@ -104,6 +106,7 @@ cpu3: cpu@3 {
 			riscv,isa = "rv64imafdc";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
+			next-level-cache = <&cctrllr>;
 			status = "okay";
 
 			cpu3_intc: interrupt-controller {
@@ -131,6 +134,7 @@ cpu4: cpu@4 {
 			riscv,isa = "rv64imafdc";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
+			next-level-cache = <&cctrllr>;
 			status = "okay";
 			cpu4_intc: interrupt-controller {
 				#interrupt-cells = <1>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
