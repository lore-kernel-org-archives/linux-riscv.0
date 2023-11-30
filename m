Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A1EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 01:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5djxrBJjwLQpS95aVF3NMpCgKDYpfnZfBEyB7cMUCcc=; b=RZEQkiYGMQnMFI
	gieoVVcjktIq7Ni4Ujey1Ss054hbmD/221LOpUbIZomhsCq9/XL1VNBjI1XmzIUYMB+LX/OScADfJ
	jC9s5DDUp+s+/c13Ol9rgXmCwFnhg0RBoBoAzLeJcIUatixgpIsB2/AW9SbSO6izdHzgBqncvOcuh
	8KaQ9LcWlQwtRW3o9GuOtfjR+w2ZC9viA9hL2GKU68JyM3vE/Vz6k8jTHOKYPupclGjFeeMWtCYZc
	7TQEvdIJPY9YJ7cdn9tDm2WHR/+V7ZrSC4mshbm49DFpwXpi68419+UsY6f68G7I2qT9pWyIKIb8z
	UditvORzT8qqC0q2g/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WB6-009i28-09;
	Thu, 30 Nov 2023 01:49:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WB2-009i0C-0n
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 01:49:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso414391b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 17:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701308954; x=1701913754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z+ndca3Z6Eic7YQC0/xH8FsGWWOuYgGvNFQBkZMdF4=;
        b=neQiUgNGSikVHBBSTEJoPXbFjpEyNk3D8Krk9LDMCHyOGuOnq2MjQfK4I20intDfPI
         LiLfMK2SP5WIsurRfNQ/wnwiyQFSCuH1wY8E7fQ2FIJXiABnCnHWaRTqVqj64WXxUQH4
         uIfWnhrXguqiUMuqTklZHT5zz5d6JsqlYnEFnPHMY0NCAzN/TCltSsa/UYGG5aVjzq9V
         o9o3ojrVjPxQ/aLBRyc7MKX+FUkxLPcxqF+t3CPv7gtWBmACZ+5AMBPimmk75FEVRJU9
         M8QRJF0vNGz9UDch/xD+JlM2rPNzfo7J0rwUSqVB6Zx6b3NgVQfYpEK0dGOxSUqECTc1
         b1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701308954; x=1701913754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z+ndca3Z6Eic7YQC0/xH8FsGWWOuYgGvNFQBkZMdF4=;
        b=pneBQ4NsNfpB+1oEpvPXp3uzNlDTuW5g1MMbS6hN3ZkBBKYmc4KPRpJIdi0UtgHe1y
         QOBrxYsttaZghLZSOXahOIZqudOnnGFMXP7ODVt/8dV9PqhJSAwox8i4G5GB7yUFEuuo
         7UR7E72Y43JsDSWzZfWnTRjcEKQIeB69QyeztxMg2ZcfGiEf+e84M1vFfukOmJ9tnQsM
         k0d1ckJi6Nn1NrXqI57CWZw8Kp2Zs3HHj+E32IospNNa+xzE2d1Mzy4p4jqQX7fGBA9M
         oeb3ip/fDHKCVnBmTuAjQlreoWSuZ9S+FC1YTaviKf4nROZZwOyh/03vtR7/g0oX068D
         3e+g==
X-Gm-Message-State: AOJu0YwGIoU7vnS5qCgYpUg60PLhASvnRLwUjV7eQ/tJIfipkx+YdYhg
	172c63aUgrFiVsjcn+zeJiBXuQ==
X-Google-Smtp-Source: AGHT+IFBN4GbO5IVrH3STjeo4NgwmKPtI5V+pg4yKuZ08Albi8y5dApuT1MLd7SBUshAcww+J5QhPw==
X-Received: by 2002:a05:6a20:e68c:b0:18b:d344:6acd with SMTP id mz12-20020a056a20e68c00b0018bd3446acdmr20940688pzb.10.1701308954337;
        Wed, 29 Nov 2023 17:49:14 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:9707:1e8c:3166:6a23])
        by smtp.gmail.com with ESMTPSA id bc3-20020a170902930300b001d00b0bd306sm24455plb.251.2023.11.29.17.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 17:49:14 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 29 Nov 2023 17:48:48 -0800
Subject: [PATCH v7 2/4] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
MIME-Version: 1.0
Message-Id: <20231129-th1520_mmc_dts-v7-2-c77fc19caa6f@baylibre.com>
References: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
In-Reply-To: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701308949; l=1662;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=DQ96Tg/13kE5gI7pfVf4VVYmBoxlIyPSePCjjoqiwMQ=;
 b=lhspIc86lmUso+ZOw52u80IWEJIRiUBb3EeGUsj7g6D4elrcuxNiXt5OSkhbg/64cyN4LLewT
 ewwEkRNha6EBMg1QDE3n3HSu4WVX5oLoLE+/6/jvvss58AO4TPhEjJx
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_174916_282125_E48AC876 
X-CRM114-Status: UNSURE (   9.66  )
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
 arch/riscv/boot/dts/thead/th1520.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ba4d2c673ac8..af4fdcd82e0b 100644
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
@@ -304,6 +311,24 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
+		mmc1: mmc@ffe7090000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7090000 0x0 0x10000>;
+			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
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
