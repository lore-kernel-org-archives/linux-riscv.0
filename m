Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90402C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 10:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfes7NonDdquEMvvUde49BZaA0o1BvleMcFw5AqFXSE=; b=2g1vBN7lGY6k0N
	wtRArTNin00lQeTbVTO449Mp8aqKeN/Y10xL/nYF8u8pbp/y1IPvXgJ2KdlR9D1Y3Mf82pokxK9CB
	U8SdL8TKTD8AygmndU5WT2He7ch8dpMfOLjpOwQyXGesYN/6yj1V1qS/RYusfj0oH8GYcF+4FXDUj
	fDArEI/pML9DY9cyTfgwa9N1c9KlWFmGd1/DUksP8U9TYTOCfG4CeTNALw5bJfw8vwOpzp1TEwxg4
	xjM8BH1JI/fH/BqhfCuyMImA4gs7JJVM6ZjvjNejGdQCD+y4LABV9ZpkoyjS+syNhvQEibm7ldHUd
	8s2k+N2mK1uj/cRuTQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL64-00000003IQi-2JkK;
	Fri, 09 May 2025 10:36:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKEa-000000038Yv-174s
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 09:41:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so2857711b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783695; x=1747388495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=Jvt3Ec31F9ZWaoB4FmJf6QAHoDuiX5HYZxutWuPFnD3rRdHRpIq1t6v98U3xM7noYO
         1LzaGY5H6p/1GSukgbhcar1tqLneGhToM8zNEzGSN8C6K3bKLXIqfQ1cYNDPaFaVpDok
         hYnNVeApuLhjIxVJQ9w0xfrLSX9YWOxb3OHHuVPWbS5kYzdQEKXGIjL663ViJnwIkSmH
         dk4IFeceQJTJMgvwVgJhieQEF56ROqLJbAFzlTWbeySfLzvmq1h44YYuiTCuZjadwcJJ
         5eXJFDBXrNcnAvo2gbFN6bItSbfoNV3coEv4KemSPxknMwZ3BuCABV+IYVhWNpleztUc
         1YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783695; x=1747388495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=Ct/sT5CNsCek0tcBFJR67Ccp/NXcKKZ6hIdow9dkupe4JtJRTa23cwd5lQr9OcBKX1
         1GvC5OLP7CDIFjtqtTLzOnSXakExcuPIQ0B1ScrzVWx/yEvR7X47yLlC/byl4qiDozXj
         tc5eGEsOfLmU92wHPvhSI7jv+uswsUFdlP17aIKS1UyDHs+Nkf9mOkWXceAR5XPZjjif
         +xZnJWYaJGPiNIOyyBUcbwnX95kzrgHBDF08sa02T2ybNvZEv6RfVMjbv/QU/sar57MH
         ao8L0nd5d7vG+OC72ku9nYscKoy+9ue8iBhGcgzjwohtACiETfNbW1oTonYIbaIZTUIT
         c6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCV/WYj9ui6CAx0+iW3hO/osFc7kSYBVQKPW7F42w8TPL42baH3VI80geaWsudHp0p8zw0xDmczgz+nBHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO02pLbX01XGMzmp+xk+SgtlEEpKINvxRbbIW3Q3CfV0cbTXjw
	NVCtSgmFctlruF6LMNEkd/2g8cQoQlvKKwoNiETJHr/flcSuggL0/CB+OrKg298=
X-Gm-Gg: ASbGncsdA+llDYO4hhoijnVl8CW2mjrnTZJcQ2/pdiJicBehBXfogOCU/YanlfUvuee
	7yC54ajQLQwrvZ65aLRnKChoTUPmUXgRwnPUPVrB9HTL7d0Sn8R635L3PjKNsgbwo+kN3TL9DQe
	qGDdkj2um/dux3issf5vGGuuA7+AfPW2N8xWK79+2EG0OHGEwOFjNGIB8rQdrVt9Jl37BcIdZ6Z
	lKHeHxlx+h7bp1rUTR71VZydEXTgqJ5Ec2jAqFj6I/385S8O+qslDQ/wzRf2j1hJ2KqrRtNNloA
	OwcqhVULE+Ynk1OlkqOWDJf6YfaLuOfrUEtDQViB0NskMeN0Z+V5dvoNbQ4ZEbNOoxlNojFZW1S
	FiA==
X-Google-Smtp-Source: AGHT+IEgalPQ22cx7DiKoLmOGrrO9ni0jyC4XIPIwGEyDn4n6J78lWHZEvPtJShZItbWPQLmYJ0Xvg==
X-Received: by 2002:a17:902:f602:b0:220:fe36:650c with SMTP id d9443c01a7336-22fc93e3d82mr42864265ad.23.1746783695428;
        Fri, 09 May 2025 02:41:35 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:35 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v14 1/5] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Fri,  9 May 2025 17:52:30 +0800
Message-Id: <20250509095234.643890-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509095234.643890-1-nylon.chen@sifive.com>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_024136_301710_0CC49B84 
X-CRM114-Status: UNSURE (   8.42  )
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
