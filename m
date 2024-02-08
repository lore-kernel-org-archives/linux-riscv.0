Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9558C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdUL8Y5VMJsQzxVc3Bi80Z6jbRsFmnPiMAg4Dzh1QEI=; b=4H1UUrksblQOob
	HCL3xo8rdTwf/SMX5zNMS5cor4XCjBbKboUE4sCbwnpQ7IUptVps/hmguo6PdfXwI0mTwxX0EFl4m
	QhQnXi3QogcilA3bGXEh7gl0FC7gR0dWpvNtucZFZiOBHQViYeb6o9KZVsvihyMeKHFFs8SN4OmPN
	avnaT7PKeeMRzVkMuHZRuZR6YYCQdlwWCZ4gZ3h7ZboEnCxrRXhxcEcoVVLrkkcL7DHA3asr7w/7t
	R5TTAd2sm6yu/bvJeMHiFjk3cbrKnq7CwxuNlwlhrWQF1Rf9OH/KJjKe7hRuBWDZRay2EDjhQJk9c
	0AV2KWUnLVOj6zzD7yyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lS-0000000Dlxa-17oq;
	Thu, 08 Feb 2024 12:44:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lF-0000000Dlhl-2qwA
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4101d4c5772so5149765e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396250; x=1708001050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McJKLtshO3D7dPz7Uw3van7kyM1Ng7QWriaUI03VR+Q=;
        b=bRtp+8utzeT6afzJCsC43o+rMuygVhD/eHKeTTMkNoXTx/Oxdb+Alf7BX3JBtyWnmR
         kRWyAKmr3KfCAy36CH80Uf+uMqML5Ru2KOiCfsaEDlBZMarDt4DCuf5Xdw+8LGk/uuZs
         V+0YKlheuAOUdUXAaS1zGqiji0jnPCwxIJnAW4e81aNDvVQFmgkG2TTHAZZnz/JTQN/Y
         SYco1mHk2iXfL2gMW2tm2fPqeE0M8B4xKChYeroA985pO2et2jWu8PCBDpJvKZF1pK8e
         kK90MS1gwfE3qhCGjTei4GtWmFrU2aX8hNAQny9pUBBg4LipgXjwUs4VZk7fJjthOuIy
         hahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396250; x=1708001050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McJKLtshO3D7dPz7Uw3van7kyM1Ng7QWriaUI03VR+Q=;
        b=nayZLbnj6MhfExhBu8//o/Rsv+ShoJT6q3iI4tqnlACRoDnRO7JYTXNyPSAlw/BvtM
         cLBuAAKSNyTb/hQWDgTyl9sLAyw3ruqShXgLqSJGa4DbEzZF38H8guseMJ710cfxPScH
         qWbZ2OZ107Jekj3jtGna79zslW0eBbYyHb0qWzwqSTix/HAUTbLowMzz/aQVB+EoIBSL
         PBitRcy905J1kaHrUfAcEstXknkCnkF+36StPmm3q3DHVKgd61A9IDnQmJnMa4qbvRWa
         r3qTrbdGvLTt6foTo5jdEykyMMD0Mn3RfmuhWHW3bfZZc1FqZA0UsmwAaEFS5Az9Qa+f
         MSqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV42dQBwidc36P4ji7uVOoyvn66A6LJspbuk5I8Q39bm4HkcQtK1ITFWqC21xQyOP9fJvny78qldaB8lLrcAijgv9rnZVff1mmjRFmtxDUb
X-Gm-Message-State: AOJu0YxA1HQZXTmomhdhcQBccDhvV4IL+owouup7opRoPZ6vLW1sjNAZ
	R2eb8CU6mOfRljDfHvqxjJE/lq7JI5RGrnPZ3BVcUlr/ASVI2PC5NZ6CelDlr4A=
X-Google-Smtp-Source: AGHT+IHqJVPSXIx9zTm2sfCHEO4bGqRxWj/L31Fi+6P/XBaLnbH3QSlrjpSAnQgVZ0l2gpyjJ5YqVg==
X-Received: by 2002:a05:600c:1c17:b0:410:2975:cb05 with SMTP id j23-20020a05600c1c1700b004102975cb05mr1958906wms.19.1707396249979;
        Thu, 08 Feb 2024 04:44:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoiCqTbyl47pwC14HtcXzPMz44Gm6yb/nEUCELzy+BV/Axcoq9C92rydDNjm6ZJsUwtFYlNkf6Dnd9fDwpYkBn3RXEY9MMkTat3u7c/KTe+75xd0PnWSpVYuNP/BbCKoqGpK70xWYtHQr9rfUJbSb43myzOqXNMrY/H7zkSNHPpRz9nqQIyEwLWP9pErkSTaUUTQNLxnlUz9irTs9BCe9Si/OZWdth8LChjZb61VKx23+BaXVtWOgz4AAzS6LSt+cIkYKdNBr1WDvtmNSXqkrzuVInHcE3zRWzSMxTHV3AL/3Mh3hxBIsT2ANfP32/3HOd29eLSQdUsD6eF5+d2tlfGxAHG5a4CKXoDDBX7TdC9QiirOuPswZGyRUUXMtDqGgcXZOzlx6mBHElPMfmHZ559p60MHpfTytFDAhtjVvEuE5zstw+VsoHpvFJYq1NVTVHw8lK3AAZwj3W2Z8QJlg3vM1ZyDr0kSXq8pl8gL8r6E2cslkR9iehDygOM9YEfoQ4+87Z5aCE/qXoUFjDRZd7aSfPS4g0VIFfKRi/AQSgrg053XLXW1SPXRqEQgGsMHE=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:09 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 12/17] arm64: dts: renesas: rzg3s-smarc-som: Guard the ethernet IRQ GPIOs with proper flags
Date: Thu,  8 Feb 2024 14:42:55 +0200
Message-Id: <20240208124300.2740313-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044414_609608_D8BF3077 
X-CRM114-Status: UNSURE (   9.23  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Ethernet IRQ GPIOs are marked as gpio-hog. Thus, these GPIOs are requested
at probe w/o considering if there are other peripherals that needs them.
The Ethernet IRQ GPIOs are shared w/ SDHI2. Selection b/w Ethernet and
SDHI2 is done through a hardware switch. To avoid scenarios where one wants
to boot with SDHI2 support and some SDHI pins are not propertly configured
because of gpio-hog guard Ethernet IRQ GPIO with proper build flag.

Fixes: 932ff0c802c6 ("arm64: dts: renesas: rzg3s-smarc-som: Enable the Ethernet interfaces")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2b7fa5817d58..acac4666ae59 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -193,12 +193,14 @@ &sdhi2 {
 #endif
 
 &pinctrl {
+#if SW_CONFIG3 == SW_ON
 	eth0-phy-irq-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(12, 0) GPIO_ACTIVE_LOW>;
 		input;
 		line-name = "eth0-phy-irq";
 	};
+#endif
 
 	eth0_pins: eth0 {
 		txc {
@@ -234,12 +236,14 @@ mux {
 		};
 	};
 
+#if SW_CONFIG3 == SW_ON
 	eth1-phy-irq-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(12, 1) GPIO_ACTIVE_LOW>;
 		input;
 		line-name = "eth1-phy-irq";
 	};
+#endif
 
 	eth1_pins: eth1 {
 		txc {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
