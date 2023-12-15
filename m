Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FAAC35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvyX0l6U8K5FOZA014IAn/x24iuIR/9dMoE7EZQS9pE=; b=SZ/Szmth5K95vh
	Iy22vBIbNnyO19Q0F7TaTtEM50K6h9NDGRIZjORDfcb/RJq/awn3pJBhktoSHSymD1uUrB3vh2ak/
	ERXaEz64cQ6F8HGPGAowo4pVfU1NqaQj2Jeg7GSxcV/0do2/2BsoZ0vCAm+SGpcx2paRm5HR41gJy
	m2/jscbhp/kip4U/N7ybR8pBo+Tb2D3Dh6FVGwCy6DtGx2AYz0C2o1L1MJxyt3lhdlP1Po74zeBzb
	p0pl3F8f+CgAUGOm3zlIuJT4YkvBJyZq6ouo7M8pYV8O1qxDVCMdjKrP5YaE8G3HG56VfQCHXIBQG
	apRNudAdbFV1bFlbkDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LZ-003aH1-0r;
	Fri, 15 Dec 2023 14:39:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LT-003aDZ-18
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 14:39:21 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 308423F2BB
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651158;
	bh=Ybq5UjTeoIDvQGsMjYKQSlN8FhlG+exm++rGqALpbk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=kwcVmKtKgGrQzD50R4KeZeC02oSkbdTKWzAKXHCMM02XTTU5/B1RTajhr0Cy6vEZ2
	 isDz2HqM8D9aGcKHSBzVOvgG+wXDlPCH51s2j4A058LFmOINbJg1Nf2QnSZsLWQS+O
	 agICxlcZxP1FCu+DZBoE08Ytk9D78MT/ubKhn7HNorcOdePH5FDHy60t2XITHxxrkP
	 9i2W+QeRX7kM/4mNuiFghxE5LdY/hqhyHA+m/aLsE3lok99b/kC4R0N9GgxPSlIRAs
	 +kaYa7Quz+HH1N7MUEwB/e71ff4BzVBO3YFBvvjw3aFmztmiNRWJEdSHPxqoT7Ntkc
	 uvS0bvJzZcwfA==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a1e88d2d7faso44313066b.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 06:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651157; x=1703255957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybq5UjTeoIDvQGsMjYKQSlN8FhlG+exm++rGqALpbk8=;
        b=inh9rHLzq3/SrNSBD7bIc+yCqU7gtFsmDMcVxexj3J2Ba1X+5fc/+QJoBTE5SSAJ3l
         yrsFopjObG/qxmmW0nIQaPqNTAacerptgn7d+4LpQGA24LVKZActfWh7rA/fxZWFiH0i
         lveRnakwJOhR80RHCFr2ADkLQWQNuVf/QhuJXcrQb3clOsO49X9c8Y7hj8IxM28tpuJi
         elWKqhR2BSW4xGl2oiH3f9A7JJFkTTSChcGTpnO6hBysMjRT2vkcuB++rPo1stbD20eF
         4syF0rRWbLrn4N07VRJ8hK6HeA5Sz6DeiSuA28fQnK78SQtp0F/zbjQ05OChVzM/61YN
         UNEw==
X-Gm-Message-State: AOJu0YwK6IMe+n3Jnz+KPRItZHG2VJoEUQc7TuL64+qoOeiueWt73rM7
	39ArDj+8hOUZcWaS0pnGEiRgrwjJKyMNQNrFO1oKNtW6TCUaMKA9/BiBgQnXGjTVXL6CQgeVi1y
	ubQKG4I6wuT8KfhvRbzWivOchhdFEDbIZC0RCndirwhykJQ==
X-Received: by 2002:a17:906:530b:b0:a22:f068:7f6f with SMTP id h11-20020a170906530b00b00a22f0687f6fmr2487186ejo.103.1702651157466;
        Fri, 15 Dec 2023 06:39:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlQI/l2ZAFLp1q43IDXNIJcNIW2onNCcYx/a2Yji69pawtw9Ir+cUHT9Sd1e0dwlnqyRXDFQ==
X-Received: by 2002:a17:906:530b:b0:a22:f068:7f6f with SMTP id h11-20020a170906530b00b00a22f0687f6fmr2487171ejo.103.1702651157255;
        Fri, 15 Dec 2023 06:39:17 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:16 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1 6/8] riscv: dts: thead: Adjust TH1520 GPIO labels
Date: Fri, 15 Dec 2023 15:39:04 +0100
Message-Id: <20231215143906.3651122-7-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_063919_528245_721B9426 
X-CRM114-Status: GOOD (  11.53  )
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

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   |  2 ++
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  2 ++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++----------
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..91ba96588ae8 100644
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
index 9a3884a73e13..0ae2c20d5641 100644
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
index d5e2378a1afa..17ca214b5a97 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -206,13 +206,13 @@ uart3: serial@ffe7f04000 {
 			status = "disabled";
 		};
 
-		gpio2: gpio@ffe7f34000 {
+		gpio@ffe7f34000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f34000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			portc: gpio-controller@0 {
+			gpio2: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -225,13 +225,13 @@ portc: gpio-controller@0 {
 			};
 		};
 
-		gpio3: gpio@ffe7f38000 {
+		gpio@ffe7f38000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f38000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			portd: gpio-controller@0 {
+			gpio3: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -249,13 +249,13 @@ padctrl1_apsys: pinctrl@ffe7f3c000 {
 			reg = <0xff 0xe7f3c000 0x0 0x1000>;
 		};
 
-		gpio0: gpio@ffec005000 {
+		gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			porta: gpio-controller@0 {
+			gpio0: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -268,13 +268,13 @@ porta: gpio-controller@0 {
 			};
 		};
 
-		gpio1: gpio@ffec006000 {
+		gpio@ffec006000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec006000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			portb: gpio-controller@0 {
+			gpio1: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -410,13 +410,13 @@ timer7: timer@ffffc3303c {
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
@@ -434,13 +434,13 @@ padctrl_aosys: pinctrl@fffff4a000 {
 			reg = <0xff 0xfff4a000 0x0 0x2000>;
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
