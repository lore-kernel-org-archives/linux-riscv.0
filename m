Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2913C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmcL+RfLGVuMghPUBkuyvHxFWJ3W4uGWt3p3nqrqNlE=; b=igL8r5dSMPY7sW
	0OXMlFeJnC/h8ElHh7mlz3rN1YU35fbffWGlpWE3fYyYVB0sVcHGV0WJIzX0YpzJZX0te7EibWbI1
	TFhXc/fMAy9US/E5MkYupwqe7BvPP6eetT0JbHGK3I6XT0q1l6OeNxFgsRYr1XsDG/e5FyModhwUM
	+N+iSJJnrsV2HFY6naaYvy77smw9v7AtduK9xIAmk++LbAEalBYm7KU4NdY7DTMpfnfJb7/nG9u1y
	7+a1LKM+cU4G9j/63YCi1EC18ovUAqVrP7bencc0FEAskDWbEdB8eSgLTif2han6seAZdvhy3Aycb
	lUA0PzAN1uV4p6PnZ3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1JE-00AwkZ-1n;
	Wed, 03 Jan 2024 13:29:24 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1J9-00AwgM-27
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 13:29:22 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 99E6A3F803
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288542;
	bh=k0eAX7Pjr0Es3oRTW4OzPPCh10C3Ug4Yt616FM0odEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=oDx2PutFSTcy3hxsvqUSKyOCEIB0bidDpDgzoEOP4IUWAB/9OGAc8Lc4x8Tv0h/Vo
	 8ir5L6WVLcRhqznod4xHL2fddHv3dmHoD7N7WCW654Vmn6GpUIGUycv+3qhe0Bk3lR
	 lRh2t/ZJCYbhDx+YbbW39Lb5e0iTUyfb4YMwhFutzLH5BE0LolEDEHbqkiiE2DD+q+
	 tLIgLX7v4clfFuv9bDTJqcWHYr+oBkDXu/R7VQsq6p9dI1yYj3jEarmGSylxvra8HF
	 L3LnxFuUMe/LkbdNWPzhjdF0sQSr1vzvaImkkvgrbx1b0n55rO7cg1Rn8F92Op2/Ud
	 ItErq8u4VSsGQ==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a2888d63b80so29537966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 05:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288536; x=1704893336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0eAX7Pjr0Es3oRTW4OzPPCh10C3Ug4Yt616FM0odEI=;
        b=GMOGe1rmo+L0dF/mW8rUEBy+67+NOB7y5GqVvxBl8HXAeyj5VYAZNd53NUvVd8LHwN
         qVxi5g9Q3GgkN16DX8ioGD6Cx4Osbj1VlkrTAmQuEl+EGJFsHielgLbkAt5RCVnLRpYV
         nehRQYRVl1U98w59Xosq/7/Siv+ssE9V3X3Nn/Ia/MkyhbQPqyV1XazlWdfs3acU0O95
         ydKFNSgyTaSTe/7epKkF4DgUDOwnGEFWcDD8amfUsEdDLtYlUBw/g4Mpf3Ydz2uc7zlN
         zGVTPRPx8OHIsjNtqtBw2NhpgHVZXH9OcOqww7eko/yn2b6ErWpkat3l6pQ7BmNeYPFH
         /clg==
X-Gm-Message-State: AOJu0YxEOL4GrVA0dOiVbe8fQVdhY4vS+u/CIfsdcMvHKdSl/vFtY7z5
	op0TG4ctZoyTzPxg/CcC5b/UCs/3Zz6vhiu4TD28KGxZATmKHKxluB/PU9rt/jk4Q9q/29D7mL7
	HR/N8CsIQJysNkojgymXqoUiSTV2XwnZjqbkSILuxGScYQ0SiK/UC
X-Received: by 2002:a17:906:ae81:b0:a24:8deb:3524 with SMTP id md1-20020a170906ae8100b00a248deb3524mr9998284ejb.54.1704288536393;
        Wed, 03 Jan 2024 05:28:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNIq1CKNhWMoSrckwwyabhUuOE7H6QabgeWt/eKwTAzHuJddgDz15KXv9LDSyfEPXQDMx8qQ==
X-Received: by 2002:a17:906:ae81:b0:a24:8deb:3524 with SMTP id md1-20020a170906ae8100b00a248deb3524mr9998278ejb.54.1704288536233;
        Wed, 03 Jan 2024 05:28:56 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:28:55 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Date: Wed,  3 Jan 2024 14:28:40 +0100
Message-ID: <20240103132852.298964-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_052921_526412_70BACF80 
X-CRM114-Status: GOOD (  10.75  )
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

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..6c56318a8705 100644
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
index a802ab110429..9865925be372 100644
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
index ba4d2c673ac8..e65a306ff575 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
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
@@ -242,6 +248,12 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-group2-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -278,6 +290,12 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-group3-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -414,6 +432,12 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-group1-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+			clocks = <&aonsys_clk>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
