Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D76FC61DFF
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53oOXq5f1IBAesNilJEfY7Ix6EruQ/n1GrP3wrKU//E=; b=Z560iE1HgZFQDf
	JPFBxZO5WIGOmmac0Mxrg8Cj3RLbXQUG8JaO+5JO38+AzWpMcxnTVYPD7HhjxoF6akieBXQfd2qy5
	pCnphsmP/w47LtyoSFYqn32tvhmbO5nmJ7h2t/G/faeX68PzaLe6CfR92riU4lgF3QY5KPquwCxbo
	J/+KnN6tSxI7dYN9AwbavZ55S3kozwTcXzEQV4QCEFnaJjjpCir8V+tAHGRWrroyg78rAP1L/mfhS
	vQhDEJhdKDuzoCcGaXu2QNEq5pyykpJLvSYFxR8MFiTW2YfhT00vZhDw151Bth/8zXGBOTHRQw/UJ
	fbhHWdkWTH05WSDqYkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqe-0000000GFf9-2yMk;
	Sat, 21 Feb 2026 18:37:00 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqb-0000000GFbg-3A7X
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 18:36:59 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3870df2331aso39859301fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 21 Feb 2026 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771699016; x=1772303816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi+zTY3v+XYAN7MEQwL4QN54NaCqF12xnryOs65hhBU=;
        b=OIgOf1QfBqhxz/3M7OQZmYuHfxd0ouVFI3UtnhAfzznM54NCsaJoX/QJJknzvYJ74g
         +mohxx8SSK5KMQ2dd2I5hre9rcoXJ28hHwK0uLHaiqPAgKPd4DFEufHtr/3SOT+zOfWw
         Q3AZ/1AooNm77RkTUZLALMlJZ1Njj2XCZMigpXeqw7dZkZjImNpFsG3Fhp3HlvFeEejo
         Wf8CIgUYoZRSuyIs3sPlWCH8ukspZzKPzhhDGVC0KdrgR+XDOch2F/IqmUYlNYAEot/t
         DPc0VjCeJSqC09wJ/VThbwD/5+ex6wn6lTxJ6ueUtUJc2tJDGhwbnF3bsx9FLROjbs+k
         UI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771699016; x=1772303816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vi+zTY3v+XYAN7MEQwL4QN54NaCqF12xnryOs65hhBU=;
        b=WEPtNbNLnRAjPH4PhMbHg5z12DD+no1mpViss88jGIH2DpEYb6edczIjBnwKktbBCq
         KYermhJw2ho7QhKpCUlCW8fPFGgxzHBFcaf96GoJ63l8qWFtNLAr9wF9UFOciJlM1jxG
         L46zIqzckw366SqNlANAoDev1azVVnWS/ef//6Tw8tbRzpK+qZFHDsOEByuSvJhyl7y+
         0FRqmoAqhSx2y0eVTX0qSxkLzmiI9zTn7pN54M7T5e+vp7/ewPS0UlAQEvEOMDHsQnsr
         J6f/uMjpMqdZdC5TQQcswTrtqQE59zEJJ3ufJfBTtoXYMJS5LisgUaVEMquHPXiyJzMU
         lOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdvpQAO/WoMhE/DApqd2Zj1myOZxfWBE+1mIRQJB7J7qXQ8qBGrN8pKKPGpWt0ntt1hLqn2B3gs/lH6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2DuzDCcMVQGtEKpxE/qtkEeA494YCUysjLFwFAuH8tyVLoKRC
	TAFJWWWrWr29x8ZFe07zFHZh6hv0t+jkyVcVVzf/XS+eYWSDg/H0c78=
X-Gm-Gg: AZuq6aLi41iOgzwwhLyIUMmXz5AVdW3ntzsK8/u0aGuRHlH5+yHCZtx+I7jq9mj9i+b
	0KNJP+3sckNaPZyEZiEIF2L63xCdk4/Bb1hnIBf/M8D2imR2RhLPCWNUy7TTjh4URLgeB7fsc3R
	JeqFhvCV/FOkHRuzF34QCgenCyFpporPrRaGS0xUerrgugDPmG5ZiGktVWUB7HuI7NJTIxrsB3+
	1qPeAjjS529yHz36fnu1YPlTDHY03D2BjN2Fd28uQFaXkhI729kD3PzFb3LI6YAIz+hpUZfGopl
	tj/vwVuJSqxoP28+94L8qUqi+/Xi4z1/iP/iHCW29WWsngvggwt1laCBwA7A8RIPIglWyviLLQ1
	ogVqjjGXj+Vjg50iotwBn2PqU1i06RtjAcN8mGskK8Z7DLeEvbpg6mt9lPrI73iT6q7k8DOzOfW
	9TXL5HqFU63IVzbtHB+gENP58R8g95XwvRTSPi
X-Received: by 2002:a2e:9853:0:b0:385:b4ef:f667 with SMTP id 38308e7fff4ca-3885335b418mr22967171fa.0.1771699015563;
        Sat, 21 Feb 2026 10:36:55 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:53 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Sat, 21 Feb 2026 21:35:53 +0300
Message-Id: <20260221183609.95403-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260221183609.95403-1-privatesub2@gmail.com>
References: <20260221183609.95403-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_103657_808254_C92988D6 
X-CRM114-Status: GOOD (  10.77  )
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
This controller is supported by the sun8i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 63e252b44973..8e38a0d95f5a 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -193,6 +193,19 @@ uart3_pb_pins: uart3-pb-pins {
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
+			allwinner,npwms = <8>;
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
