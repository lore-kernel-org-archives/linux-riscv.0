Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76046C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wRd2QbKFAyknbw8e8OzIOdmt+pvmLdOdijR4yHW4sL0=; b=0okMTf8w22MotZ
	xVZySUR5V2/Duf9gPg2/ixYgS73IUkW+H4c3kcGKvwtzqPGhBP/PEQeeeyhu1vOaCa6QI5rjJBeTg
	zTejeJVYqVFCeSR5hNlmpoFRTPMS7YrM8gtwO3nmQxZF1vTSUP4OzAapqQMvtGcQNAvu1L8/odDgt
	zjnDjNWo0RJUfUL/q4G/NBBZxlFDMGJiapm24QtGNoCZH1coEocZ73+ia1bGql13FAox2Hey+xfh9
	rkxuyjXiSzgUjUn85JnBXHN1NQagVYaI0jgGj3xsQRoWcQOy09CfHwHaEtFl2HxOujZqlD/ZgmTDt
	ko9swMsgad5/0cjKZ5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZu3Y-00000009Zb8-3I8q;
	Tue, 13 Feb 2024 14:46:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZu3X-00000009ZaN-01qq
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:46:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so3149433f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707835601; x=1708440401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir8zpBgLqK+Si36wMIN5F8HTmTu0B6WTLwvEQnIKe7U=;
        b=euzjq/X8Cr+XdWI4o7WtV4yaEO+E98vdTE3aOzBTIJsWCyPRrx5oWSolhBMkK+d0Ol
         lBTCo/xDXnA3sJCpJYp69gUkWrJ/ililE2GBEGhwnM2vTR2M1Zza7WmlfubmfNEY0hV4
         5z9X65EIqa6v9DhfSw2XksMJq/qJ+Vo6gSyVZkB0OgeTSxqHKQmg7NdD/zgEKCmXAVkc
         2vrT412gvZw5Hzu5pLSH7QmN9WpVALHRX5ixkVjhs3IBs4ca1XMZgGFb1LsDNI6WFTfs
         2Dq4nkthQYyVK7ZqBbw67WZ8YQQYUxkCqYZ3Kki7Dx7ltvZ25JYvCGADY0gCvx6/tmjf
         H0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835601; x=1708440401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ir8zpBgLqK+Si36wMIN5F8HTmTu0B6WTLwvEQnIKe7U=;
        b=pMJVviiJJ5Ta3H4raQrx63+4Lt/i7upQtneI77suJfv4i8RSfuy34WhApnCPRUrvO6
         0+zXN7UvFP8Dc7+PdAKaS0y02g/own+1ma/b1ttdafrxWB0bLXU6CaJ6bAkjUUkOxGsG
         Ra8KZKWQKesix5/VgLq1DDoI1m3JxkUL7wCxC+o8mjhyFeCSOQEb883GuUijfCnyeSQN
         TGKGGASw20FUEdJDg8cbFE+hh74ZbiZqQVutEq7XFLq6yAYGoVuYUggxedlgummJDAhX
         oV6bCVFgI4TISKbD5Q1uj17RVU+ecQzDYn/IPEEjDSajcjWemHzeWpwGIbhBfG75tM5C
         5sBA==
X-Gm-Message-State: AOJu0YzZKQqPqxbMu8rdvu5zfzeR07uJ5jbdV74sxqu6v8dPA5YYzPqn
	DsvtycJz3rHE95B0xv2KS+1VZ/T0CdXDfcx27+nMFD1gMsx5sSkheYyjrTJyeAI=
X-Google-Smtp-Source: AGHT+IEkjtnuspwt+t5YxwSUUxNYqjk5HfcCDkGYBdBQ4TZ0L9nsjc+2ejUhCa/bIvPpauYP32R9SQ==
X-Received: by 2002:a5d:540d:0:b0:33c:ddc9:6926 with SMTP id g13-20020a5d540d000000b0033cddc96926mr1003777wrv.4.1707835601204;
        Tue, 13 Feb 2024 06:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXumOGyL64U4UnNmJmEmjj2qONvdl6skdM6eE+twVkvnip6Yf5yJlw/Fmeu4B83NhNzLAJwV+X7VfUvxitIWlLmVeSxeKhMoYQaEtY/zqfPZg7fVpuW1go+ujSfvx0hkMrHRDF3v44RbrW9tYKPubGKSQ2lBfF0HbEAqU4/UvbIyb5Odnx/NnFLyXmsL5s5LZBnNPTd4wFSRu4LeFS752ZhqognFMTNbJvdrysdVd8V9vWU/JaaFCUhLhDfWlmcjqiRibDAxEAqb3OXWBlgMRGEuWx130Rf3BiUD9OoQseymiXcKt21n5ApjBatDDmZ+HpB2eA3
Received: from krzk-bin.. ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d67d0000000b0033af26545c8sm9714280wrw.50.2024.02.13.06.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:46:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] riscv: dts: starfive: replace underscores in node names
Date: Tue, 13 Feb 2024 15:46:38 +0100
Message-Id: <20240213144638.341509-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_064643_066525_29B0BCCB 
X-CRM114-Status: GOOD (  11.20  )
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

Underscores should not be used in node names (dtc with W=2 warns about
them), so replace them with hyphens.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 12 ++++++------
 arch/riscv/boot/dts/starfive/jh7110.dtsi |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 14d553047e84..90149e379c10 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -96,14 +96,14 @@ cpu-thermal {
 			thermal-sensors = <&sfctemp>;
 
 			trips {
-				cpu_alert0 {
+				cpu-alert0 {
 					/* milliCelsius */
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit {
+				cpu-crit {
 					/* milliCelsius */
 					temperature = <90000>;
 					hysteresis = <2000>;
@@ -113,28 +113,28 @@ cpu_crit {
 		};
 	};
 
-	osc_sys: osc_sys {
+	osc_sys: osc-sys {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
 	};
 
-	osc_aud: osc_aud {
+	osc_aud: osc-aud {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
 	};
 
-	gmac_rmii_ref: gmac_rmii_ref {
+	gmac_rmii_ref: gmac-rmii-ref {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* Should be overridden by the board when needed */
 		clock-frequency = <0>;
 	};
 
-	gmac_gr_mii_rxclk: gmac_gr_mii_rxclk {
+	gmac_gr_mii_rxclk: gmac-gr-mii-rxclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* Should be overridden by the board when needed */
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 1b782f2c1395..8e7f5dec6286 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -237,14 +237,14 @@ map0 {
 			};
 
 			trips {
-				cpu_alert0: cpu_alert0 {
+				cpu_alert0: cpu-alert0 {
 					/* milliCelsius */
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit {
+				cpu-crit {
 					/* milliCelsius */
 					temperature = <100000>;
 					hysteresis = <2000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
