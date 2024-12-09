Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94E8E77180
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dvidm4SxClOmCrLSUH3X6DG9JxbNMBVyl2FoPfCHG+o=; b=1qeMHMD4c5dLmc
	83lYLHig8Hf6STsSA8DXAtbryIoVvJO+8tcpgo53r83K1ihymrwkL5c1aca0ItxNwi/lI6nVi/Dv1
	Xa31UMVGNak9k2Bp9LQQ26hlAjixV/A/RveZ1g8GCVftMSnTkEDzAgbb5Uf/kGm6FHN4XF7XP1dWO
	VVESKvH6CDJAbhBWH56Ru4tq/AeyV3dZWQq7/mQlwXhqm2Qyw+RXkWUY3nbru6YU5vlVvbsFwwPmR
	sy2wSlR4vUPdcRC9MT5TNg3gxi4tpn5OGYeXr7C9nfvWqwkNylG2/xUu9Lk0q+fAmffx6yT4/YvdG
	9GxShqeziuTQjpKoDoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY4X-00000006hfP-39nL;
	Mon, 09 Dec 2024 07:20:49 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY4O-00000006hV0-2UkO
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:20:41 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-71de8527314so570027a34.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733728839; x=1734333639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbDh/g3jGuzLNE1F/UbDJJl1YM6gN84aixwHJdNbJcM=;
        b=PjAVw/6+sYthXqHYBec9eevFzTbJcPGQJ1fqTw4z9kVbehHc2EbzL/y3ZBWW+YuUkO
         qe7v1Bm7WIKgvxnpoMvt1EU5wwQNz0VhAojLNlbn8kw8NEBMAP/MN0X+6SiDK7p9WaLr
         RRUkoqIALWE6H4aW8gW5A08qKv2AXJUBO/rPdfK+OiK78slGJ/0Ij0rVUXQzs5vcASvP
         JS6FP6iyyKWMgwQrD35Avto39ox54XLhN6ElhsE2h+LVO9FRKKqW1Z2S39uaj/QwpxnJ
         j7MxmmujShs6n6cqXwAwUwZvwkI1Um9QNW/ABW62WhwfS5mFjsl9SqgGRekjGyr3Uv5K
         rOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728839; x=1734333639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbDh/g3jGuzLNE1F/UbDJJl1YM6gN84aixwHJdNbJcM=;
        b=deEtu8Il0BicVxHD3vbsGkfhfPA0KPeBZ6na+eANBr33TH30lbOZsZpLZtPxWxqI2t
         XZ8F6JdRGs8URQHjQvXi+VBDwduCAVpX/A3yogkQSaOIi3jVDq75iSv+IgBL2UHcn8Ps
         jyaK9LaJYvD6xby0HFbeK54J/9vrr00mcl+wMCYVInh198D1PD6Vm/EfkPsMqFJbOnde
         Bpcf8WIe4QTBF9ieEmwUTDHZRuJUJZrCzA/4x3Qy6nwyAg4roqm3QZnwoA1JXTEf8nsM
         LBHzAYx4YYmxOL0NQBrx3YcLZBU+aSUMdgwZa0jyWjuS3pedq82RHR1hfOrSeuLIh8/P
         OEdA==
X-Forwarded-Encrypted: i=1; AJvYcCWxhN05Omv9/LSvRsnj5JVE7hzr91fBZbrLvI73lvMgw9HLhhjfndtNV3OxTwjGi/TFVQkaU+H8NOEWZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVPXL6oeu5DUR9w1TtHTzI+g325ZEQMIYQasFYYPRBlGe2Vx9C
	722K9UV5arKEzIqAxZWZLb8vW5dLFPYAbopzC7z64yLgZID0yVtO
X-Gm-Gg: ASbGncv+2Q78vfAqLe6cX8pDXf88+BYav01E1LeBYcvr+//Fa8v9QLv5W8UDjWIl92s
	tQQaGC0ANB1H1cLaVmwWEnMcEi7Ym7/glgjI/JS4aOuxBoq87ebIa/NMjdBZuu45tKTfkGmzaSY
	0bbMaFnR6KdYgwYeDtd3L+EH6FTsyD9SMS0DGXdtv+u8K91v9SZluhRnmK4b1qViEBuyWFA15iw
	Nn2jLazAUaxVAXJ2g760rutUZibSH431yQmjMI6AfmJevV7lT3HFb9Ilbay
X-Google-Smtp-Source: AGHT+IG5zrGT2pA4Mo08JycALnQE/jgwjzKHfeIfoQjjJ7auIuS4u+TvVuuWZ5bJxvnL2bTWFYRjOg==
X-Received: by 2002:a05:6830:b83:b0:71d:3e4d:becf with SMTP id 46e09a7af769-71dcf567efcmr10394977a34.27.1733728839444;
        Sun, 08 Dec 2024 23:20:39 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71dfd03aa13sm69807a34.8.2024.12.08.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:20:38 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: [PATCH v2 4/5] riscv: sophgo: dts: add pcie controllers for SG2042
Date: Mon,  9 Dec 2024 15:20:30 +0800
Message-Id: <b4426c4762bd778873d204a2796885ccd98d7c69.1733726572.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733726572.git.unicorn_wang@outlook.com>
References: <cover.1733726572.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_232040_641611_D90AFA8C 
X-CRM114-Status: UNSURE (   7.66  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add PCIe controller nodes in DTS for Sophgo SG2042.
Default they are disabled.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 89 ++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..bbb7cabab9de 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -195,6 +195,95 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x02000000>,
+			      <0x40 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0000000  0x40 0xc0000000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x40 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x40 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0x3f>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,pcie-port = <0>;
+			sophgo,syscon-pcie-ctrl = <&cdns_pcie0_ctrl>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		cdns_pcie0_ctrl: syscon@7061800000 {
+			compatible = "sophgo,sg2042-pcie-ctrl", "syscon";
+			reg = <0x70 0x61800000 0x0 0x800000>;
+		};
+
+		pcie_rc1: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0800000  0x48 0xc0800000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x48 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x48 0xe0000000  0x0 0x20000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>;
+			bus-range = <0x80 0xbf>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,pcie-port = <0>;
+			sophgo,syscon-pcie-ctrl = <&cdns_pcie1_ctrl>;
+			msi-parent = <&msi_pcie>;
+			status = "disabled";
+			msi_pcie: msi {
+				compatible = "sophgo,sg2042-pcie-msi";
+				msi-controller;
+				interrupt-parent = <&intc>;
+				interrupts = <123 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "msi";
+			};
+		};
+
+		pcie_rc2: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0c00000  0x4c 0xc0c00000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xf8000000  0x4c 0xf8000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0xfc000000  0x4c 0xfc000000  0x0 0x04000000>,
+				 <0x43000000 0x4e 0x00000000  0x4e 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x4d 0x00000000  0x4d 0x00000000  0x1 0x00000000>;
+			bus-range = <0xc0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,pcie-port = <1>;
+			sophgo,syscon-pcie-ctrl = <&cdns_pcie1_ctrl>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		cdns_pcie1_ctrl: syscon@7063800000 {
+			compatible = "sophgo,sg2042-pcie-ctrl", "syscon";
+			reg = <0x70 0x63800000 0x0 0x800000>;
+		};
+
 		clint_mswi: interrupt-controller@7094000000 {
 			compatible = "sophgo,sg2042-aclint-mswi", "thead,c900-aclint-mswi";
 			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
