Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B608CD13590
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 01:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T3v4ZH5qVNIbLVkDs6qWYGxwH2KIaVwy5sWsS+jPA9k=; b=0nh0dH0MLuAeWb
	17RPEw1BJiiAXuW7qHHUc+NH6DPxTTMWHJ0HrTSxCQueWAu7ZExXgnsBfw5JR3WqFK+s1ng5nAYYv
	2+ps/ua4n0wW/UnDfXlHb865J4q84y5x6HUYfqUpYzn/gtRKY65/cCzrjPdy8CHejq3/Ig1y9vk7i
	xHnp51hytyOccVLWq4JxWxVMc+n+mGNuvU9zu9Z8FvXME9KxwOHMFkg+Yx3VLyHsOvQHxHm0/Woql
	2fCaPvtNjx/O8jHURKIgwh2VqYb/Bo02+YnpQtRRCMqteo8JZsGZUvDjn3MfN/fY/+Pmi8lbp8ioB
	fFpRGBrJjE0B6i7dP5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5EKb-00000009C4r-04EL;
	Mon, 28 Oct 2024 01:14:05 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5EKC-00000009C0E-11Ij
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 01:14:02 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ede82dbb63so367306a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 18:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730078019; x=1730682819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3tCahJOmROdPw2eESwWsnhfLTfFzOuQiLcj0eIRRxE=;
        b=FlIlnG+gqj0UOC3ypMX+sVqLJQF5je57G9K6+ymmRup3PoHgh1gJNFLVpJIejnZZKX
         qwjvb0pBmrGHfztpgIQ4Em/8c8AqZ2GW1aV4M3XJz6zZoUpvt6WYWAJZOtXvuND624Od
         YMUMzXR2VB5MbxUf6Vw9fk3J8nepDtDLUtmTKHNkPIrB0oWVGIerz+91iTfEcLAXSdjx
         CJF7wxMbkSN6lwGImh2ezzTsFkKBLo/xvn6WIH/yygobZ11NJexY/YzdbovYLlCkotZJ
         RQYn8cybR5a99e+yFYJTun1VCEJZ9M+u+emQ6IQM+X+/OIimXSb4/3iuF6KdaXB5cy2+
         ZE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730078019; x=1730682819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3tCahJOmROdPw2eESwWsnhfLTfFzOuQiLcj0eIRRxE=;
        b=GIJfHvyZHjJLeyDZIlD44/Bql8j76Hrl7NNdkZh6DS8QZ/ULOe5DgjYSAAInvhdrcE
         5TY8KYba9dvilvTFKI92Gai8vVrG3efjLku+XoYB7tQVEYkKFj+/rjTcLKFRSHz4Fhaz
         B8XgMf1/Ww6qQX1qCTnWIw3LJwlWvJrMId2gWc3yGgQamVhsxesZoxGM1JrV0mWmbx5x
         0hnlDpRiq+rtLRu007lusuY4L0+4MfxjKh7gXMdahN0mCFtJVCoDSkSzsUW6utYXTyk/
         dpCdCoTCLM+WUmaV2We+I8AN5igPABW8dkbiZWI9HI4muEqWczDBuR+auWTyn5MM/Hzp
         RSjA==
X-Forwarded-Encrypted: i=1; AJvYcCVVNcp/WC7EMjHlO3QPu8Hucmw2xJ7Al9qBgSLuUnTgSLVGz6pM5Df7q3A4UwcqXhhdLYFIMvQ3E+MmcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJQarc5Cf5jF6BUYM2kopnO2AWyxeIhHIoEpUFSLbY+ccGx4n6
	eD6XV7M0nWGEh8Wym12M7qKvTv+7ygEyDDYcNb37TlhpMjEMrnvD
X-Google-Smtp-Source: AGHT+IEn22qT3aAgfP2GIkF4DIPGzct889HLqTlXcqnHoA/L+gK2jDOatquPmlzkbeGD1c41qaA4Wg==
X-Received: by 2002:a05:6a20:c997:b0:1d9:4639:396b with SMTP id adf61e73a8af0-1d9a83c186bmr9642710637.11.1730078019112;
        Sun, 27 Oct 2024 18:13:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72058052be4sm4744556b3a.142.2024.10.27.18.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 18:13:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Liu Gui <kenneth.liu@sophgo.com>,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: Add ethernet configuration for cv18xx
Date: Mon, 28 Oct 2024 09:13:12 +0800
Message-ID: <20241028011312.274938-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_181340_307931_D0AAE7AA 
X-CRM114-Status: UNSURE (   8.68  )
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

Add DT configuration for ethernet controller for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 ++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 49 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 26b57e15adc1..a0acae675a82 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -55,6 +55,10 @@ &emmc {
 	non-removable;
 };
 
+&gmac0 {
+	status = "okay";
+};
+
 &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..50933e5b4c75 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -210,6 +210,55 @@ i2c4: i2c@4040000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@4070000 {
+			compatible = "snps,dwmac-3.70a";
+			reg = <0x04070000 0x10000>;
+			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
+			clock-names = "stmmaceth", "ptp_ref";
+			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			phy-handle = <&phy0>;
+			phy-mode = "rmii";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <1>;
+			snps,aal;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				phy0: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0>;
+				};
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <16 8 4 0 0 0 0>;
+				snps,rd_osr_lmt = <2>;
+				snps,wr_osr_lmt = <1>;
+			};
+		};
+
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
