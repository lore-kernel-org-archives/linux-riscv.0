Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BDCC369D7
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfes7NonDdquEMvvUde49BZaA0o1BvleMcFw5AqFXSE=; b=q+NSBy64zLVxUo
	u/YqvJy44NE6tY7ESFiPRXUQc9ESNPC+hlh8Df2FoB7aNXFO527u9GHgPCnzVKjQD+FuvGpsBXcuJ
	ULTFnrkMiBWO8dDoHsIERo1n7mrHjl3GrMHqp8R5Fj7Kw6KB9O0T8J0XT0mizSow+MLyDoTy79qCj
	fTnP0uf+gMfcDblmocqC11AkAKVOiRlgwcyJ6Y1Nrn3SuuTBjrBsfMoTD/YUwauTmhRCwp2wrLLEo
	tYbtQ7hpcicn7InfUyOxptT8vok3CevvrtGnP47x7lMEBZqBPmO+AXJz1Iy9J+cZknDKbImBFcaS+
	ZNYStrh61JH3F2sqIKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ACS-00000006biv-3lxm;
	Tue, 22 Apr 2025 09:45:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Ca-00000006OXH-1T6C
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Apr 2025 08:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=; b=PJGDNU5Hr1J82plM2BxfQkbR5+
	/JOOm88KxCAafe238jd8WjWcYvRawMr0uruFhlkmVWpKgrQdlwV1sjbmzPKj7g1Kt/JB87xVhB/Tq
	8ZT7EJq2nPfD1i0e4cH3E8udpLFFy8Cn2LNr/FQSHk1Uu38aGZ+ts509PsLclIYaJUiRo43LXu2c5
	OkD75un83vv2sB1l5mFvvNuox3z3/4jD+W46LAo+8H/qf+ogV/zf8RiLhlHtAJZaav//Z398VeVUv
	eI5dAYBFjrotkTVDNeAoH7W3T70h7Ohstk8GJPMzFyl3ZCBicRCy107ew4nLpE2XRofZY3F0/X5JJ
	QbvgwFow==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u79CX-0000000BANI-10pl
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:41:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22d95f0dda4so11565335ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745311314; x=1745916114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=kAdj6E5IeePplScSO4GkyLaj+zPpvUbUw8M6sHu0AXrfATy6g2lNl4XVjamGqzujsj
         aP4L73C7NRyefFDsUCMBOdioQIOM5ymjRqVPbvcKIzW3wIo8mdlVivO2D0JLDSUaHx40
         R9b8ndbDZUOhQbw3BXwFBWG+qSoaIi81L7kDp4NFo57oW6oj665BwRVSceDtcpXouDpM
         KnAZ74tUbsxWUzJWIvsG0loKY7+xiwPxkN9oWW45gKX5gzo5K2cqAvo3Ea6YZsf+SkMn
         +MCFLQ3JzrARIQRN/kS4c41BM12hr1jiiDfSuIiYJEZ64MCsAjfwGBXftOhVSqrjp1d/
         S57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311314; x=1745916114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=gs43gUJ5AVcH3pYu6pHptt+7/mnMdGrPzOpfy5LapzMnv3IaeA7nVhlkHjh0uef/i7
         ObQaGY/KZQrXs+e6T9PiHh0ECNwVryeAOQZl1UEkqZKRuwElT5lyeElaZmks6rDXZMu8
         0+om/KTwRiSx0juKHjU9Sm4x1fbqPiGjshFSPwfQmQOlaEoGxEl6SobIaLdcr/d7+001
         ts8WIJP4HpQxpKl+gKYPhqKhtBUf/FQsKzvhfAvFTlIpGclQ32zFy5DgVAhMk19yPm1L
         WbLAr+yNp/XBcmXJ1oxRVuj9hCok1X1DfMPrJa7x8ErnkyDCoL38Ra4XrznVzj5PnOvt
         chdA==
X-Gm-Message-State: AOJu0YweebrqLU9uPKm6MTrsumrETReSoze8lkx9fPp+yRE6ADAyYB9b
	1c2LythrEgqtVMQy00gyzbrpxgeZMBPSgiBo3lPKTBTp/r8WeDWyUYKumeJ371g=
X-Gm-Gg: ASbGncsjDfeKoUSsf0QtEuPR4BK+Ee3zhJ27a8Kw/RgMPvITYSPXbBdyHJrvj9zp3us
	Mu7bE1CSg8/GnKKY2lKmGrE3hkyH8rYokF4ECKtDHfBO8Af/8CKUPDW3mNjOf4kv7THwRHu/QR8
	DrrZsHT6YkDCBRVyaAQeXmeRdJVV573PcyypAGkIm7ikQtzYWX7DaF2CJBBcXJVWq9HSoUwiKBW
	YECL0Gmm3dajTVnb2WJwy2aSt4ls/9T1iM+H1aLY23JfDAEQTEHSciQPAs+IUxcrND9jeZ7D8f6
	DTBMQnhuMwMK6g249eXfnIeuh5TQemmqg2FlXUMZcavRQ36hKi/PpzJc/Rt0D4Fl6tSHOVwbNCg
	jt0QoYirWrwm2
X-Google-Smtp-Source: AGHT+IFp00dnBQ86k04fdmbX8xvzwFEmfdHBx64nvu1PEvdvO50/UHtsOOWSOHg/3EGakH1tIpZc6g==
X-Received: by 2002:a17:903:1249:b0:22c:336f:cb54 with SMTP id d9443c01a7336-22c535c9c28mr225400805ad.29.1745311313749;
        Tue, 22 Apr 2025 01:41:53 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7f7sm8038343b3a.82.2025.04.22.01.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:41:53 -0700 (PDT)
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
Subject: [PATCH v12 1/5] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Tue, 22 Apr 2025 16:53:08 +0800
Message-Id: <20250422085312.812877-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422085312.812877-1-nylon.chen@sifive.com>
References: <20250422085312.812877-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_094157_423492_1552D994 
X-CRM114-Status: UNSURE (   8.58  )
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
