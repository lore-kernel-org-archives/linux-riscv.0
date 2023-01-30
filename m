Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1F1C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qJyG7yyJ8mJfpqPZCqN0Ca8mxWcoZWsNcifuG04JHI=; b=MYSCvKj5jY2oTl
	OJiobKRg90CndZpVniCR3Nio5xUf6hGoUFk9395kF/XrWM8dsFE5DQDDM75yazhNkX6Wr3wgfDBTi
	vJQ2L5JwwJa4SNhz/v/hN0fSFFDmeYdilJOQJ/mWerW9E2qx6PcdefdgJAjv8QEXM/1zGivN0YfpL
	ZShJdXm/DxzQba1E5CGCKPbcyviMlO6OcN1bI7CL+b+kT/EZnqgYLjh8UhoRqGjjuAiklCUTPm8RE
	UD7TyOE5Of4ftrPgRlWolPKMnXIcKcsQrWQ3oUBrrS3CkweljZtmvsQ4gueUh3FO0ojwk5b8Lm0wT
	dumonYimeQ2gLyfMz4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQX0-002u1y-2I; Mon, 30 Jan 2023 09:32:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQWr-002tsA-F2
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 09:32:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id v23so10986624plo.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 01:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxtYcVhJhYnmw9Kyf/CwQWgviswE64iGZP+l2Z32zUU=;
        b=WfpSpboUezsAyUDDVV9MgUHTxwU1B6vz4v5+gIu7omiVgcRS+MZhIWZsnhesnBobkJ
         FuricfmatL/tBgUO2Ox5jovBrabUbuVFkruA6tDgzTFQg8NdpfM1PA/DXKnbJhaaakHI
         UetQVLgUSxAPkniq7vGNYBLuRL/k9EnltcV5QBnMJgmh+6y3YuHI2HDK2tO2cQFuJKu1
         cy34U3MGwmpRhajU5owIL9mqSuUSM6w1F3wRuOzqU7r+M/Nf66ZWml5iRBZ7ttNvwCBl
         HqdqkfNfe4oBmhzr0Q895sfoVszPUVnwcg2WRU1LSP9N1QpyFifC6WgQ5fm4pizh9PJA
         QCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxtYcVhJhYnmw9Kyf/CwQWgviswE64iGZP+l2Z32zUU=;
        b=jF4MxO7JdYGYB/4WEo76b2uH71I3uXg7d2JGvr0h9LPEinjQcNjFqcuIWilkJNjnZZ
         6HbUiM6XiX8IhWQY70ShVoFItB42xQ7YPkb05SXicUsOXNvCnD68nzBLFqz3sR8mEu3X
         go4QIiRGsjvxRUjV8vpstC+1G1YjpwvJMgMNSQlLb8Wq8WwkAYyBsaDtunB3AFHmEucE
         WQwldALgUrTkCQC9pe7LPvU9SmtY7hREFmSNgcBz58uO0bP5YK+VGFU9JuhsWhpJpgWv
         A8+VQoH0AuA+0TkFBAojlskKDZwv+0bj3r6wmvq1k+NCyw9pLBCvAusIZdBp3LoDDcR8
         p+Kg==
X-Gm-Message-State: AO0yUKVkEeZbfo1+X2pPUAan0h85iBcazEm1JtF1pQXgsL5pbExx9qoE
	mLl+osPsDdesDQ7HUeIMARkjPA==
X-Google-Smtp-Source: AK7set+sqas1TmEZGyot0yhlXSSwa3Kkzex+Yml58yVBreADNUkvzMVeVh4R0UHw2PdTkO1Dvv9mIA==
X-Received: by 2002:a05:6a20:1592:b0:be:9249:236c with SMTP id h18-20020a056a20159200b000be9249236cmr1679774pzj.35.1675071160436;
        Mon, 30 Jan 2023 01:32:40 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t13-20020a6564cd000000b004db2b310f95sm6245704pgv.16.2023.01.30.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:32:40 -0800 (PST)
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
	vincent.chen@sifive.com
Subject: [PATCH v2 1/2] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Mon, 30 Jan 2023 17:32:28 +0800
Message-Id: <20230130093229.27489-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230130093229.27489-1-nylon.chen@sifive.com>
References: <20230130093229.27489-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_013245_562453_CF6221DA 
X-CRM114-Status: UNSURE (   8.34  )
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

[0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
[1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf

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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
