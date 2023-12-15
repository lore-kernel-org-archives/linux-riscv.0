Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DD3C46CC5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbqC12bFJi2nRycKfjBLI9acyVam98XAuC3AKGtIM5g=; b=zVOEXh4kqmFVgD
	7OLuqgRn8DzJKfcVf1MKl20zsNso50n4jG2C7oxkZ8QhSPnARuoRytfEHFNC6kuAI0IU1w26q1gF3
	axnhkhW4fT6Lafl1hEdUO0OPd6405Gk6HO00C9dpjslYAdm/aWuJD5fftTlNZ8vTjHClNrOjF6VLU
	9TvZFDm0+LwwlGQ5OBZXAK+jvsnqeryFTMHA+P9L71HM/QSQJWL0DTBHsuHeqqb5mvIVxMGNnxEf2
	pY6sMXSS1izU3jpFMOx1ZWW8bmLwZmDL+i6fXVf0jb/43Wq9xmiifPdCeK7NuwZ9Pcnom/Vr6/ryO
	iN4TYYVFC/+eN1k9fABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LY-003aGk-2H;
	Fri, 15 Dec 2023 14:39:24 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LR-003aCc-2x
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 14:39:20 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C3BFF3F2CA
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651156;
	bh=zIhpWVKJJnmCyP1zy08oHrKsokOM6OlCzyTjReVqd1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=DnITNOLBnM4zNlO3vbwslNLpaQ05huDLxOxHEaQR+epSeIDnDCX0u463UfjC+3LPE
	 VcjZNDSOqHH/oLUZMr/pkiaHREYADO1acsXeIcRejMO0JhXEhm/8EgbFiasfIiugAl
	 VODp9kWrH0LuCQPiknq8Cupa9rPPkf3+hf597m6jxrvGTjlqXjIenqAvPZCTJYVkOa
	 MF/eOxA5wt2ZetwF+nF2cOBzoN0I7/IsVwTONjLo3GHwZXtHq6/qdn8QeopAw8nhtW
	 77wvczW1WgfUFDS4qB4c2mbOsPXoqh1wmzMHstwkhD/AyFNpPuYSPsQUDi7RxzCK+K
	 51feozP62IZIA==
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50becd7229aso587188e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 06:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651156; x=1703255956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIhpWVKJJnmCyP1zy08oHrKsokOM6OlCzyTjReVqd1E=;
        b=qZDAhkMtTCPOj50b2SRHQzajQkAiG6Qdf/jc63B/oWy+aG95eE0RX7b3AIP1Qr+EiR
         CRbLNd38rLeWVDJSVT5Aedtojp58Fl8NMZ57irq/yFyc/jsAE4YsdoUhjhLU8k+0Z9sR
         +D0/c1zRSuZStciiNMlgYkyC00grs4Mj+QQ4t1l7s8zJakcfdCUrwktGPv9Rs+dUMAmU
         Guy0AfPIDYNzWxcQ/TQEm1CDVFObqcJTw6mOHl83IJkuR+G8LpmVasSryuN3IuFYkuAo
         sKG8LDiSVY1MwzfbworJBuYExX7Qq09l3oljaoRjjxm9akUWnDBgzpQe5YjX+nIINCqr
         /Cbg==
X-Gm-Message-State: AOJu0Yw2rJZ/4NhvGZ4b48krWTyFtjY6SFmFq+ZivD+MkMgw8se1hMMz
	x/BsEfHd0X4AE/Dc2xXyzeKwNTOeWEdYSBnLwE/Dy7x1cxoy4bLksvS40ppct8/hKyTRE+DFJpF
	jJux63mQ+IxMlYIMt9spRj423aMYLV2vUIH4knYQJ5Ckg5A==
X-Received: by 2002:ac2:562c:0:b0:508:11c3:c8ca with SMTP id b12-20020ac2562c000000b0050811c3c8camr5154674lff.7.1702651156260;
        Fri, 15 Dec 2023 06:39:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Vuhei34AU13Jnm38bp/hQV39eU5/IVQg8JqEo+wN89ajcH21veCiM3jRU6Sxf9xyyOAt1Q==
X-Received: by 2002:ac2:562c:0:b0:508:11c3:c8ca with SMTP id b12-20020ac2562c000000b0050811c3c8camr5154659lff.7.1702651155941;
        Fri, 15 Dec 2023 06:39:15 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:15 -0800 (PST)
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
Subject: [PATCH v1 5/8] riscv: dts: thead: Add TH1520 GPIO ranges
Date: Fri, 15 Dec 2023 15:39:03 +0100
Message-Id: <20231215143906.3651122-6-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_063918_094976_72781E99 
X-CRM114-Status: GOOD (  11.57  )
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

Add gpio-ranges properties to the TH1520 device tree, so user space can
change basic pinconf settings for GPIOs and are not allowed to use pads
already used by other functions.

Adjust number of GPIOs available for the different controllers.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 397d5c71bd3d..d5e2378a1afa 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -217,6 +217,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -234,7 +235,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -258,6 +260,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -275,7 +278,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -416,7 +420,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -439,7 +444,8 @@ portf: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl_aosys 0 25 22>, <&padctrl_aosys 22 7 1>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
