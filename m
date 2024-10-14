Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A654D18138
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXNX6kWbPgGlgDDsU3E2aVnGEKbrRBCbU1x2LvUl2CQ=; b=mB+LaWpUznnMRT
	R3qPGDgXO6ARf4UNnu3JwGababJdSLBxKUP3Y1EY3HjSioa0SiqK7nw77Qh0SxuvJkgrlIBkijeis
	MJ6rxEpDiO6vIp+bedxCbWpT3w8P43r8LxKo48z9Wemu/CFfaVLC4RXk3wdSMoMgYz+Tb6GS43YH8
	sGCj4dK+EogDUWRW01IoU5gxnw7AyhQj9FgDp0iwJUSJCSSthWIlHpgxxeZslKBP3xQ0Ea+wTSXMO
	GLPgYK5gsQo6i9zk3LK/AWTr4bUB8W14dy0O0UOQzqcaiGSiWxsXVD32K5YVRTnGlXXxfbWSFDDq7
	qj4VTK7apRWz7OABS9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHE-000000066bk-2wGP;
	Mon, 14 Oct 2024 17:54:40 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHB-000000066aK-0WiE
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:38 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso1965631b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928476; x=1729533276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0zit6gUQKo2ZMxFYqtl0909LFUrn7ZGPPwMzt0NP6Y=;
        b=NsXAMIjfaMuyQhQZbR67x3IrqQEgvi0G1x1bTOMbM0XcMvTNRXP1kuauSEpwYkUMc6
         SX0R3nWO6u26UqRZtDF7ZDWZvU4DX7vHzNZN3oSFVYsll26W64MoO8rlhrHLFFLUzuna
         FFk16UxPwAnn3KQ5U+CFyYKhNaS5uKien8EuYKiQkFKEwnRQJ9W66A6NkITwWeXef8cj
         wt5onQNHj3S/e82Aqzv95LV1uSIHKFvYMaGtqP3EvyXBh1MDrOqgttT5f2on9k4vP4Cj
         EGm94dnsa2VwcoDdU361vfCcJd48RiUF6X8CISpM7N+/7VWMhj7YiZ3FTjU5WPFYE3NE
         HHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928476; x=1729533276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0zit6gUQKo2ZMxFYqtl0909LFUrn7ZGPPwMzt0NP6Y=;
        b=lQr9ukIKAdVokhF4ZTBbwJennNav4tQE/OWsW59EHzhLAe9rPRWjjatsAWsv/47HDt
         tFzikVU3pYiY60diYniV5iEtVLgOno0phlBJ1SkPNJQqu7PN3iRWF/zZUQjMenCqA9hL
         D5Nc4Z2Itatlum5mUUEw9ik0Dl9vjTfACkLkCtwaU00K+XKTlJCynOA117/VP+gAeyEa
         vds+3/0Yu/e0V6GRpwHQQs9CVO7MjTNuQv20WZO/sH37VBSG9u1XD6m0kGe5boENUy2h
         GHjAQhNxN2iNXjTn2+b8DSf68RjDsSsf9pYxsHaaULaZOKE5uIDvgXiFIW7g/XQd5Xhx
         1/cQ==
X-Gm-Message-State: AOJu0Yz2M8qIbmCPdtCbG+raTffAeRzOhIUhQLmr++SXE9uD1eR8PxJA
	w6cJNI1S6ywiaIzz/KzpvTsFWkJ5yl/sP8uvEIQYgyJbhRz4WWdWPVc87QH6iMw=
X-Google-Smtp-Source: AGHT+IHmZ8spKfjJSaHqojJMyLp7o+oDaFg/XgT/pdZy0pW9OWdLo+u5au4zboUexFynK3K/7hfaog==
X-Received: by 2002:a05:6a00:856:b0:71e:587d:f268 with SMTP id d2e1a72fcca58-71e587df456mr10082998b3a.4.1728928475702;
        Mon, 14 Oct 2024 10:54:35 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:32 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 14 Oct 2024 10:54:20 -0700
Subject: [PATCH 3/8] riscv: dts: thead: Adjust TH1520 GPIO labels
MIME-Version: 1.0
Message-Id: <20241014-th1520-pinctrl-dts-v1-3-268592ca786e@tenstorrent.com>
References: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
In-Reply-To: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_105437_332390_618F6768 
X-CRM114-Status: UNSURE (   9.80  )
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

Adjust labels for the TH1520 GPIO controllers such that GPIOs can be
referenced by the names used by the documentation. Eg.

GPIO0_X  -> <&gpio0 X Y>
GPIO1_X  -> <&gpio1 X Y>
GPIO2_X  -> <&gpio2 X Y>
GPIO3_X  -> <&gpio3 X Y>
GPIO4_X  -> <&gpio4 X Y>
AOGPIO_X -> <&aogpio X Y>

Remove labels for the parent GPIO devices that shouldn't need to be
referenced.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  2 ++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  2 ++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 +++++++++++-----------
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 497d961456f3..1a4154a6ff3b 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -17,6 +17,8 @@ aliases {
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
+		gpio4 = &gpio4;
+		gpio5 = &aogpio;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 7738d2895c5a..58ad381fc1c3 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -14,6 +14,8 @@ aliases {
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
+		gpio4 = &gpio4;
+		gpio5 = &aogpio;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 9c6cbb4fc3d7..31725c3a13d7 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -323,14 +323,14 @@ uart3: serial@ffe7f04000 {
 			status = "disabled";
 		};
 
-		gpio2: gpio@ffe7f34000 {
+		gpio@ffe7f34000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f34000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clk CLK_GPIO2>;
 
-			portc: gpio-controller@0 {
+			gpio2: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -343,14 +343,14 @@ portc: gpio-controller@0 {
 			};
 		};
 
-		gpio3: gpio@ffe7f38000 {
+		gpio@ffe7f38000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f38000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clk CLK_GPIO3>;
 
-			portd: gpio-controller@0 {
+			gpio3: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -370,14 +370,14 @@ padctrl1_apsys: pinctrl@ffe7f3c000 {
 			thead,pad-group = <2>;
 		};
 
-		gpio0: gpio@ffec005000 {
+		gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clk CLK_GPIO0>;
 
-			porta: gpio-controller@0 {
+			gpio0: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -390,14 +390,14 @@ porta: gpio-controller@0 {
 			};
 		};
 
-		gpio1: gpio@ffec006000 {
+		gpio@ffec006000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec006000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clk CLK_GPIO1>;
 
-			portb: gpio-controller@0 {
+			gpio1: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -545,13 +545,13 @@ timer7: timer@ffffc3303c {
 			status = "disabled";
 		};
 
-		ao_gpio0: gpio@fffff41000 {
+		gpio@fffff41000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff41000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			porte: gpio-controller@0 {
+			aogpio: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -571,13 +571,13 @@ padctrl_aosys: pinctrl@fffff4a000 {
 			thead,pad-group = <1>;
 		};
 
-		ao_gpio1: gpio@fffff52000 {
+		gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			portf: gpio-controller@0 {
+			gpio4: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
