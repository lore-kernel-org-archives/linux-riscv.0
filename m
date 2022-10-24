Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A99C67871
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XwhbkoPALv4SdNC7rRAYD2K3VLShv/LZasxotQ9OALs=; b=rpHYf7mN3Z/o1O
	HBYAU8b88ck7KqLpEvuG2HhNQagOL53wLLNb+XCgEnFhOzh9QM3rQZQu48GJXXUGo0LLfzQfPyFyf
	Nxa0kuO4AfItD7QgQTuAe02bcToMsD9Ac3AUXdEJVRyK8V2iyQK/lQhlY2nj88Arlzwp7+t03qFI3
	MTfxD+tE900Y2FmErZcvMjzio/CaueUxRl3L8cF4jUb6IxLoQZ27BvTliBfxwyrkFvR5trLa1TYBz
	soxsVkHXFIO9SqBQQ3IqbdsVaZ8DX8wSagkB/eQ8rx59DBRZO/KzT0u4TFSgbMUUKFSZBksp28JeC
	DOs9xcrQxcfhumg0RYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on3Gl-002nbc-HU; Mon, 24 Oct 2022 19:37:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on3Gj-002nay-7F
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 19:37:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1A2061561;
	Mon, 24 Oct 2022 19:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB923C433C1;
	Mon, 24 Oct 2022 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666640271;
	bh=GTzGyK5ICOdcW3TRbCJOV0+yXyHnU9QoAMm0ZKS8v1c=;
	h=From:To:Cc:Subject:Date:From;
	b=ALITZss1pRbrMLdGnnQCScYQIAox+NcvETAU1maabpqGSPYDt06K5VvFXuzFOtgAT
	 jnUpj/4Kf8pzKh4YkR7sbKknASD6DgQJlDKWscUF7ErS2PwmolbpJ9NUFUdmUwPueA
	 IgF7ZhjNzcHl46dHOByqrTfML814kg079KcqiHjuFhr0eCyyMuHY88XK1LI1SosyT8
	 RmlTXj2E59MkGAh/Mzcf3gbOXYexxeuJM6dfHGmjSxYb//EvbyHfzjWvSzb+x1fBhP
	 b7wI7EEXjwuDvwVeQRYKT5m20PvJ5Knq12gE3A7rfbPy826UEx4gyTJI5LksnTxp+5
	 h0pKCrJ70TL/g==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Padmarao Begari <padmarao.begari@microchip.com>
Subject: [RFC] riscv: dts: microchip: add OPPs to mpfs
Date: Mon, 24 Oct 2022 20:36:48 +0100
Message-Id: <20221024193647.1089769-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_123753_381624_239CEF27 
X-CRM114-Status: GOOD (  11.43  )
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

The U-Boot dts for mpfs defines three OPPs which are missing from the
Linux dts. For ease of synchronisation of the two, add the missing OPPs
to the Linux dt too.

CC: Padmarao Begari <padmarao.begari@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Hey Padmarao,
I've been trying to pick off the bits that're different between the Linux
& U-Boot dts. Do you remember why we added OPPs to the U-Boot dts but
didn't propagate them elsewhere?

 arch/riscv/boot/dts/microchip/mpfs.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 0a9bb84af438..9d9ff7174341 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -23,6 +23,7 @@ cpu0: cpu@0 {
 			reg = <0>;
 			riscv,isa = "rv64imac";
 			clocks = <&clkcfg CLK_CPU>;
+			operating-points-v2 = <&cluster0_opps>;
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
@@ -51,6 +52,7 @@ cpu1: cpu@1 {
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
+			operating-points-v2 = <&cluster0_opps>;
 			status = "okay";
 
 			cpu1_intc: interrupt-controller {
@@ -79,6 +81,7 @@ cpu2: cpu@2 {
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
+			operating-points-v2 = <&cluster0_opps>;
 			status = "okay";
 
 			cpu2_intc: interrupt-controller {
@@ -107,6 +110,7 @@ cpu3: cpu@3 {
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
+			operating-points-v2 = <&cluster0_opps>;
 			status = "okay";
 
 			cpu3_intc: interrupt-controller {
@@ -136,6 +140,7 @@ cpu4: cpu@4 {
 			tlb-split;
 			next-level-cache = <&cctrllr>;
 			status = "okay";
+			operating-points-v2 = <&cluster0_opps>;
 			cpu4_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 				compatible = "riscv,cpu-intc";
@@ -166,6 +171,24 @@ core4 {
 				};
 			};
 		};
+
+		cluster0_opps: opp-table {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-600000000 {
+			    opp-hz = /bits/ 64 <600000000>;
+			    opp-microvolt = <1100000>;
+			};
+			opp-300000000 {
+			    opp-hz = /bits/ 64 <300000000>;
+			    opp-microvolt = <950000>;
+			};
+			opp-150000000 {
+			    opp-hz = /bits/ 64 <150000000>;
+			    opp-microvolt = <750000>;
+			};
+		};
 	};
 
 	refclk: mssrefclk {
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
