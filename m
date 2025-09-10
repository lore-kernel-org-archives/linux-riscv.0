Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49B2CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nKt89wxlgNCDY7ny18kBjGaAFqO7VfiGm1X0UfkI2Q=; b=s/6Bp+OAMAMNby
	xvU7hhyKzDiNJR4NziSzWgHMPj8U67fwL9dY/KDx8HoCpT7quRuC5vC6SBvHiPZQahtw21jfu0Pue
	Ei+0K1jOVH4LAlQv/f+Fen+B7eac/QwB9a3KR2UVfGm4eWHVoD/c4k7UbCjZ+ud6Ak0KOfrwhMo86
	s5rl0rxsmjPVwBExjtsJOsAcpJbi2PW3SeMltSUHOMi+QdkWoyUAtTpF2w4dFpFbAXzh2IYhkEa5B
	oBRw2yqZvkl7C/YFbcPgAOc1PVLKDpayFuSxwKlQYsK56Wj9LbI3CsUbi7dn/EF4Z/J7f/F99oc0b
	HrtTuxZE7OaCyZFKjGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAH0-0000000Bbrs-0gMx;
	Wed, 10 Sep 2025 02:09:26 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAGy-0000000Bbq7-0uUo
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 02:09:25 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4b5e4fc9b4fso34515631cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 19:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470163; x=1758074963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvwjuScXFIOkNO4l0NAjh5hmUBFBDILktbVX+sGXQiQ=;
        b=hUaiai86ajFHYeYHzrStasi3ylCkwtie3ddQe8EQjtEg/J4q95yhQTN9WtAsYdAoCi
         LN3mEon1xaZvhb3wRu3j5cvLW1iDjp7E01UH76Pzt339PWk2lyZ9IR8CihFtEh5V9RJ8
         D34a/Nd1pYuvGozbS/9hYPtwis3Ad0axwZgRtrDtfWsspQh4sjvfyta8ZdcfqtGbREs7
         SnjgJ8ZZQYIFwcVAMVKPqvI44Xvf56hTn5yaGs6TAo9CpVGGsYKbQTz0nXsmNLIS8+vP
         K0LKUR3E8VI8DhvsQ9+VjR2nOM0OkkJOsNqw61Vd/NWgH3gOIhT6YVlk/rwbLV2zLqE3
         NW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470163; x=1758074963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvwjuScXFIOkNO4l0NAjh5hmUBFBDILktbVX+sGXQiQ=;
        b=MhJwhgFPorMUkyyKR5PulB1dWLWLfbPhUAKjD0alcfDaTVBIEd7Np4cAhgYl5ayW4e
         +mggOPHDXpSYk2ouMUjkxW5EpatkoQ2sjMEcQJqTdd/yyFMlPx5O/DeyxM4JQvTEfpQ/
         l8XrH6oIPgsX4VcYOUH3BMsZ9kyt+ktF7qroKxfEd5GxCNKd3LZrfMGKHqMPEOBu3jYB
         3kKR8BsEKf0dOtrxAoA1JFPM/Ya5AgkyPlx8u3OmEC7GjAPTokqi4I7Fss0Z+VhjJymN
         +bLSMI0RJTipKWTQVd6eXGGU1b7nnavSkabQtczd5TXtmpkzKWJQUOUv4DOCN/3yifiM
         PRwA==
X-Forwarded-Encrypted: i=1; AJvYcCWBu/hoFeXiyaZC20RbU2s5LLiHl/twOgaAW2gEAacC7RaXF/GNwO9lmGk6bIh6xjfMwEds8ab1/vj+fQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28TRN6s4V0bmKOJ7XuoSz2oiOVzgHbf3xHXzlDZtexaUQJdnu
	6QQjebz7UyQqPu3NZxyuofwmsfCvE9iHkaMnIpH7kjzoB4aY/bEYIn1w
X-Gm-Gg: ASbGncveuE6x7tNrJcP4TotpXXw/0vv2vQugdOVDGchrr8+3pUrU2yJpK9eT0ytj1te
	QuaDcc7DHs169uP+HPn3DcXJtV5Pp3XGPlauUYk/z5bA3B/xPdkT9Sv3LsyUFyXjDBviePJlAWi
	ipqQFiwBINfcst1HCXD2+FmKscJ5hf7rGlk79SH93RFgh3AXIK69YTawuPsnc5pduKxgqK8oxdu
	3nkhQ7LCXTKV+ojvNLbxrTQhh19R3fFYdHpv0x6bE5ARdwrbvJcurScLbmvD9ggsCrRqHldf13A
	27pXoNnx16KecLv3cKrfaGBsuwfQMpFAuwwXyAUuqjeeIPim2bBdG/YZvTrYn4nBFpvz24jX2Ja
	+Mz1uA5KMUdPPS111DOF30WK4VHDq5jIs
X-Google-Smtp-Source: AGHT+IGWK15y3cJ0ySkBVFDMFIUT+JGKHEf8Zddz6BKl48R5eLCXjRJsTMqwRryUollNpWDOlRLpqQ==
X-Received: by 2002:a05:622a:409:b0:4b4:9666:f1d0 with SMTP id d75a77b69052e-4b5f8445a7emr145405181cf.49.1757470163006;
        Tue, 09 Sep 2025 19:09:23 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61ba742f9sm17682681cf.10.2025.09.09.19.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:09:22 -0700 (PDT)
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
	fengchun.li@sophgo.com
Subject: [PATCH v2 4/7] riscv: sophgo: dts: add PCIe controllers for SG2042
Date: Wed, 10 Sep 2025 10:09:13 +0800
Message-Id: <5cecf3c854253e508a88995011dd4631fa0c6eae.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190924_272344_42346EA4 
X-CRM114-Status: UNSURE (   9.01  )
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
