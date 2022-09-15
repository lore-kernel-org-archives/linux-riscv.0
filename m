Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2235C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8wZDgL25/4gIR5jp4mdDanNjk+ysWQqbc+UNk8WB7U=; b=BXJpYRX5YFA0hv
	ksQKInViqEZcysDfyeGNfrajhaXf5WKz2TuDOwxNiLIcJXU7WhUhUJ+lk1/HIfQKMlrdrjRmP5S3r
	YbivimNEjqKJLFCFsDbDNFOA3La+Mv7/H6PgqDpwuQr8DMYOV55WtMMqNrCwjAjE3yqAD/8ArGPko
	1FpZBs2Hnh/+OT+vV3Vi2/HMXuOCGZONK9UBcg4uaUeGye+k+flAIgIjlIaZJOvQeIPSS20QZb0oo
	aHGDp1Fqpppofkruphxmgc2u0Hadga6n4024I3wForkWr8v16kfv0n8c4gp8WL8chdFg0JKZP7GVh
	TpnItO7ZAWYcXjUOgxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQw-00FUXr-Fg; Thu, 15 Sep 2022 18:17:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQk-00FU8T-Om
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id ay36so4843007wmb.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=h7rmDnDbEL5nfCcVBsfSnk+K+mwOgzf5y2MGdbkhmos=;
        b=pJ+WzY3CCFUWtX4TsruXqFq2+vI90gSDypxzOkr2djU2Rj0ml3PS1t96Zx0i2lZ2wM
         vCYotryDXl75WPhpCDPwhBNQSOMJv6hSEluVzcMeieuoobhBBV9ur0buMnwLJgsmjxnp
         XVpSNQyJzSlYeEsUWjP0JWZm/FaxpvEUVcBpXkXoelZ1exDOtgW4kx4lgolnLmj46Rs+
         y+DGl0webU/vwpfufgNaT6k0j6pDRy3L9TYfMzC8CTLex6fQGFSowm6nahPGyx8iamcK
         2bJuIT74TkPfmAT7cZo4Bie83H9TbZ3vixCHv6bcak24ma3jf1grEXg4FrZtb11g+YUU
         swRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=h7rmDnDbEL5nfCcVBsfSnk+K+mwOgzf5y2MGdbkhmos=;
        b=fuIjjC29l09YB+APTRtMboGLJJsPr4HyE1xvXeqEhe4EnzecTt5pImYVablfo8hwgv
         AqJylHaPhU81MXUtSIy/hSzgGcNQ5G8NrISJ7rOhxaNVnB8JyI+Ty+oeWe2oK15duDBj
         6CasP9VBys7bFyHF61feXCv8/iDQbmhS7Ly2wq8hx1h02zOReVArhtNtZ8Sy4+R91yPz
         S5v9KmqMLWOWN8EMdEp8F6ykSwBPT89INTBEU8+rbf83uaoCdoYnJdRswvmoPBdXndNl
         uELGdzHZl104AjUtGU208825uHk2G8HdTaEtMAVmR53Lqyz9XAWf2fAP6i3D28OLj2Vh
         Rd1g==
X-Gm-Message-State: ACgBeo2TpkdNX5Fp7Is0383YjIWh+WMs9pw9oc2QMeEAE5IAAfYSzRUu
	5y0rdNhuIEUgGfVCy4VgJ9A=
X-Google-Smtp-Source: AA6agR6pdr/WhjUQs5dbPdMFvVEN7qcpsDILeWhlX+kudsNMORv11FDp6hzHNX+T5WBRNGOTYfw7zQ==
X-Received: by 2002:a05:600c:229a:b0:3b4:810a:8b4f with SMTP id 26-20020a05600c229a00b003b4810a8b4fmr7749657wmf.117.1663265856553;
        Thu, 15 Sep 2022 11:17:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 07/10] riscv: boot: dts: r9a07g043: Add placeholder nodes
Date: Thu, 15 Sep 2022 19:15:55 +0100
Message-Id: <20220915181558.354737-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111743_022769_BB805F60 
X-CRM114-Status: GOOD (  10.90  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add empty placeholder nodes to RZ/Five (R9A07G043) SoC DTSI.

This is in preparation to reuse the RZ/G2UL SMARC SoM and carrier
board DTS/I.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v3
* New patch
---
 arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 177 +++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
index fb6733f3cc2b..6d9db759a847 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
@@ -13,6 +13,14 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	audio_clk1: audio1-clk {
+		/* placeholder */
+	};
+
+	audio_clk2: audio2-clk {
+		/* placeholder */
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -54,6 +62,23 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		ssi1: ssi@1004a000 {
+			reg = <0 0x1004a000 0 0x400>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		spi1: spi@1004b000 {
+			reg = <0 0x1004b000 0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
 		scif0: serial@1004b800 {
 			compatible = "renesas,scif-r9a07g043",
 				     "renesas,scif-r9a07g044";
@@ -73,6 +98,48 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		canfd: can@10050000 {
+			reg = <0 0x10050000 0 0x8000>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		i2c0: i2c@10058000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x10058000 0 0x400>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		i2c1: i2c@10058400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x10058400 0 0x400>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		adc: adc@10059000 {
+			reg = <0 0x10059000 0 0x400>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		sbc: spi@10060000 {
+			reg = <0 0x10060000 0 0x10000>,
+			      <0 0x20000000 0 0x10000000>,
+			      <0 0x10070000 0 0x10000>;
+			reg-names = "regs", "dirmap", "wbuf";
+			status = "disabled";
+
+			/* placeholder */
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a07g043-cpg";
 			reg = <0 0x11010000 0 0x10000>;
@@ -104,6 +171,95 @@ pinctrl: pinctrl@11030000 {
 				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
 		};
 
+		sdhi0: mmc@11c00000 {
+			reg = <0x0 0x11c00000 0 0x10000>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		sdhi1: mmc@11c10000 {
+			reg = <0x0 0x11c10000 0 0x10000>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		eth0: ethernet@11c20000 {
+			reg = <0 0x11c20000 0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		eth1: ethernet@11c30000 {
+			reg = <0 0x11c30000 0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		phyrst: usbphy-ctrl@11c40000 {
+			reg = <0 0x11c40000 0 0x10000>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ohci0: usb@11c50000 {
+			reg = <0 0x11c50000 0 0x100>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ohci1: usb@11c70000 {
+			reg = <0 0x11c70000 0 0x100>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ehci0: usb@11c50100 {
+			reg = <0 0x11c50100 0 0x100>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ehci1: usb@11c70100 {
+			reg = <0 0x11c70100 0 0x100>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		usb2_phy0: usb-phy@11c50200 {
+			reg = <0 0x11c50200 0 0x700>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		usb2_phy1: usb-phy@11c70200 {
+			reg = <0 0x11c70200 0 0x700>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		hsusb: usb@11c60000 {
+			reg = <0 0x11c60000 0 0x10000>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
 		plic: interrupt-controller@12c00000 {
 			compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
 			#interrupt-cells = <2>;
@@ -116,5 +272,26 @@ plic: interrupt-controller@12c00000 {
 			resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
 			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
 		};
+
+		wdt0: watchdog@12800800 {
+			reg = <0 0x12800800 0 0x400>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ostm1: timer@12801400 {
+			reg = <0x0 0x12801400 0x0 0x400>;
+			status = "disabled";
+
+			/* placeholder */
+		};
+
+		ostm2: timer@12801800 {
+			reg = <0x0 0x12801800 0x0 0x400>;
+			status = "disabled";
+
+			/* placeholder */
+		};
 	};
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
