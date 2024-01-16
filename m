Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B310C4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 04:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+USSoIdbe/xx1jQsX4VTxttr9lr+kb6CXHQ9zxkvCw=; b=j8O77QYDBzzE3X
	wL9ZZtpBUkbgN0efXQW2np6Jo+de+xU3ilct5ewNcA1TU60NhNZqaB1mT/oMZK2IjeWLzYfS5Fs8s
	XU8BSJWVOEgFMOznKwciuQ8FCEiEvNPQ1Ef4lqlPcUS8gc5gcOoV/jmkMSTVsKwtHStHDYjrWolKa
	lXcAPdcLI0n+FXdhHr4dV8gnE/b3GiAZN0GAIn1z5u1EtzRtGJfkFW7J8Z2yeY6ELHeIe8JE4E/AH
	ZRBnJpaR5UbZN9oo1kvlN1h6sg3kpdNIP4oTc6qPsXaYxIOlbAHDXaUBxcwgd1HZsyf0j9LJoMOoC
	NCIH9OFM4ZqcLc6P1zAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPanG-00AtSz-1M;
	Tue, 16 Jan 2024 04:11:18 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPanC-00AtRs-0F
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 04:11:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28c0565df34so4762349a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 20:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705378270; x=1705983070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNWOGH7VpQY6V8fQKtozhdwdDDbXnjZtAA+yG72Gg0I=;
        b=H6tj0xlHtJjTrXEJtrHsUpTQXfqOSCeOHh60EBagGvBX0xfrWSzqfXkWNbagbVX8/h
         crRM3TPqjgytjoQ916C8k8u0FSWAuN92RTAOirv/MZAP5Z0TlNRYWfUyICyAijb3frnP
         6DnqCK9zVBUOY6G1p0PKWtN7M60jEEEEJv7fYa845Xl2heZw83Kfrib+PDAr283jbs01
         fvlZDiabaITtWRvUR5carrzjzQNVJqtC9SAQ36BkQuzPGB/9O+Shia2R2BF40rMuyubp
         Ni48pv7dYoCuMQj5dKEpp0UOkhonFMWN8VQ1oeeS87b3ROYpfOde+CGlhiEupwNbT2cv
         eOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705378270; x=1705983070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNWOGH7VpQY6V8fQKtozhdwdDDbXnjZtAA+yG72Gg0I=;
        b=aunP58hUDa9TMxu+N1ceQ67xWOB5dKau6T1PAVDGMUfpRcKAx5mDU7XhluNh7mRoH8
         lqeFezoQHqDOtYkQ1tSTQgSems9lozZ5OT5yVE5hcY/jxfgquhHWbPf6TFscz909TjDc
         GLte+2UqaxtDfeF534jHSdDkIJOkWbWy4/fqh32m8ZhZmZKTOrust9sjNeP4g43dXmL1
         QJFz3eU2MwjXNEnHCGyNvpmzWB3c/hLJDcBkS1iWMXWijmtdhJi8aBrKJVrz/sH46nvN
         UE/liNTbfeVrQwbEovWxdl/DYWDngnUvIlfZb/WIO8tjNTqHjelye8FN/eIKbCRaht5z
         3uQA==
X-Gm-Message-State: AOJu0YwfZ9H8yAkQ9RaltjykVMzo7Ce6vI58J0zHmtRxvyOIefvCtRQ7
	3EQRiTIBD4NMfj0N4Msi2kJuKux96WKgOg==
X-Google-Smtp-Source: AGHT+IHdLaq3l3g4Pmg80E7WRUhrwEdvo239qSRGLCobH/JD2z9cKN13WMng5fzHJO29R4gzkXw4UQ==
X-Received: by 2002:a05:6a00:4f8c:b0:6d9:aa4b:3800 with SMTP id ld12-20020a056a004f8c00b006d9aa4b3800mr3973757pfb.19.1705378270417;
        Mon, 15 Jan 2024 20:11:10 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id e3-20020a056a0000c300b006da14f68ac1sm8348585pfj.198.2024.01.15.20.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 20:11:10 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	u.kleine-koenig@pengutronix.de,
	thierry.reding@gmail.com,
	aou@eecs.berkeley.edu
Cc: zong.li@sifve.com,
	vincent.chen@sifive.com,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	nylon7717@gmail.com,
	Nylon Chen <nylon.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [v6 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Tue, 16 Jan 2024 12:10:52 +0800
Message-ID: <20240116041054.11641-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240116041054.11641-1-nylon.chen@sifive.com>
References: <20240116041054.11641-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_201114_113796_462ED315 
X-CRM114-Status: UNSURE (   8.81  )
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
Co-developed-by: Zong Li <zong.li@sifve.com>
Signed-off-by: Zong Li <zong.li@sifve.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 900a50526d77..11e7ac1c54bb 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -49,7 +49,7 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-d1 {
-			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
+			pwms = <&pwm0 0 7812500 0>;
 			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
@@ -57,7 +57,7 @@ led-d1 {
 		};
 
 		led-d2 {
-			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
+			pwms = <&pwm0 1 7812500 0>;
 			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
@@ -65,7 +65,7 @@ led-d2 {
 		};
 
 		led-d3 {
-			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
+			pwms = <&pwm0 2 7812500 0>;
 			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
@@ -73,7 +73,7 @@ led-d3 {
 		};
 
 		led-d4 {
-			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
+			pwms = <&pwm0 3 7812500 0>;
 			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
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
