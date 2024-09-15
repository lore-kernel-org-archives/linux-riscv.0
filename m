Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3656C3ABA0
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EM9m6N3aQyRNH2yaqWNqbNkdeDomRnzncPlyOajq5Lc=; b=0byEWNLBeRjT4T
	KMp/wtSy7nxCNAw0bpSDtvdjpojgye6S5JjHagEjLXvF+nnzx8fItxksd7k7Kqbh8K67R5AB7NmOy
	qXeYaoruOaRbRGQxDQm0WncOY1ol+OdHOsIdrVeK9+UQnG8z/j6T8xzcUUUFSzcc2tw/RVAm4RJnt
	YTDBL2FyLaKIF0BxdSPvP9R89/wwPYAFabLz/Q3eUTjerI0Sw/Ck5AM0ONzBtDfhnRsqjjtNWWafl
	6YZVo2wX9fX2yz/w0bbvFJhk/KoZJIyotXscd1dABqQWSHxQsE17F6hRjnMwNWJ6XjaxU7FifwNr+
	xzCpVX5lFeaQsaIA8/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spqVi-00000002EuD-0C3X;
	Sun, 15 Sep 2024 14:45:58 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spqVe-00000002Eti-1jGM
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 14:45:56 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6c358b72615so34387386d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Sep 2024 07:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726411553; x=1727016353; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:reply-to:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaNRwlrs/nOlui6L6+29frsiLzSV0vI5EdNksEn8QUY=;
        b=JGqrI+OS3LnobYQgeRh3jScXTkg4J92Vk+OoPKmxYU3WpMJ6zdZdjBsobg7eWbesFP
         eXKAon+bXU4jYvTj0FXxZJ8D2LraWaxPppyf8muEkTNyjoLPe74IxbBzkJrMAJuPCVvA
         bej5IJsYafD2IZrlre+JnWCGxk9FPQIW3RHUaHaT1DEvGPuEP4hbUT0oJYqTQUOSb4Se
         +Vnf+tkUFaORMShXpdacpbdFOFK3Xf2Fz4ZT4YbLU3s4u1V7zrnlSI7y+Gn/otA5KIRJ
         uCCegxR/JUu0lNob6vgBH4X+9wnWPJKgL8pQ+RReOdbVTyNNdGZt1sie3iGMnrtrP3sm
         PcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726411553; x=1727016353;
        h=content-transfer-encoding:subject:from:reply-to:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TaNRwlrs/nOlui6L6+29frsiLzSV0vI5EdNksEn8QUY=;
        b=MLB3GimPs48cwhhY7AnUpDddg9p+LthbeIHgx9dFRIZk9K+FpIY+rCmDUg+m2ya8fr
         9T42kIohv8sIf79+3zNbAqGSpHjGTxI2B5f5moaTHvbtghIeiBtWViIXGVVWYmorDtsL
         22rd5XFfgBzZXszk3bEiENP3fcgAeJLO2VTSwVmbcon3dd/dHxLmY/kxZF1/0k6C6oDf
         1aioq8KKGJvFHENQcCpOhfAHCIqJEcRhoNkHuvREeKj7mdx5rh3xUgKCSFa/8DZ3aynw
         Hmp12kIzc32nrTzBgs/N1iSJ5xa0n9zj9c/FQBaNp/86AgcKvWX4ePm4jkiUxpZg0smX
         O1hA==
X-Forwarded-Encrypted: i=1; AJvYcCWn+mZWIwLxLZMtVoJAWaCeYXkTFolnKu9l6bueiYHpSeELKQOEw2OBX+ft3bEiiahPWFIlHsQBvEZrhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXvFklEAnmriN+idXoqiVO4gYmk9Z1K6UYD5aPz9ie0BABdhhj
	a4gFUcqVup7mnspzsTvKNVmfCedBh/50rMBnt0NqaPHpaOIDKYjX
X-Google-Smtp-Source: AGHT+IF0Ccu/apzaKszAgwuDU09i5bpQP/2PO0Ybjid8wUTXxRNJ0MJtie4khQMTSISV2Fa8X/CfoA==
X-Received: by 2002:a05:6214:468a:b0:6c3:5db2:d999 with SMTP id 6a1803df08f44-6c573556d57mr178765296d6.9.1726411552883;
        Sun, 15 Sep 2024 07:45:52 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c626346sm16073526d6.29.2024.09.15.07.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2024 07:45:52 -0700 (PDT)
Message-ID: <7ede7ca6-f8db-4b38-a1cc-8be3d0db7fae@gmail.com>
Date: Sun, 15 Sep 2024 10:45:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Yixun Lan <dlan@gentoo.org>
From: Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v4 3/3] riscv: dts: spacemit: add pinctrl property to uart0 in
 BPI-F3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_074554_495577_09BB81A5 
X-CRM114-Status: GOOD (  14.24  )
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
Reply-To: 20240903-02-k1-pinctrl-v4-3-d76c00a33b2b@gentoo.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yixun Lan <dlan@gentoo.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Palmer Dabbelt <palmer@dabbelt.com>, Meng Zhang <kevin.z.m@hotmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Before pinctrl driver implemented, the uart0 controller reply on
bootloader for setting correct pin mux and configurations.

Now, let's add pinctrl property to uart0 of Bananapi-F3 board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  3 +++
  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
  arch/riscv/boot/dts/spacemit/k1.dtsi            |  5 +++++
  3 files changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts 
b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 023274189b492..bc88d4de25a62 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -4,6 +4,7 @@
   */

  #include "k1.dtsi"
+#include "k1-pinctrl.dtsi"

  / {
  	model = "Banana Pi BPI-F3";
@@ -15,5 +16,7 @@ chosen {
  };

  &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
  	status = "okay";
  };
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi 
b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
new file mode 100644
index 0000000000000..a8eac5517f857
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K1_PADCONF(pin, func) (((pin) << 16) | (func))

It would be nice to have a pinfunc header like
arch/arm/boot/dts/nxp/imx/imx7ulp-pinfunc.h.
It would reference and encode the data of "3.2 Pin Multiplex" in
https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned 
, the document you attached in the summary.

Otherwise,
Acked-by: Jesse Taube <Mr.Bossman075@gmail.com>

+
+&pinctrl {
+	uart0_2_cfg: uart0-2-cfg {
+		uart0-2-pins {
+			pinmux = <K1_PADCONF(68, 2)>,
+				 <K1_PADCONF(69, 2)>;
+
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi 
b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 0777bf9e01183..a2d5f7d4a942a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -416,6 +416,11 @@ uart9: serial@d4017800 {
  			status = "disabled";
  		};

+		pinctrl: pinctrl@d401e000 {
+			compatible = "spacemit,k1-pinctrl";
+			reg = <0x0 0xd401e000 0x0 0x400>;
+		};
+
  		plic: interrupt-controller@e0000000 {
  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
  			reg = <0x0 0xe0000000 0x0 0x4000000>;

-- 
2.45.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
