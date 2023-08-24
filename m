Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC39AC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzckXeuAjReE6d/4rABqkwvQYdvSkOxfRrjhg8hikM8=; b=mzaofA9IbUFGdW
	IVwUj9uIW7+ofNZPo9m9tN7INDCekMZvghYtTL0arCn9ddRACIos/3UwFDImlRAhhPMrFgbAyb3Ks
	RvzslWm4+Iu02TujPX96dXKm8Bx2J2jJO5QzaV6/t6vlAOhG/JOChfIv6hBzjtm1VizV0hPTX5Aej
	cHJYVMF54KugFt3rRL0NImvZWbu4MIWGF2gfDC7GofpTvvdoc2kxRQjtKWVr9r0Lik/y1WT4COHt9
	tsKHrXHNkq0isP6mMz4WAa8xdbsvej5A9ktHALNBbIceuojN9JLrPXDZ8OhqR+fza3k9lz5M6ipGf
	fUCmTd67dptTDspK81tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ8iQ-002zSL-1N;
	Thu, 24 Aug 2023 11:41:30 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ8iJ-002zOQ-1V;
	Thu, 24 Aug 2023 11:41:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bbad32bc79so109909101fa.0;
        Thu, 24 Aug 2023 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692877282; x=1693482082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYEBuXLu4uE2kJ2ozzMWwnVNoOekh2iwP5U6RNf7wSQ=;
        b=IKtvF8nmYy3jZ7/tJ1ocNP83YPhmUOfU1ukKLrZoQ6NlIktkzevrCQrmnmiW4x0qzW
         HBI4kVl2oTb/QFXqzblfGXbqZ9nkrWF3UbKlS7ie5LUa3Ewrwlmib/AGoAa+uXp/sq9L
         zpWyllOijHQbzEjlhrDvRBGgNtKdereRvqMDxclED6/MvyPD+YZX6RGlcnALjWO44THx
         1DjSTu8htrFdTfgfjsHEpiwzll6TF1HKu5m6j7ZbCYBz3WXvGtXvNWf1g2FVfPbFoazR
         WGvenfJw+bnejp3NWw5nt6qPME6QQLaj0sszl3S1ryTnnViYmWGUSB3OK2e3HnZ62lFg
         056g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692877282; x=1693482082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYEBuXLu4uE2kJ2ozzMWwnVNoOekh2iwP5U6RNf7wSQ=;
        b=MBTawuxbiofigALpbcJvkAUUhyXMxX4sDHuC8lO5Q9QnM3d8AM07TS+ON85wsBtsHL
         Whay9Ll/3szwvZpij6kTZ6qoG8/jrtC5BUojV42ckhjeEQoMJfmqD2ApaaNw8olFIVEj
         RMOxqF4+N4Q2nPQP4mNx/bCI81kdYne/Yi2+gRwj2n+PyK6UVIzf0jHtzoMV2NmlyhpN
         QvhgOOvK80GiekfKavG8STvz8Mthh+bKwECVPTSXePhER/SSCaraqwn82bRuYknCzg7k
         cCC4j/SHMYV0TsbRNeJLbRvhAd+jRHUXn+wERzrHDYI191XgXk70/HrYq2ekdLm7OmjY
         oBCw==
X-Gm-Message-State: AOJu0YzlCoMvURUo1U0J6A4iF3/V2N2cr9DKIvS66zXBs/ZYTRPPIaV+
	pahi//VwwEC8WPalKQP2Hw==
X-Google-Smtp-Source: AGHT+IGosD9atNDiPZaywzwFkj+U9Wv2BBqLfQ1/+Gnx3OMtc/Isue8TDcEuNM0sXvJzNSBzWrxEzA==
X-Received: by 2002:a2e:9e09:0:b0:2b6:dac0:affe with SMTP id e9-20020a2e9e09000000b002b6dac0affemr11525371ljk.31.1692877281745;
        Thu, 24 Aug 2023 04:41:21 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id o17-20020a2e0c51000000b002ba053e1f9bsm534568ljd.35.2023.08.24.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:41:21 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 24 Aug 2023 14:40:27 +0300
Message-Id: <20230824114038.891493-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230824114038.891493-1-privatesub2@gmail.com>
References: <20230824114038.891493-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_044123_503261_B5F3C4BC 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
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
index 922e8e0e2c09..c4ce13ab9512 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -127,6 +127,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb0";
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
