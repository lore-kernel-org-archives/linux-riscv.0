Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B149CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 20:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akzwyEBDd9+qC0JbC1VCPdBgKjdsR+7tUt00sdZvgpo=; b=pBJdNnMNwkz9k6
	8YLf7UXmh2Kr2ISVWdxOw3wgSvsb75VVgq1LUQTdafxiU1g8dkrTFEqqTAWpC+Qgc7B1HPKlIj5jG
	OLE4WR3zWUZI9lRvuYN5QsGwKFo80aF7E1/z1u2/BP4qe5sgYNkjKUVGSHpn+SnMoVY/MsUoBLpOd
	I29eblMmvUltHYxaVUAaslQVGz/6tXrTJeseVAw5nEeCuK3wGDoDZ0vbbwDklWRwXsTLvh7AU3Il1
	HfZOg+0eWywIptO8Y6g33CUvVONudUgvnDHAh91UXmVZ5fYrE+YOQueXzmHtg4zz52CIMMrR4tHEa
	sPP7oBm0F+CHOyPkFdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwW-00DE3H-2z;
	Tue, 17 Oct 2023 20:45:32 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwT-00DE0e-0T
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 20:45:30 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so3351627b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697575528; x=1698180328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhR9frpmu/yAUsLJSS2gpg1w0JSCDYrDF2EFLnkclH4=;
        b=xi6u0GWySvN4dSYyiWotO0Mbdegea7muIz9DqpymsCCaippRy7bAkRSB6Kpxs78twe
         HxKYIr9mOLM4IYO+CaqfPGDUrtqq1grhPLsrIx9CyFM3Lb/a2YOJdYkM4DqXONQ/kzpu
         /GarvY3XSioC1r7CVojCFzf1bTOEoGnXBS7jOweWXh7DfxrHdaeNKUgkfLdt3STwK2qy
         OKvTLnMXOadrekYXNJOYBnmxMLSztUumqXKD484Dd9bTYYPxcumURKO0GphnUuvF/GQD
         JOOcjBFIiv5dIcOuWZy/MaGY+wljgSdXERSZ/XAMc7QOASXn36AeRO1oC0Fb9n51Z+os
         n/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697575528; x=1698180328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhR9frpmu/yAUsLJSS2gpg1w0JSCDYrDF2EFLnkclH4=;
        b=wdpJpPte1ZRO1hxD/lydUFzHjdabZmagNJnSkAE3kCZer0SL9B8IYB5BKCzRCeQgxP
         Zzi0iidAFhJPQTxg84PosRY37VkyS47+a6gFrhRBewm3frcJ+KL4A/GYMBbA4fiskp4Z
         e6BMZcx+qfGH/X08hxZU7z2Q0P9dErLUtq4Xt8P1UWDlZmyC+8lHDM7ZAEqBC3K+ZvW9
         4AldTP77EutpeeWxJ9WOHJ/zvJu+PyryxJoQgLT7oKlbm2I2ZKX71+fufes2ggnh+TiD
         ttmxJI2owDrfm3bldCZMcwKqAHZQsBw8Xib+CaZeLWLKccBFTIaTZBNFrJC1W193UVBB
         1Aag==
X-Gm-Message-State: AOJu0YzIcaJRKCA5bCPP4KFhKyG4bjjAlfENoWaOA6lDMOqOtm+Dyjm3
	Q7okAcGF7Xmksy1lD16BN7UtKDxMF9rVkdbw4cA=
X-Google-Smtp-Source: AGHT+IE7E/rW2mbc6xNEhKDqX9w4aYvx/W8/zfByPnf9rcrtNEjn1LkUl36z7pQ7qVPNU4UJBZy+Cw==
X-Received: by 2002:a05:6a20:72ab:b0:15d:684d:f514 with SMTP id o43-20020a056a2072ab00b0015d684df514mr3481188pzk.6.1697575528704;
        Tue, 17 Oct 2023 13:45:28 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:51d6:dcd6:63ef:52e9])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a6b8300b0027b168cb011sm1906553pjj.56.2023.10.17.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:45:28 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 17 Oct 2023 13:43:51 -0700
Subject: [PATCH v2 5/7] riscv: dts: thead: Add TH1520 mmc controller and
 sdhci clock
MIME-Version: 1.0
Message-Id: <20231017-th1520-mmc-v2-5-4678c8cc4048@baylibre.com>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
In-Reply-To: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697575515; l=1256;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=BOuTsoiS4wD+cP61c2nYQjChDl2neNVnlaTjhPPnjNo=;
 b=dcjpH9D4/iuzxXetEkXlXo86ynK58hWjYsp59cgxdD/sG0SgXrxZ439+HwU+bql+QBAfc0iv0
 l9K6iCBFRIzATnT9moU6vrLC7rmog09qtMRbIBbp7o96+Fr82mQl/EW
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_134529_184237_B9BF0775 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add nodes for the SDHCI fixed clock and the first mmc controller which
is typically connected to the eMMC device.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ff364709a6df..ee0711352790 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -134,6 +134,13 @@ uart_sclk: uart-sclk-clock {
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
@@ -292,6 +299,14 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
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
