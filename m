Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9474BCFD31D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqUeKy/ZjGVvcFY+TlvwbZVDqXrzFWYlTLHmlmSiOAc=; b=zGGUwmTRfrQ+l2
	ZjOa9thYpXIkYt0mxixdATAUDtM+KugU46rtYAqlfkWCtq94L5kx0QaQLZxD6g8wPmOBI8djV2e7h
	zvEQZsbcNKfcvgNleB2BGh9TO+uqcOzS1qAPwcE1YBMujxCWJ6MMtmxSEOEdbN/JLlBubOvu7cP2x
	DgODw03T+B1puduwIp5UKZUhubAS8wLReshpBZi4xSl+w6OEtgnTYecCNP2ivI6B8J6RNdIwyX7oH
	3wK2eLhCD75RtTlRArG9cxTDSkLEolh8CFOOL761QxGztVoFZ+GZZOs4EOll/mAGM0JJJzguVYhUt
	C/x6uDwVK0h/krpH+M4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szD3k-0000000G0GX-1qQ2;
	Fri, 11 Oct 2024 10:39:48 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szCtH-0000000FySH-3C5k;
	Fri, 11 Oct 2024 10:29:01 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539d9fffea1so621491e87.2;
        Fri, 11 Oct 2024 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728642537; x=1729247337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=;
        b=FJrUz5l0D8w58XXee3LDXPu93Gkt9hZcwwrc7xDX72zXHjorzlH2aIlS9hQtEh+6yq
         +Ozj554QbH7zItYRPZix7782qVbBGIspURJRfsIovS3CoNPCIQvmQ9Ol9IbS8pdXV7UV
         tmRuddTiQPwPEkRfB16nNDJ8laUqTUcdzT0MSAgoHPVSv77I4WSNSyzRKnSMcX1Dby5m
         mzlYsT0jcl9DulEDRTEnFi9dU+ApYI2ovjS0gz1Xi/m1Z5jy3vFnyVADsnp+cAYrWvEy
         1cyi0COpmen34QfeHl6QozK79GEbUzxADHYvFbfy+kiZXrruOcnz/ISvleUh0Mfq7w5o
         WWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642537; x=1729247337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=;
        b=rJ6F+/A00CeacgSwFqr+mk/aY8P5iD3nV7gBYHmCTYk4qntSWlEUxOJO3qDtJDe7RP
         7LVkJRJH9t2MPFaWIk6XIhj5FRbY2iYTPQRRR3IJ5bJwIrMzII9z4c2QO3bJkR9+u5Jq
         n5vAkOvlqiaA2z9zOgO0G8QTsfEyTsM0Qxi+ZHp6eiQWGXxB69mhahq2aXcaxdAQ8CcG
         +wwMrlmp4rQR07cEgpHwfLMJ6fb8rtIFbs3iLTvG8THLTCxOUaKpIdkqXUGxIo52F4R1
         ei+45BQgzvnfkRGXaybbl2nw8iEt4FP8tsAIaswqrgTVcHGJnD+2vUhJSqEjYeVHi3Kc
         srqw==
X-Forwarded-Encrypted: i=1; AJvYcCWLb1/1Xn6OGYAm2pqDtmD+2Y+U+oa8ZhLKyMM1QitV5Kp2jYhVNis+OJ2AQPt5K/SndgmCmRZ13iMfmIg=@lists.infradead.org, AJvYcCX/QopOEAnpu/V1/JYno2ELzlIUJS8zZmpki06Kb8fINn1TFJUsV1E2OkwKNq1L10hwgdKOJGX+d7Y96OqOk/JB@lists.infradead.org
X-Gm-Message-State: AOJu0YyBAVzu2F83S6/G4KqxtRILQQVy55KR/v/W0ylzmTKSNZpv/jnE
	OkBia9S+YPeMx8yovPH3qfUGsBHrPff/BUIcbxRDDGPMesRo0j8=
X-Google-Smtp-Source: AGHT+IH/0iVsIqjE53CKqC3QuGl88A222SHl1NC8BOnNKbuokjEWuS32AA0HurhU3gBV0qhEcwHfLg==
X-Received: by 2002:ac2:51cd:0:b0:539:e333:181f with SMTP id 2adb3069b0e04-539e3331a00mr162073e87.10.1728642537233;
        Fri, 11 Oct 2024 03:28:57 -0700 (PDT)
Received: from localhost.localdomain ([188.162.200.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f1003sm552534e87.233.2024.10.11.03.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:28:56 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Fri, 11 Oct 2024 13:27:34 +0300
Message-Id: <20241011102751.153248-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011102751.153248-1-privatesub2@gmail.com>
References: <20241011102751.153248-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_032859_820051_660CCFA0 
X-CRM114-Status: GOOD (  10.48  )
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

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb028d..2c26cb8b2b07 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
