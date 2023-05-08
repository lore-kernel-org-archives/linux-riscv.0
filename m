Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B431AC7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmTtTYhUtsFsADHOptPpuHO73Hu7dqdlIdRflhs464U=; b=trgEekGSeQkPLk
	WPCy7xfkHFJQl00VBgnNoFozrkz05c9HLXLWFDqeugf/j5q5VIJjNSRTePlgii1IHt2Su/ar1t0dc
	oBYqTCrKsUFwdoHy80bghbh04oCqIQWoeo+EITyemhvcuCZX/R0uNDDsGEoilC2sguMpRXAm2oRgu
	xgUuUt7MpSydK3eRmMyaVJk326tR7jFhEIDN6n0xJB6yAPMPPOyhaWoH2BlsXDU7n9uzC6zRQZDfG
	dkVPlWRcXbU0VW7ATb/DkgRyPXlscKPzXRAHhkYdzGqx/NMIXs6tBgk9uFlKEclsUhIIPY/zVwQ4R
	CdL+1e+vIGnBpZKw2aPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5QF-0016fw-0l;
	Mon, 08 May 2023 18:17:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5QB-0016e9-1R
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 18:17:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DD8A62135;
	Mon,  8 May 2023 18:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C4CC433A1;
	Mon,  8 May 2023 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683569834;
	bh=BeSBiMW5kmgs7+Z7icdUc3/2UWyKIKrlY/vXI6gIZDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F850zsgIjLZZIVsp/40NUEh0Et3PjVKwqFK17JJEOj4Qv2WUfB1tB58G2VLPTBQmG
	 8XRfUAi8yafgVdWrpZ1vfyScdT8FxrJOdvC3iwtV1yUA8f0Fgs3Sh1j/iv2AGpGI4d
	 njKbCwX2JHJpJQQPGGD+XLX60EZQdKDiUC2IU4au6A/AIBcr573u3Hti4OBRAJ8+1W
	 SUHRBOJEVon0J31fEDuq7y/ZLzPp539+XRI0PVC2OXYcgCNjQ32XZvIjWYSJB9KhGj
	 64wLFYsidBsWtjUzxndJ0BcJfZRqfopOiA90Meomd/ICeHOkUK6WFLVpwHN9DUXY1m
	 bt/IdqNFsU9lg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [RFC 6/6] riscv: dts: microchip: use new riscv,isa-extension-* properties for mpfs
Date: Mon,  8 May 2023 19:16:26 +0100
Message-Id: <20230508-elf-dismay-799bb48a635e@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508-hypnotic-phobia-99598439d828@spud>
References: <20230508-hypnotic-phobia-99598439d828@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=sxz5UhIOaJj8Re9+hSvtSwbaV+pJMl6xzcAp79D9KJ0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmRNmWBZjpFz00vJS05+L9L+f2fzB2CqnuOxv4vyjCY1 aDQqX6io5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABM5JcXIsDaoQu7ndSPHiFVZ b6r+XVDUX7+QO+WEwN/4JVafG774vWT4n/X1LGvk2k8PHu2w26F8MObA3czOT/KLMu2ezbrw/db +2UwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_111715_569005_A218F7BA 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 42 ++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 104504352e99..53efb5e03c64 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -21,7 +21,11 @@ cpu0: cpu@0 {
 			i-cache-sets = <128>;
 			i-cache-size = <16384>;
 			reg = <0>;
-			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extension-i = "v1.0.0";
+			riscv,isa-extension-m = "v1.0.0";
+			riscv,isa-extension-a = "v1.0.0";
+			riscv,isa-extension-c = "v1.0.0";
 			clocks = <&clkcfg CLK_CPU>;
 			status = "disabled";
 
@@ -47,7 +51,14 @@ cpu1: cpu@1 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			reg = <1>;
-			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extension-i = "v1.0.0";
+			riscv,isa-extension-m = "v1.0.0";
+			riscv,isa-extension-a = "v1.0.0";
+			riscv,isa-extension-f = "v1.0.0";
+			riscv,isa-extension-d = "v1.0.0";
+			riscv,isa-extension-c = "v1.0.0";
+			riscv,isa-extension-zicsr = "v1.0.0";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -75,7 +86,14 @@ cpu2: cpu@2 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			reg = <2>;
-			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extension-i = "v1.0.0";
+			riscv,isa-extension-m = "v1.0.0";
+			riscv,isa-extension-a = "v1.0.0";
+			riscv,isa-extension-f = "v1.0.0";
+			riscv,isa-extension-d = "v1.0.0";
+			riscv,isa-extension-c = "v1.0.0";
+			riscv,isa-extension-zicsr = "v1.0.0";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -103,7 +121,14 @@ cpu3: cpu@3 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			reg = <3>;
-			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extension-i = "v1.0.0";
+			riscv,isa-extension-m = "v1.0.0";
+			riscv,isa-extension-a = "v1.0.0";
+			riscv,isa-extension-f = "v1.0.0";
+			riscv,isa-extension-d = "v1.0.0";
+			riscv,isa-extension-c = "v1.0.0";
+			riscv,isa-extension-zicsr = "v1.0.0";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -131,7 +156,14 @@ cpu4: cpu@4 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			reg = <4>;
-			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extension-i = "v1.0.0";
+			riscv,isa-extension-m = "v1.0.0";
+			riscv,isa-extension-a = "v1.0.0";
+			riscv,isa-extension-f = "v1.0.0";
+			riscv,isa-extension-d = "v1.0.0";
+			riscv,isa-extension-c = "v1.0.0";
+			riscv,isa-extension-zicsr = "v1.0.0";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
