Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265DACCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzeCVZGSXbRFrLcEWr4V+4o3iUiIx7+s+jZ4NUmHuLg=; b=ILr4kVJwSHss7k
	tvawHZnuOyAeAH07zzsS4+bLxji4LdIp/8GW/6VMQApgp3ZIh7TuGTLJ4oxyKHQjHDgb96OGbKhIQ
	9a/YW54TUtmxNfV69fibck2wyggQvzyB9gKdb+SgiG36Q11BHx7r1O4VaLcMh9FUlnwwnji3kSCM4
	S7m5+qqenzSKmcD91uL3S+8QiZkG9RHihVwGjuVvR7oIRSNhLLVsKf50PrXgPPpTqAsH/GhwGyTeX
	bROA/KmLDLP8JmSjgiV9N4S8wE7b/+XjKvNHnACWM4MdIKD21JvLo01WaxkLo448qOm+7GwIAOXVl
	nmS3cHcG9paTSNxof2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8jC-000000052md-43b2;
	Sat, 17 Oct 2026 18:01:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8jA-000000052m3-1MWc
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 18:01:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e49fbf92aaso4371045ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260111; x=1792864911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i10C1318BcrIJPXpXStoFrX+oUsWnUZudq49qSCTuyQ=;
        b=a+s19v4Ot+QtTnXFkB2gJ4MDWEOohwPzeL7UNGjuyKSxeygioYc1RIgYRj8A7O1Itd
         tdkZCc5gEMRu2NoFnjBndjqd9ZkI2SGEcDgjgpi7Ykx6Wc33ZOoB4269XVvw4AKMhh7S
         4euDCczK8DFKgcXTICZ4ZhSN+tiUF7uXe5cHqHR+2y1G2UzLxRiblGMWFz8lWv371E+q
         FlM3u9kaOZS1NW/LbtghB15z+3ZWa1KN7+LFhHFQcEoYbuyoozqaWH7Zvy+2pMtS+AFb
         B0ygZumKZvDxdlZYVbGw044PbCfkzdMbzk614kVczsPGx98Gbq9Efl7FOIN4KYof9E3x
         dG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260111; x=1792864911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i10C1318BcrIJPXpXStoFrX+oUsWnUZudq49qSCTuyQ=;
        b=pySzSTqvpxAKC28M2krCOmLOpyjjMoEsnPGERKci3jQKIbK+Lodds6JeWrCvdUJa+s
         VyEMIpiCOeAgmD/VAmhtEYOOJiYqh/xf9A9v4t8K6pVIp4LbT08mf5x9RocgZcFUgMnD
         kxN5IIbFBJ9G78xM4Lgjsnchb1v/qe0ojK6r17tir8MaWyfHFm6kbpH1FrWnucORa5Kh
         Oq37RyERUoB/DWInWAzTQl+THhGABEuAbd95sQXMD+MTuWCi+WUFXCz8WoI2PvTPc8Ei
         /mwV+ut+5t6vWn+Y9E+17EHYzF43rrKtuBFdN3Q8HiT6t8ZQSTloifpsPSqdKXiRSQXH
         s8yg==
X-Forwarded-Encrypted: i=1; AKwUvBzwbQz0ZFksTInx9TdwThx+nFeVD3PyhlJCbmQWSnjF6Mqrq2yv5YoJiU7ePGBfE4DLlW1NQwrWDbN9BA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIir20JouTbz5FGN9DXWdPStsr4ouGnAEuBl0tUSX8to21oCPem
	az7Fk1JEYvlns7cnm+wmZknDgehEu96vqUstiR4Wu8QqboDKz02ssYOS
X-Gm-Gg: AYBFou2U26/lxItXdeD2SWj4Oale7oE+GpR1LPl2BXcKqSnCl5es7e++cCWuvQzD55D
	qITuMitg13TF+Bq+bhnizS8MUj+3Y5ZH43TeFMuagwKkkqBHNIUbCzlBYNuHkiyAux+01s5pEZq
	q7Zj0nYGYnXOsHAI7k3UoujnxcqWxEFyHbWTR3p8QUHrXbB2/rQ+J0hX/POC+weMzdp7bC0DGYW
	eR00ATlWQVj+eQxW2uXzfk61HWzHh18elLovvI0hVlWS6ThbffQO/+eot7LrXOOmt56oP3wMJ/s
	Og7LhYqg3HzgJiShgi+p+xZBQm0cBILntfEIPx8khGpDhhrTmqR10Cu3P8OSyhRhD0nmifS0woI
	RSxbgI2MPZavKCoOBb1KxtD7puz3/mb/3gcNZrdz59JpbWMsjojpoNJ6BtgPwcycsdTtT39c8CO
	BQmdK5WhdNAGBRD9L1G0saElpWRc3iTxUe6DgmHX///wxm5esmJElJALaoh2XsIem5RHOMqooZo
	wcfhwGxtWO7AgmY6zXsKwp7n9EPfnZIAZrp7zZPgX+i3cyOaRFIqcoP3Kt7iNuJV6P4CaJsKfhJ
	mee/ALLUOA/KzGDeh7PoEMI8egTwLfBBcdyX21fvvLQvwS/WzamQHg==
X-Received: by 2002:a17:902:eccd:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9a6c1b983mr25597675ad.16.1792260111161;
        Sat, 17 Oct 2026 11:01:51 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm23030035ad.2.2026.10.17.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:01:50 -0700 (PDT)
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
Subject: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 02:01:40 +0800
Message-ID: <20261017180141.3477743-2-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
References: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_110152_390058_6670D5B2 
X-CRM114-Status: UNSURE (   9.08  )
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
console UART, the I2C bus of the PMIC (i2c8, which every K1 board
uses), and the boot media controllers: SD (sdhci0), eMMC and QSPI NOR.
Mark these nodes bootph-pre-ram so an SPL can use the upstream device
tree as is, instead of carrying the tags in per-board overlays.

These are the SoC nodes that the mainline U-Boot SPL for K1 currently
tags in its board -u-boot.dtsi files.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd341..5d9550272 100644
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
@@ -726,6 +731,7 @@ i2c7: i2c@d401d000 {
 		i2c8: i2c@d401d800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI8>,
@@ -857,6 +863,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +876,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +885,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +965,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1095,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1339,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1353,7 @@ sdhci0: mmc@d4280000 {
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
