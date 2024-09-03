Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FA4CD342C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 04:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfYC4IPyroRwxLhgCYQcmjjrGsQ8m854Xnn1H9Bc/30=; b=Gw2jN/S1lE3qxG
	/EZod1m6tVnYg56qeWN83ubvKQjBFTymI6yEpo2h05yOmwPolWwvdbqvdAcslt/RagsLSmuJTLXfl
	vB99YifbgRotxdqOzhz8j2WlLrPKeuawgbs4xwN0d9y9ooM7ogQWr9nF516YKWXoTh+PCy0cJKwri
	TN8XtS8ZbMJ8C4/grw89hO7G8NajldzibzhuAMLQ62Beggfh+eZK9XuO28pOY5ozG46x1/yjsuzjj
	poyC4P8i/yXQsRj6keKKBKBKa5eGwcaToxh9bVgorWNeHypg+EFEhhTUn/snXKA08clqV1boolJ9o
	YFSMrzMJYVl0q2LMh2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqj-0000000GFjU-0nlm;
	Tue, 03 Sep 2024 04:09:01 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqf-0000000GFga-0gMj
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 04:08:58 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-277ef9a4d11so928303fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 21:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336536; x=1725941336; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZ4BL5w+jZbnBcrACJr3d5UErDD67jcver4i8Xfl9kU=;
        b=iJsEKwHOBDfQ75VWo7ZGaAkV2UW8wRRkk5TmTuoMIrPFAT/oINQSCwdU0977Dt8GE+
         4IhtT7J+8wn3Luo1cGzq7ihKTZsnms+2x3WhNjx/2R68adKlkbrrmnHwwS7Oq2hm8Kob
         6P5Jz2sYjxONDHOSjTBDFjLtEY5A9GYDCTa4gon02DrT/vMyszeipVVCBu1QsJSQIlXr
         SoE2JDRY96QL3SLW8gnNzRJ0zVvouWJMy1fHLDS3uS96s9BGXTC/hA17HF0pZ+ZGUUOY
         xs8zPEyJqabUtgD3ioMdg2oWnoMn5m9KmI2y9o/47PaAjkvN6/isiMCC2A1rRPrCK8JI
         HazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336536; x=1725941336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZ4BL5w+jZbnBcrACJr3d5UErDD67jcver4i8Xfl9kU=;
        b=PB1uQvsPXcsm6ThzkVpa1x0GAx90Ac9Vha2Gn/i/GwlAvyMOnPO4eL5lLl8OTVK8Kv
         fLlX86dnsrFHpuWPBAWG0Umy7D/m0/9FL7qyoiPoFaReSEoB4+oSx25ss87fmfj3zueZ
         3Q6jWh4KTTzwtLaFzIhLJQS6xfrl8HpkBO5Zea6Yq/D6KMGZaFwd/6YglxztRjl8SJYC
         hXCCntuWltth56Z2MjAsH/Q2ebDaaMzp/kLSgIyfIbQqZEPG43bxK5YRyfMMsZohlHLy
         XZw1z1J8p1DUKVoRD7f+11uEchn5HUBzlT6ZSZpxykgAfsX+iqvdwoqCTZMIrhjHUeon
         +Oow==
X-Gm-Message-State: AOJu0Yy7nCDNEE92/G3vNVwaiN8QaEigHLIwLu/McM1QVZi5tCRb5MW5
	OvY2JS+Tl525NAiygbjWsxZ0ilpqFR4fq6c8Sm1f4TB98ikyshxLuqU7R6uP9Ak=
X-Google-Smtp-Source: AGHT+IF4pX9A1K6vCNuazJY8FE8Q32M3mUa+nGa1uX74lj9BVRLLaU+asl6F6Kfv3PXZHMCKYZWoVQ==
X-Received: by 2002:a05:6871:1c2:b0:270:1850:f898 with SMTP id 586e51a60fabf-2781a7aa5c2mr1087930fac.12.1725336535908;
        Mon, 02 Sep 2024 21:08:55 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:55 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:06:57 -0700
Subject: [PATCH 4/8] riscv: dts: thead: Add TH1520 GPIO ranges
MIME-Version: 1.0
Message-Id: <20240902-th1520-pinctrl-v1-4-639bf83ef50a@tenstorrent.com>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20240902_210857_302731_BE2EB0CB 
X-CRM114-Status: GOOD (  10.21  )
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

Add gpio-ranges properties to the TH1520 device tree, so user space can
change basic pinconf settings for GPIOs and are not allowed to use pads
already used by other functions.

Adjust number of GPIOs available for the different controllers.

Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 834dcd1fe7d8..9889b557c494 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -338,6 +338,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -355,7 +356,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -380,6 +382,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -397,7 +400,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -539,7 +543,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -563,7 +568,8 @@ portf: gpio-controller@0 {
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
