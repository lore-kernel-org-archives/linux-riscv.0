Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083CAC35FE0
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 02:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qst1mbgRxHBdvy2X8kZZJOOGXoEAthrlcG6NoDp9Dmw=; b=1TE3ELCvt0mGj0
	qrcHqND8RENra3XOaiEjMflvRSbgVoqQ+q5OY9db2/ksCIFZaKtb1DN4XgHczYHffGB8+RKXM15O3
	i4xf7Hrw6b7GTfeKzkuE0Dy9X3nXoxvfgPVLNMimjakkUMaNeRuv16M0+F4f89lJFebVIqiGtflGT
	pRZ5Ef0pBId1TvI6BnXvCLA+lCqiN47XhlDITWO2IWRNcuQ5Ba9ZLcNNHluAamdJIUTInlchejBf3
	pTp+3yUV1LK3jQ6urDSXtpTBlivg9opgD5Fpv4KLA+rKbJiol4F+tlgu9UlL7bQhGJVAFZ3YDDqmX
	VVR+LaSUT8RFtoCgFPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spfDo-00000001VjD-47i3;
	Sun, 15 Sep 2024 02:42:44 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spfDl-00000001Vgv-1o8u
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 02:42:43 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6d7073a39dcso39119057b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 19:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368160; x=1726972960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHgln3wQkLMw2wtycnvxZvj7Igj75ioqXt+PI4X1eXk=;
        b=KgPQKXsOyCjzIZvDVLlmBxo/vIOZDrQ+Z0aRP5uG8aQO4Kp+fUAUh32m3WROJrvUbz
         y/8aNqt/xRiYLJDBG6eJRiwQNFDdnGDaG6PfZojq5plaYLiCcUI05auTfZG/nDX+5kg/
         TLglQSb7QXv5wEmCn+UqLEFKVVd3qGTiS7Ic+msb5HfVoG/tAIWOdJLZ9+Fu3X1Qi/lc
         74AZ2LwvjRGZmz5FGUfGW0RgIptbo++/UF3b8LYNynebHb+43JO6UtmsmK5FSTijhJtt
         jJ48p6oWs/MJTQRMx9uXdsaTMHiJ/qJtgDGW8FBjxPMy57FRGGveJPZnMcWPOLvrccBN
         iClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368160; x=1726972960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHgln3wQkLMw2wtycnvxZvj7Igj75ioqXt+PI4X1eXk=;
        b=BRe62K4i7nVbNnyOLDA7arVopAczMddIZQ/uTozTyJVAvZUTG4y6WXxaps19DfowFf
         LilhtQBI2iVwuPTjkL4BCCJAPHGf23O+76zia1qZRzwEP/e68MLLjVaf7K6WkE2DVi4b
         bXE8W7c8/Gs63OKxMmW2Z/2G9++6Z1VAOgSCk8EbgZRrqywyZadM4ICkHKfq853I1O4x
         W9cIYUjjDKk5513EPcK1qxFDgW9poTZ7ktg8NQ9l/eD6WkGy/mCzY9fqSLku001ffBgL
         hkObdhwt9gyRslP+rZq/uWsPGTuzuoITdYxVDtLISDtdZMTewVQFLYeqY0LQK45QLrUm
         rXsg==
X-Gm-Message-State: AOJu0Ywwu97xZXW4s8WTGU9S/W6nGI7suO0+dlAzxXRt2vOA3xTj42fX
	JLjkU3POEB8kMBEAZ1NZmCWNvQTK5GOzgX3he9TYPfInmNWrwyyTDDFiSWdTcJY=
X-Google-Smtp-Source: AGHT+IFaHdrsdHOuCpt6ydJMZ8/6aD/aZlY/iZxg9AFVDXoiT62Bt99GdZSap1940+IAiYcKZgw1yg==
X-Received: by 2002:a05:690c:498c:b0:6d6:afe9:d818 with SMTP id 00721157ae682-6db9535bab1mr147029077b3.6.1726368159686;
        Sat, 14 Sep 2024 19:42:39 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:42:39 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:51 -0700
Subject: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
MIME-Version: 1.0
Message-Id: <20240914-th1520-pinctrl-v2-3-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_194241_531782_45BFA3CA 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 27 ++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..be85e3aee56e 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -44,6 +44,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &apb_clk {
 	clock-frequency = <62500000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1365d3a512a3..530648ad64f6 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,6 +25,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &apb_clk {
 	clock-frequency = <62500000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 3c9974062c20..9367754eede8 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -215,6 +215,12 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
+	aonsys_clk: aonsys-clk {
+		compatible = "fixed-clock";
+		clock-output-names = "aonsys_clk";
+		#clock-cells = <0>;
+	};
+
 	apb_clk: apb-clk-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "apb_clk";
@@ -357,6 +363,13 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			thead,pad-group = <2>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -393,6 +406,13 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			thead,pad-group = <3>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -529,6 +549,13 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+			thead,pad-group = <1>;
+			clocks = <&aonsys_clk>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
