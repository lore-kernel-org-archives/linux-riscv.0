Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972F1C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 07:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agzHt1uOHhrRtLnO0R1gaj5XQ3RWS01C9MvQPc4pViE=; b=s78ELJcD6IdS5r
	xNSizbYeRbG+T4SS9apbXGFR/2ADESZ/RBF6a7OBagv4y2OVzSvE54uOPDdYDbXZR9L6mjTqqn8rz
	bCpyGNFdGl0ERYXn9UkpyGsojMiHFuQbzUcoHy+zOLOvoE1mbQPDdmSuwrlw62+0nCRkNw7Aq5WEc
	8mCaJsUGPYdHcLXfc/Un2BbFh3kxnT6Pry3E7FrbVhj+olD+xuU2XLIYXnGXy5+QDfDQjVgrdXJkp
	OH/2XrtKxl2w7UF1ZDpugfjPa1c1aM71/r73mu/f01G5kWmgxvaKNgRFN8TQNjEbTRU2f8/KfbeyQ
	tpEcYIXiT6QMYDqqZB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGpj-00000003NPq-2io6;
	Fri, 26 Jan 2024 07:41:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGpg-00000003NOr-2ud7
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 07:41:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d74678df08so390425ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 23:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706254857; x=1706859657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQ+aiqCw3S91Nb4RQKLeQuvPLrZnPOTG3U+KQFNu6UY=;
        b=BXKg+aUq7dNzMYNmw1ukErvAMMrKH1MxTc40ak8x5DkYM9L9k7O46aFDiCrH/D7oew
         uyuMkIT8AbGKPMojNouIU/aYQAOJ/BFGYmeqQY6j8nB/fEyymgN8g38iuex+bb3bioos
         nS6zUWj4oLUu0BiI5Jk7qruNbhhmAxhYUahEpx62t6tWOw0/ezrMPkJ7N40Zo0dQIZrC
         jcDDMVyvQ+oQDAUlVXdz/XnrcVwWxUhW+P5FvSweMSsc1aPW959LwsjkL3lrMHusv40B
         dpf1toN02uV5EHqptxNMdjlPAmsDThJ2B8K70HX6P+hKCnnHk7zrXzX3QIDoaxkxfYR2
         E9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706254857; x=1706859657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQ+aiqCw3S91Nb4RQKLeQuvPLrZnPOTG3U+KQFNu6UY=;
        b=rJZpSTH27TRVUCDGYlLryytqU+5LlsxWT3On4EZj5BrOQbRirQjsZ3oHULpRuyAaGC
         3CB7FKoXXg8NLZn2uXpHtBGTDojxfm2nGky7q/wGrrjw9AoagjhkfMXrRyhNvlw6HikE
         NlOA0fs4Vodfb6fn2LMwTnFzOoZmy7jW/i0rHDXk1moE6EJyoBc4YWjERT6tfoTTgcTX
         8mYdY++g596NwZ7gmtcYattmEtCunwAkK5YA+x1uX85Shu6AlFlU8RlmaCvFHDav3/Su
         Y6kCJlCIkIO121vt3OQZNW2CNl8ZBjimaJUBLibZdKP9KyXjYQfijiVerXjD10TjjShh
         vbZA==
X-Gm-Message-State: AOJu0YzePQ201ezQTDVx1/ZF6T7QfxkfT3i8Gr/03Wokny9ovfDnwIIX
	MIqE2HKAjQz04XSeXp6yImeLLG8lpicBOo/nsYUxQG2e5LsVLkdqs37krLu4tx4XZ2eAg3ypGBi
	BtelB38chc88K2FkkMBFGB6sq0U43w0UlrPBeLLPERz0srLeyKUfFf/E+ag2D7UKnB+/kd+1ADp
	ZbETzsUemLjRi1sMUERvvVnSgUsLkZRmiAjLOIbXaTNzDMUoB1ZNU=
X-Google-Smtp-Source: AGHT+IHqTLNd6hNMspVuKkxKRoQYn887EIsVxZCUB2eyX6Bk3ZwnMVua+oVZcHYpUkjOWXYgiAkNWQ==
X-Received: by 2002:a17:902:ecc5:b0:1d7:7af5:1f7a with SMTP id a5-20020a170902ecc500b001d77af51f7amr873431plh.49.1706254856695;
        Thu, 25 Jan 2024 23:40:56 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001d4816958c2sm521066plf.166.2024.01.25.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 23:40:56 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de
Cc: vincent.chen@sifive.com,
	zong.li@sifive.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v8 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Fri, 26 Jan 2024 15:40:43 +0800
Message-ID: <20240126074045.20159-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240126074045.20159-1-nylon.chen@sifive.com>
References: <20240126074045.20159-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_234100_756281_02BE7DEC 
X-CRM114-Status: UNSURE (   8.36  )
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

This removes the active-low properties of the PWM-controlled LEDs in
the HiFive Unmatched device tree.

The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].

Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf [0]
Link: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf [1]

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 12 ++++--------
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 900a50526d77..06731b8c7bc3 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -49,32 +49,28 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-d1 {
-			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 0 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d1";
 		};
 
 		led-d2 {
-			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 1 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d2";
 		};
 
 		led-d3 {
-			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 2 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d3";
 		};
 
 		led-d4 {
-			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 3 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d4";
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 07387f9c135c..b328ee80693f 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -51,8 +51,7 @@ led-controller-1 {
 		compatible = "pwm-leds";
 
 		led-d12 {
-			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 0 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d12";
@@ -68,20 +67,17 @@ multi-led {
 			label = "d2";
 
 			led-red {
-				pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 2 7812500 0>;
 				color = <LED_COLOR_ID_RED>;
 			};
 
 			led-green {
-				pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 1 7812500 0>;
 				color = <LED_COLOR_ID_GREEN>;
 			};
 
 			led-blue {
-				pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 3 7812500 0>;
 				color = <LED_COLOR_ID_BLUE>;
 			};
 		};
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
