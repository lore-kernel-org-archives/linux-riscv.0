Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29764CD4F2B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FH81MjcC1nC5NNeNPuB3aYfGPbOMDIlbur0tNDx7LE=; b=VfmJ86G/GsdMSB
	d4Pp8XVh9V78LB5yedP61jrBgVXwNJAQdgnXL3bSulAJaoAibls2To7VRMllmWEDtAR17o3M62Zai
	zsDdHdgXLf4LmZpocr6fOwwf9SlB62Y9kyfkbCjBCDiZ7wnESNEacfXdMEmM8p6PTU17F72vZDeDl
	cTTOig7WHSCF6BMFwJDhuckjYs4z1+q+ONy+18YuTD31ClAecxW3klcJi8vYMUP3aOlWO9XPWbiLX
	vudTD3m1j0nU0ELszj6NmshoSYroXspqK3Evn3X2vm6shqvT9HyS/ZuZAmwARQxuwOxxZJ6yJVJzY
	LoRwBk+QtPD45+8NGtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbKE-008Np5-2q;
	Fri, 22 Sep 2023 08:15:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbKC-008Nnc-1h
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 08:15:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1127D62210;
	Fri, 22 Sep 2023 08:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21535C433C8;
	Fri, 22 Sep 2023 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695370543;
	bh=J7c7CSpq+jJvt/X8SgS6zQzZjvo50bIOnu44mdhPcVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jcXyy16U4chszJ31wBu5ayzrJliAmdcJTmJ2bXra0hoZIqcbzNWy5TWmIpktqcDW2
	 Gx5hGNwGL5bOSaXgFAxdof8UnEdAPYGWn8eTbBblqXcyB4cmR9R1rfnFjoV782vdib
	 rk/kzmAHw3aIPo3rDMVMlbFG4TNVOqUMsqj12IytjcrRGfY8WFYaCMDdj5YP/pkacP
	 xMcynAQxsT4s5MOGc/DJZF0OR/mhvPNjI+pMc8T4tyt2eBdLhHJG5KZ1DulePXr7vn
	 T+09ahZJCdjHAwCR06ZUVV43gcJwVI0pi0+wYfrmiOK5/90rzgOY0pXad+YehZvO5y
	 2z3MDDsy3iFSQ==
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
Subject: [RFC v2 2/6] riscv: dts: sifive: convert isa detection to new properties
Date: Fri, 22 Sep 2023 09:13:47 +0100
Message-ID: <20230922081351.30239-4-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922081351.30239-2-conor@kernel.org>
References: <20230922081351.30239-2-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_011544_649441_3A30084B 
X-CRM114-Status: UNSURE (   9.02  )
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

Convert the fu540 and fu740 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 15 +++++++++++++++
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 24bba83bec77..156330a9bbf3 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -30,6 +30,9 @@ cpu0: cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
+					       "zihpm";
 			status = "disabled";
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -53,6 +56,9 @@ cpu1: cpu@1 {
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu1_intc: interrupt-controller {
@@ -77,6 +83,9 @@ cpu2: cpu@2 {
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu2_intc: interrupt-controller {
@@ -101,6 +110,9 @@ cpu3: cpu@3 {
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu3_intc: interrupt-controller {
@@ -125,6 +137,9 @@ cpu4: cpu@4 {
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu4_intc: interrupt-controller {
diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 5235fd1c9cb6..6150f3397bff 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -31,6 +31,9 @@ cpu0: cpu@0 {
 			next-level-cache = <&ccache>;
 			reg = <0x0>;
 			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
+					       "zihpm";
 			status = "disabled";
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -55,6 +58,9 @@ cpu1: cpu@1 {
 			next-level-cache = <&ccache>;
 			reg = <0x1>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu1_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -79,6 +85,9 @@ cpu2: cpu@2 {
 			next-level-cache = <&ccache>;
 			reg = <0x2>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu2_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -103,6 +112,9 @@ cpu3: cpu@3 {
 			next-level-cache = <&ccache>;
 			reg = <0x3>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu3_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -127,6 +139,9 @@ cpu4: cpu@4 {
 			next-level-cache = <&ccache>;
 			reg = <0x4>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu4_intc: interrupt-controller {
 				#interrupt-cells = <1>;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
