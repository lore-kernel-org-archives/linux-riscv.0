Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6BFC04E83
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 05:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHFuI6sIlVeZ3eBH1UjkCAg2X++VmYq5BtJx444juhg=; b=ytS2H8pVQMrC6H
	o92v3lzsVx/haW51OU3l/22WbuLsSZSZx28G4sDY0vIwwZQkeyqY43IxC3kz5mOsigUG2Qdt5Pvw9
	FdtasZYdI/FYQJzFial5R7Cmrdf10Ejnb5HygVmE4GrqrTVmpLoPOE5DLN7oy619gwUdnI5YxYZXR
	Q3APzmkZHSqL7639k/fLmZY31oHHwRIYmhpdNUVauL5qCLyWkNgZhTAzt4k5Oggef2Ruv9Kg62XtM
	HTZuWVN5TJc3mkhWkSgJCZmaSTrDiBCVtob3BqDcj4U+aYP+13FjHrfHdH4kOds7ABDFTGMZm8XJJ
	DOFeL7V9X7lHyY1R38MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHt-007u7N-2X;
	Fri, 10 Nov 2023 05:42:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHs-007u6N-07
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 05:42:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cc29f39e7aso13008865ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 21:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699594954; x=1700199754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frioRiPhaekRnCE/0ENvI5wkvdspg2jE1Z81EEiVDoc=;
        b=izT3LX4/6ckxsVQ5fs5LDrcFNGZW3VBTxekfHp0hxwH+vTOmOcNqc+qIKmBIXYcNC9
         ku6gKhvvXbthcVze3dGjAJjQk7xelLtiHXGOoLtJna6sEQXC4k/uOd6cmcO560QF+sal
         lE4ZnoWY21BwUOLksnX/do05M9JOS5mtdLsm/LyTVu5M9jELClLXK8O5isRrpKWZImeZ
         KxXu/R0Ys3yyrvqnyvCgQe+BUGmBDSa64LxSt+eRVdeSWX2/M1JKs7vcN8q6WOjfcLRX
         NiefiFRz6/oBCKRu9ve1z4dGGdNw91/QBY3A29WaUe3sUhVGFdXruBXad5+sUrZ+qC0W
         ChcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699594954; x=1700199754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frioRiPhaekRnCE/0ENvI5wkvdspg2jE1Z81EEiVDoc=;
        b=meVNcSNSMyb27VmjGwQsNehIaosJI90ZfE7ozm5ExSSCV5WnGFsKaZeUicbFTmADXH
         ephTJes4NrVS4KUiAEFB6NKEQYG/6mJq0QQiAYrsMO4NPAkmbHg+Lg4ghiBLf9zWqDEp
         cI5d0+ScWRtIKwNwNL9z0Y7LPtu4irmuX+c9n7oqAYKZTG7QcdWYmzh/UGAactbInzMH
         cEQF4NAzDP8HfHZx13uAn8c5dLCnvEpTALJTADtsethYPmztKjBIAxeMn84fByQOXrHo
         hCwBVuCRTmSXw7Q8O2GZsu3OiJp3PZbrv5W6Vynk7RBuFpMmjZqUgQO1Do9SQtZdVy3D
         Z5tQ==
X-Gm-Message-State: AOJu0Yy1AQblSIQrlOoueghB5imaUsxeDWAqPuQpcbSbDuhIM+0M+avk
	Ztm2f0hdbnx09zM3YGdVYJJpww==
X-Google-Smtp-Source: AGHT+IEPm64O/kPii92CwhwQe1YfvABcclwau/EBIc09Nos6a3An9QWe0GQ8ouZ4SdnmIGy2UbbfeA==
X-Received: by 2002:a17:903:41cd:b0:1cc:6fa6:ab62 with SMTP id u13-20020a17090341cd00b001cc6fa6ab62mr7777004ple.29.1699594954577;
        Thu, 09 Nov 2023 21:42:34 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2071:4479:98b8:cc69])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b8a00d4f7asm4498845plb.9.2023.11.09.21.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 21:42:34 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 09 Nov 2023 21:41:15 -0800
Subject: [PATCH v5 5/7] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
MIME-Version: 1.0
Message-Id: <20231109-th1520-mmc-v5-5-018bd039cf17@baylibre.com>
References: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
In-Reply-To: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699594943; l=1608;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=118IOeI3EDHQnRGvuv5ewuNsGEAnYvxtIZdzQTMEyXk=;
 b=yeOrLz+tWTsGAfXBiTlsUCM457E2vnWs1IdM64XT3ndoS1ZsuBso99iSFBRWZAC6Hpujod2vK
 xZA5w+PGj/PAXAJNWux4UMW0MTSz3dqYn8V63Datq2uZLRYpXMPuJ8B
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_214236_075011_D064A871 
X-CRM114-Status: UNSURE (   9.85  )
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

Add node for the SDHCI fixed clock. Add mmc0 node for the first mmc
controller instance which is typically connected to the eMMC device.
Add mmc1 node for the second mmc controller instance which is typically
connected to microSD slot.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ff364709a6df..f5ec9326c4b8 100644
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
@@ -292,6 +299,22 @@ dmac0: dma-controller@ffefc00000 {
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
+		mmc1: mmc@ffe7090000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7090000 0x0 0x10000>;
+			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
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
