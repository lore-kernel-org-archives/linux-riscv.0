Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D78C77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEURv3PfBqm0T0grI2axm7x0I09lGmniqRa4dJVx5S4=; b=3G1MsNQ4f/qQXD
	C1mSelEId9mR5JyOhD+eu2/fwo/QDSus4jCfELBvW0T/WcntQuolRzmv1Wsrqak7IjXslA90I6KER
	Bu+i/gNi03OcxqdAffrUEpkcs2UMtH5vg9k4Kz9/9XmTQ86ag6JZNVmT1SUAB5tSe3ICV0S782DQR
	Z9ZyWjCJd9+aSNgmDzmfpgU2cocWEwjKeosRUdydt0xvPNyQbT8DsSpwtxi4j8TEftdy2Fx+TtkHe
	Mxjv2ccxuQ6DJgHgmF8/NklfeMlefrVOAEWFb6RxxHl9kSd6NHLi+HzazVIFKl12IFEGGbd/7spzO
	wIox1rr8/fX2Hhs2sJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQh6-007Y1m-0r;
	Thu, 20 Apr 2023 09:35:12 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQh3-007Y0u-1D
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 09:35:10 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b52ad6311so1038548b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681983309; x=1684575309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHPuRLA5WWcEQWx1cI3sgBTHdUDt8lS20i2hj6DWJQM=;
        b=I0GuHV+xeH4hhf9jmjGqJqjMpaB3h4iLZtZOerQDLrCVSiopbDOjRVrVZZ5dsbzGmN
         sLotILAXSjHXXK3WU9LkaXmo8tzCu6nBCZDoDoQlmWh4adXl0ZgSaPoW07ydRmJyTk36
         VtGBYQDDtrg0iO8/PeRl1i5eT8yknBGSmWcpX+mcYa0y78oQIKV2R4pVlHqI2nMd82zH
         BzVGp3v3p3ZviovrlTw1GMuT3PSZNishGIDWkXXmXMEowKlTothFnR7Qf8nO+WcHGcoX
         WGaDp7SwmktKS614Oz10TiFpoVJ3VTfiH5rK0/QOGs/BZshnFPYsWY6AJf6Db+o6mkaQ
         0Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983309; x=1684575309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHPuRLA5WWcEQWx1cI3sgBTHdUDt8lS20i2hj6DWJQM=;
        b=LX14wrqgfmgwa2sV2ThdVKJwymLw95ZWYVmmnvTUPhZx4lO6wcZ1HtPR92YFdlQ+0Y
         e3Sskn9GU9r7vMDpQiEx9LHEetPCLE/7QJLvvGfGEEQJHj1dqhc8IMQ0gYsZZGjB27U2
         O0wVmZT6a6MK7i9oiaEQH27rGpv5toOEidBMLLxYq0K5cpH9lOFKUpZb6ESLXtbLtKxu
         7K+iJnZ+z9WYRdMApGpWCU4ig2lznOusosHjpoZdTfj5Lvh5igSKigM8jH1waWY3M8wh
         ASsAwtU5EYsVxZ2NAQmwJl0jcRiDednmFcX/yAUaskJHFk5c0+PPa+vHItpMxPE34xPh
         GymQ==
X-Gm-Message-State: AAQBX9ddPFlitPetiofhCKF8bY4dVeKaDrTcw7cfi10Qcr14RvhLr9cJ
	YRz0wb42HnXLCLb9MgtQscoBlw==
X-Google-Smtp-Source: AKy350abeBDWDHJdXZTQE7s0QOikL+2ciqc/t7yvCQxyX1OhaD11p0xvKBUUC0LwfASK7s01JPRGQA==
X-Received: by 2002:a05:6a20:a59a:b0:f0:1255:781b with SMTP id bc26-20020a056a20a59a00b000f01255781bmr1511257pzb.29.1681983308729;
        Thu, 20 Apr 2023 02:35:08 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id p5-20020a63c145000000b0051ba9d772f9sm781551pgi.59.2023.04.20.02.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 02:35:08 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: aou@eecs.berkeley.edu,
	conor@kernel.org,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: nylon.chen@sifive.com,
	nylon7717@gmail.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Thu, 20 Apr 2023 17:34:56 +0800
Message-Id: <20230420093457.18936-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420093457.18936-1-nylon.chen@sifive.com>
References: <20230420093457.18936-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_023509_416020_49A3ECF5 
X-CRM114-Status: UNSURE (   8.20  )
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
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 4 ----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 900a50526d77..7a9f336a391c 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -50,7 +50,6 @@ led-controller {
 
 		led-d1 {
 			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d1";
@@ -58,7 +57,6 @@ led-d1 {
 
 		led-d2 {
 			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d2";
@@ -66,7 +64,6 @@ led-d2 {
 
 		led-d3 {
 			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d3";
@@ -74,7 +71,6 @@ led-d3 {
 
 		led-d4 {
 			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d4";
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 07387f9c135c..11f08a545ee6 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -52,7 +52,6 @@ led-controller-1 {
 
 		led-d12 {
 			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d12";
@@ -69,19 +68,16 @@ multi-led {
 
 			led-red {
 				pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_RED>;
 			};
 
 			led-green {
 				pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_GREEN>;
 			};
 
 			led-blue {
 				pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_BLUE>;
 			};
 		};
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
