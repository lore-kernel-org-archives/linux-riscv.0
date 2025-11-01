Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55E6CCF9FE
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 01:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwUYAMjHF03qn3p643Igg1nMbwbA+zxnV1DZ1lpnKg8=; b=r8chALU1ad4AGD
	2w6FhT8lPcZ9uUvnzAI9+nknPnYhXovMSf1xJgKZPm0w9spaIdixrEQkfOqoftp70nZBR7gSUDmTB
	AhST65EAhQuypRP+5Ma5FW9FsMLZFGCJTJ4IfdaCnETQw5O1EMNBa/OITst6GDFkifna1X5Za6qWv
	MBL7i4ZZZgHvbD1ZRNkMllTJ5AKN0F9Q9m0O7PNt2TvG2jrI9zTQahjJiXWySobbBz0nsDgd56rEx
	rmCr/t6e2KO6ssJ96KzNQ/MZMIZjjgA+09zj4fNtAK3VB61i8Eu7SoAp7WBiTk8zV5MrZtdws9+R1
	VIbmVF+WlF20ciHEDYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0fs-00000006yOv-2tVh;
	Sat, 01 Nov 2025 01:45:00 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0fp-00000006yNa-0GJx
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 01:44:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-781997d195aso2079466b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 18:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761961496; x=1762566296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK6/9/Nd88Q9gusSePNbcMpaVCV2+VwX5wGIqW+nXzI=;
        b=Mb9u8foT7v2zLt2KJhzfAUVP6+UAls/WkZeCTHRpi4a74P/CQxUs7bMarysDECIcP/
         uLVEANPbuuOLw3HP7edTufF2HztjJ86/J7aAQQh/cESYEAG4nx4f24viqAztEi55iF4R
         SJ+3kx5Ztuc8hMAMj9JcupHzJ4vn9I226gb7PSWySMkPnNYt7Ylqj2nvRLVV5TVuhZBr
         0j/toeyCTKoXk/2AjRiPV+9grGLmynxQ/4pif9LbSj0AH9SiOzZlBmyYXFHqynn7hpTg
         xP0SgIGvJWKMpDg16a56lG2Wux9mBLm6yAV6liM8bZnKg+y0yeaiHTlgT/D7XSiKmeSN
         rjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761961496; x=1762566296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gK6/9/Nd88Q9gusSePNbcMpaVCV2+VwX5wGIqW+nXzI=;
        b=CNNHzgsHtcEuNONQJkVEmFa1QdxMO36ntG4TvmoqxSRqFX2UVKScNAXlOWrZiZFAcS
         2owqUmtzgsEKOzhmiShYXlUBM/+EF8SWwGnWf1Ao9kb0T1dPxF2BuEzEB9F7oDIBhdrB
         Ea7cBuC9htBMKy+0wjtSyUFro6yv3ROWtgwNR3ekMNOYtcEnJgROrkgV96i+L9uf56AJ
         sM6ImVkgJVQz8m2aKnjceSH+UbSRoTk5GChbxPgllBwxHcnL3ZPkZ9JhtHQF+KRLUnnl
         PaY6InV8FR6BPmdo7ADfiW9IPLxbo1c6jO5yHO1zBzy8stRe1Qe9caP7QvLlUIeQG1wQ
         QHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3fnK9fBo0tNbeTzs4qwq4HW5o+XGnZTw8cSx6b/wE4rdPnK2/NSlocHtT5Gkqrrj+9uJMHBzBNhb0Tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgONg6iEncSMUmbdn1p/qxUM3cBYLUlx9C2pW/8fZ3dsDtaNqT
	fkDyt32S8TydtO6n63TFrSQ09m+QG4HB9O4t7peky0gE4YkcM8l0D4PZ
X-Gm-Gg: ASbGncvL0YmDAs5jafJ3tMJ6LvaW0OLUsqKXQwovX9cNusg/GeGaij7OtojKY/tWrPt
	8YxC1E3CcOLyhXySAvb6L+RExMEpQ2ViGiZ9wYBEmSpjs6YasiD4i7/TdAwadH9SKuor6FdQhvI
	RhKa81fvokd1zeF5tftlJWwS34rdvNlat3Px/qH+VLT0fb0qQhlAZe0VRBhbGDUPR2Bmvsah29u
	BpnE3OICY6ahK3iAjiG9KkaXbsMiMSLcaY6z2vrXJEeX/hqEyuNWLxEEFp8sQ8CH75r4hDybyUV
	w/DHvTj57fqNyIqjk5KtdYxorbIVeHovDda10nIiFWr+qUXYD70pg/JTxTPh1vrscaihrb6vCBt
	oLOSMTEOimjsWjF6LWiz6hZiNHEAzf4126eMaHJcbqYMXZ/32d2HT9aKTq21+Bvve6iY1MbiTGR
	6zhLem7VJjdCmzOTjmiqTk8rfSBMMqF438jTTgpw==
X-Google-Smtp-Source: AGHT+IG73fXaL0VcqLIqRkANfPCq0IjyN6Ot8qtT20JHVXUm6Q3Tb0hIJV982rzY2kwxu6Q35wHvuw==
X-Received: by 2002:a05:6a20:431d:b0:334:a953:1263 with SMTP id adf61e73a8af0-348ca566211mr6539181637.9.1761961496152;
        Fri, 31 Oct 2025 18:44:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm3350585a12.32.2025.10.31.18.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 18:44:55 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Sat,  1 Nov 2025 09:43:23 +0800
Message-ID: <20251101014329.18439-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101014329.18439-1-looong.bin@gmail.com>
References: <20251101014329.18439-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_184458_595689_CEB56625 
X-CRM114-Status: UNSURE (   9.73  )
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
