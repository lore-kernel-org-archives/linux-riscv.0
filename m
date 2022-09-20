Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFF4C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Og72kBI+6MKCJMdr4RxGf7SQJ2p5ktqKYHZ4AAj5tU=; b=cHHo5fu9fop+X+
	eue1PT4QW1E/b9qF3n9t1vsC+vIjDXAyY7ihIcpJIw1ClFQ561ltKz9jtfo923Ik5sGvO3IzlFPfF
	rEULty0FkzCBjGmZQAzs95bTv5aS6piI8vKeW5545Mz3tb2lMSmVWylahLh7hjKFgicJR1Bzsp67G
	0idM3excDJQSSH5VSlcg5GPL/FB0Oa1q0N0Vk3+XdhV/7nwxLLFAMijG1Aq6761Q1SUOK/2p3Mp0U
	HEyNHVr7v2iRsAwc5JRbbt1+4nRnf/+q5frsGQyHH2yR4k/omY76slxDP5t61i9QsOEuAGvRFn/96
	7rAE+4cfrWWn7BmP4bXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiKQ-005poc-KX; Tue, 20 Sep 2022 18:50:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiK4-005pUT-50
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:50:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id n12so5906637wrx.9
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=huhfPl8+Ue6w49fzQoqMzRhfuePqblfjXffK332HZYQ=;
        b=ZQjck0mz1NJl+RRbDkDFrZ1Q9/1w20hB5vvd0dF4f9EerXG9HaP2wChEiLG5aaZ4Kw
         tIBvz+EWoCVYqaf74M0UGrLUL5QCZp5aapzOM5Dq4TCIaiHm2ZIjbHTQbbnDuZVKaQlI
         PuzgIilhOhJrzDsiGPj/Ujuejm3HCjb3Srp/mr1k+eY0diwNYr0WKmAYTz/5P0iCBs8I
         pqHZIOwJm+nBrwY8ulFO4bhR6VYT2ojWULuK/nNdoZyxNWmpyEQtvSqL5oecrgy0J80w
         CWrhOMGFQ8IuwBvyRyemIoWbKFH1W+QTDStjf1+0Iv7VTqsz3ky8t/NguXAaTpRbD0UU
         3WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=huhfPl8+Ue6w49fzQoqMzRhfuePqblfjXffK332HZYQ=;
        b=ibeLAqsC+0ilmglRYpu07XWR8e0YF0QaB49bkKt2gf/8TpST/LRCzhZxXHVLyDXTlg
         BhJL3wiA+U7reRk3CCFv7UE8CF5i52VUzHz20jh4CFaJPzKFY/rzKpNEVp7FvsQ1hFNZ
         UNcK6ctjvYLDwn+b+hSoRiNRzsthaYtWCJ4RyMhELYt0Cjgmuh/ZdXdzE2o2MnU4hNUm
         I6aSNWZSUem1ArscB+vQK29vPTfKjlFCh59MLzS5irHIlEPeV83LET+vZPJ96d+2ZcWN
         QZgX+6McZSZoKroCERh2hLCGGyKERFDGivxv/Fu6eGEmUo+ETlOnb2qUCPQySYuWPSZS
         aTXQ==
X-Gm-Message-State: ACrzQf2Oht/7uyXJVuh2hb47r+sWmIp1GspjvbmPE6fsbDW2GbkvmMN+
	dW2sXGl3s0+yuWRrdg0knCwyBDECjbWe1Q==
X-Google-Smtp-Source: AMsMyM5P7vfaGfUtFwt4Kdyyd3Ifr620ytmNRKzPAhGTWtJMHr5MX79q+mtppyXZ320XyzU9w1dACg==
X-Received: by 2002:a5d:64e5:0:b0:22a:43a7:b9df with SMTP id g5-20020a5d64e5000000b0022a43a7b9dfmr15294792wri.79.1663699815859;
        Tue, 20 Sep 2022 11:50:15 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e9a4:d6c9:505d:20d0])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b00228de351fc0sm582722wrb.38.2022.09.20.11.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:50:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@rivosinc.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 07/10] riscv: dts: r9a07g043: Add placeholder nodes
Date: Tue, 20 Sep 2022 19:49:01 +0100
Message-Id: <20220920184904.90495-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115020_994621_B6A223F9 
X-CRM114-Status: GOOD (  13.67  )
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

This is in preparation to reuse the RZ/G2UL SMARC SoM and carrier board
DTSIs([0] and [1]).

