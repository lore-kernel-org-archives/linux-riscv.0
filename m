Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE2DC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTSQKSiVHW2Ovv/or1XywMvIZEpvK60e4i9fMAC42/w=; b=AVHXU832LIaR7J
	YncfJUmCEBmR4itZq1bVsajPVw9vrBXeoR2wX40yg7vNZKm+OzwYY1/4p9q8mrB25PHp6ZF8vFMMc
	SZq8sjWv482baLXC1ULTS07hlZbWbCTvq4WM3OIaFspB9CEkGZF1hvI9yVkkjJ8SveYG0CSUi2DIw
	2zyjZFvtwXIPS03j6Rr999JCSRgN9rmFAS34f+XuwvfhD8p/ypxDm8+aZ7He/KRM33IfOiR7FA/eA
	INOXmMAnQlU0scoxus50PlAz6cIhaXXJrtHwCfR+BXwUEACU82kCPafXcLPufPtY5CMktcBdykmCQ
	9VeH2Wf0Zl+Nr/pV015A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whg0Y-00000000y5A-41NB;
	Thu, 09 Jul 2026 04:05:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whg0U-00000000y3b-3a7D
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:05:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84847f60deeso447290b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569902; x=1784174702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+lkRwsHLNpgYt1jIp//joS32o1quiaFJu8sJahi9Pc=;
        b=j3PScfYHnKXAZwfCuefPDzTFe9RjSubCurYnuAx1QuT4K7fLuKAeVCdtuOc/aJsOwE
         VgRBr0IpubWRP29gCdaYEMK9RKuldDcGb5hgv+rZ2+1Y4TyF88pn7ZFY3uAdTKQZKe4r
         bAWz/mVI7j3mSVNfDOqZfkTmqnXdPy03vIlFtH08TwEpyr/tqdIO4GtyQONY8TOHBFdw
         JjIpKL2F6EpJUXjgU6ymBLPqoZDTpW8pnWyZVRtRTjFah0LzCpZACHJeFYJOr2DPLmPL
         uetuIqjOav7o0qcsf5/gwivj5ewQYk1DG/Qyk4ET1xhTEdcY2Hzn3lh0ofOJS+qc14Ek
         ynWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569902; x=1784174702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+lkRwsHLNpgYt1jIp//joS32o1quiaFJu8sJahi9Pc=;
        b=JyyyaquQ/sP5Tc77ion7bnZQAmDwjBIC2mD2cMHb7yZCul1nn49pPwzcQUQx+LsGdn
         MLMoKSzQGwxr6uAW+vI3HbW6itpEoV6PxC0lr67zkd36ESNA4NOlErtYH/uRHEUToLUo
         yPDFrFkaE4ZHpAQsKLeOrHrhG/OCCVeXsCf4xZBu2FUQqGXhfW7I+tmbPETPJaoUdUWF
         aTPMC/9h8+b01lEPBWSj9WICzg6aM+N7GyBGh5Tg+EPoyt7PyxhvtPjIfx0KYqzJgT9w
         Go6Ic7fm1SVcx+PfmKPEX8uuy4FgLF/pGKTWWBQOolCum4Z+CqXQUryLDfhjFzPOoDHc
         zyGw==
X-Forwarded-Encrypted: i=1; AHgh+RrhN7RntqLPyiEjDp2xx9RCJiz+ivFAUi4HWaOB5lN5T+d5aIO5+yrMX8gFjlDNQum7b0jyIjZ/IfGiWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx55SXp6+rS5IfejtWxlU+ugqDJzW4gcoIwY5/hqAcWc7Qf2TMU
	XwO6Km/wqGJLsxy9s2v0nrxffoKc4Xjtbse30ttCHJbETP///X+Uezwj
X-Gm-Gg: AfdE7cmgWhJpuoMxOI6XG61U877N3tc87mkfh+fSvtodLB1cg+jOXxqR6/X4fOT6K+F
	/WU2007euGFeWFar+ZK8hGlC3tSK286OCSy1nhisOOzIqxNsKehZUWmW51s3U/0zaQN8uFADpbV
	j+aAJ2I+oebcOZi9ZpA3LHJDkAUVLNEAcO5JiSCfwLsAdbVH3oI1LPjlUEdQ1b4jmRaU9lJh4Gr
	70PttYE/g/b0ADwQPIb/fuAUTJeUphEpbehDlsEgrjz5wT+HCn6pMd9xOCJ3YI9btJi3Ed9M3L7
	FpsNkSeP1FLPcG/nHDFCUCFbVaikyZOQujqNvs9lgkEmdbnk+5bwD3NLQRg9KxskHA4A0wa2cpf
	tets2TH9orLbhzy3f2DhvPHZBh6U+1UtP+6mmvxV4BApDAqreamsWCETKy8jkfTKy
X-Received: by 2002:a05:6a00:22ca:b0:848:2ef5:50dc with SMTP id d2e1a72fcca58-8485aca3bd0mr1379223b3a.36.1783569901817;
        Wed, 08 Jul 2026 21:05:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8485a44876csm335615b3a.27.2026.07.08.21.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:05:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Date: Thu,  9 Jul 2026 12:04:14 +0800
