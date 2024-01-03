Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761B7C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dg6E7eeGNC7BprRxj36PQquFn0kItJiQ7iebVBBTgak=; b=U1qe8O/KUWZrV3
	uNhvoOEbaQSJtMI2ICWVayGxUR9SlBpI+8Hf0VeVijbcoe/xnwy+tuMNi/TyNS2lZ/EEY4Sc61Oy+
	T+GJ2NBnc2NrLEn8UTGReaHXLgNfd37x0Y1VicAYuDFVw7fOs2xgmLzejqZDzO8txoRnnG/6Ux2EJ
	41L4kGmpSvb8dOuuwfN+pu99o5/Naka9xUqj01+YKvojdfleHDUCS6+vQ1WUiH9opKUafUZG2E1pu
	gHD01tBiA3y9/jwW5HG3DE/ee10kXdlbCNCELdutJXnz1i+Sse6n0k339nZRIgCq7Tj/gQ0QEB1Cm
	5i32tF9PkM++4ohYHSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1JH-00Awmj-0k;
	Wed, 03 Jan 2024 13:29:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1J9-00AwgL-27
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 13:29:24 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C0E1F3F7FD
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288541;
	bh=0q4qVCL28lgyouuyHQW1jAXVMv496RwqdrhrVphRrLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=QHrmUHeBG2Sg78Qn4o/oc/VNXoPeSkdXeFiRi9LgvipPrBGj46DqUIi3dNshkGH7D
	 HozWJZH5bV+8F57+7MPKFDivWF2YBzO53rhWXrNLJ4LqTwKDMb0wozBpwdipox+EJ5
	 GjZ3+avWuVm4xgmIQOxmwqCkfS6JGVC3x4wdxQ1eybx/0mqu6RTrW0GonepCsqnLtm
	 Cp+2D1V7by0FWRRrpZaiTE9BWKvHHVmmuz0MvMCStSaJCjNp/+EyoavBL5wQNJQ9FD
	 slXFxIbQuR9VfOHnFXe054JLOk5xGYi40g/Asj05QanKWXP3HCoy5AXmLI8eGvJmZD
	 36q+Bad4a+pzw==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2351094960so49377766b.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 05:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288537; x=1704893337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0q4qVCL28lgyouuyHQW1jAXVMv496RwqdrhrVphRrLU=;
        b=Kytz+mJJFONE/ISVwfHBCHkGC+vke61auNshWXzMkj4oAXshm0GLSz213148OjkZaf
         8JtXwsrX4fpOYeWfDSuywBIy9n77TK7m5XhUi7fqpIMHpLHjW4NfybIdxvsbWq83QLsB
         Mj+8ZKeDG8nSq+fd0mgVQeBKfJMoKoWvDZn1UYrBhCwqk6wFnDlP49bopQaGUCmky8AF
         5Nz2VR73SV6OuWp93yP0kHFPqikY/NRv0qfp3jITDWgJiFpaI6fn2y1DktEEiXaS9Lu2
         ukrzNUsB4D5UWOZ1z2/6KJtTaaxRAdWVzb6bt3maT5rdu20J1QZaa9mDgfB7ZZxm9Er/
         Eu9Q==
X-Gm-Message-State: AOJu0YyLzkEo89zlL9/xkqRAMaeQkAx0Ejp5ao8zKZtkouRLS/Bnyori
	oYOY4KMHEgFQvXGYbVVoXXJluSx4e4itDTj8ED86gM+6Rs/PAs85eQayEH/+sKYzwaRJzlLkU/6
	xfQPqybyRQc6PO0Ni/C+zkHDy9rvCMmRHlWQrlypoyeOUYewvuB8o
X-Received: by 2002:a17:906:3148:b0:a28:7191:b45c with SMTP id e8-20020a170906314800b00a287191b45cmr913102eje.37.1704288537604;
        Wed, 03 Jan 2024 05:28:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOKs0kME56k92k5vGgUD816ieBRpvwkjnTW39Klylw99PDVweylgaw2xEPfO2+zsSEHnmBmA==
X-Received: by 2002:a17:906:3148:b0:a28:7191:b45c with SMTP id e8-20020a170906314800b00a287191b45cmr913089eje.37.1704288537400;
        Wed, 03 Jan 2024 05:28:57 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:28:56 -0800 (PST)
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
Subject: [PATCH v2 4/8] riscv: dts: thead: Add TH1520 GPIO ranges
Date: Wed,  3 Jan 2024 14:28:41 +0100
Message-ID: <20240103132852.298964-5-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_052921_536394_287DAB84 
X-CRM114-Status: GOOD (  11.74  )
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
index e65a306ff575..5eb841ba5124 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -223,6 +223,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -240,7 +241,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -265,6 +267,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -282,7 +285,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -424,7 +428,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -448,7 +453,8 @@ portf: gpio-controller@0 {
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
