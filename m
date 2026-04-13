Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E164EBFD17
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YRzH1De1qUNF52gyp7qu1/diOIF5X7eexibNMjWvrg=; b=3p0fPSyEmVXR3Z
	xWddSOTNydOj/5fUFpVtoNg4QjAe4HzbQmP4nTMVaPLc4A9519O8i9kqK5KoCB12AODy8SN1YduJP
	XKqYJcD3QWFjdKPYnBGDhMFaEiEeBOMUGgWXfCLREIgE/C8DeKhNC2/GsCztaqPWmpsOR2+uErTK2
	MQsP4m0SVxWCP8zJ2nw1n6eANmUhSSzX1wJCvs7WQGOnpiLzPZf+onZ8ejfJWr4/7/UR0AQsQxkHZ
	tAZNqDi7YkBR7decOA84jVWw8yPECDNBF68SR8Ieds7Tsx8QRPfcnKJWNQmKTowSZbcC1nX4UcvXb
	zwNtGSmj1kMZ58it7WmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCG0-0000000FDIZ-0yWf;
	Mon, 13 Apr 2026 08:02:56 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFx-0000000FDFU-28fw
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:02:54 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2532399f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067371; x=1776672171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=Ez6KC07AjFkvyBzX4+ZYfbMzSau8cQrKyX9TZyvoaueimK7XEervksZ2VmObeCe6Ww
         P4BuS60wOACD4lN33i8xD8uj1SXBiOZFdjriO4VUcTc1Xrs/zop8j/AnIu1+lkLJKBtI
         uMTYaj8SIystOt62WXC1wBt9tl/392NdjH0o+crh8j8LI06FRlo89Xo5U1t6Bd+cA3l5
         +GH+ZGNG/xpfdhUlVUFXLwDbceXXAqnJYptGe5AbRa6g3WCVQpSwBY3HkXUO/tuBxwOu
         Ag/4I/trFJBlOiu/svk/hQgJN4KPdeI2mVZ13sPjDX3jVQ35XxUjMK3aYj/fnxIb5kKk
         8ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067371; x=1776672171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=39t86zaG16kXe9hLAHIjg+gQj/3rkIeOmwWRfItDZnQ=;
        b=jgULPCRFKyG2znaqoBxRDNQ4utAdrnIONR1PYydo3LgJuUMWWwc/Y5WWP5MjUTJMPi
         99WZMTQJ6+Nfd0Sp/el8SjZ/fKJT3J54rtUdL5fmrhZo5VlWPiRyU4+PM1hmYUqlImjI
         wb6qUEd8QQaI65g1lBzGFrz8KYGYlD6rbN1WdINe03eiPoXdqOIZLX4MnE76nIhR7Rcw
         PYM6VKk7i8s94Zt2Yr+nwRT/iRC3aBaJaTvfwvvZl8M8jZnUztm9AvHmqlxzEdidmWK1
         KbE5t74XjjRhNF90ulF9RRwWwhhn7e9EteQHJPRNZpsEQ2gCK7q4l1oDfREaVsEmLbXf
         lrfg==
X-Forwarded-Encrypted: i=1; AFNElJ9J3w4u59//9z1BQML9oWp7aqLD31gyRV4pKuFR+3rtPEVzYDHpyJB2OfYjncWiAxEicT424UAmnVJsQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR7gLiXZRJRgpO6BdsRnZJZPEqC6Fd5LfeONjO3sROxsxkHenh
	5QT5IojC/81qaKNAFFRNx+w4XobI15ImLpBPX+nVW6MychvLNdOfebTb
X-Gm-Gg: AeBDietgv6/wbaF218tdf7d28pTYp5sInhtD3hfE0iOLYPeonR5TA2v7efsQU8HA64v
	7UDgadlLyS9usnIoxpJFwIjIRlQ5rBlYUR3nD+I77+Kmu6626acbNb2A/TfOvtEkELogpXe8MUM
	oIYss2o8A3qqsU6kCayerY5kOsFdSQwuYUfW14MGiuRDzvkydadjbDROm/oEpdXatx6Zg9UiLvS
	oXnIIkAJz6HzVUd2ELkiMtHM2DZxu3BcJ902vlY2M1yjccOhu6eFggNjX/sTaWGtCSQ+6IGpPe5
	ByMMce9c3jVDkICVhMIRG4zBdKSlBp4Ln329bnUvICqxuVkW5zGl9u2YdCT5nXdPFAQPz9m/aYf
	a+dmy51HBLI13fK0wOmmOuwZSzN/n2qixR4puO9UqMAv2Nz/Xxn5qQzOJWtvjTi5JN/y6zCsfbi
	pAxwblT/MY1mTSQWDQuwHH1zd+ogkZDglkFHV5O+9IKenUzyIHPJC09ECPEUw3XHO1
X-Received: by 2002:a5d:5849:0:b0:43b:45a0:9df8 with SMTP id ffacd0b85a97d-43d642be552mr17751732f8f.35.1776067370293;
        Mon, 13 Apr 2026 01:02:50 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:49 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:17 +0200
Subject: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_010253_573027_42BE1DAA 
X-CRM114-Status: UNSURE (   9.58  )
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

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..a7d88564630f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -220,7 +220,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -241,7 +241,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -367,3 +367,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	broken-cd;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
