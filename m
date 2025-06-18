Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBCDC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 02:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTagfUzaBqks4R0G4MB7DGbsxiJMlWdPpIVblZfrN4I=; b=0q39XvqQOr1DRv
	AATKcJZ2IriMI4EKzfdO+8u3zvmVW7VEqTp9Ula/bUgqbJLxMH+POyd1zofH8vkUy3LDJ3W3B7icx
	sqMcjk3li6HvhM2DKXAKOdrMLU5EFVSwZqSAGiaD0Zbsq1PukKIfNs6u95u3fXsq4c0z11uD+xIAA
	6fyltAFG+Wdq+aK1c9cYzMZmD8HR+QpYkJIs2dhtgtLgj5sSVIi+lttYUR2wpjWAF9ax9FYY1OQA1
	fKJjff+q9xp2agouwko3oDyQMOWbkKkfpTOZgYaHi2dBz5k85ZMCkbu3vL4oJ0dCbdxI7lvT62bPT
	o5Tjui2QA4Z8o18UFSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRi67-00000008nD0-1cY7;
	Wed, 18 Jun 2025 02:00:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRi64-00000008nCE-3Lnm
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 02:00:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b2fb8226e1cso246961a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 19:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212016; x=1750816816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE1Gb1OrqiG3LYX4Be49eRK89ofo8s8025uwaNDm1VY=;
        b=CuKgjLtdtj3wTTRNehsX0w90HRyZFRVNs3xUEuxO4gTxGUZp8ufYGbfkPgCquaTqkt
         nXWbOIB++gULS1BJkR0kohvcbDLM4nN+ZqeykEjNNKRkE/LAUVpt6m+TXZEqjzN2EK9Q
         npVp3ZDFtw5b47IeSycADO4aLKsswTu3S1JhOjAXfJQMI6X5QNI/ztZLwW8jD2kYxesu
         sGHYlRoU0d0MHVZgPisbWPiXye48BpxRqU/lx4w7VcNM7fei7f5t+zK0buLL/3LzToZl
         WrE8mgVH7BM++r4YWqF0cF527a4iMqxjvIYGGhxGCvBNSrXx0GN4WJnWPQUZelgrx6Du
         DVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212016; x=1750816816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE1Gb1OrqiG3LYX4Be49eRK89ofo8s8025uwaNDm1VY=;
        b=NRdw3UQJCYiCPXZ/XL0cfyXFyCP+5wjvQa9TifzIvYkOvNiyEqJJAuscpmefdjccRK
         vQRfCQ1NhMnjSn/X6dejfo72nHKN2JtfY3NAChl5CqNs5fSN7lmkFzTk02azDl7ikyGI
         z4DFnDG/oIqZpTaXSCRcQwB47y8ceFsly+bjtMeWMul+o4UWcJ1iTVUF5AW7vqGOH9NX
         TwGIEghP2UxV/XDmWmFktBdKgRGQUlWamhdzjxvo82/CtL9UGNLFk943jemgCSVroXwZ
         dccMSL9hIpjoMD1FfJia/uhqu+cmwAkVXQ6VnV3iGWkHjykFl87uIXxLGj/+scwToaJI
         8xQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCT6NKaV5zLHee+48nhOdJDJtw/RGmADKeKJOZIx9Xr2h2h7xQNKqFHi+12FOkQdBayDAt16OYTLXa3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu2wINTafTiVma6RlpuO41WAbgxW5e1/th+PnYgnCSR3O9lTwS
	THZIz68EjFp3Dy3gFydYuPC4cRmAkRCFcBFBNnMg71MGh41GHLkRGPnj
X-Gm-Gg: ASbGncuDFcRkCQ6ONDeV8bIIQcJKX9BI+yRZsDIjnnhMDgb6gsisMpHJbNfiSKMRIOp
	kS2x+OSQ7/rEna2AAIOUt3BtsTWJFOUbtrai/cHyhLHgXFJfeqXCrBWrreQNHChUYN1iwuEypt5
	RvyjL8YFmk7AkdiFVw1zRYurlID7rXd0p3x2WEvZzFyBqdlly2/+0GrVAFrkhQ5WNudP0nAdEQu
	oiJhzwDDwF4povoBdJOCmHEaz1JTC5t81gklvqBqDG+ow75HeWSgO5ItLyzHUbE78CeNpa9XtHg
	kPEFzK+xGUQNoA2ENvRRkwVzrjaYOck4Sf9E3dW8auH93pxFEq6NFaqQxrpp9lmuQN6ClGeM
