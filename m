Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C27F3D61E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKqtAi19DDdZBLvytxtlIE3lsEUHdA/aOBhQ+jSqI9I=; b=ZSdY2UxHLFNMW1
	rtPpA9uR5jY/DtJy1xziIyQQkoN6kB0pWskHoHlFQI5oaoIAoLq/NYrOMUFsgDkRWBTLSsf1IHjRz
	3qTxtxIWL4kzKyx1nOIb8A0v0TcIlfxR9QLvHE09GAJVfN29jlFbJN98At2JfXis0xqzW44HPSgGB
	MFy45/m4jaIcGWtXC7WD3aLLhQZBLJFj3otFydj36UvJQvl9JAB1Slts1Su9gDpA8xzDCCjeQ1Yfj
	p89uRlJ+XvsQLHoR7sehxLL/jofMnWtQO3R5zUNdQRSlz4Ts0PLiLyqx+OENLuq4DF34f3TNz6/Xp
	wgJ8JP5lLEex5rkTs8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788y-0000000At3Q-2fyl;
	Mon, 30 Mar 2026 08:38:44 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788t-0000000AsyL-30X3
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:40 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-487012ce896so25202615e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859917; x=1775464717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWssdxlHALW3Qgq+7Nkzy7T5aM2eq9AsrkcjeZdUOek=;
        b=ZH2B48F1D5rgMVJvydy7oBaHPITcsL3ZJCB9y56VB5AoPbPOL1F8gNoHC4yxlidbq1
         xpEVRGx4V1u3Ykt5hQZlwwqG/jmyHootV9bsqqbARtbbzegh4qWc2rHQokLWYkxYBZDv
         NtD3puw1XSvsZ66q/grKY7rR2hqwPfyGjwC7BF/HYmPzhe0dkfKvdiEKoclaoVbMGLP1
         JCR1MRwatGyVgTsRuE5SwusDK3kkibF6fYUmeyjMMYTiAOS5nWGBwsxA0M2RxA5fd1U2
         YksbJ8PqSvLgF0r/lcB/8sNwEFEO8z2Z2FhT9Aqeg36doVihfvn5JbTiKDxqzKP+hnPH
         CK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859917; x=1775464717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWssdxlHALW3Qgq+7Nkzy7T5aM2eq9AsrkcjeZdUOek=;
        b=W428wXsVuC1Keanj4Ul0R2FBmpUfSjhBWlHXyTcRxyf3wXn7W9Sam9FnGIkGyQfBr8
         5TYZ6ySGoFi6eXlWjMiHOvQGZ8wW/GbNm7a4nnDZS9IVvVPOV36FX2s2DKjQl3Tlgtb9
         sYcwlZpPjiIHn8L1v9KY8UjDeRFR0lU/3l9LKWjx0FZ3vj/V74/0Mr71jQVV8YB7JVXJ
         /IY+cUjdzRj+pIAbuifhiVwqIxJD3TxhqN9XAqndDidcpKgeP8aEpAPzvXBg9qcy6ETU
         80dWbkHD3gdt1uUa+jCyEt3AtczdabKMwULVTftQzRznx2XydLrvwjDD2beqoLKlxapy
         Aukg==
X-Forwarded-Encrypted: i=1; AJvYcCWmXhbXK+i+dRaw+QCDHPkqbx7nmDxu/M8bfS5BP6XtJAfahrPW74yrPDkgA3ScWUGCZQdGDM2syhwzxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpZKdqj3m4lq6/OZJ4Bcv+186iu0YdBLe/RVCx2CViVOpoqDCx
	AbKe3hRqm2SJfj/PPxxhW7+RsyVLwuN4di61iXGmep232tznqqXOg/Yt
X-Gm-Gg: ATEYQzwtNDnPcrOcQA/anFzMcBWEhGH6M86RSOujmuWiZGNl5fbD7KurDKJOg61R9z8
	VMuAXZQjnoDm+m8gkPqyZu+Bs6H356C0LN4NFBCJI+oE4XnFKDJLtPmICUFwaCe5WkhVqXsqBXn
	r1xz5KLS9EvWlOsIqoIISLbLGqgDfIkFuX/wmpPa8/IrYsrMKF6nDSAbCw53FchshHJMXF33l+l
	b0mX38LUgJX6atFt4VI6XgECzY8daLQwq3xMnpyEjeCEw5+ksPQj0s76CHGX8bj6fTi3gCcVTcQ
	khqWtdvNV+/8MJXTmZto2g6V6XQXtdjgWdtWBvPKRWELkusSp8sOQBdMtSJ0ldP2cLEMNp2/l/l
	AofVlIsB1GrJum9cHIqyUXzfzw3LFl9mMw5t3wpYezDgDeCgFkwOhYP4pA15XYvVM1XdC9dK91C
	p7dxL2+DMRGvPotxnsQ+qwowTo5Bf3LPsSwTJxp56AiCKmfuVmQbNB/SRogCCc10E0Fd6AeDolU
	zM=
X-Received: by 2002:a05:600c:4f91:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-48727eda549mr197940965e9.17.1774859917344;
        Mon, 30 Mar 2026 01:38:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:36 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:09 +0200
Subject: [PATCH v5 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260330-orangepi-sd-card-uhs-v5-8-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013839_780847_97694820 
X-CRM114-Status: UNSURE (   9.75  )
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
index 5790d927b93db350c8f53aa0f314183b3173fd76..a5bd63976a4ff772ae9a9f983042e9b032ecff95 100644
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
+	pinctrl-names = "default", "state_uhs";
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
