Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D363AEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 01:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfZGpxZEKwB2nGzhuADozqrHDhsHbBSNX9LC5i9/Tws=; b=MXkNkeh1ZIi1fe
	A5eVaTQimYH62Sbysi+s4tHhnT3e1+uG097dyUX0L/DyPkW2kpjLFnSF7flBcChjFquW30Q6HCOq8
	3VWqKeV7I46u5l8F2Js4KqYllUVQanDcnWyQLks+j7hNjtzEAKjoaOUsaqTkdeWdfU/2FAeJfa1u+
	Gkf+oCE0aBJpm9jaEssVStLMyrs4SYHaCAWyGdazu12dNEAsNjuRgXvbgIELV4ug39f+FwA73CcJg
	oJuTkhXj9yvucZ1syLDuVzn3J2Pa2spYPCVLtlw6SyE7HmLSR/ZLa8tNDnybLdZR8DEPpkwBWBoyi
	hxlUUPejZ5abLvT5rFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Pz-005nWd-1B;
	Tue, 25 Jul 2023 01:00:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Pw-005nUP-2h
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 01:00:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68336d06620so4670632b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 18:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690246847; x=1690851647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vubcOJoroAr2qpLW2iybw1ATfvK07sgIvUXsKV/dGPo=;
        b=ZdxNwW6iD+ATHVZZmgMI/K5jv3cH2Ujnpa1n4KF84BDR/TFSOAgnarse9TTxC1kVHW
         xqBDH5rfDJk7lEaPUaVKWLlKqeZAlNF29DCSuXXiQyo5L3nvzeoUUq/9qe1Y0BSiJfzm
         1C9AS63LVx0DIY0JJfZkSjBJ/T9s6e7yPM//pm91rXImPCUIDMJISbUUboI3IapNhzBk
         0aQYmbQX7yeZcu2vlGe7QfCW5B8UjmClt7XtvwAa28hca7hr1AJ0/KAWYXrv0WRRKIVO
         oyZ8IFYxB/66dZR4O9OkKlipdd4bGMWHqmQLrQ1By1Uozf8yhIxDXeyFxKOFpQx3sRP1
         mPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690246847; x=1690851647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vubcOJoroAr2qpLW2iybw1ATfvK07sgIvUXsKV/dGPo=;
        b=G/MaWf67k0cJnHHqefrO2/nRosbm074ayDpM4qIsIcs35QHNLz9coQodrNngt7c/R3
         W8AhjcznVY2DLtkPdwx5UOYhmFmCKY7ElP6PiMZKRDMMs+Vd5Ifx8S8ISinE6i+M9G5u
         ++T6LT1UxFm0pS7+VrH8FIIEhICJUv2jsFeCnZw80BydHZSDDVnLV5lAGwksfGlOyZvm
         Z6ypx+KZ01CPbN/ejc29M4kn6Cw+u+1CJtifN5yDML/RGqWeomnjSYRWbSqzWiQbFxgT
         9/xWJ61erTIU4VDQalzqnVCfXsSZhnc+rREeLTF3QajT26y18LTqf3pcs2Q3by0tiHxD
         w05A==
X-Gm-Message-State: ABy/qLarvCW2ohZ0UprDPEKDwsIB63iTEtC+0YPrTA78OJynyS/DQgR+
	Afqj350CBqP7t8GPGX8bSL3/kRTqro1ixj40ygkAMg==
X-Google-Smtp-Source: APBJJlEAhjbsPgk3JD0vupzmDd8EQKw4DMuvw92Ytu2yFQiDXb5Y2QzGEzDlhzbWXyacnSEsLpMj0w==
X-Received: by 2002:aa7:88d5:0:b0:63a:ea82:b7b7 with SMTP id k21-20020aa788d5000000b0063aea82b7b7mr13452644pff.28.1690246847286;
        Mon, 24 Jul 2023 18:00:47 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2cbf:9196:a906:e222])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b00682a75a50e3sm8576900pfn.17.2023.07.24.18.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 18:00:45 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 24 Jul 2023 17:59:16 -0700
Subject: [PATCH RFC 2/4] riscv: dts: thead: Add TH1520 mmc controller and
 sdhci clock
MIME-Version: 1.0
Message-Id: <20230724-th1520-emmc-v1-2-cca1b2533da2@baylibre.com>
References: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
In-Reply-To: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690246840; l=1329;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=6awbEzIrA6nzn4c2XYrw0EelLQcw8R2AyCuPywQYMDA=;
 b=K/Sjhx5qpvJO6IrC2wQpAqRt+DIritcPNunTAz3bS4QTSmeXIj/8HZ8iSzjVoM9e4wViBk+q+
 s1qzxGvdPrQB5vXLmlawMw5qj8+rijZgtPdfrY4hxhbHh7fXpKK1n+2
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_180048_876562_07DE4CE0 
X-CRM114-Status: UNSURE (   9.50  )
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

Add nodes for the SDHCI fixed clock and the first mmc controller which
is typically connected to the eMMC device.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 56a73134b49e..b33bfb04c955 100644
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
@@ -291,6 +298,16 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000
+			       0xff 0xef014060 0x0 0x4>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "sdhciirq";
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
