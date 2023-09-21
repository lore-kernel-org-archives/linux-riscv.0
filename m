Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C44E70703
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 09:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htJoVWsk6Asfq+v5yYRkvs4ZdheD4wrB8QpOIBYWVb0=; b=F2ELd43pPk5GAJ
	2s4hgqtO5/3375eB3pwLlpsNSA83eU6UX14QbL8ZJef9wI+g6MJwBxAzxaaTHSlU90eYY5iPSX7wx
	4EQkWsBCPELdXE0+mMwNWdL/2urU5MyryOwR+6cuhlDHHiaCWCaDU5yv1jIGek7R/oS2Grgt25agj
	Lyj3Ou95BrgwpzjjkzoMxYCefsOtrsv0/EH3qfgj1L26XcYKxeu7ssWChAvRd0Y01J8j8dZ+Zm1El
	mbKh66Uz0n3WJ0jnrvr3A3FFhoo8OnsRmwJv+IG2TCUVL6phrZJqjXuv2mme8LYNS1Y9wWlScuj//
	fC6r/LAqUuicAugEhTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGRQ-005eHX-1q;
	Thu, 21 Sep 2023 09:57:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGRN-005eFP-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 09:57:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2EAB61EC0;
	Thu, 21 Sep 2023 09:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36527C32789;
	Thu, 21 Sep 2023 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695290264;
	bh=vSXizHPWCC3vt7yMn09hNeUOdLEKT3JekAX6LnbrW/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EujmTCZP09XUJeQzzazy2AXsnaOdQov3DtKFGWWu2oJV1IzU5yXbW2XVRZTEWbzky
	 HT9ThX1/cB8wMSIf0XO2ljugFBQV4y4lakYVE4O81I5Tkm867LFyC2CicyHHfn0Zga
	 z6w8gCibpyYoCk5DitKLjddTaShbAQC7NCupDWYwqd6qBbBF8B+xbTFfEnsir8RFLO
	 rc6Wn6jDGYnDidanS5xt1KtEtIsQNUND8jHLtfEicBlR26x1DLJoP4ryWYAU8UfV0z
	 G2vitSgarNpvvIgbgOMEI23y1gr4CM2PMZwmfEdqWB+VYlJRlCLVDhbSCXYgyeODZb
	 f53BXTTK3pyUw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC v1 3/6] riscv: dts: starfive: convert isa detection to new properties
Date: Thu, 21 Sep 2023 10:57:20 +0100
Message-ID: <20230921095723.26456-4-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921095723.26456-1-conor@kernel.org>
References: <20230921095723.26456-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_025745_610073_7AFCD540 
X-CRM114-Status: UNSURE (   8.83  )
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

Convert the jh7100 and jh7110 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi |  6 ++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 35ab54fb235f..d2276357faf7 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -33,6 +33,9 @@ U74_0: cpu@0 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 
 			cpu0_intc: interrupt-controller {
@@ -58,6 +61,9 @@ U74_1: cpu@1 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 
 			cpu1_intc: interrupt-controller {
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index e85464c328d0..991090136bcb 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -28,6 +28,9 @@ S7_0: cpu@0 {
 			i-cache-size = <16384>;
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imac_zba_zbb";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zba", "zbb", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
@@ -54,6 +57,9 @@ U74_1: cpu@1 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -84,6 +90,9 @@ U74_2: cpu@2 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -114,6 +123,9 @@ U74_3: cpu@3 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -144,6 +156,9 @@ U74_4: cpu@4 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
