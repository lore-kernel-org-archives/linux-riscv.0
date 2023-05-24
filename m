Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A855C7EE2C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5Puv2JyVKtFKN4r7Gv7g0yg/84vmCJCZmFIPObpbWY=; b=WZ/fM7r8OKwJZC
	+wG5sdcJlNtRCsPFhbmOKJpnpXnzW6CC6esRySHyVbmUN4XvMCufzSs0ExhYDA1ql66FAIQKDiRwj
	ZPodbML32DdhWHtkJawPPnIxqXjhcEzuRqsFx6RaSZqaqVwHn+CZBmy4Ez6yBKtubvC13rGjwyuYK
	YHfincH6C2pA53eysuWHqMpqnFoEfV1xJ7ZnmtzCnLdIRfMe/9aBuzh/MUAw21DnYysvo8rgVVPth
	f/EzSJaykLupi6Thn5YSVsYvk84I4ZrFaHZsK3Zd+hg/LnRNNGOwZpA2SQSViNVQL3FHilzCDe09T
	BcQqesTblvwiJLwTqaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jrR-00ClvD-0l;
	Wed, 24 May 2023 08:28:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jrI-00ClqB-2R;
	Wed, 24 May 2023 08:28:39 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so571353e87.3;
        Wed, 24 May 2023 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684916915; x=1687508915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3ShG8niWENBdEZ1rwxaaLlhweWqDlNMQKSkikRPmcw=;
        b=YSChDKRWS6Imw1L0SeB0IN6ZuM+a/H/oZ9Dr2NBh8Z3CYULLmn3sKhuyvZ4Tq1uXiB
         zeCRhi/rmvG0Cy3xXJru0pCR9BDM1JpS7dakQIrY+ocdIHdWwLJMTRbKdo+cXDdcA0vA
         8Y160G8RlYOxsUBYwoSDVLppHrG8SJ+BQFb1Lk5amAtVRzIFEhNcyR8EIApjB5qnwx92
         2zqb2AZeLegtoXywRVYy4nZnklQ7BXaotneUPeAHSJGjeJyOnsP0JvyI15xaXkOKSF1J
         4T76Cj6EKqyHICQzEJJNwU7Il+vyNyd/7lZWvWQ+ig7xb9TFEzjRhmw3KpU7uqAvxLA+
         dgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684916915; x=1687508915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3ShG8niWENBdEZ1rwxaaLlhweWqDlNMQKSkikRPmcw=;
        b=TUztJ5r619F+OHOSOmdQLEFlhACVyhIeMcpKmNP7sZj3cBqj05OR5S55qwS3DIKDNS
         Y1kD40shYcKpjX5qiyg66++BjbvdKuWD9mSd5h2lu8KrGddx+ZJ/0HxKDPNgAsbQ7f42
         iP4N0zmr4OGDF4VuNgTEpX+pAxDFbwSsVihc1xY4wWsn/VI+AhKe/htTTi7TN/Pyd64J
         9QqzlgUr9K5/OJiT56MLkWjMvpa+/PSF2D1bdrxR17m2VFzHXA/28BiuyBUxW5LPZTPB
         G1qDRXRMZxRJmo99G6Nb/97Y4aj5wV+7899ljHyLNyRNWrIjDklWdk1MPY6FeE7UJ7jt
         3GHQ==
X-Gm-Message-State: AC+VfDzHIEbZDieHRcYmE4kIC02vFZKAprjRI7WFk5JcqUewtpQkeeUh
	IVqrz1e7F0r/qAaWwurWEjo=
X-Google-Smtp-Source: ACHHUZ7ERw8MQIwxgY0PwdFaFK9FxBnMmNFE63p+EPeuqhKlwikM0km3o8U8SsH82QTzyVLrEzpGCw==
X-Received: by 2002:ac2:4a68:0:b0:4f4:b378:469d with SMTP id q8-20020ac24a68000000b004f4b378469dmr2500468lfp.41.1684916915157;
        Wed, 24 May 2023 01:28:35 -0700 (PDT)
Received: from pc.. (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.googlemail.com with ESMTPSA id c18-20020a197612000000b004f378fbb358sm1614049lff.112.2023.05.24.01.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:28:34 -0700 (PDT)
From: Maxim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v1 3/4] ARM: dts: sun8i: t113s: Add GPADC node
Date: Wed, 24 May 2023 11:27:32 +0300
Message-Id: <20230524082744.3215427-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524082744.3215427-1-bigunclemax@gmail.com>
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_012836_793297_3017C68E 
X-CRM114-Status: GOOD (  10.60  )
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

This patch adds declaration of the general purpose ADC with one channel
for T113s SoC.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 arch/arm/boot/dts/sun8i-t113s.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-t113s.dtsi b/arch/arm/boot/dts/sun8i-t113s.dtsi
index 804aa197a24f..d269fdde330d 100644
--- a/arch/arm/boot/dts/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/sun8i-t113s.dtsi
@@ -42,6 +42,18 @@ gic: interrupt-controller@1c81000 {
 		#interrupt-cells = <3>;
 	};
 
+	soc {
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun8i-t113-gpadc";
+			reg = <0x2009000 0x1000>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <0>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
