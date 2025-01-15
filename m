Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031BFC02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 07:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCX4sB2CRmEIV04eshEYN9I0T0rVn5k2CUZrdhFrmO4=; b=Sg8Y2rSc/+qu9A
	zJ2LGUEB4qa1ImG/iHMq/UAI0B1XhbAuA+G6hn4xYAy0Se4PEFvj8IuiFGnySYih/hNhp30GiGF69
	vknLKXW9bCsYLeiz2HCXMNGI/xjz9SOEh7Vrp02/ZW/Y5GIe4fTQKGaukccx1X3s1o6E5NtuUCpdA
	K3Av8tptoxDFucKIcOmZGa8A04FBX4hC1M3X/AuZT2RJOvL+xZVolZdU3fl8IRbTuaUXkM8Z2qTPw
	R/rVhAxCIdjlMlwvy4tOtvqQ7GuHOlM6LubHPJGiDBTjbbD+djT8+NipLwydB3jW8Ri9Bu3GctoeW
	m3XxKDGllYNdBf26gbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxVA-0000000Atgu-3lCM;
	Wed, 15 Jan 2025 07:07:44 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxV8-0000000AtfU-0oYP
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 07:07:43 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-71e2a32297dso321421a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 23:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924861; x=1737529661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0fASG0X/uQZD/W9OMmNQn0p1YDVNMMVIY7/O8Icnnw=;
        b=dTn/8iU7nTi37ufzeXq+NawFT3CLkpGCfmzN52Sium5StMgNEkVdpkEdyJPkAQOb98
         PI16rZoG4W562YNFZsZrHO9zrzHd4+vzr/OQlGxXpe+XnpJ4QOLEaOOJlTtU0uT+bD/B
         vShfa8+buZnEgwIsU0MaLmTiq1JADFh3eyehfw4C1Ebt6FdC2CyC2qozkJ4dEcEmooWI
         lqi3q4PcbfpsIoyoYx/JX5hAAJ0k/rXOxqPKtBGsCi/EWk0A3sGzPdAD2FcZhAwHCThU
         GmPFUXerLZBk+NJnRKXWwyP5o57tyiLzsNQ0Se3s011fbZcUhEZE1XTb0BG619890vMM
         JLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924861; x=1737529661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0fASG0X/uQZD/W9OMmNQn0p1YDVNMMVIY7/O8Icnnw=;
        b=GL40T+m/bdwJOunAAyMRzGL9AP1f/YxmH8odblXoIhdntqz4iS/zYhKjT+5hTqUUZq
         4RefFcocOuLVSnY2ct/O39NdgioqVAQuSCrWHC/SsvmCMC2a3xZD8jupibiMZfiBeqlN
         v7Gcw0i3S+sAvdUbNd7QpVaR34+w0hnQKadZyFYToNQnICXBTxPE1hr8Uts0Zi4oIwTa
         peqq+OK8VBwIU3f0QyA0FZifqiwAbqExAapR+//UPXum4HGcymHEmAz+phQJZtv3L3F0
         u6oJIt9jZZjGCsjA5KMcj/XwINOHz+WyGF4Dw6bxwe5KzJmH1DahfBRtcPSCLZdL1/Fk
         9m1w==
X-Forwarded-Encrypted: i=1; AJvYcCULUr02HBE/5JpTUZldenR92hmx6pPdEi510jsEXuGlNjOqLElFlhaqaAGBg96IhypvHXdEESQ7vcAtUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy50CPQvwLITjtyn/3Vq/3QCdzyaAoCDcaFcOllEbF/H48MZfzQ
	CbGLgEpT+DZcfYBgNOrvaaOOxZGRHH8uLhtvlO9GpP6cGcd4SzzD
X-Gm-Gg: ASbGncuvHRZ3bJ7jcgATWgZbT5cjYGE7Iccq/sAgi8AsjlKbVyGQA5L9SOR93ypef11
	MRHhIerizlp7MZinWea6OLVlFwXolQdnFXx7pMLmTz7COH20vvDr1w95/2bTfv37wohY2D0Uf0g
	kKRnHqStPwP1GKQcP7rw0vtsIJQ6ADi95v0YLS5zFvXPLbxjMJjCkQkDfuGqZiJnchMKH/nLY4x
	dB7wBJeNlnVYeANAbA55vSGOsmH9l2Mn0aLUdFZjL0Fq9ZKWLNK4saNk8Mmyq6giMI=
X-Google-Smtp-Source: AGHT+IH3l04BzTwOQOVeVceAZhDLzmEf3VzEspec1E1UGUxl7qEL3KQJ4fTf/YoGkK/x9urtKw3yFw==
X-Received: by 2002:a05:6830:6882:b0:71d:f7d8:225 with SMTP id 46e09a7af769-7248594ac72mr939861a34.12.1736924861369;
        Tue, 14 Jan 2025 23:07:41 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-723185481b1sm5445257a34.22.2025.01.14.23.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:07:40 -0800 (PST)
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
Subject: [PATCH v3 4/5] riscv: sophgo: dts: add pcie controllers for SG2042
Date: Wed, 15 Jan 2025 15:07:32 +0800
Message-Id: <4a1f23e5426bfb56cad9c07f90d4efaad5eab976.1736923025.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736923025.git.unicorn_wang@outlook.com>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_230742_233327_810BA6FD 
X-CRM114-Status: UNSURE (   8.26  )
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
index 02fbb978973c..3db46bfa1a06 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -205,6 +205,95 @@ clkgen: clock-controller@7030012000 {
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
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,link-id = <0>;
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
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,link-id = <0>;
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
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,link-id = <1>;
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
