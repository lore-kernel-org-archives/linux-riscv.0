Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E05EDB7CA
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vfK+vIkiGu7yWYUtiKvA0VhPV6/CuMDh0tNyX1UmI8=; b=jSKClVk7uKMmfd
	qdzYD4J8emkW2+S9uZ1JheF08ltWGXsjb8tJLTsJ0nCPKAejAa6lbBnVOr5OUl3jJVaW93x6uFKq1
	GfxZUgaVCJ2qlUKz/rQU0NCARjSkujTvQSGStoXrOToGsX2gZUsBWsZ8Uzlp++xfIO1PRB3KTpq5o
	cmXVsN35IeTlb9mKdQBE1xj5A9SZ7oRkDAVbjCoFx7AimfAMhdQRFcgFQ907FXyCX/zKmO/3qeJji
	vg/9tTbRcmyXeF+1sS/Re6dUiE+aqCRaecCopcr90DT5tu9xRxk7ZgCFdCiU2QtOWjSerxFgJGRH3
	OjFNcENSutONUn+NeuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lJ-000000068l3-45xn;
	Tue, 07 Apr 2026 08:26:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lI-000000068jD-1BnU
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d02a71526so2720049f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550375; x=1776155175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+BJYlYfkNO3bzgJIrrKwScy12NnJdvPgI8y4TWtzcM=;
        b=Ofx57cqKF9tUJcUqnkkWDag9CDiYyknmDDrgGr4+GlrqIyO+oI8ASlLO8ttvn/ZrjD
         vpO2RJ0VMX93Jiz/vexJYY19hyykCC6mwR7K/xN/H+ZBlU1UHm/KutDMW9FZ/Jvjw4qf
         m7JxnK0lSxJm7c3Abe3Xfh8Xk6DSbBWmrTZvVVwb+7DXHOfLjSXKiIuUWgXS7s/V27JO
         O1gQh7DuzHTbujpBNT45YyS4lnianHLDQYCmNYKPL1BmR7399LBnqVRgHbbak0UOgfeK
         KYM6npzK/4cgiGfjoglflUVKrPcKzMgZMwhZTvR6gtYjKQHhOcOAHuTqk5VV8HtW/bJB
         /Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550375; x=1776155175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W+BJYlYfkNO3bzgJIrrKwScy12NnJdvPgI8y4TWtzcM=;
        b=aXDQTQqKpgfx6h1P4hgqjXXpihscQgIvrChKMHS7BjahEzYPp1VJqylxICeJz09MPr
         bcdv2LFXTinRs3ewH+YtkPZzTth/+13ipYaQzUWyRZWSLjJrhabuYBIQ5B3OrEYv72EI
         7P6UEFeAUgA2wWDo4QEc8dewQYAPh2WCnx0KaobX3TJozJY8MXy9t/L9PrYifmTvxkV3
         gaEip3blIY68Q0slm9a/M9BOH5Dg7evlEtdbJtwA/47YMEjAg/8x9c9iqxEOn8uVw9KR
         zUAN7mO33xGUL/F38Ewxoa8HqMpuOLaZftvHWFflft7Zh0qGs7N91O3lakUl4xiIVJ8Z
         y1DQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4R9TL9xrXOMYDsBkcNeF0v7th52g5CxkNKZPW4NvFbhzou724jT6wXoXStq3R7DrFGA0flC2ochfiEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYSXhKUyJdAjcAxhmXF3SiXeusVdCxfrrUiBYJwQX+cCmwza2D
	k2yQYAVY1zex/YINT6+6Xf1M99DfhIGEO7Pbb6+77/vHbNVBi5MatftU
X-Gm-Gg: AeBDietntXhHKZWsNE0x5Q+lM3rZeLuJ55PBeNVuSZ+ZI7GsZ/KZEwyfko+IT7Obfdz
	mk9UqGAO2NCS/jMIKLuBS1ZHsDCDgg8V1gQYC8cEWNq5Qr3Pkb3jISEBUFvFJYO3KIYqAlyxZNa
	DzcuF/ENIWyuzN94Lj/cNhDAjJ8odMpAjR5DQA9aKbhJHdu65U5FVWZP+jLq0tcuO0yIXY75clJ
	Ul2mHg8XHfepcNPice2YlMFB7mzTwAmeXuiRVjFr+FDWmTQiek/y9JDq+gA3HZR6W7Z7FI8TLFH
	lafOU3WqiaQY5bOEYE9l+0JeXIDYoW2NctnwkVznFvqHLkQ1cLqYVkCjBj5WVySkDvfHbLZeVXR
	Jo+C3Qmjsf2Hnt1eZI5hXtG+pcN2Og6N7ahYnO4XUFslZ2PMjh5gg6g33p/+ZYsZmMddOLR8K/w
	K2QO/aArZpAkDcanpcHu3wQ5/QRJpcOCsKn8ub/JS3vcgJt936I/yqgX/dr4k/Tto6
X-Received: by 2002:a05:6000:1883:b0:439:f605:afde with SMTP id ffacd0b85a97d-43d29314e93mr22324658f8f.51.1775550374535;
        Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:28 +0200
Subject: [PATCH v6 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260407-orangepi-sd-card-uhs-v6-8-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_012616_348156_34A78FF4 
X-CRM114-Status: UNSURE (   9.76  )
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
index 5790d927b93db350c8f53aa0f314183b3173fd76..a7d88564630f3332270ba5fe47b078bb14f564e5 100644
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
