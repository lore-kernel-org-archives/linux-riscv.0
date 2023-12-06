Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB962C10F09
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 08:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apYSqNR0gCHXdjC6WaBFnzu2kOTJeC0MbyRQViJlpcU=; b=vJg5e4KyRlRElI
	9upUegvFeZFppDefyZQZfRHXv3wE51JlusRURBHyxfLS5jSRXyQ55s8W7/WYfeayhVapjDAs/M563
	nn2FLdBjBVkkZas2kmbI/Pl/ByPm02F7jY5tSNo0TH+4GazUbUeu28nCcvCrfGuITv1wsix2O8MfD
	1V0nygVvzq3XUlZ/eaW7ATwjOojUvB8HT54KnIyx0jR/iHOLtDUJk9xHStXr/TTf3Wgcblu3wETM6
	UDL3dY+0OVcZselNw0UgO7GNgm0riO7nguqfuikWw3BLeSPSPBkJKT0qf3whpNhlGtVdpNIqlheud
	tTowCuGkxJK8YobdS1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmyf-009MB1-13;
	Wed, 06 Dec 2023 08:09:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmya-009M7E-0H
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 08:09:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d045097b4cso31526555ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 00:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701850186; x=1702454986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7G3OQPwJDFWry8x0QoTwA6RQDLqZhXzSJItslkCCzc=;
        b=eAnjXagW4jTXYadhAMSObQIP2qCL9Aj2CaC4c3cWzCEou8ToGtv4ov5qOASpZbtasS
         UTUlJAmHU38hWD0H4MpSZ98noUO2JoDIK/FNEfsiTa1FtCI8rFl2kaaui4XAnpt6vCZn
         y7iVr06fNREyE/2QrGjU1UKD0uP6dkqDGN0VIa8gJDzTNTvOkqRxWUd4JURPgDoPvUHP
         hbFwpuKMJoB2mA/4fH8DAROVzmNk9ZYm7Pw5YSW/rwQJ0GFjhE7G5bmT1uM//++acybE
         ltq1tRjiXjvkxdq3XN4Zqr53IeZUdz5bQrj+aVUdxm8sVTFJmJHY5tCNF4DxBSFopKgG
         2RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850186; x=1702454986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7G3OQPwJDFWry8x0QoTwA6RQDLqZhXzSJItslkCCzc=;
        b=eYy8IkBgypDT2un65rPrDKR8A87Cx11CC6ITocoFPXQ5/hssnJWXgC2U2os0xEBHL5
         KSfIsoZM6KqDbX2ejNLbINKhITS5621IA5jjmglE9ZadXxMaMujJKWZkpY3cksQXfrUG
         LC9O1OsOfk5mTkWfufzBoPPXgymt5XyGKH8p4/V1bNEnffE4kcw+7Pnz4gtK1lUxb1nw
         0W1ronnmS53jjTXX14zXAk0ZZj1bORCXFk8oXnoqHMg8GDJsXm/Y4psj5aOEvhyiPWJE
         LIdp3K8hw8baSK43UHhnHPTH7jW+xqXfYaN8uCTZSZqJm42stcdgTUxDy3SVIxEsG3Ec
         wlUQ==
X-Gm-Message-State: AOJu0YwJXsW4U7vnKr5E2uhNZcdyPwPVAwEbDOF6dnaDysVmYdEI9eJD
	chbXyNnvgs9k9YSKiPx+g7oXbA==
X-Google-Smtp-Source: AGHT+IGNzyBdiIZfQ4DF4XuOmGyKRZni2mP3PRV/P2h5TceAkWm7j9RgEST9AXGECkznBpWFXNgC3g==
X-Received: by 2002:a17:902:d4ca:b0:1d0:92a0:492a with SMTP id o10-20020a170902d4ca00b001d092a0492amr315004plg.85.1701850186736;
        Wed, 06 Dec 2023 00:09:46 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:92e9:8fb4:700:680])
        by smtp.gmail.com with ESMTPSA id bd11-20020a170902830b00b001d0d312bc2asm1208668plb.193.2023.12.06.00.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 00:09:46 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 06 Dec 2023 00:09:22 -0800
Subject: [PATCH v8 2/4] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
MIME-Version: 1.0
Message-Id: <20231206-th1520_mmc_dts-v8-2-69220e373e8f@baylibre.com>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701850181; l=2206;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=WX/M7HdAU0IZKfaH27b7K6yGIPbBsFWLjtWUShpbf98=;
 b=mJSGrl+9jRd9jMRsr/5TkqPWw2MdzW4BN4WPzOcL1xcccZm3RhHte5T6gK5aHQvgLcgqwjv/d
 YG1vZhx3H+lAtaW1goqwPpaUUEAu6PXgQ4dQSHJZEGqF4PbwttfdQS7
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_000948_122308_ABA88995 
X-CRM114-Status: UNSURE (   8.94  )
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

Add node for the fixed reference clock used for emmc and sdio nodes.
Add emmc node for the 1st dwcmshc instance which is typically connected
to an eMMC device. Add sdio0 node for the 2nd dwcmshc instance which is
typically connected to microSD slot. Add sdio1 node for the 3rd dwcmshc
instance which is typically connected to an SDIO WiFi module. The node
names are based on Table 1-2 C910/C906 memory map in the TH1520 System
User Manual.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ba4d2c673ac8..8b915e206f3a 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -146,6 +146,13 @@ uart_sclk: uart-sclk-clock {
 		#clock-cells = <0>;
 	};
 
+	sdhci_clk: sdhci-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <198000000>;
+		clock-output-names = "sdhci_clk";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -304,6 +311,33 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
+		emmc: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		sdio0: mmc@ffe7090000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7090000 0x0 0x10000>;
+			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		sdio1: mmc@ffe70a0000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe70a0000 0x0 0x10000>;
+			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
