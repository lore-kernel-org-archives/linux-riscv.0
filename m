Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB25AE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfes7NonDdquEMvvUde49BZaA0o1BvleMcFw5AqFXSE=; b=nWBeA/RN28y4Ol
	WFsJ/otoHDHMcMXcqRlmWf6nKpN7Ly8toh+pPAMj5T/zfoGSw3R4pzZeIR9/My8AsP6Hs8EeLOrg2
	7p1JFl/SbJKFDQW5Kbx7ffDo9nQUlpdh2olvBLGwWz+3QUP3L08LEPPsDD7Je4cMEtyJebmNmVWj/
	l0HgroGEaYbAb2UKFTj3Z0JhkEHboSOQTHI+fW4DCX4SrStZ3QBD4ItkVYK9nHwpbksStIerjXJ/7
	7YMrXZg4Qw1Ttju9x/YA/zZN0V91jLZLTHYTv63SOHkYgVvZtkfOY6aU+hSx/rnTXrY0tUrGD3wYe
	k052sgXOVRUjMOV2GjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1D0-0000000BaLG-2uEz;
	Tue, 24 Dec 2024 09:28:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Cy-0000000BaKl-3p1y
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 09:28:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2161eb94cceso35005075ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 01:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1735032488; x=1735637288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=dyEc8FBSCINlxLCbjwmr7nu1ZLOb8zhXPuNrZDvjRr3ums+5ot6++pq2wezkxlqXkE
         pmQCT6u7jzuy6LjysKEjFTadKvNME44q2iufG2FFM+9EzZIs5KDi9wr/A3Bqsp4/8PGG
         ajWPvcLczy18igonTEzzkAjDMOg8YRa9IqfnJORnsdcYRKoa5MpYGi1xqDzB9b+USOJA
         FvQO4um4RtLUMjPcYDo11dLY9JwYYmx/bqtG9oZqLKxJeZUhvyaCO3Ac4ByMb6GFRi3P
         +xze3J01tRBwWT3RXlG4R78uzs5iwT70X/Jtec+z31O9U7yLUMGAovwz7TxhAEbgTv7u
         ec3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735032488; x=1735637288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=EIjAjfxyzCIZd7rvObCeOQk5PabANNtmHGmdNKnOwLGW5XcJ10URlpA0U4sx6pPSih
         oPq4yTolhpI1E+grCoxs69zdj5dVl4SrKS/JByWJ54G9KFvCiwSbSGEN9NCIqS+qXSJn
         UFW/ErTYUArxTOMH6S0BWzOySUZIyH/ipMvgO4bwPyV8Vlj3So/LZhZBysqvD9l5+8eT
         Xu1TaUagLGbxnABHUCb3qq+bfS9QPrGxD6YO7CLsxPfVqfzCmqJSFP0PXGT+VNx3wgsd
         p+ArH2Y3sfb8zTT2cgSjEt65BNhHkUH4OjzlTyV7TX8E6uifFlDNPoHEM0EsRDeKGzwk
         Q+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm+9X3vkXzYmG96jUNK0K1VKQzUQc6rrUhopeSunp3O9L/I6/icMRd7iYa9zCwZN/OgYMDXoR1zu1UqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj3iEb42CLaYD8b8+gBfqxVlD41jxoCTtyNoTPENQyMdkXXMSJ
	9Zw1nSiRYoQP80rL2czQb0rvAhlMqnx7v5UvYoBfy0tToPNNFBAv0a0UcSuS/Ac=
X-Gm-Gg: ASbGncuAuWvytOxhx2VZFCvBJ0qXrBXDVhwr987P4dF7B8edIpAHQuuobRqMzfNXgrm
	viguTaYJZwETlkld/79i6jUycLi9TrJ1SzZboby47n5PX/P4aF80F0ZGD4N/8UmeghJJdlePGeh
	0vysOesOMTlKwcS+xAkp5cy1pOTlVhZkkmaTEyvCxLjXDVUm8vwqq5SkzKcU32t0ibUYM9M/T6l
	jqlGgNE97CrgWjdWBZP1hHtQr4af3Dbfq2uvA0yH0C/vgGOFGG9odlwp3toDAeteW9LebfHMjG9
	xkfaRScSh1MeG5Pizw==
X-Google-Smtp-Source: AGHT+IF0zLvXg0En0J308WC3QLi6iR0zwk8h6v6PO7AKPZZqdQ2DFuER2UQDgneMceWfSmVNHYy5yA==
X-Received: by 2002:a05:6a00:4485:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-72abde0f951mr22397563b3a.14.1735032488180;
        Tue, 24 Dec 2024 01:28:08 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72af8dcff60sm516341b3a.152.2024.12.24.01.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:28:07 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nylon Chen <nylon.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Tue, 24 Dec 2024 17:38:59 +0800
Message-Id: <20241224093902.1632627-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224093902.1632627-1-nylon.chen@sifive.com>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_012808_954827_4DFB36D3 
X-CRM114-Status: UNSURE (   8.22  )
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
