Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A462DC369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfes7NonDdquEMvvUde49BZaA0o1BvleMcFw5AqFXSE=; b=PE/Bpdzd6RNyi3
	4YXWOUp4D+R8rE9aJfhfaoiD5BUV/TmdVdx8ardIUh7gUyFT1oPOlgLCUZt62ztgJ+di3IcHLofA6
	unmDfrk6gLt0xGQOcHf4g0Tz8suJkIAeo3Q6snvcUDLEj24zqiivi7pBjaM1cvy3MgSa/Fk7bGBgz
	q6QB8xzhHORR1MkSucpQYrWhKRNAhsyu5nuE/8TRoGtD4ilMaWR8rGtae2cFJNWc2VelOfhKsWszc
	TVqXqr8LmbFZ0M6VMepepD1qAlCqcIlx7yopbamsidTknRuEfFptbefd55ibFuaR3fcEvAqFuCKu1
	7ilwBvqg88Lt2HSJZxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6niq-000000041EI-10S1;
	Mon, 21 Apr 2025 09:45:52 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nh2-000000040oq-43cR
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 09:44:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-739525d4e12so3036823b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 02:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745228640; x=1745833440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=BiwTKDBaHIYtpM/lcTDa8tFdcJUiTfD02ZX9Rv8ZA+RcZ+IHwlvF2y4tqwaLCjstWU
         C3VLjQnRoFTsxanIHFQiYmWbtz/0jXYfOB1y+gIkxCnvrmd+XhZOcRS936d943mABOaT
         3p92ozUyQAw62jTvZUzJmaLR2K/rlxxSgnXPaC6eYbz6mg4cswE6whsAf90U+euOJ3yH
         LniNg1MdmN661Asf2XNN5xl98khDLLTRUzr/H9PpW4l097htAJXSe14L/ShRHIaguK/9
         oT3fMwlvgV7QOGB/hZoIwB19WjocrxqcDktzP48R30pye3kB/xIcGb3BHivKnO/xaLdo
         +HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228640; x=1745833440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=hOuITn4yFRmfNUajwjFL41XotGlza4O8pfZm2ysUMRcl9NGJvHRdg6Ws+41TWs0e2d
         8u3nQr+bz2jogPmuc/D7nwRHonLw7eSYu4G0ZtHLKZNeIGlKdYiiV0fYEWbfuXUn8K1B
         ERcijhPS2Z3fXiqjgBM0OdXOaJAEjYdMSkob9Vy6iBUm3BQ4H/u9/tG/LCsGTkMrxYI7
         0rGgrsz1tUG03bliz8Vq3GogJgIU1SkpPOHSxHQXQux4HPqeUpnBirHyZnuGqZJJJQF8
         IHa7GDfM0+ZFRo/rHG3ibD4ACvAzlPJiH8+kBfG+GKSQ1pzJmT6t6x0gG2I0EwundJXe
         4Yag==
X-Gm-Message-State: AOJu0Yxzc+LWj/wnteIjsr1F6PvhyO8ssmCA0HQ2a4wAxatCS9/pGyvW
	kGgf4BOLffOkKmYLgn2/J+qZJmywHF8bICSSQ5vFnM9/2YTZxA6uSMb27M1Gsuw=
X-Gm-Gg: ASbGncs8LWfuDLcumVUh03Pz2imJc4JBKqJOwUYnoUSOq+sepyNuzZzaNPMvnllzgJq
	9ZyU0g+azLQNzysMODHZnsYNo3IMJrrRMb3M0/7Ym0LgNgg9MGTWEONl0BQB0equrS15WnmRymL
	S3gSYL09V0m/gWXPAXnMrn0mfPe2qmvkEJth+ZIxfPdgxkFBhUgm9dj1M8Kz8U97w7X1ZUJ4TfD
	CGU8zkCv1tSGMlySFZX8+YC1hY+usiOuzRs84fnSwzykVxohyCaKWIWg4Ex05gwDiau6bd/lOP8
	D9hP+BTIWf27qrX68whkDTpTqIaq4tuSX0CqlK6qVXzt6aGeYZgMuoybtWBuWsZ1z7dZbhBIr0b
	6Z7BKK8QDE68X
X-Google-Smtp-Source: AGHT+IGhAPqW9k+zFC8QWowxPP2G8A2KzR14N1unikrdNvLboUqrU7XV7viGFBw04x6asP4GUxLZ8g==
X-Received: by 2002:a05:6a20:158c:b0:1ee:c8e7:203c with SMTP id adf61e73a8af0-203cbc74cdbmr17237282637.24.1745228640076;
        Mon, 21 Apr 2025 02:44:00 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf32sm6371965b3a.142.2025.04.21.02.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:43:59 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v11 1/5] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Mon, 21 Apr 2025 17:55:17 +0800
Message-Id: <20250421095521.1500427-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421095521.1500427-1-nylon.chen@sifive.com>
References: <20250421095521.1500427-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_024401_003405_588BA8AD 
X-CRM114-Status: UNSURE (   8.57  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
index 72b87b08ab44..03ce2cee4e97 100644
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
