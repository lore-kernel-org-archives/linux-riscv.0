Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF909CD4F30
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0it4N+Hm52iK27JATQCNsSzAMydUWJozkkYOVkOsBI=; b=xrzjPDoyqTcAfk
	FC93eiaVTT/6GcJPq/VFxoEUQSnXg+VDZCwg/d7zjbvxhxNu1aapozIKLR/n/yXdJvgn+g3YX0mJV
	F49NcRXg/Pi8+8iJE2iwMpct9mwV8/H1I98v1orMGR2X166bMtjQCxRRbhyytremijHt6yMs8Dh52
	5frLq9tJENOyHe0by8fnMB1N3xl2CK4Pu+frjYAQ6S4XviHXUQ3MW7LIiSV3fA76d0nPF+NUHvo6d
	4jy5dObmbkVtrKv6aH1DdJE5jtr3aXxWrwvmj1pqsJippSpIEQvgO1abny0r6sHzTGtBBlBd/pbM8
	RoEB2C3TBDFbnYtNc0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbKL-008NtY-36;
	Fri, 22 Sep 2023 08:15:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbKI-008Nr9-2r
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 08:15:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 96632B82246;
	Fri, 22 Sep 2023 08:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A6BC433C9;
	Fri, 22 Sep 2023 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695370548;
	bh=vlviu2tG9WGCaiJkQbOLu/vrDYST7pugzrdM9DdK2ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a2i5MXdidcPs8u+tMHnhxw17vMWux2e425//v2jOFM3ChgSuYKllZD+Fdszz+4uGK
	 2wrs44rBAYy8XM4jGOY1qecDOPTiIfN1H79o/AYtPuGTrSTGQVtR2Fxjq6Le8x2qic
	 TXogaK+hkh5OWYkwbA58PUFjqCOd+IB8unx9ofLs6JsBep5wJJP2ikL/WdvCukSgdG
	 NmIgrXGiVSwb09T+W2Bk8awQ/+KBEF+LO2O7gLvTaWGKA3rzegWv31PUqv9QQPNghr
	 XGnGRe7xXDCNeweX6LbFMs/2K8bYOBBREWJVOAokarO4cOReFs0m+tPZ0MwpY5u5h8
	 0UTbimGtASV4g==
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
Subject: [RFC v2 3/6] riscv: dts: starfive: convert isa detection to new properties
Date: Fri, 22 Sep 2023 09:13:48 +0100
Message-ID: <20230922081351.30239-5-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922081351.30239-2-conor@kernel.org>
References: <20230922081351.30239-2-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_011551_192035_2425C357 
X-CRM114-Status: UNSURE (   8.86  )
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
index 35ab54fb235f..e68cafe7545f 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -33,6 +33,9 @@ U74_0: cpu@0 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 
 			cpu0_intc: interrupt-controller {
@@ -58,6 +61,9 @@ U74_1: cpu@1 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 
 			cpu1_intc: interrupt-controller {
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index e85464c328d0..90b35be9aa6c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -28,6 +28,9 @@ S7_0: cpu@0 {
 			i-cache-size = <16384>;
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imac_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zba", "zbb", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
@@ -54,6 +57,9 @@ U74_1: cpu@1 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -84,6 +90,9 @@ U74_2: cpu@2 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -114,6 +123,9 @@ U74_3: cpu@3 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -144,6 +156,9 @@ U74_4: cpu@4 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,isa-base = "rv64i";
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