X-Google-Smtp-Source: AGHT+IFWxCdtQjg8rgmCsHjBzQbH7FXpOqcmxWb+qrwYJsBbZ1/KLDpnvQFLZBFfFo4AEIEP+41QoA==
X-Received: by 2002:a17:90b:5825:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-3157c6ef628mr1088722a91.1.1750212015879;
        Tue, 17 Jun 2025 19:00:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c1bcbb57sm11479969a91.7.2025.06.17.19.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 2/2] riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
Date: Wed, 18 Jun 2025 09:58:49 +0800
Message-ID: <20250618015851.272188-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_190016_839201_3D4AC829 
X-CRM114-Status: UNSURE (   9.46  )
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

Add PCIe device node for SG2044 and configuration for Sophgo SRD3-10.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  30 +++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 175 ++++++++++++++++++
 2 files changed, 205 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index c97bd62e5f06..1ca5fb707061 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -67,6 +67,36 @@ &msi {
 	status = "okay";
 };
 
+&pcie0 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <1>;
+	status = "okay";
+};
+
+&pcie1 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <0>;
+	status = "okay";
+};
+
+&pcie2 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <3>;
+	status = "okay";
+};
+
+&pcie3 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <2>;
+	status = "okay";
+};
+
+&pcie4 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <4>;
+	status = "okay";
+};
+
 &pwm {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index aae4539dea98..6ec955744b0c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -32,6 +32,181 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		pcie0: pcie@6c00000000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x00300000 0x0 0x00004000>,
+			      <0x48 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x000c0000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+					<0 0 0 2 &pcie_intc0 1>,
+					<0 0 0 3 &pcie_intc0 2>,
+					<0 0 0 4 &pcie_intc0 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x48 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x10000000  0x0  0x10000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x14000000  0x0  0x14000000  0x0 0x04000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc0: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <65 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie1: pcie@6c00400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x00400000 0x0 0x00001000>,
+			      <0x6c 0x00700000 0x0 0x00004000>,
+			      <0x40 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x00780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x40 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x00000000  0x0  0x00000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x04000000  0x0  0x04000000  0x0 0x04000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc1: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie2: pcie@6c04000000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x04000000 0x0 0x00001000>,
+			      <0x6c 0x04300000 0x0 0x00004000>,
+			      <0x58 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x040c0000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
+					<0 0 0 2 &pcie_intc2 1>,
+					<0 0 0 3 &pcie_intc2 2>,
+					<0 0 0 4 &pcie_intc2 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x58 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x30000000  0x0  0x30000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x34000000  0x0  0x34000000  0x0 0x04000000>,
+				 <0x43000000 0x5a 0x00000000  0x5a 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x59 0x00000000  0x59 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc2: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie3: pcie@6c04400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x04400000 0x0 0x00001000>,
+			      <0x6c 0x04700000 0x0 0x00004000>,
+			      <0x50 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x04780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc3 0>,
+					<0 0 0 2 &pcie_intc3 1>,
+					<0 0 0 3 &pcie_intc3 2>,
+					<0 0 0 4 &pcie_intc3 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x50 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x20000000  0x0  0x20000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x24000000  0x0  0x24000000  0x0 0x04000000>,
+				 <0x43000000 0x52 0x00000000  0x52 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x51 0x00000000  0x51 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc3: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie4: pcie@6c08400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x08400000 0x0 0x00001000>,
+			      <0x6c 0x08700000 0x0 0x00004000>,
+			      <0x60 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x08780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc4 0>,
+					<0 0 0 2 &pcie_intc4 1>,
+					<0 0 0 3 &pcie_intc4 2>,
+					<0 0 0 4 &pcie_intc4 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x60 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x40000000  0x0  0x40000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x44000000  0x0  0x44000000  0x0 0x04000000>,
+				 <0x43000000 0x62 0x00000000  0x62 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x61 0x00000000  0x61 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc4: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
 		msi: msi-controller@6d50000000 {
 			compatible = "sophgo,sg2044-msi";
 			reg = <0x6d 0x50000000 0x0 0x800>,
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
