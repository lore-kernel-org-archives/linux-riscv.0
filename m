Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D91C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 06:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMAmznsg+i4/2p67HSGoXmunF5RKocbKIB8JaQ9qzLw=; b=bvUWEOg3NjMZSV
	AEoe+HdXiPaJMi7XHLFtVPPc0Xil4HYS7gNciZ6IBQlmJn0ODEkyX/9JMz9fmVVs/n0x2WYQ+KCPU
	T+5rEEnoxfTzWKjg1vj8aJ4q2iWB3pTHlhuwp3HS+vD5URm3JDGXbkbsU02WTf3elF1GgGCgSi3M2
	6ozjlj96ZdpVWkTncwZTjyRuns8//IrEnxxcxUD6AciBJkqrXC3EPrEkp3In7grJiitLOMEH1S7MP
	/m5dQ2WLrm1ZcBBIpayihIrBVMfaNERpUCOKKfMsymwyXUQ6OXXJfhSrqxin8mBI/+RXfbDUenvH8
	nR5Xa9/CPbEHfWCkxYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSA6o-00FEpr-2i;
	Tue, 23 Jan 2024 06:18:06 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSA6k-00FEml-2D
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 06:18:04 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5cfb81124ecso2799369a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 22:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705990679; x=1706595479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME8YwPbdKoUEBb8pwsupWQGlI6P3cfXncKX/A/ie+p0=;
        b=XhmQ+omHwbJWigVUh2MhfSD0+S0zLkqwFfNaYLb6vhOQukd1g043QagZdYqibIrSOB
         hFjUG+eDYyBMNjtYOghnEHshm+jCCSmZ86HzmndVBXXA4KcyzU/bFdDO7AqgjgeLQrMV
         R7+NJEOun0xP7E/YLf60JzDOPJDouR9rKkoID5jr95DePcKDkJurSIqUvrQ2GZjHQTp0
         kKt9p7gkU9wMCsTS5S/8Jx3jlNC0Dpuu6Ojmz+QD7t+YKvewHjR0yjnAmvIcwG7VsRhV
         VOPPF2gDGqc/qHbbNrc7OMF0Fv/9yOtjvi1m93Ri6eihhuZQ8RNxIkDq9N4GUUcvFHd/
         nBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705990679; x=1706595479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME8YwPbdKoUEBb8pwsupWQGlI6P3cfXncKX/A/ie+p0=;
        b=FlFjBBiVn70yKi72p83iysDnAjWq3ueDEFG+wQ1wmi+h1lb0K24ofo+WI8WFLFigMy
         hsgssUk2xO5rN4D/XyeavmehB8B0n0qGzB8nZF2udW9YKQe9WwOfT12AiAFbUrnbmTP9
         gOJIeWjnJHRDGVyiPUz4anjKuT7kRzB3ewiYZ6vN9zYAYyo5gyHA6kHtOmFW3k0OXYJ9
         dOR6rtMR9Sq71ev3xvcwCO3Xhk986Ov7g0kGht0QVLL7l6L5Z0uoQcoTrK+hn+u7N8WK
         fzWugfDfqmxYvCCWL90bVZeuRtqRqt5FRXdDDhnYO49jDqcokeoMig5OGYriaaW+lKaG
         n3MA==
X-Gm-Message-State: AOJu0Yy6/v2e8aautGe1HWwf26AU6GDfO9URC8AEXM5l3b2sNjyaXGNX
	1XJvZDMkXRS7B+9s6AkPsehQVoe5nocH/e9pWqk+I2gVB8Xx0K4e+qpmmOf+LX5Sr2n2XAj7LYS
	1qYGUnR3/CcLqHG7b8fp1ghnzXV3HkGr6WEidAFhHK15oRp2LV4BF3rcrx+nNgk9aCV5/yTcwuU
	mOOcDwkzKMA/qh6Ql21SyJZz+ijNXRSYBB8n8uhdPvFHZZTVN50EI=
X-Google-Smtp-Source: AGHT+IGilp1NHJ+bOxCNhyXEG/4JAD2rrjQuIW5uobXx3C9HXC0+T93+AoaL+nis4sBdTei7ICbDBA==
X-Received: by 2002:a05:6a20:4387:b0:19c:4fcd:fab6 with SMTP id i7-20020a056a20438700b0019c4fcdfab6mr1483066pzl.40.1705990678572;
        Mon, 22 Jan 2024 22:17:58 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902b08700b001d733c88646sm4425376plr.216.2024.01.22.22.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:17:58 -0800 (PST)
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
	zong.li@sifve.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v7 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Tue, 23 Jan 2024 14:17:46 +0800
Message-ID: <20240123061748.8844-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240123061748.8844-1-nylon.chen@sifive.com>
References: <20240123061748.8844-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_221802_720465_17D6C7F6 
X-CRM114-Status: UNSURE (   8.17  )
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

Co-developed-by: Zong Li <zong.li@sifve.com>
Signed-off-by: Zong Li <zong.li@sifve.com>
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
