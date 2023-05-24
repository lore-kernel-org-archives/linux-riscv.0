Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C070C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/cKxRklTEG1WfHzL+8fBQ+IiaGgm1v0hxWxDj1+Usg=; b=gNREUzfBrR/lLB
	c0vM0+evYZoEIwfSqSYNPm8yS4BsyAAtLsEsaaFYBtWJU+Ll996bPlXaZMAaJnERhai8xkhU6q/zG
	W0X8BbibIFV8Hr4yX9O+UJ/3KJ3iMrfpyA8N+dYCHxroypAvZnTcxAFs058XJUDuB43nuFMbn3knh
	dQP2LhMW179hlrHaVUO6gV+Y+G/OBQu+xL/h1I4+574ickw2vWfwqJR+D1d1ZIr53IkyzXHC5h12o
	ihezfV6WxDnyhKqAX8DHxvdFApNK5Dgum7AgqaCjNlYByaJ7sZuRvzBcTt82TtOR8jNHaAMmIQFds
	S+t/UDEBXJpat6TLkXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jrc-00Cm1f-03;
	Wed, 24 May 2023 08:28:56 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jrX-00Clxc-2m;
	Wed, 24 May 2023 08:28:53 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3b39cea1eso556888e87.3;
        Wed, 24 May 2023 01:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684916928; x=1687508928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odFoqtaACFFyMrXmxlrRHYMZnaIGXqlcjA/Yeo/eMSM=;
        b=Mvd/veDyjuxX8uDcTR8PI4Xqf4ovhcjx5jyKNU3IYsLv4K4TWPiwQuH7PXLRUsd1lc
         FyfsPiUqwOq7sGQfZ10bL3H78meCp0oJsj12w7ytR5d0mG3wDlkzIA9amxl0LHWmdIa0
         nXTGfbb9SYE29Q/mKKsF9fX2N4Xee3qGLqoiTf3mpGpaRyyJf2VzepfVXB0Fj6tjE84u
         Wre8p0Iu75GJoNJ32N0Rhj8avsw8FRrCTbcV0NFk4oNtz1jQj3MslC3Ps8lUxtC0cQd/
         6c9GVZxKAzA3NmOekitk+/TRT6AuwtmWI3YkDMpKlpGigNvSnPkbhU9lCm7b0LEp42gX
         ThBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684916928; x=1687508928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odFoqtaACFFyMrXmxlrRHYMZnaIGXqlcjA/Yeo/eMSM=;
        b=iLwTiD6eBFy5jP1ubDSlLXTT1+QLbYGEkqXYlBbAZRihlhCKIf6xLURObHAkmuum+n
         LBgcAw/hEX7tbvvUh72JfQyZjwgNwVkGlD0D49CW0BEpmMUBmfLX2wCdcsCNfAhBC9/n
         X1tqRei9FMu+eea+c2RPse1qYkApURXE8NKWq1xDs0HlLfScKfe6HMZyKbfYxr3LgNjp
         zVkHzZMHJkWjuL/rnvGJYw47AVbw3+hBM1AUsMsPoAx0nsXAPtq0Du4WRfLk8XrgYhrZ
         uM4oqYhKNOhYlBpwZdhzntbEBu38CwFvBZZYo2qVT1EZzIzAJXJ9TYvlYDAN89jaX0Ds
         CrbQ==
X-Gm-Message-State: AC+VfDwJz132kXjAS2QQ1RXm9rBPV6BETZTbKtZ2n699Szd1/PWOmDb0
	BoRVrYQkf/7hf15Apk+zHn4=
X-Google-Smtp-Source: ACHHUZ7nTj6ZzaR2KWD9boDc/9z2PyjWBCXVB7avQ4mYjB8ldUrHEw92byKyfbq/IsC5bWV5bsz3dQ==
X-Received: by 2002:ac2:596a:0:b0:4f1:3ae6:20bf with SMTP id h10-20020ac2596a000000b004f13ae620bfmr5776396lfp.1.1684916928480;
        Wed, 24 May 2023 01:28:48 -0700 (PDT)
Received: from pc.. (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.googlemail.com with ESMTPSA id c18-20020a197612000000b004f378fbb358sm1614049lff.112.2023.05.24.01.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:28:48 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v1 4/4] riscv: dts: allwinner: d1: Add GPADC node
Date: Wed, 24 May 2023 11:27:33 +0300
Message-Id: <20230524082744.3215427-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524082744.3215427-1-bigunclemax@gmail.com>
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_012851_906734_3F5F29FA 
X-CRM114-Status: GOOD (  10.36  )
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

This patch adds declaration of the general purpose ADC with two channel
for D1 SoC.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
index 97e7cbb32597..b21825429cca 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
@@ -6,6 +6,16 @@
 
 / {
 	soc {
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x1000>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <0>;
+		};
+
 		lradc: keys@2009800 {
 			compatible = "allwinner,sun20i-d1-lradc",
 				     "allwinner,sun50i-r329-lradc";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
