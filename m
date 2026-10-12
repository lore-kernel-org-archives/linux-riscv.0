Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41157CA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 23:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oj3zivvNJMBlvNw9N9yuOhpU/+NEnW9/po7ZVjz9RRs=; b=Xm6qrWrYAUHCVP
	LOG1N2o+sHUGaMBa/OnXbelwuEBGNitz/cuH4QO3SENMP+uXG3ERny12MoFa1CPhAEgb7J6rzNhVC
	dClL8C3iWRdNGC8Jr34SB+T6G35wj0/nlrRXAhy5VJGfj2gz2yVJ3IKB2JbEqTa7uW3RYbUqXJdz4
	AfPkN07Q4VVAI126kXRR5Qcq4ktVeZK31cfB82t4c6vHzzGHX7X4LatWS5UAbaNy4GrfV9C56Wx5b
	Ws1upsH/TsHSsFuFiDk/jCOerXyTjzm92sWfHRBDZb1G1BM4A5izdO0gGV4YbclAhzw/fOprb/EjT
	4MdnWriDUfHZ+M+++4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPsk-0000000BgdB-2OUg;
	Mon, 12 Oct 2026 23:56:38 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPsf-0000000Bgbh-2vUS
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 23:56:35 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3115c4451c8so2490103eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849393; x=1792454193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RE+TAdR2zoysZ2fy7BxGaPmSY+PSjylK6Zrp2w78nJI=;
        b=OAMWYGCE0yE9l1uQd499LmR2SiagJLKi8D6eQ+8SPXMTW1SEXe3AsZCuIIFiyhYtm2
         CK555BG0YwV1lFgFO2mPT/4+USAd3ufxRavhfUKEtALet2NbtHVMAnqO0gBg0EG5TdRI
         FOpCbYN0PfxPZDnsvmNRnaxr7fjFnQ/peKUJw3UmOTDcFKqN04pVWjkr8NGh4oqbXjkU
         9qoC+NCEtTppHihBCjEY4NThfJojihzSQCCpbAneN34A2oxgbmXAo97ROfUCtrHkOaoy
         Cj49Kv3yEyPA85bAjeiYRs4whKglrwIBl3vxbu8H3Ts4S2TKY5GR/vQs83izbIRIlnnE
         CB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849393; x=1792454193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RE+TAdR2zoysZ2fy7BxGaPmSY+PSjylK6Zrp2w78nJI=;
        b=1GKGlmlKvJpdQrjsiSNyyKl8Ur5cRBlExaHXiLrFjr3xcW+kMDfrbiNfGLDs04yIev
         LiC3Y0aU022BIE6bZK7oyvnT1Optla4zOHn/S4+wv5r9T9wlUdGOK+UUYeB+nXLfh7Go
         GOFyXTwJB+qK3W9ti00ZVYSvqteRCHBmhs2H7IOxaeF9jakY7oP/rF4S6b5No7rtrEwh
         D6kYGlxXAhG1L+EqKWAlCwJRfZ68GDR9KLzgG5xScbY8+B1dAzeOtffPN+d7ghK4EGl9
         G1yxf7kdW4AiiyYY73UyOutxRA4sbqtBzO659KBshlnYy97G9HAEDMhgmP+zU9LsUa2+
         m9HA==
X-Forwarded-Encrypted: i=1; AKwUvBwW5G/XmFFYZxw1vSrC6WFPt29vpxg9V7Rx95Yvr0gP/0D3V79sZ4599TtwoYFKpWuaDS4EzWD8lz2nCA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKj6LHyNdKYvzJyTKgRQiKS5+xnArrrt3DixNjvdfmkGOPJH1kt
	K/XRwPwwSXXR0bD+MeKXPZ8Nb5LkggQQHh0qEGb4oPOoLFTKF+HeAxby
X-Gm-Gg: AYBFou3nUpBR5N5nsbMQYtDkatYS56UFNra13LvEXWjFETBgFQP/S5esxdUZHsqaTys
	0+GXO6FCUUvnNRvbY3ors3QceiqcXl86NPV2J1+aYJy8P+iye2fO0SmTjlTZrFyS7V/qldYxuA4
	24fExd26XrNG6W334iuF9wMLr4kY3wl/oT6tac+7rU/A28iYECcaNpZxnF6/XSckEkJmmPPJ1RB
	b3lTK4mVK/1p3+ijt/hTEL5i8xCdV3cbGuF3/gb9q21xSJ21C2nFPvJHXrMgaDRTPb3OwNL9MgA
	IHwe4lRTeETibZyDApyUnkS2LDGQ1qcp5aIakM9X7vB+xjUYAoLFCHlZbTiydwGNH1LxM0q6G5K
	/HQmvhXx3nlOZaYn0lUwe6Ww61reT/EQ3JieFAH9KffM6NOc6Qcn56AP8lfjB5AZL4TTfVXraQF
	D9sdlVKi2ZHHp24Q7l9+0EqzOZWKI7DgIZxtPtO4k5bl6qY4w+umMLTA8go9hiAYGyef/yKc8a0
	0CFNERm80b/QOmc1Rbk3rGn7sAdLQaLyAplWPzkbOe20jSHk7hvZicrFN+9Mh6x2HiZMmWBjgj6
	oqn8e1sADG/91B2CmoSzc5uKOg6/2DJL8X2GdsfUXO0ovmpDM/j7Xw==
X-Received: by 2002:a05:7300:aeaf:b0:341:c383:9afb with SMTP id 5a478bee46e88-3536c59ed2amr14755201eec.20.1791849392798;
        Mon, 12 Oct 2026 16:56:32 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm8686145eec.1.2026.10.12.16.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:56:32 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Tue, 13 Oct 2026 07:56:23 +0800
Message-ID: <20261012235624.77993-2-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_165634_562067_824DFF39 
X-CRM114-Status: UNSURE (   8.95  )
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

A bootloader SPL that follows the K1 BootROM runs from SRAM before DRAM
is up. It needs the root clocks, the clock and reset controllers, the
console UART, and the boot media controllers: SD (sdhci0), eMMC and
QSPI NOR. Mark these nodes bootph-pre-ram so an SPL can use the
upstream device tree as is, instead of carrying the tags in per-board
overlays.

These are the SoC nodes that the mainline U-Boot SPL for K1 currently
tags in its board -u-boot.dtsi files.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd341..8ca98d15a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -322,6 +322,7 @@ cluster1_l2_cache: l2-cache1 {
 	clocks {
 		vctcxo_1m: clock-1m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <1000000>;
 			clock-output-names = "vctcxo_1m";
 			#clock-cells = <0>;
@@ -329,6 +330,7 @@ vctcxo_1m: clock-1m {
 
 		vctcxo_24m: clock-24m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <24000000>;
 			clock-output-names = "vctcxo_24m";
 			#clock-cells = <0>;
@@ -336,6 +338,7 @@ vctcxo_24m: clock-24m {
 
 		vctcxo_3m: clock-3m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <3000000>;
 			clock-output-names = "vctcxo_3m";
 			#clock-cells = <0>;
@@ -343,6 +346,7 @@ vctcxo_3m: clock-3m {
 
 		osc_32k: clock-32k {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <32768>;
 			clock-output-names = "osc_32k";
 			#clock-cells = <0>;
@@ -586,6 +590,7 @@ i2c5: i2c@d4013800 {
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -857,6 +862,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +875,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +884,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +964,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1094,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1338,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1352,7 @@ sdhci0: mmc@d4280000 {
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
