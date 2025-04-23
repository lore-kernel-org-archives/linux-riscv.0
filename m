Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C79C369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfes7NonDdquEMvvUde49BZaA0o1BvleMcFw5AqFXSE=; b=3kMgp7MY1EpL0y
	LA97RPUjrezbTz7wbByqkXVc5ox+4pwZviAWwfwwbY18bVxz/yiPfXxhU11Mt5Sf4+Z6o+73DBigz
	3zmfop6BuJ2SzWf+v143cHuB8E6kbLGiFtMh2HIYfdPqKQNmScUAW0Jur1rEAB8aXaaV+uqT0WoMQ
	RFaPfRDYwXF6rupzsWqSVvlpbtezIPEZyKSJf7elrxUl41CNATsZa0fiFqRnEuTLZ57/Bmas2g4dy
	DpmuITP9PcEwf3ZST3dhB+lzvZhhuUNiQaby1YmeInyXJPnZUNeZbqdwffyNA6WsAsGRYISeaUBeV
	ljEXBA7qqrQTxp5EVOGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WtE-0000000A5Vk-20gA;
	Wed, 23 Apr 2025 09:59:36 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vr7-00000009pcH-1K8t
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 08:53:22 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so4247291a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398401; x=1746003201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=hV4qof7qJNEJeE8g1Z7d3JgQkEnO5q0PsEun7rEppb2tZPNBGzMYAptyCDP9GrzxMR
         hJ+x3s0OtlHXQqRoDI8pJRXd/Mnp55wAHaqYnXUwQ7oTg48t1jBg0ygMewKpWt6YTEur
         9ubvGGUEC3eXu82vkP9ZI++N+C0p3r3bl0mUzSE9fTwqfAbQYEw5WHC1QuC1hcQCeWAw
         DjnibOjZ3j63jxt3CC0Cuo0e1C5oHJRN3WEnw9WLC+FPnrh96cnBsAp8HlFU4Gz4u0sy
         NKJdttO7mHMUsWO1ogW4cnA/3cmBdea4eyJsSRVDXdQY47fsRdyjcaOC8i3T6MJ/aGAt
         Dt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398401; x=1746003201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=U8/6ZJnRRuRr43+FVk3zg8Ak5A+8hDdS5pWF2pOF0bFCZvAjxePjCmz/K/qsH9uZe1
         c14BsQZX3JiP+JWvxVN3cG22HSCSSusp2nMDOPnN+FJYTj/jqxRpbk4U9hFOJJ4Rpnve
         wAJ9E7d/4Ec5xZViBvjCa8/nMB8BmsVHpuENp+hu+QahdW/EljUvNZnCDi1bYtvsu2eD
         OAQvUYJmM0ds5DTCwAsPlsNFbA7xm2kDAurzMRJlx/PFKFLD1UbNIJbRhdrRK2RtP0rn
         bfpMg85KvindVvDS1gtdwUC6CffKS3sSYuaLf9jJjE6QMr5Eb9Jd5d8uVl7WvMOhj88F
         f1iw==
X-Gm-Message-State: AOJu0YzEm80wOIAM+eSLbUZEVu8PoQIsBI/7viCGnPb8ggQzd5+43c+q
	ZaCiB/LH7wAyR0wDHhZprM90NPFd/j/X+C5GZltANddWZR8MO0jH9cNx2tKoYVg=
X-Gm-Gg: ASbGncu0/HDktdlLVhuPO6YOkiaWt6+qlI4bYJfV/hqyyUzbWpoMEUkY4Feaab2NZjR
	15e3d/G8niRGgzfk+LXNVJAAKUpPFvRw1COy6d6bGy7smwUaP3Ld5KAxGdifqGH47OTXqnMRTxE
	W94BfFY130holprWvo57R7/Phrq59AcFhvMF5wiJuOhCqVwf1CYcu3ukUIqCPOOdIQKo+ur1hm3
	AtKZerbAl4c3OhSMriE6oFwNbvRdFdXVYyR6xJ6366MjaIL33pGSmJ4+2cCCEib3J2pusUpaOY4
	jGRVUAdPqFrh7rBsLEB1W03YAQ7pnaTdb2YryVeZQGuXwS9yWGM6n/QWMWOT88QG3S1A8EJ66Js
	57g==
X-Google-Smtp-Source: AGHT+IHEKV/m10IrzT141uXdAo2R7TQilKbWToWRUKyb71DvBqH66dHmnRA2NqFUmClDybjkDOEreA==
X-Received: by 2002:a17:90b:1cc5:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-3087bb9f463mr21064712a91.26.1745398400742;
        Wed, 23 Apr 2025 01:53:20 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:20 -0700 (PDT)
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
Subject: [PATCH v13 1/5] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Wed, 23 Apr 2025 17:04:42 +0800
Message-Id: <20250423090446.294846-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090446.294846-1-nylon.chen@sifive.com>
References: <20250423090446.294846-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015321_349862_835D1A2A 
X-CRM114-Status: UNSURE (   8.06  )
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
