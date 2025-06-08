Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A609AC5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMKpfTfKrZvQol10iZ9+9iGxrWIKlcbBynVKzFQX1a0=; b=hKC3Vyd7kVJXiF
	LNqNFCD3SLJtggHTyjM9dQoQJJpQsDERMqRQdhow/kSBFV+AxrFU66i54RnT2ic3MQ70I/2fV0Y+v
	NePs8D4JSvOVnmauLbpDtp7nIQ+GlAWzhFEaj7o/eUQtJxiLrYyv3XJ7fGdLL/WR9ESlnOwluV/J5
	8VLLsJJbul2RS9warTv9G9aNDrw0duyschuJLpemAQnuzIRoGbteTkA9gw9y2XlzqzYH+cWVrpSLb
	y/uQMEYXyGfe2cDGDXzQdyfd3fhbWupBW+y1dcCRE7Jsma019yWQhBpFrFRyzaT93fh1Mbc2Tx7gB
	wWXWSzirPRvd8y+K+h9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSn-000000037ND-0a9A;
	Sun, 08 Jun 2025 23:30:05 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSl-000000037Lw-2ITB
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:30:04 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fafdd322d3so42929946d6.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425403; x=1750030203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmTQdXSUpQ4hD4RssfVmKVveK6myf0C+7VFTgPHTK8k=;
        b=MUecTvHk4/xBxzR1R8hWka5t6z3fK3lse139fXziqty/SVonnOoB6y0pcvfYRGi63t
         wgcBD6Jt7XP/jiIAoV3ZccQBbAAuPPhwtGklRKokxv7xDylh51Xhjck4lxIXVFf5RC9F
         ivRufKAfn/Dj+79YAQVJy+Gpuxhvlg1KDOPB0JTz+KvGaly1Nj63z8q5fb3FY7auslub
         /zbO6UtZjQHsMujjNx0S5qq9XeXM6NG6k/Ei/XwBFJiLMbqY3CbmuUVvtduOgNsW2iGr
         z96BQ2/JRMigt90/asBsscIn14Ljn4tQBEn+Hpb0JAUrhEQISuRCZg76fCai87gbVj3a
         3aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425403; x=1750030203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmTQdXSUpQ4hD4RssfVmKVveK6myf0C+7VFTgPHTK8k=;
        b=DSwFwaDB9Dk8mZzXBhJndSI1wBu8M5ghgom3Pu3AxBujymNCSX/a/QCNuqdu/P/C2z
         5EBlfMuw5AHMDwiHNh9PKkF4lD9pP1rBpCEIn+exmE5daMgNw6Td/Ltfw62d97MiYihB
         twdMZh6tljqSDnslCIHp9cb6xsQ14UfEFMoTenf5kJxcxDkS6zfBwvo2/YBuxT8Vh7Sd
         eZZ/+C75ZtsTwqGR+JoBxyyfyEcHIR7engZt3BEoih4/wS83jYVftoB8HoehXWfoN5aT
         YW/SqCk4iEO622CaxkDAX5seo4CMgF08wjlLlnfsbLcsbxNtUKnealZYZbdjC8eNRW/w
         fjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzV1P8aacf+vuMmIg0NkHWIpFAEPuiTI7iF2GbGbEQxeAusEFODQBW9WlAyRbPSlSfPWPQMtc6ah6hog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzoYTaqTWks9ONbWi/BEwOiQZygWCBtnFxBw936BdtRl6Xw2Qh
	CS+jEQz5Rbu5EK8hCnniWz/vjSL/84OY4/dgzhyrF+WaCor5Wm9nM5Y8
X-Gm-Gg: ASbGncsAiHISkAOQN/pGwtbJvliwyZt9x5b2G4Trcq/6qIYyb0GKvI3uFY3gDd88aeT
	9Iy4pBaYE4d7OAzj697LoXKWLJShLVaBQ1iVv7YSoVf/V33fjxSl3XsTP8rEZx6REhOv3s8Ero8
	6Ul6IsFqf34kDRarQ+a6wy4xAwvjenlk6gq9IUYt4sbVMkSZvWF/yZNFPLknOzlQM+aBSiWwQD9
	Xry1lKM4fDP+80u+7XmlcczB4xSuxrR2FSqbjXMXcA0cT7QzHcLpjuJeRGBBVTLzgQvhUe0aYco
	CXq6DgAsvPCB8/UZVzsaYaCX1J4=
X-Google-Smtp-Source: AGHT+IGtPVr3vTtnHXhXGMrBCPsB3mR48xsd0pogO36byxImz47783KZFg2uYMwvdFSvrVGfpQLmDg==
X-Received: by 2002:a05:6214:2426:b0:6fa:bf2f:41a4 with SMTP id 6a1803df08f44-6fb08f4d14bmr179466146d6.1.1749425402761;
        Sun, 08 Jun 2025 16:30:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09adc0d9sm44053546d6.52.2025.06.08.16.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 06/11] riscv: dts: sophgo: sg2044: Add MMC controller device
Date: Mon,  9 Jun 2025 07:28:30 +0800
Message-ID: <20250608232836.784737-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_163003_584768_E877D8C1 
X-CRM114-Status: UNSURE (   7.64  )
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

Add emmc controller and sd controller DT node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 17 +++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 24 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 54cdf4239d5f..d077923097e8 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -27,6 +27,23 @@ &osc {
 	clock-frequency = <25000000>;
 };
 
+&emmc {
+	bus-width = <4>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	wp-inverted;
+	status = "okay";
+};
+
+&sd {
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	wp-inverted;
+	status = "okay";
+};
+
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index a4d2f8a13cc3..6067901cde1e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -111,6 +111,30 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		emmc: mmc@703000a000 {
+			compatible = "sophgo,sg2044-dwcmshc", "sophgo,sg2042-dwcmshc";
+			reg = <0x70 0x3000a000 0x0 0x1000>;
+			clocks = <&clk CLK_GATE_EMMC>,
+				 <&clk CLK_GATE_AXI_EMMC>,
+				 <&clk CLK_GATE_EMMC_100K>;
+			clock-names = "core", "bus", "timer";
+			interrupt-parent = <&intc>;
+			interrupts = <298 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		sd: mmc@703000b000 {
+			compatible = "sophgo,sg2044-dwcmshc", "sophgo,sg2042-dwcmshc";
+			reg = <0x70 0x3000b000 0x0 0x1000>;
+			clocks = <&clk CLK_GATE_SD>,
+				 <&clk CLK_GATE_AXI_SD>,
+				 <&clk CLK_GATE_SD_100K>;
+			clock-names = "core", "bus", "timer";
+			interrupt-parent = <&intc>;
+			interrupts = <300 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7040005000 {
 			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
 			reg = <0x70 0x40005000 0x0 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
