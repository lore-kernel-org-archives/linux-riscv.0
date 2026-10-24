Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0A9606AC02
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWGbIqnT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l7AFE03X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a49ifzVpF4H/w9UjWmOmYKXt61WlwOhB0YNAMVrNc9Q=; b=OWGbIqnTcIXtMJSWr1aEHdrO+b
	lW5c2IYcqiwVJReAnXhUkDujWF5dTJd2oN5GY9gdzLaMN77m2g5Gekdr2UiUkdo2pvoWEL0pZWu6F
	GHhVN15853tVGGvs3RbqfwKqE4edCQIY605pQPrqeOeQhVeyQSLqjl7YrM4PsG4PwVFIWf8qfM5Rv
	+SFukRD0oT7msaZ6wKOSBGESkTvh7Idn7FzBLinh5urnB0jf26gERvYl4xSNPvaEamRwCcOI1ibbw
	ScBId0pS/Cdqwt9RZd6BjT2Zjgv/ikFWoGdNUZHoDNpHTHGZcRqpiYlYJdGEka7W7/A3WjIAVJNdN
	HV1eIRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY11-000000002nM-1Qed;
	Sat, 24 Oct 2026 09:26:15 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY0u-000000002lN-0moh
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 09:26:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso681483a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 24 Oct 2026 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833967; x=1793438767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
        b=l7AFE03Xtv+PbzIqu5Z/SqqOPqaGoE/NI7iJNFfDFWEmvRWeXQGD7NugkY3p1KENll
         EXjAeGKDPGN2YPQ5yZrLny8Qy0H1VtAhJLIrZM7ujLF/Vwov7BcZGUNtJ3FsLYgPXM2t
         G8u2xmBwHjtvxIBBSDfdWEtUAIaOHzq5iGNIaqg77zi3IMEjb9R9Lknm7FCXERvOWvFR
         3dTj0ex1kc8IO/4XBLipnwFgjcHn2PBW27JMHR2/d9yBqRpgJkjhc+A9W4vuX9P1S7qr
         hZ8pxXcLXQz1ZQ7vxGrh9Z1VW1MJRuJSmN1gxIfKFsYehsTvtcnJCQJiOXjBbbpKc38+
         qeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833967; x=1793438767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
        b=ZXeW+CIavL2mKrjj6rkKeJLUlYNWg0WBIq2CV8zTiHyecVgB0IY5mKnDJaiqmU4dWM
         QU2fLAlzn3WXZ4fKA9lVciUHe2qqPH9SMy/hdxRqXxxLI7vHSfQbFb1HERvmRb5MaQxJ
         RczV5D3/bZXN0daFl6Iz7nWbAZlN95VFFY1TzHaw0iXD6CoSaZNiBbsC32uHzwYRG/27
         TJ7/EA6edv3/Zj8OyJDIqv1kaLGXEToqvsYzuwUjZuQbbAUhtecbNs5xDZ2HkasXVg6/
         5MY3E2ggET1qXUyAG0U9Vtj9SijhTG8BGLZcUXdHocmzm0lR5BOSRZ0DByaRTHKq/fgO
         u0DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFgOzxI3xC5bqlRvLeBy63fIF1UrqaNSdSu/AiINl121TuOV3dIRI2uKypjaSfba6DaxBOMeVo3RshsA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIZMRce0xzRxFSTkjy0tZ2Y5eZBUU7A3WWOpwrGQAjpuoCxZh0p
	79bXzBShFejyXqZGV7v/OfAxXpmjgpk92ABdnVKOasfP5NdvrU3KDQzP
X-Gm-Gg: AYBFou2iCER7Zr/pn297V9hIPRzVYE44CFCvt5tf96kj9NQICkEFnBHJ7gYgdJXKctP
	fqFqeFA6YWUybTdH+AxT4N2UZfgRzCU6aDIx2Mj5nw4W4UamHnEfogXqLR/MCbNxqSAuyhtHpsV
	4Ehk2/hXpvYZyrQQGYNlGaH2rSkA+hDozubOxiGyFc4xYAZuQh1OF4sHc/MqF+3F9u5v+Cp4gG1
	UfM7KEcXBJD5RZJj6Giy5NXqSharLL66vb/lr63dO4aQvEWJGvViqgrfWxPdsM0yIGpkh9qPNCv
	ic9zbWmApMJymBG3u5Nh/IMqtMf5UUPNe6LOYfxPyuPzKlL90p+6e3gfE5PbmXI8qFkvz1yTQiB
	shjrR6oFSTaZmM6Si8HtO2ApmGf1zacAfsnv9EdAFBHDzvoTfPH7W3TfzoiGTrR1Y4120iIP0px
	erh6bS1dID1Ewc7iec14C7gv3byLPGBlQUjb9Rkhf7OSuRXxSKyAGzynP7hQKkSYqp+gxz4kRML
	XQFvuOgDp596fqpavm9L0PPrEK81js2p2t0o/pi+Dm4KXyH3GJprAz8rk+BLtuqG6bHeZd4MA8X
	cdDp6J2G4EiTjyrIjGKGYNHSKqP1MmSC/P1mf/ssJ3ApOYmmMJ3uWJGPmIdCLH6sBlV1tHaqism
	4FaKYQwbAUDgd4V36oJnN5YRop0YiukDL/js=
X-Received: by 2002:a17:90b:1812:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3adeac04979mr1472063a91.10.1792833967618;
        Sat, 24 Oct 2026 02:26:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:07 -0700 (PDT)
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
Subject: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:57 +0800
Message-ID: <20261024092558.143621-2-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_022608_230140_04F29269 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The K1 BootROM loads the next boot stage from SD, eMMC or SPI NOR into
SRAM, and that stage brings up DRAM. To do so it needs the fixed clocks,
the clock and reset controllers, the console UART, the boot media
controllers (sdhci0, eMMC and QSPI), and two I2C buses that every K1
board wires the same way: i2c2 to the EEPROM that holds the DRAM
configuration, and i2c8 to the PMIC that supplies the SoC.

Mark these nodes bootph-pre-ram, the phase that sets up SDRAM.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd3411..8a954f56a9 100644
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
@@ -544,6 +548,7 @@ i2c1: i2c@d4011000 {
 		i2c2: i2c@d4012000 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4012000 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI2>,
@@ -586,6 +591,7 @@ i2c5: i2c@d4013800 {
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -726,6 +732,7 @@ i2c7: i2c@d401d000 {
 		i2c8: i2c@d401d800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI8>,
@@ -857,6 +864,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +877,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +886,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +966,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1096,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1340,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1354,7 @@ sdhci0: mmc@d4280000 {
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
