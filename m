Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70B9D18138
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FihhDynbzkOrxOtjoYuyvAJ/enbqSulEwcGJpN0jTWE=; b=JfC47FgKOd3yWA
	fCrZHo8rJQnKfJQWPrQH2D6TurpVUX7si3P7jr+6SQuYxW7G1xOCrdUcNEZ/1dpp0gGzdPk5n97jH
	c5iIbL+WwFkMoSQGABXorNNJUj9OA5MGT6+t7nAXu9FgXrQHt+LGJ1GwyaBAIOJPXz79VgCtgssPB
	PLhn08k1h49QZix3ArM7S3aCFUu1GQZStIMaUm63ooEq8GNFFciGxt5f3hHvfX3g/Sut8zesilLMZ
	C+4YUAj3jbvQA5w7acWTA4MGAqH4NO2iZ61aa0Y9lRlj7o//JuGWIVQEDQQiTt3ib8eMSvn1E6aFQ
	iCvOoa1CsqYqQcCs+kVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHR-000000066kl-2IQ4;
	Mon, 14 Oct 2024 17:54:53 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHJ-000000066dv-1d7M
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e67d12d04so895082b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928484; x=1729533284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxQK+n9uvqhf6yQ2qTxF/yuzmEwFlzvtchBbUqK4Amk=;
        b=avY95sesu4OyG3jEEYcR9AONC6XLWtAv7dD5WghiA3ZKPshU16Vmnd0Nksp9qXvA5s
         c9Yi6zXEQDYr3+2CfzOzWwbJyL5/omfE9xCYkHlG1dO/dehOd7Gk/sehxmoIXM1YMltS
         SD1KHlEoU52KYdj/PCXqvimgaLs0HMXFE/vNKntiQPORx7e/VgUZ9x8u3FysUAUSQElW
         azBniGdReqzMKHzt56ozezbAytpkaFS3WryBKGu3kmfr2FoogG0gYKnctTGYMIkxPi+b
         sOrUDbbvwoP2ZRf1fYn+PigxYCrntFIZw6IeAA3MbYFlLFhazX8syr/BQZfodYieAQQ2
         TauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928484; x=1729533284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxQK+n9uvqhf6yQ2qTxF/yuzmEwFlzvtchBbUqK4Amk=;
        b=olX635QNA2yNfD7cKW2CX7vPbJwzlYm9kT0IRBLg7ssif6su1Rfq25BTEZMUdU0bEm
         dvKidobsjWyCCnAJRhoBizw7KKruLneLjpv6z2gvDlvThNZjV6WSdH+mVGTDSvOz0QzD
         dW/LLYzwif4hZ0gx9xU2b7z8UyuKd7kv3piuSYhlBik2DiBN0Ghgr5JhG1I74BY5IiGC
         Ll9M7wWGgsCC3Ek3YBhW1hTC1jQYJemeNE9oRumlq8pcL1mXep+7grKJahB1KuLstCLv
         rF2EurxCc+lVic1T7q0O0NVU6daTY32RKEcOu6N1v9JZwG4XCrSzIqh5gtk+tkcPPOvU
         VOjg==
X-Gm-Message-State: AOJu0YwIz2k/QjhtcJdKysL6Q3tm4Zx+Ed3IsibknkGg5gdZ3DIcHdKn
	JxoGswW4T93A5nkDx7DNuH+VlNFUO7Ang+CeQ4018qux0wBT6PYTFZjgrQ6Sg/g=
X-Google-Smtp-Source: AGHT+IFZUMYy9vf9WX9eJFZ1DI5EcPS1iVJ1rtk3ygNh04bgPoR2FuxlgA7ZyP+WLjWOVGFidWnbzQ==
X-Received: by 2002:a05:6a00:2e11:b0:71e:4c34:e294 with SMTP id d2e1a72fcca58-71e4c34e41bmr13808172b3a.7.1728928483815;
        Mon, 14 Oct 2024 10:54:43 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:43 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 14 Oct 2024 10:54:24 -0700
Subject: [PATCH 7/8] riscv: dts: thead: Add missing GPIO clock-names
MIME-Version: 1.0
Message-Id: <20241014-th1520-pinctrl-dts-v1-7-268592ca786e@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20241014_105445_549349_67A94230 
X-CRM114-Status: UNSURE (   9.28  )
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

The gpio-dwapb looks for clock named "bus" so add clock-names property
for the gpio controller nodes.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[dfustini: add two more lines to the commit message]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 31725c3a13d7..cd835aea07d2 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -329,6 +329,7 @@ gpio@ffe7f34000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clk CLK_GPIO2>;
+			clock-names = "bus";
 
 			gpio2: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -349,6 +350,7 @@ gpio@ffe7f38000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clk CLK_GPIO3>;
+			clock-names = "bus";
 
 			gpio3: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -376,6 +378,7 @@ gpio@ffec005000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clk CLK_GPIO0>;
+			clock-names = "bus";
 
 			gpio0: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -396,6 +399,7 @@ gpio@ffec006000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clk CLK_GPIO1>;
+			clock-names = "bus";
 
 			gpio1: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