As the RZ/G2UL SMARC EVK enables almost all the blocks supported by the
SoC and whereas for the RZ/Five SMARC EVK we will gradually be enabling
the blocks as a result we are adding the placeholder nodes to avoid DTB
compilation errors (currently we dont have support in DTC to delete the
reference nodes without actual nodes).

[0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
[1] arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3 -> v4
* Dropped status and reg-names properties
* Updated the commit message
* Note sbc node is not enabled in RZ/G2UL SMARC EVK but will be soon
  enabled so added a placeholder for this too.

v2 -> v3
* New patch
---
 arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 150 +++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
index fb6733f3cc2b..d90d263b1b13 100644
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
@@ -54,6 +62,19 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		ssi1: ssi@1004a000 {
+			reg = <0 0x1004a000 0 0x400>;
+			#sound-dai-cells = <0>;
+
+			/* placeholder */
+		};
+
+		spi1: spi@1004b000 {
+			reg = <0 0x1004b000 0 0x400>;
+
+			/* placeholder */
+		};
+
 		scif0: serial@1004b800 {
 			compatible = "renesas,scif-r9a07g043",
 				     "renesas,scif-r9a07g044";
@@ -73,6 +94,41 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		canfd: can@10050000 {
+			reg = <0 0x10050000 0 0x8000>;
+
+			/* placeholder */
+		};
+
+		i2c0: i2c@10058000 {
+			reg = <0 0x10058000 0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			/* placeholder */
+		};
+
+		i2c1: i2c@10058400 {
+			reg = <0 0x10058400 0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* placeholder */
+		};
+
+		adc: adc@10059000 {
+			reg = <0 0x10059000 0 0x400>;
+
+			/* placeholder */
+		};
+
+		sbc: spi@10060000 {
+			reg = <0 0x10060000 0 0x10000>,
+			      <0 0x20000000 0 0x10000000>,
+			      <0 0x10070000 0 0x10000>;
+
+			/* placeholder */
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a07g043-cpg";
 			reg = <0 0x11010000 0 0x10000>;
@@ -104,6 +160,82 @@ pinctrl: pinctrl@11030000 {
 				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
 		};
 
+		sdhi0: mmc@11c00000 {
+			reg = <0x0 0x11c00000 0 0x10000>;
+
+			/* placeholder */
+		};
+
+		sdhi1: mmc@11c10000 {
+			reg = <0x0 0x11c10000 0 0x10000>;
+
+			/* placeholder */
+		};
+
+		eth0: ethernet@11c20000 {
+			reg = <0 0x11c20000 0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* placeholder */
+		};
+
+		eth1: ethernet@11c30000 {
+			reg = <0 0x11c30000 0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* placeholder */
+		};
+
+		phyrst: usbphy-ctrl@11c40000 {
+			reg = <0 0x11c40000 0 0x10000>;
+
+			/* placeholder */
+		};
+
+		ohci0: usb@11c50000 {
+			reg = <0 0x11c50000 0 0x100>;
+
+			/* placeholder */
+		};
+
+		ohci1: usb@11c70000 {
+			reg = <0 0x11c70000 0 0x100>;
+
+			/* placeholder */
+		};
+
+		ehci0: usb@11c50100 {
+			reg = <0 0x11c50100 0 0x100>;
+
+			/* placeholder */
+		};
+
+		ehci1: usb@11c70100 {
+			reg = <0 0x11c70100 0 0x100>;
+
+			/* placeholder */
+		};
+
+		usb2_phy0: usb-phy@11c50200 {
+			reg = <0 0x11c50200 0 0x700>;
+
+			/* placeholder */
+		};
+
+		usb2_phy1: usb-phy@11c70200 {
+			reg = <0 0x11c70200 0 0x700>;
+
+			/* placeholder */
+		};
+
+		hsusb: usb@11c60000 {
+			reg = <0 0x11c60000 0 0x10000>;
+
+			/* placeholder */
+		};
+
 		plic: interrupt-controller@12c00000 {
 			compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
 			#interrupt-cells = <2>;
@@ -116,5 +248,23 @@ plic: interrupt-controller@12c00000 {
 			resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
 			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
 		};
+
+		wdt0: watchdog@12800800 {
+			reg = <0 0x12800800 0 0x400>;
+
+			/* placeholder */
+		};
+
+		ostm1: timer@12801400 {
+			reg = <0x0 0x12801400 0x0 0x400>;
+
+			/* placeholder */
+		};
+
+		ostm2: timer@12801800 {
+			reg = <0x0 0x12801800 0x0 0x400>;
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
