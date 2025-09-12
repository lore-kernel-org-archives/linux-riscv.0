Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3D3CAC58E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nKt89wxlgNCDY7ny18kBjGaAFqO7VfiGm1X0UfkI2Q=; b=xi4MRIzuzOjzLm
	P/MPKInfajx7FUFSGCVGON2E1NbhhEW5xatDKgFtpcbmajpwndEul1ODddptSfsmnNzjrTXu9ePp4
	cWG/wQtmUztZzAlxv/F76nnykmLMNdpmIHqXB/UG6AdPS43lvW2VsxD/pT6LW4HoAG83Y8KUuMJ18
	qbuuXttYWjsPcOLOzaxaYyrvkuU0lV3NyXZKosNO0r7ak7qRKMEBS5XcofMHWJyQn3vd3epJr5e1e
	4XdVMPsVrMApBF5V9OSafCxBZ8w3JE9IWXryJbT+jElt8jLcdyeXdI2LYYtuUXdtfoaTd682zqXci
	WzYH/mWRpcdM5/NWUbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtep-00000006Y0X-2HbF;
	Fri, 12 Sep 2025 02:37:03 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwten-00000006Xz7-0PBy
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:37:02 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-74c7d98935eso661257a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644620; x=1758249420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvwjuScXFIOkNO4l0NAjh5hmUBFBDILktbVX+sGXQiQ=;
        b=E/3UPLX0aC3wuaMCWRe55LgETsYyezurYQybBlWSjnFuYCz3B9qM/B1+Yd1bJ22ihW
         RwwzG+8W3f4ukIbaVWFk1NG0I+qNtMZZCedBxJeniBC05JiggdmdjAVIEeEdBjzw8FUe
         hBzENdRLi7IlAlaVMcAp06oBLtMoQzOrrIypn6w9H9vdVG3mwHb+pBH2ApfvnyF2lqWh
         bMaOlVV2bniTEUYSQqQkpwiOnM5sJ/97mBNU9Mm5QoMlq7V8boqIvyu8E0dRbi9yUvaJ
         hwZGeZK/BuTe+sDmj00MDMK4oOSc7LmVH6FGczH22CytupzXQRQMWAWYf1ftOsMBxxnm
         uaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644620; x=1758249420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvwjuScXFIOkNO4l0NAjh5hmUBFBDILktbVX+sGXQiQ=;
        b=DwjaRQW4BRgOb62pEjofJS0yybeH1og2hizO1AXwmOnyznqNgfkv9RLDzaVBbvTGhz
         9Ai4YpjDEJgl0zRsiiP6X7gK2kKXv1lP1C2DvewLOLzUXEqzGnjqgga7b3jydNUNyA7H
         RwKY58YjRt0+pRT2PJv/rbM424F/gcg98kG+XtoJCt1xFa835EeAoYvyyfbIBy0FS69g
         WSxqHbo+f+PSwWPuT3gIpaEHNvkdOf3FSxsEz3dxes8KAGhBI1RRCUA6t/hj+Z9U93ns
         DvtpYm3eehdrSNe5VhczkEBJYjPDt0ohQbjhYc+GugYd+OW/3it85enEOII1koBflMUD
         bMZA==
X-Forwarded-Encrypted: i=1; AJvYcCXwPdw902kYqQLPzq2jY3o+wv1PKZT24FosvxItSP26Xwf8WuBN87qMtkyfZqDS3Peuv4c6Zd6k1SKwQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfJs2WyVkD3sL6SHXgqWHghphMiJcfJOl9Ywyz9/G+r45k1SA/
	Tr4UM9JD3XLJThC8HtiOG2bcB4GVhRLcxZtSs9hJ58SGeSbTJ4D0Mc6D
X-Gm-Gg: ASbGncsDPV1VZgxiTmyaVgnZR6VgI4tHsRfKK5jcWwCA4T5u9HcZQ/2dgJY2Jsa4FVR
	l3M9e/dA1m/xs3jwRDrjJdomfrFXEFH66zXzrrMRLlTjPbJt0XevHJCQkfbSiH/t5rYEEn3M2WJ
	Le7aU0fKxOZqzOeZeTHTQN0kqouigNQqHgXEo0BZtn3USG7GQ/7AJuwZSAHA15NoIw7DAtIoAk/
	4u5O4p5U3kQEgmuzzydMVq+5Td9higZevIi6fvMUMEyohCsanBPXlz2kbpEgFB8QBLplFtpV7nF
	b60yBUiKFrwyQXLFLpVSzX9vhECVDoj87ejB6T+XroZI+2tEgnLBaLM6dv2Z8K09NU8jGYrIKP5
	VKOy3GH8j8q6mkZehS+knNAHC1FmazB0n
X-Google-Smtp-Source: AGHT+IGyuP3/R9DH/EcaxhL/iQY5WFNGJfVttr0Thdfkkw6lmjBCk6VyxF13AjSvDr/I+XJlRFCejA==
X-Received: by 2002:a05:6830:82f7:b0:745:9a08:c9b2 with SMTP id 46e09a7af769-75352d903f5mr897685a34.5.1757644620197;
        Thu, 11 Sep 2025 19:37:00 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-621b7bf520esm343900eaf.7.2025.09.11.19.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:36:59 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 4/7] riscv: sophgo: dts: add PCIe controllers for SG2042
Date: Fri, 12 Sep 2025 10:36:50 +0800
Message-Id: <828860951ec4973285fe92fceb4b6f0ecb365a2f.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_193701_140924_E30CDA9C 
X-CRM114-Status: UNSURE (   8.50  )
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

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 88 ++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..b521f674283e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -220,6 +220,94 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x00800000>,
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
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc1: pcie@7060800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60800000  0x0 0x00800000>,
+			      <0x44 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0400000  0x44 0xc0400000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x44 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x44 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x46 0x00000000  0x46 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x45 0x00000000  0x45 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc2: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <2>;
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
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc3: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <3>;
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
+			msi-parent = <&msi>;
+			status = "disabled";
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
