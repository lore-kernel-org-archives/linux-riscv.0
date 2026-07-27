Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91B4C53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYvzQQs9KggSZTDfctIL/L845BZkkd4Y4oQAf4DvCLI=; b=QfpHHk3aAsFhgF
	6XLRc0RAJef8didYvkijLqvqyZb8Apy6MbFsb9Sdb+NMeR7TmSjZCBmsC4gQ4f2Ec1bxUEbUUMZy+
	XTb4q9/RineXhzTqIylRetB07ihQpvN7SIBT8qDkDpATvKtZUPq/vsUuAypqwSJJQk1LNEOKscbtU
	Vwl4neRSAr3Ufd+ODp1uUig+j/Pbm9htZMqcWoqxJHkyFl5HOd4ruFMLS/dec9m4ZsCOi+oItI752
	M577S4uw4Utr2BhYMtccpY/aIn88I8faGvh4vDqZpDbE78UBCyxSNclQsLT9jNNMJgdrRF7zBv4Om
	VNrAp79prpjaKwEAIccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHw2-00000002N55-352c;
	Mon, 27 Jul 2026 09:47:46 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHw0-00000002N4R-2iG2
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 09:47:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so36992505ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 02:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145664; x=1785750464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2N52ZF/IjKhZBIW5738KSh9he99B/S0uG1hHgg20oHU=;
        b=IMQ2xBTzFx/7l6KeWLNE11iFko/Ie4Z0y9XZzvG/Z5Y6lS5n3II0jOkz3uXuahNKbb
         GqzN/K0lS6oDaIcvbY8EL2ZKdfH0vuCJBDYujSaPcED4EfdjJD0v72Z5wrBDn6rTBXC0
         WxFergrzYW5yMduZ/d8zvcTJ4ZaBqtY5ZeXC+kJUS8Jo7ewYbOJ60G4tiq5TDe1+Vs9N
         X84zoaupUspiMCxpUF7u77C6G0N3ZmANYG9F6/P2OLppMS3gFXiQMtrZT1Wtx2gzb4jQ
         5GcGy5arF1d7oPJb9loqdURKFi0PJmNMMztJL+UCpeDtqv9n2lkLnlWzHqrvHqxd9bsP
         uPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145664; x=1785750464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2N52ZF/IjKhZBIW5738KSh9he99B/S0uG1hHgg20oHU=;
        b=PI8sfQ7Ie3GKk1uWJsZZRgN0orQn6BKwtbjNktJ2E/8m5DB6CQD6PY8597duDrnqyA
         /zfPD99lzeIO9utyJzOPD2k9wCN/LmmGZajmRSw8mTbKr4G7Lu726OyGXxNd35L/ZXEh
         u4kwheAlvzRgDBa9HxuycsmqGRed3ERixH4fh066iWjooeVUvheopSyhMtX+rKtiagBA
         FZH68TmzXSTAlHS5n80/1hvsZe1g7hDDkxc/kxoEAQ/AZmLSGsgPAD6ZDqGYVS9QmyE9
         hGjHYmQaTYDmK1X43EsGRBvW7oxggj8Ml3Ri6yG0ovB/cJAo6T3W3g5LLa5Z6NeB+YJu
         rqnA==
X-Forwarded-Encrypted: i=1; AHgh+Rpl2TKfGeci7WVHQpvNxuPccw4Tn/f7TbVTb2DwMErUWB+4tMUyx4BLq1lf7PE3BjcGYqdCkAzIEcyPSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUuN3PxfasvvEPjY/6plJ2vjzlmLgMhNrAOugblVKLvTM/9I5u
	6seQfVmozUiIty1FVbyWMLeS4seDJi7qSvS/xjT1oJxbWkQtgKPWuZovPqQAgsDp
X-Gm-Gg: AR+sD13v91OUmm52sfELJtu39/H1wO+emH5u3TM/UqiIBGyZtAOEc40xRDn4oyDQdIQ
	FEFB0AEqtmaqWpjAqty/bvButX4oeKtUnH9rcFMS65sF0RWdlMaPuvaSlNEewT7KB0MU513yOsX
	4eTQAA60AAPBkMjZwXissyIasNpowCOynaefImKvwY7DZfYGIKFXda2T+HqEZ+RAtMoj3jE0nuZ
	kVfPjiu1BHxGjutAG/fYzyrcSciQfciL9JoMZ8cHPAG9L/IWNq6gkAA5DTEQnzeIQ+WWUBtLKGc
	yibVtdyO7RdV2YeWCKFRgEyE7B9CYUT0kZGmjNCoYuMsk5nuEgIw4HnxOtj/sZDI4zwx+NhaWvc
	ktcbKzIilYgW2wZpdcy/Sl9ZwJ6ObmHJulEa1z6BpfWVkofqQ6h+zzwv2lI1HEHJuhDXUkzhm3w
	Yo
X-Received: by 2002:a17:902:fc46:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2cfde851bc2mr78137205ad.24.1785145663832;
        Mon, 27 Jul 2026 02:47:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e8a0asm31819215ad.34.2026.07.27.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:43 -0700 (PDT)
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
Subject: [PATCH v2 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Date: Mon, 27 Jul 2026 17:47:24 +0800
Message-ID: <20260727094726.890179-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094726.890179-1-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_024744_722606_51AC4DD5 
X-CRM114-Status: UNSURE (   9.43  )
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
index 7863ab7dd308..314dea88b4a4 100644
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
