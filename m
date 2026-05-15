Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64181CD4F3D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSDs0d0PeIdeuJ3iXEfrN2o12oGTwBxYMKxZ/Hv600Q=; b=wyfnLYdrRIKWmC
	lJQub2k5EHZt38MTvbD2q6uLCjdKVX8jSLgZ4M5czlVY3utAnwsmxn1GHnX2J4gCOcscIxMYvuvz0
	CZi5C+5htnUaS3uGQcu50wFzFT0UZmkQNgpCzpxEfMuE7P5Ck4Ok0B40nbvHkgr6lERkTSlQTtPuh
	W/EeQzzv7pKruMS98UXRUZoSH+WWxratQbZq2tMnGgulq7VMau739SrKJgZEtN/YrZ2DJupSq3Mmr
	8k6OC/YtmSfNv0S8i52Zx2a/Wf9IHu1ZoBbCgNUxIHR/dUgbyNuE2lTxgM//Uqj5J5SCvPRDT4JwS
	FDBfzMZlPW1TfNgdhx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6h-000000085mt-1nrV;
	Fri, 15 May 2026 10:49:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6f-000000085m2-2bKX
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 10:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cdO1zzlLKkykrIptdTOfySnlGfDlrWt09hUBxB4Iamw=; b=O7azNylDI8cvafjlwq19XIPcti
	B1DaCq5gDRKdNSGeWaCPf91B3dOJi2s/Y1Vq5+JuC5liSgyu0C66pscXoxwi+0iHCxhvrbxG2oJW5
	B/n3W3ZJXzunH4oG1eGaze/fffkw5fyvE8jnGbBZq6aOMONtpYuxPJLrOfqjLavJTOhj73Zms0PJL
	tAQpTy6VxW7k1eV4COTRa6iVvSatL3hRh4oreXw57bLZMM5GaKNPB6WeYgOGf+Dgy6WUWpeE6rKHp
	zRk2JIIurrhhjZTL3nkYxV4xp1j8llsyCVyKRonaeKwl6m9iT5/cf4egRFWSzPelK8K+NXhfM0kU5
	YpVWg5vA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6b-00000004wnh-0BuD
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:49:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45ae6a0e523so2761342f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842160; x=1779446960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdO1zzlLKkykrIptdTOfySnlGfDlrWt09hUBxB4Iamw=;
        b=q/MEBhR45p8Ac29g5c9M58mSGPwBTAHERTToalXzRh6XsSckcI0daR8zKgFgZb1cgj
         yV4UQT/YTAIoFIWflRiRLxiG1e8kzv6jiZVV6UuqaIvwkl7IsjUU0xHaq8WEbzHIBmam
         ffItTVrZi0Mf4guyA1Gul52AzqEYN//G0ZgaeQw6tmqW8ZDu1iVAm7i+ruwIpWQeeTrT
         GgiLl3GlXkPqGcXkoOUEWBdoAvsOCfFKAnfc6u0Z9DPYi2Y+P+yKroUn3eKpjx5xfu89
         1xyL2V7cqpfZ1POrmdeE3RrWxymDItUqZlUdQktZbx2EuxSd137HVfGC8YOq3zMXHyfV
         PF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842160; x=1779446960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdO1zzlLKkykrIptdTOfySnlGfDlrWt09hUBxB4Iamw=;
        b=YM47ORdpBFdJyQKQO4jJMWYYqTAxYqWcj7WDsoEuiGnFHWI0JzKoW69c2xlF16rFMQ
         IIqw2PJAMMH3DytBAQ1rKbgMLHmeOSSaK49YAgT4ByGtEnXg8TjlovelLXhe91Yqda6w
         BhIu5y8JiU4IUpv/YcnzQmw3BCq0KM2AUGYndpApRnfKJjcQJB/66XIVQ5+DFiRUjKCz
         k05sB2gwhG04EF8bPDoAyGj7IuJKZk8InsW8Juz/14Gm7VtJNmp7kSRR7YTFYjOSYp6G
         hV5MB4OV2CebyOvElYFLeu5GTzESO3iOx6GKqGDFZBZznzFxyjQFvvnLtsOwZFgD7n8W
         1Puw==
X-Forwarded-Encrypted: i=1; AFNElJ+l7Y0f8ECLz6jrw69yXXEZFlX73NLoeGpqPrb3KZffgXdz+E2xGimP/cI+xPO6ALCL3qHOEpG4rpbWIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2KPpX2m6aNpSITZqDowUzSl49tsFyBUjUlEOl/6evOZnGqR0i
	43OQeYHVBDGIVkkF7S/1FsCvISg9WteOIN6l1liHGtNouO7kO90Jpz7b
X-Gm-Gg: Acq92OFK3+HB0j9o/zUa9625860tsg33zPq8VowvbfJt28uAi97xvKQUEP296Xd04bc
	IZR78vvXWXu0RjFbLbss9PM2ZmT3nNyj48rdfg85z1gBRjTSZVlNgUPrz3RJSmhs1jMnJBEvIH1
	nEyah2dduDSigFhCrHZO9Kc0kaHhh5Bc1G5RhGIVxPZfIbIaue8HrXcmhEiBVNAcBY0c+sYeEXB
	WejjpH0pVn6eV7dubhQPErqTfY6gGlwV+IXDp9jH+O1iCnMQ8VVlT1mLcCigmo6iiuBbuZQ1FTD
	N8b8uGjkbuXhNOWwQ/a790pXFEoR1GnbsdSwp90S74TnLLjmIKovql+IdpUrhhtlZO8R6AQTpMm
	EBOg2lixj2dPugOX4048V0y5AReKw9N3+KTGDE1crr4sGeK6udr1sHbK8a540CcxEZC1pSsll1p
	zaWh2bltaSx4cknO+V+f6tmo1iIg11o/883jaoeTys+ULTT9pONgC2qYRkO+3QJ81sCQ==
X-Received: by 2002:a5d:5d10:0:b0:44e:1984:5f3e with SMTP id ffacd0b85a97d-45e5c5951f9mr4409926f8f.31.1778842159282;
        Fri, 15 May 2026 03:49:19 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:18 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:49:01 +0200
Subject: [PATCH v10 3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260515-orangepi-sd-card-uhs-v10-3-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_114921_571622_FEE4489A 
X-CRM114-Status: UNSURE (   9.83  )
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
Cc: devicetree@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with GPIO_ACTIVE_LOW and internal pull-up
  support
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index e20daa50a152..72f77e9edd63 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -17,6 +17,8 @@ aliases {
 		spi3 = &spi3;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -221,7 +223,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -242,7 +244,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -374,3 +376,21 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