Message-ID: <20260709040415.977784-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040415.977784-1-inochiama@gmail.com>
References: <20260709040415.977784-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210502_941691_06AA5568 
X-CRM114-Status: UNSURE (   9.12  )
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

Add all PCIe device node for Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
 3 files changed, 266 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 2a6d35a64d5c..1eb5abbc61f9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -205,6 +205,44 @@ phy0: phy@1 {
 	};
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_0_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie2_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_cfg>;
+	num-lanes = <2>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 2 PHY_TYPE_PCIE>,
+		       <&combophy 3 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..68aa21a5279f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -689,4 +689,37 @@ uart0-0-pins {
 			drive-strength = <25>;
 		};
 	};
+
+	pcie0_0_cfg: pcie0-0-cfg {
+		pcie0-0-pins {
+			pinmux = <K3_PADCONF(79, 5)>,   /* pcie0 perst */
+				 <K3_PADCONF(81, 5)>;	/* pcie0 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <33>;
+			power-source = <1800>;
+		};
+	};
+
+	pcie2_0_cfg: pcie2-0-cfg {
+		pcie2-0-pins {
+			pinmux = <K3_PADCONF(25, 4)>,	/* pcie2 perst */
+				 <K3_PADCONF(27, 4)>;	/* pcie2 clkreq */
+
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
+	pcie4_0_cfg: pcie4-0-cfg {
+		pcie4-0-pins {
+			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
+				 <K3_PADCONF(77, 5)>,	/* pcie4 wake */
+				 <K3_PADCONF(78, 5)>;	/* pcie4 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <33>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 82c9e2da82e9..53cfb2ad48cf 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -439,6 +439,201 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		pcie0_rc: pcie@80000000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80000000 0x0 0x00001000>,
+			      <0x0 0x80300000 0x0 0x00003f20>,
+			      <0x11 0x00000000 0x0 0x00010000>,
+			      <0x0 0x82900000 0x0 0x00001000>,
+			      <0x0 0x80100000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTA_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTA_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTA_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
+				 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_A_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_A_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_A_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			max-link-speed = <3>;
+			linux,pci-domain = <0>;
+			spacemit,apmu = <&syscon_apmu 0x1f0>;
+			status = "disabled";
+
+			pcie0_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1_rc: pcie@80400000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80400000 0x0 0x00001000>,
+			      <0x0 0x80700000 0x0 0x00003f20>,
+			      <0x11 0x80000000 0x0 0x00010000>,
+			      <0x0 0x82c00000 0x0 0x00001000>,
+			      <0x0 0x80500000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTB_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTB_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTB_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00010000 0x11 0x80010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x80110000 0x11 0x80110000 0x0 0x7fef0000>,
+				 <0x43000000 0x16 0x00000000 0x16 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_B_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_B_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_B_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			max-link-speed = <3>;
+			linux,pci-domain = <1>;
+			spacemit,apmu = <&syscon_apmu 0x1d0>;
+			status = "disabled";
+
+			pcie1_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie2_rc: pcie@80800000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80800000 0x0 0x00001000>,
+			      <0x0 0x80b00000 0x0 0x00003f20>,
+			      <0x12 0x00000000 0x0 0x00010000>,
+			      <0x0 0x82d00000 0x0 0x00001000>,
+			      <0x0 0x80900000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTC_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTC_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTC_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x00 0x00000000 0x12 0x00010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x00110000 0x12 0x00110000 0x0 0x7fef0000>,
+				 <0x43000000 0x15 0x00000000 0x15 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_C_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_C_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_C_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <2>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1c8>;
+			status = "disabled";
+
+			pcie2_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie3_rc: pcie@80c00000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80c00000 0x0 0x00001000>,
+			      <0x0 0x80f00000 0x0 0x00003f20>,
+			      <0x12 0x80000000 0x0 0x00010000>,
+			      <0x0 0x82a00000 0x0 0x00001000>,
+			      <0x0 0x80d00000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTD_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTD_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTD_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00010000 0x12 0x80010000 0x0 0x100000>,
+				 <0x02000000 0x0 0x80110000 0x12 0x80110000 0x0 0x3fef0000>,
+				 <0x43000000 0x14 0x00000000 0x14 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_D_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_D_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_D_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <3>;
+			bus-range = <0x00 0xff>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1e0>;
+			status = "disabled";
+
+			pcie3_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie4_rc: pcie@81000000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x81000000 0x0 0x00001000>,
+			      <0x0 0x81300000 0x0 0x00003f20>,
+			      <0x12 0xc0000000 0x0 0x00010000>,
+			      <0x0 0x82b00000 0x0 0x00001000>,
+			      <0x0 0x81100000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTE_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTE_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTE_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00000000 0x12 0xc0010000 0x0 0x100000>,
+				 <0x02000000 0x0 0xc0110000 0x12 0xc0110000 0x0 0x3fef0000>,
+				 <0x43000000 0x13 0x00000000 0x13 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_E_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_E_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_E_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <4>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1e8>;
+			status = "disabled";
+
+			pcie4_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
 		usb3d: usb@81a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0x81a00000 0x0 0x10000>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
