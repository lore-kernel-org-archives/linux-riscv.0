Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7399C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 03:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfes7NonDdquEMvvUde49BZaA0o1BvleMcFw5AqFXSE=; b=pN2jQqHRGL1TiU
	jWn8TKzxMUp9kfiiTK8Xv/GYMLYUIfd/8niNamQWnCpAysRaqPhKn+61k4OiZTywZIPx9fkeJDRu/
	lCEMAus3Uin2jKCG6MIorsVZQ+eRKdoFoqbHzCcmAfKL/WLVIWV0UNchp4sl+5vLrHxi3a/ag8w9Z
	RnFcKaYZ5MXDrDK1kyJ098NzThTptQ9BDOY+tjAtH09Z3shp0e4QhWmsIVgckgw68+7WWn9ma5y+G
	2GNp2POVtHR5czp2X9QLcP6kX30WT/sAp2mT11AqOvYV/o7B0h8o6i2rMu880In8K7y5rj0rxOSzO
	4o7uCZMmcZax4GxRKGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUAi-0000000Eppw-2s12;
	Thu, 29 May 2025 03:43:12 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUAg-0000000Epoj-1Jn5
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 03:43:11 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-22c336fcdaaso4591285ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 20:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748490189; x=1749094989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=dD2pcjx1kIQQQoKK7UShrmfkAVMUQY6p1640blkK4jbNbsqsNo9JOmbJrOScOd2U+a
         tbvgYf+4wxu8oPlwRJiM5PhsXA2ent6BZYqlQjdmB9cA/1IAidsgkrIrZQqymCXaUbKh
         RfgsLlpc2FOuOWEV/owstKS8uX85MMJLYTd84jLl1S9zQy/3hmJjxViib9fbPV7DWrth
         RaNLwTu+dRkqy8vbmbRV9A740Nrbc8xVpClYkQCC3rEe9Nfz6xBkD0Q3OmVpY/M6ueoB
         qqy7II75s/D8W/gUX/E8DxYhIiU0w6Dw6VoaqoAcA5wZbUnWChaqb6GY37ZbZZYemYZp
         B9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490189; x=1749094989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=nzeXeACPr7wW1AUApPgn9nSAxBzKYvggTOOug9yL6jG8WYwbYWXEKW8lKg6guT9ONu
         O2+3Udg5pciCJNMbGz6I1S+oLmG4Y2Rwv9RESR5NTY9EXjV/tqInv3jO+ju+fUp3j5a2
         ZlAvVDBtnVy81pMrozwfptYW6rl6J1RBVxmYGS0QYna8Z3kMGwU3Zp9Po3iLn3nZ1RjC
         dPQiEux50QG+BeVqmAsxkn4j75NR/AnnXlco4P/6VETNSsgfobPorgrpE2jxP894isrV
         LsA6VOvABqKT5Cos4FYU1JV00ItSwiIFC2EzM890y1o5e1vrfOUJwIvdylPl0QXms7vL
         I7xg==
X-Gm-Message-State: AOJu0YxijToUpLrfbz4EYtkK1IS0FrtM/hgKXjMT/MB2ZZ77ENukQ4l+
	YCFDLHX5uJsUC9XCLr8bdPVKpK/dt5Mx5D226r5xiK9qEMNfZm9coSwN0bKHNWMkk7I=
X-Gm-Gg: ASbGnctSBKO5FudLBZAismtQCjeY5FTY9sEkPZSky//3OfYzZrlcnsw+LX2AG+oZGDK
	0TYhuHBB+/W7dlw457u1GNYBe+76PE0fcsFEfZ2k6PkZ0hYKK7y6QHcjUV6H7VBWTPYdo3m/uZK
	OwzWOT2nTkFJe9SDrkjryz+nkLrstbGFv/4L3q8mVaT1oInqfOl5bVb7TiCw9jx4fAs3175CP/c
	pDkBoVEFdMrfKHM9vZFTgfWx+d8r0xvtRC5PaWQ6a/Arq/qf/xdlQSIk1IWm1dEHdcT/SrfN/X8
	/ORnAuDj8oV+BBXMph9dOmnS66YIhUoxvU/Q1h6aoaHHAq5uELzxo1zOcTTvUwoTZ/YMwaZQWCy
	hA6bSiwbkjqVGW6syg47+39s=
X-Google-Smtp-Source: AGHT+IFstNcuVP7w227xN/FD2B4edFkQaofadttJziWx+bPq+XVZnP4+BnZFowLiEIahUkjeG851Gw==
X-Received: by 2002:a17:902:ceca:b0:234:cc7c:d2fc with SMTP id d9443c01a7336-234cc7cd589mr68462635ad.27.1748490189449;
        Wed, 28 May 2025 20:43:09 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92c7sm3425905ad.62.2025.05.28.20.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:43:08 -0700 (PDT)
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
Subject: [PATCH v15 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Thu, 29 May 2025 11:53:39 +0800
Message-Id: <20250529035341.51736-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529035341.51736-1-nylon.chen@sifive.com>
References: <20250529035341.51736-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_204310_351744_77A0BF5D 
X-CRM114-Status: UNSURE (   8.72  )
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
