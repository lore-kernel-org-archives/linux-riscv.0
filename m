Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BFECD4F2E
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3qZe9WOcTOrfp3wDWh3Ozn58iX901pOGO9xklomXPc=; b=KuLPOROBuKS6Xn
	OIL0sNq1fqfvbInzT1+jHUwbsCxYjNsCNgen88VbHGiFyJemroS+8uoGz06ex21/YhqUd0+enfLuK
	PzjAUj+pFGtfNfoDmy4YT6RxyFEMuyD7TfEQomSZM+7GnwaZc1+WILl/dtX0K8o7b6oxFzVt7Rycx
	xLy6+rzB+SSsKYY0I37G/XYMiAzalbw4SIjDve9+wU7oG3m/1HaqEU7Q2pS3Bb0BjvlgvwctwXfAU
	CDJIgQYTUYKaD8PtFqcEvi90j1MticFomgi0RxMDy6jBnyc9CO1VAUZ5KyFZ5bgYQZsydeyRobWwC
	Uhk1QwsS01dpUEidHtHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbKB-008Nn5-0c;
	Fri, 22 Sep 2023 08:15:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbK8-008NlF-1K
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 08:15:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D57A862214;
	Fri, 22 Sep 2023 08:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD78C433CA;
	Fri, 22 Sep 2023 08:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695370538;
	bh=ym/P79iMnlKHrq0wlF+lNRu7pe3fGRLDF///W24nvOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z7Zjbao64P6dk3zub1HiXIuYgEEEN/iJ4tY2c/xeCqTU5tOWJ0LhBKItOnLpiGXH8
	 2MNOKZ965+bFeS4D2UEnj2l8UUHXoYWnyUSlqpToj9PozVx1N6yV43+F6iHCJg+ZJG
	 MwzT8tNwKkxYjc8fTTBUFi18QLdgrfJjLjDFDoOifQwGnaJSarGKvBMTOwTJtE9aKM
	 up7F9Evj3t8FD1kIfnevznljBP5MEEvQvjyKeTLiBtCwRGdtR94hDcjkzufd3/xpWh
	 gNwU7H/y8adsL6jub5ic9+1Imb+WSzw8908CTpzMxTSz0QEiaErGnVRGZBkGM6r76H
	 8DA6AVGA7DURA==
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
	Chen Wang <unicorn_wang@outlook.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC v2 1/6] riscv: dts: microchip: convert isa detection to new properties
Date: Fri, 22 Sep 2023 09:13:46 +0100
Message-ID: <20230922081351.30239-3-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922081351.30239-2-conor@kernel.org>
References: <20230922081351.30239-2-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_011540_531283_D7C296F8 
X-CRM114-Status: UNSURE (   9.22  )
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

Convert the PolarFire SoC devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 104504352e99..a6faf24f1dba 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -22,6 +22,9 @@ cpu0: cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
+					       "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			status = "disabled";
 
@@ -48,6 +51,9 @@ cpu1: cpu@1 {
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -76,6 +82,9 @@ cpu2: cpu@2 {
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -104,6 +113,9 @@ cpu3: cpu@3 {
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -132,6 +144,9 @@ cpu4: cpu@4 {
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
