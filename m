Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A49C47074
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUzEMamlg6UGFKmeRov2INRLN9lhNslSFNvg4pGgq3o=; b=xMsvCa/ODYNbZC
	xPBe/yUAA/+JpoL3RFkaORuJ+oc/hiutpNHE0Oe4ic5ORU2i07uArhaZnS8jEScLxE564uyxBq+xY
	ANODsmM5XUqC8/bOrTyKyF1mWkab9l6yZwPiRR7IDqb9ymh4nIeSFK3NjsdFPJ2meNvGIMs/SDfBs
	xdsylTgBkESG7s6mrc/bnoRV1jOvITd/qb8AunQKFahgIP57+bT97h7j/M1p2yDn7wUfv7UoxEyBn
	ONCNn4bnUWxOS/JRoj+S8SCRGONEYn+S1/5gX5gvg4RRqg/v0oB0rOYZx/BqIBa5HgE+ccC5JITf1
	TuV4it9lAL2++jJvObhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1JF-00Awla-22;
	Wed, 03 Jan 2024 13:29:25 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1J9-00AwgO-27
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 13:29:22 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C86E53F848
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288546;
	bh=tqMfg95KIVjJvPKgbsWHmt5kfOhdG002h5X8NSsa4sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=AdKNqxLcAVo38kQeEn/g9lOTawZtBXsJ4Bia/xiSanZOxrBZwUqKJgPBujkDgUQ0n
	 GKXAcqjrtFB2MO85g8Hp7HT/zt3gswINWWP0fM/6X+6KZgW6z15bCHehZRMpb4Xx31
	 8frjEnopwE6tovnJAsGFKz3KvejO40qHnwVZpNWw7OcvuflIuevlIHjJSJzUlGeI7Y
	 g7LiarQrM3eRdlitx2GCLs3uYH6+P1T3UIEzcAzwJYy71/ENSc1VT1Ks0iImc4b0f1
	 G+IPinkahQ7CBxWfY6tSFwwH+8xlsi0JmmP+mUObfoEdE6lagnxMxAvertidD5uyDF
	 j2x3G2PoMsY2Q==
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50e7b2ac430so5522195e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 05:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288538; x=1704893338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqMfg95KIVjJvPKgbsWHmt5kfOhdG002h5X8NSsa4sI=;
        b=UY627rS+/7VGiAI69eSUZ/mTlGh3lzDrvLsSLmUOt0zRUPXrxs1PnckwutvP1dBmbv
         AbmcEBg0bhEi2B+bxxBxxxYV9+WFrFyC86rYJ1cC69PexI25aMyDJC0SmF20jOBaZppD
         A4iqIKh5CWjXqVYy7A+n6R3qzfz/Oxrb2u06hZMJjaZgjbQScs8RS1ucbnngYIxVw+Ba
         +5LcbGq2JN8r5M6VIdBKQeIHookxTXGgaphpfZHTsCwpSEIEChQJNDw/RQmkFf7SZyJA
         iP03weeHgF8fX9z26OtibnAPLO6ICkMheqliJ2mtKhPyXgl3/3Um8GsM3xO6/BNmKEOq
         5www==
X-Gm-Message-State: AOJu0YySxwJwz7ew58RCdTBmYMYKasOlzg2UWzdmHnyr6zmpUMZH6tc3
	3jFcSIGx252KhMC7wlN+B6EAssFk6jqAbNOTNUM2uxckWL9Gd+DcfIF0sQNPK/Cwva45+rLseuX
	+1sbvuXfzVnVA41fTxMJwvwGDPAUy3Z+r64sp3ced4V3y0L9c4a1T
X-Received: by 2002:a19:e043:0:b0:50c:327:9932 with SMTP id g3-20020a19e043000000b0050c03279932mr8930997lfj.107.1704288538752;
        Wed, 03 Jan 2024 05:28:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPDJwDzvHCtSOMtff3kEZeV9eDPzei74buh15/SGKE/XmdR3VcW5wZ0AwGHy5kvmTgi5YPQg==
X-Received: by 2002:a19:e043:0:b0:50c:327:9932 with SMTP id g3-20020a19e043000000b0050c03279932mr8930986lfj.107.1704288538441;
        Wed, 03 Jan 2024 05:28:58 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:28:57 -0800 (PST)
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
Subject: [PATCH v2 5/8] riscv: dts: thead: Adjust TH1520 GPIO labels
Date: Wed,  3 Jan 2024 14:28:42 +0100
Message-ID: <20240103132852.298964-6-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_052921_518755_61333838 
X-CRM114-Status: GOOD (  11.70  )
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
index 6c56318a8705..f1e8eaed487c 100644
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
index 5eb841ba5124..60225f122112 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -212,13 +212,13 @@ uart3: serial@ffe7f04000 {
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
@@ -231,13 +231,13 @@ portc: gpio-controller@0 {
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
@@ -256,13 +256,13 @@ padctrl1_apsys: pinctrl@ffe7f3c000 {
 			clocks = <&apb_clk>;
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
@@ -275,13 +275,13 @@ porta: gpio-controller@0 {
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
@@ -418,13 +418,13 @@ timer7: timer@ffffc3303c {
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
@@ -443,13 +443,13 @@ padctrl_aosys: pinctrl@fffff4a000 {
 			clocks = <&aonsys_clk>;
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
