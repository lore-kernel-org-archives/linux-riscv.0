Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6770AEB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djpfVY7DD3PqQDSn9ptG/qYrIiW9KvE+OBgfgiBiT6A=; b=mtrx80N5jIK1vu
	Vd7mUhGwU1vVVmv8LKvDEBewIT2syNJIgdGv/yjUulJZzy5V7LrROIx3KdKffMJXgslNYos01Z+Jp
	lBGPbJ4AyWHSXL0haA4HBQ1kPp+bUU0T+M/mLrC07Htmzyf0dpM37FY4oMKARh9hh/+YJNg2/e57X
	UwKJmSyREBPNQTRGrTIxqCtGQPgBPCXu139rmucDmCW4cr1bZlqT7XA6yzFQ+BG8miLm8CEHPjYmy
	/IUumjBuk4mlz2XFsZST0STwVPeGGn0W5PtVQHuiIf56z4SzmLPmbMX3RW24/mIGpqgPHjm5ubToD
	q3bmgeZEIKohj4WzL2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9QYI-00Bka0-26;
	Wed, 14 Jun 2023 13:28:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9QYF-00BkY6-07;
	Wed, 14 Jun 2023 13:28:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f8cec6641bso8103575e9.1;
        Wed, 14 Jun 2023 06:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686749321; x=1689341321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPsNG/FZ1k4UaDSBhJRqncRzudNFaZG2hOicOFjuDg0=;
        b=AsIeycw7JKSVlX3rZAXj0VwdwEpUA2cD5kZgqIEd1XvHiu3ykvduo88KsTKzKKG3EK
         SWDNmkagjHwGdbFJQq6vXAtCthe/rufzfteujq9byzWzQ5TviAGm9c4cwtSHU/ZJlg8e
         yossznwjncroo/0G2M4iKun5LidbAiOGOHK32rSnH6Gpr3cZgGKimytAH1H8i5wk5o7G
         go0PvSQ2v5/yxUeA3E0MIB01DEJwOQYj2xuStS5IVs7/ierzqgHe4jjWqApZdNMS8lb/
         EB//F+xYOiwfy9AYguYRf3LUuJwzU3457PdpZ95KTPsAPFwUdJDhcNcu56qmKs5zd1Z+
         wb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686749321; x=1689341321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPsNG/FZ1k4UaDSBhJRqncRzudNFaZG2hOicOFjuDg0=;
        b=AgdJaIWklnICnXg/duY8dk4HBqnOsWRkMFCACkzFY2MlSKEH4Z60uiHMdYyidwqbfZ
         TZa21Wf2RVz3iNHV6oBLLz0HKudpnTpLywDSJPytdKy79m2jGZlqjH7hLJ4oNegXfwH1
         ifFbofLxMUXm+2zXgK+BO6+A03k4hWb+zTnBOxuE/zU0mgBhpQ5M3Djhhm0KXNVULLMR
         g9uUd7zWSaTi173D6uJkbvGaNtASWj//tewkDHdlvymMHRoWWKCJ15+yYPv8k8WlUT6q
         jQ8dE1v4rcXUj/bqUnrA5ezWxjTLWlH67M1eFj4bv6Yiu86Ri/zqfnqzIzufw2oomq00
         3Maw==
X-Gm-Message-State: AC+VfDzh5QIRSsqbQmakyPZ23+0m7Cc5TlIuCk7wrZa8J7myRO5yKOlt
	Qn5pewRRy0VFOEAQSB2+MDI=
X-Google-Smtp-Source: ACHHUZ6OldjWB/O5w6++CoG5CqyBVydA97jdA46Qv0Hn+Fg2Ncy5riE3GkkDaTbuni9DWvVm/W2tqg==
X-Received: by 2002:adf:f810:0:b0:30f:d32c:ed8e with SMTP id s16-20020adff810000000b0030fd32ced8emr2357358wrp.45.1686749320597;
        Wed, 14 Jun 2023 06:28:40 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b003047ae72b14sm18295017wrt.82.2023.06.14.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:28:40 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Wed, 14 Jun 2023 16:26:27 +0300
Message-Id: <20230614132644.699425-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614132644.699425-1-bigunclemax@gmail.com>
References: <20230614132644.699425-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_062843_075472_44CA0BAD 
X-CRM114-Status: GOOD (  10.09  )
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

This patch adds declaration of the general purpose ADC for D1
and T113s SoCs.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..90c79041cfba 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x1000>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <1>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
