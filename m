Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E90C25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RH5EP1GWGLLyQ3deN5ESnRrqAR3tZ14l8z90kJ+X1FY=; b=Zpi2CR1spDWqKS
	XOPsxwRnFqnhf1Eld57TRiLGNRPJkyM5E6fbVGfmuYZw/Mwq7n5lDd2VhfPHPZQomQOp0TPeHVanM
	UtlYcE2RhxNumgVElHjri3higk+H4iWxjDar+2PIjsjs5gYGUBrul86odcvcNZazM5ym7jJDARXI+
	I7vrLGgEPbljIFchc8pqU15mxf4RFi0fiBfZKk3cDDnFD48Li0X63f/kKfpH5R85kqpCZ0rsG5McZ
	aNqyaKXxBLGr0a5Qq5gjVxfg1tgAmV51AM89Udi3oNF2iMFmtc0sR84RzB7hUQz0Do2m3T4dX9Z7a
	W4A1kTbfKo5KozS5ivGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGLv-007pZt-NK; Sun, 14 Aug 2022 16:20:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGLt-007pX5-J2
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:20:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 37B6BB80B3F;
	Sun, 14 Aug 2022 16:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2597AC433C1;
	Sun, 14 Aug 2022 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494034;
	bh=Q1zVQVYleee82rkIel2HjFE+uGlWimn78jrehPBVYNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TvTaDml2c+xUCuJmqeJFtuqn/GQ2c1rMw8Hv8MHYudL0gsK47zNSXz3j/DxZFZ+iG
	 t+TWkvBLkD/ny0DOWi0bANaJyGPKes0ad/UqrfzqCT+bbpVZsynEEBK2lpHVnc43Wz
	 kJRp38TCWGyjBj2gp+kq3qND2DIPWG7JuzkhPssSQ3ysEbrlpFAH0HQio0KWs6aQim
	 INyDa8Rs4UQh/qwoJrwbFS+ndjcCSK/QHiNKIM3ecKaBQ66UJfYxNfxFaCZsJmgwDI
	 xb2AYTkGhgeSUDqfZadBW/+vaVTqG0fnEzuCustkp/F4ASWO0f6y0i/OY81ODj59j/
	 02rMfPJGe4Nzw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brice Goglin <Brice.Goglin@inria.fr>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	zong.li@sifive.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.19 16/48] riscv: dts: sifive: Add fu540 topology information
Date: Sun, 14 Aug 2022 12:19:09 -0400
Message-Id: <20220814161943.2394452-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092037_934882_0255BEBC 
X-CRM114-Status: UNSURE (   8.58  )
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

From: Conor Dooley <conor.dooley@microchip.com>

[ Upstream commit af8f260abc608c06e4466a282b53f1e2dc09f042 ]

The fu540 has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20220705190435.1790466-3-mail@conchuod.ie
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index e3172d0ffac4..24bba83bec77 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -133,6 +133,30 @@ cpu4_intc: interrupt-controller {
 				interrupt-controller;
 			};
 		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
 	};
 	soc {
 		#address-cells = <2>;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
