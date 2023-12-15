Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490CAC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+mpj9CqFB1Uhi6+vClIchz5KOkwNeH/ZVxuxbz/Kdw=; b=UipKTOMgetsaI8
	TwqEO50kgzVuOPEMpDFLEy2dMHVsplSvxtjRuhx97RxZdvEMsRwIEfjGPBrxGxSxuWkYJGyLOn53Z
	qEG7ehlxMjLTzjT2ajhgfdxyKfZC5wA7Tsm9G2Rm+2pSONbL/OLg+PkDY9DwxeFJ4/uJitaAqgN00
	waXxmh6Bsqal5TXnOHU+mZphS4gcrz+05e3hfu8WYA9G/7Acr7lq6/S2+8M1+JPWOuCUthaOXruZ6
	V1ZkpWOufJrCoJMa4Exz/4lsr18Wvt+27w910JnGz7VJhqNKVnjUqanxWZSMfMv4Cwj32nRqHxPGv
	i1Qhh7s2WOJjasNMinmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9Lb-003aHv-05;
	Fri, 15 Dec 2023 14:39:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LU-003aEL-1J
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 14:39:21 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4500C3F741
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651159;
	bh=KeS7bAuIUzMlkgCBNZb8n3wxD/29BdX0GI6KJUISBPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=DLmBUzEX56c4nbV41rCjeOg9seAuRSulSXrZVTuAhhu4/opVy8UX4F112GJ4X3BcH
	 nd++gmjjKhQL0+i3eAmu+ipWNfnL5hRnWrWjSLmdMHa2jbc3Pzx2Z3QphWtO4InsaQ
	 0VSL0LRowDFbx/FNSQ09wHUCFU2bJQm5YClovdkwIni22i5bcpgh6o2UDIINk0SQUK
	 T3PJsMdxoF8Ipm+BLjKcUTHofAfncwBmZeSLW70TfQiDbJ1wPf8K5WKgDRGk7KCCmZ
	 i41ST37NR/3vEmyKMYsqe+olqTyAgSYVqk8Qh0wrDv5MnTzhm0z4H9g8xU3NDWfJf8
	 Z+V/50rl0tTqQ==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a1d72320a33so42976566b.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 06:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651158; x=1703255958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeS7bAuIUzMlkgCBNZb8n3wxD/29BdX0GI6KJUISBPU=;
        b=idhLJKZMoUqSztKEVJIPq9MUu95TUhHQJtpHI0s7/M47/IN8Ilk3dfczUWb2FLTTFJ
         gNkg9yVG6mYyduGgAnT9/Fp1YTKeoEpiJTd0WRcwa5+1qjSVe6o/53Kt6t25jdtNLWKV
         8ouTir5DE4DXbt2LNlYYAg03kUkhDH9EXnDw7y91ucbmlhb4H8+1P/veilf3Xdz2RTGT
         lJXNBF6geMdbkBBscljrWk8l798iGxa5MIzkY+F63P2IgyUNqnt5L1Q47OWnTwle2lwz
         9doAyQyT/xU88MtcSslxw3mcuUn7ddjPAZQnZr7j9LQUMWsDGmVP/s7Sup7wPrFbFpQd
         /08A==
X-Gm-Message-State: AOJu0Yw8oDiEahpghItduLg8w6EqvSStGs4FZxYlnaXNqEQJ2EHUr+Yq
	EN/T3zdCLpRqBnGM+yJGqWAcNkMnhHS5k6E1xbfOXxefqciUmv7NIb4Er3gO5Jb0CTcwZZh4sit
	KGUIKw16RynBAM2Q9vTBbbv8hc7r5I8/ReW+nDn6esA9jlw==
X-Received: by 2002:a17:907:9815:b0:a1e:5ea5:c5db with SMTP id ji21-20020a170907981500b00a1e5ea5c5dbmr7355308ejc.83.1702651158519;
        Fri, 15 Dec 2023 06:39:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYp9pwfbZkq5mfgtJhASrZeR58D28PvdjDO0/bhC5ViEz08OWOBS4jzY7w2oHtlQRgSLS9Lw==
X-Received: by 2002:a17:907:9815:b0:a1e:5ea5:c5db with SMTP id ji21-20020a170907981500b00a1e5ea5c5dbmr7355304ejc.83.1702651158328;
        Fri, 15 Dec 2023 06:39:18 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:17 -0800 (PST)
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
Subject: [PATCH v1 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for UART0
Date: Fri, 15 Dec 2023 15:39:05 +0100
Message-Id: <20231215143906.3651122-8-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_063920_625731_D759A100 
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

Add pinctrl settings for UART0 used as the default debug console on
both the Lichee Pi 4A and BeagleV Ahead boards.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 26 +++++++++++++++++++
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 26 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 91ba96588ae8..54d86aab6656 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -58,6 +58,32 @@ &dmac0 {
 	status = "okay";
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "0";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "0";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 0ae2c20d5641..260aa5e0769f 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -29,6 +29,32 @@ chosen {
 	};
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "0";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "0";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
