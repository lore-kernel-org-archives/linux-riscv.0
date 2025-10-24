Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF34ACCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 03:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwUYAMjHF03qn3p643Igg1nMbwbA+zxnV1DZ1lpnKg8=; b=SP/53txlh7NUAZ
	2R5xpf1y27xC45R0igZGxxKEtyJ5D+od5PkteJBVBCPlfoBnemBPcfCOZZkoJSPo1ayWENb/9SiXl
	PRqXOgFKixi8hH3otS8sAHaeBwSzALsGjT6qVVQRPwKYX2oINL65UThWF5ZTwyPndJaBQZ9Y8b5UV
	EN4CUI6VrmL/FQoarYo5NvOwoU32mKjris4VCEcGd+TNsIhwK+6MJXx3yg226ZIt18L+EjNhlqMIq
	lxVArBbpEhxmM4U4WJ5JVmsDgSW/FfV/HgpnNBIVEDmPTArILRD7phg3zMvStzmf6TXUplfHbml65
	Jf8mgmdEHC1C62pevG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC88G-000000087H4-1iHk;
	Fri, 24 Oct 2025 03:06:24 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC88F-000000087GQ-0d0Y
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 03:06:24 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1231398a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 20:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275182; x=1761879982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK6/9/Nd88Q9gusSePNbcMpaVCV2+VwX5wGIqW+nXzI=;
        b=JFDOx2AN29P5b6jZNd3/fj0hBfsrefnunxh8j0pZffglypZOnsbsFoyFnmtoCNvucK
         Csgb1MamT93qd7EW0zUwcqDFwA19p0mI1UQcX9z/0I4x89TO11g4IvBF0J8vgEeiRW5R
         0PM7aEIchElZ8gerZcAdOX47YSOuDER9FsEF0hcp/XQ3PCAhdWMlKDCqqjqa6eMMij2m
         /a8spyhRZyI3W6Kr0J1j7A32dwC/GGZtTfq+xBOzFDtalOWkoYWGmQAkw1ZzMI96syx0
         S7peVxFX3rGXUIgh0R9/c0Y+DJpzX50zAhnBELEpPxWydlzl0A2OfUQ2cxkB+Dmq8N++
         BnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275182; x=1761879982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gK6/9/Nd88Q9gusSePNbcMpaVCV2+VwX5wGIqW+nXzI=;
        b=GXHcLAK3O3vjyXMDSku0qSTMX+5VLxdIZw0U/vHiTk3tugkAscLu0jDXe34AITC6bw
         tgjomNYdeDuyJOX4Bli9arTHndRDVpky8bfxBFtL4nouFTenDMCisrFET2YQ60VqxaUj
         bUlgOZtdD07zKrzZrxlvcTTE7hxNi7M3glXcnSMNFsYVvvfaiRihBRtjvNm1xSerJSa/
         JWpZoPAibmz8t2veEGdnYyRPy23Pmcvo50xQAaQiiHznbO4JfvZtTjqRuAthpaqCNDZm
         BghtRjYo1k0Iw45QJBJp1FkcKYTDARIg5OFGI7S1kbBfUT3rWyXfzNatiZdFu3ufJGkE
         i+vw==
X-Forwarded-Encrypted: i=1; AJvYcCWTmc+jadcXqJKpUbxw/kedE+PteaCzF76t3Dy2MkkVNX6p/w2xd2tEyAsAwQEyYo4r+q1SdUAr6m3/Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWB3K47z8Wvqlyj+f6NIWGDnqoFq2Fs6sgdMfJlAV/lTjslJHb
	ourdVGUveyWszeAtEpNGoUoZTDUhLj7RHUHSLkpvpPmiSr00SyOejzzg
X-Gm-Gg: ASbGncuJjzBsupwVThKdhRpZ73JPJE47LrZk1uZu2NN1nnOQ2Ltc342uN7nLdhN51Ma
	HFhlWhipVuKNw+IWkbYvNKeKa9Znlghn4/Ep5eWFbCdTNpWNPX+qKPLoTLLLNFFkDh4PwuY/1Jp
	SraTd+t2g48wXO81T9dxxMh5COqAVXzT0GlYML5amOTTRa7vb6MZCWjXV+94kLAILGTnRaVfb0F
	oN0nOMiD1EipchunCGs3hXrCcq4tu93Qk5VybTXdRWZvSF/S5LrU+OfyoEOKqFCWCSpXTBUVFAL
	YK5oyzy6yatFrBL9yW/IoRfiPaT4MMHnEEz8QishtnI3T7xlokvhtMBSFJLlstuHCFjsiWYLrXg
	aUlrQDChlbL7endSRH3TwHnOb3Yvnft4wNjByKIi/R2Za0GQWnWaCFopGjwgRXFiYvrCmpm1fXk
	aKFLM72pTiAItDiE2Ov3BaMrRBhHA=
X-Google-Smtp-Source: AGHT+IExJ6H9VPiKo4oFXupf4Hq1rvYGBs9i2gm80xYGGd1NKgjymGlzndYHMYAVYcF8kMC8+cCiAw==
X-Received: by 2002:a05:6a21:3287:b0:32d:80ab:6d12 with SMTP id adf61e73a8af0-334a86372dfmr37551806637.40.1761275182290;
        Thu, 23 Oct 2025 20:06:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm3574172a12.7.2025.10.23.20.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:06:21 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Fri, 24 Oct 2025 11:05:16 +0800
Message-ID: <20251024030528.25511-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251024030528.25511-1-looong.bin@gmail.com>
References: <20251024030528.25511-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_200623_187911_04FEA27E 
X-CRM114-Status: UNSURE (   9.67  )
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

Add USB controller node for cv18xx and enable it for Huashan Pi, milkv-duo.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  5 +++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi           | 16 ++++++++++++++++
 .../riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |  5 +++++
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts   |  5 +++++
 4 files changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 9feb520eaec4..0e6d79e6e3a4 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -100,3 +100,8 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 42303acb2b39..1b2b1969a648 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -432,6 +432,22 @@ dmac: dma-controller@4330000 {
 			status = "disabled";
 		};

+		usb: usb@4340000 {
+			compatible = "sophgo,cv1800b-usb";
+			reg = <0x04340000 0x10000>;
+			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
+			clock-names = "otg", "utmi";
+			g-np-tx-fifo-size = <32>;
+			g-rx-fifo-size = <536>;
+			g-tx-fifo-size = <768 512 512 384 128 128>;
+			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			resets = <&rst RST_USB>;
+			reset-names = "dwc2";
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 4a5835fa9e96..aedf79f47407 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -86,3 +86,8 @@ &sdhci1 {
 &uart0 {
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
index 86a712b953a5..b1853770d017 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
@@ -93,3 +93,8 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
