Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62979C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73AKnxU1f0qnhMFsxhj7ApFhi0h+uncsdGCPDDyYHnc=; b=A32BmQz73jF0i9
	rtzf575FjQTBauDG1kPyqPPeJREchnCnY8T8+lKPG/I70W5D3xtbeTJ+ZxlWlYFQ9kJB2UGonsy0L
	0Ca5masQ7miGPlRrJ1hXzWu1VlfMLzEj4dLAFvdCWml1J7Zw9PnrXOzJvVsZYB2wGS02cujskyQfI
	vmm/yPJppWKcQk2ARIuqpp/SkgXGvFtbbg87Ie+7S22SeNZIFWAvPa1jujYjmDpgGIcy3c76yvE5+
	IiChpziaE/1rtNXdL+lK2nEFfj5SRIjXygxCGBR6xC2aAsk5q8HN6amSP5TFgA21897Ve9PtDjNng
	WXqX7q82XoCYF+yI/HgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVACa-00000003TpP-0sJf;
	Wed, 31 Jan 2024 13:00:28 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVACB-00000003TTo-2f1o;
	Wed, 31 Jan 2024 13:00:06 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-51025cafb51so7505797e87.2;
        Wed, 31 Jan 2024 05:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706706000; x=1707310800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk5axihAKFS9+0dIUTMZ/jrL2YTkFropx3eyJ2mG6qU=;
        b=XXPay0935Bp3pcCfiTxOn6Snscj9Nw7mGd+7gjuCwgc5LUKMv7ZsEJ3hVQtIp2WKqV
         KAdMVnQgC/mEGsxAREUUDhlKEiuI6DSRsck4312ZRQ6EtnZ3Cc8B/QrXq4tGIpXDqGCn
         wG/PCG0hnkKev8JmTsTOdoTVqhUQeuxAp3cKJsrzWzlq5C8+W48kVU5QWM2v7/7o6LiV
         bxqMEidvvY9UuP+GgLkogYAp6+ZM9369xaWoIQVVpOavqXhQiXfpDE9eX2XQGAg6etl+
         2eneFQJHS79KiWae0ZRbl3wBarv6XEVpx/VLPFXzcgCzDtfRQJbRWS0x3TzSKcQiaIz2
         +Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706706000; x=1707310800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qk5axihAKFS9+0dIUTMZ/jrL2YTkFropx3eyJ2mG6qU=;
        b=EYGM5gI80pwV/nUPGWTbaVpk8itS3amBZfU61xVQYpoPfZ+1nci7PmKeycitnMisb5
         s9ZLDtXa45W8xcav5kKFWlXL1BkqqKjz0dZXQ57NSbIlCmgDutDx5P+PE8snq2PevdQ9
         Vo6Ol7xeDXsVQRPgrCYeIFnRJ70/3wJKtKDM60NT/SKNpjMzCNs663SitWsC4kZeqX6S
         ivtV9/HMc0oJe2IIdoOwcjC9S4iZA1VXn3qvXK2OJRZ6shMaZ4tniKZS1k2tTQlo+jgo
         cBbAM6j18gdqe7V+qV95p0aMYEcWU3mBDMD0A8vLO/3Dr8OworeWqnhwPIb0n24ahDWj
         ZTnw==
X-Gm-Message-State: AOJu0Yxaw92L+7QpsBH4rCE3NXOZWq6wwt7+AwMlx1hOGok+a+V5iXLn
	wluPIJKfm4yZ4OxQzM8zZtGiNI3tpob6VJCEXSX6kSn8R14GYb8=
X-Google-Smtp-Source: AGHT+IFlj/2UQlXVTsP85U+sX9Z4Xg+m+7M8urgFGxXNNIrMtV2ixCb6BE8A2Y9DZeChVhyFjSIIgA==
X-Received: by 2002:a05:6512:3b93:b0:511:1ed7:61bd with SMTP id g19-20020a0565123b9300b005111ed761bdmr1608967lfv.54.1706706000644;
        Wed, 31 Jan 2024 05:00:00 -0800 (PST)
Received: from localhost.localdomain ([188.162.49.60])
        by smtp.gmail.com with ESMTPSA id h25-20020a19ca59000000b00510faaa62cfsm1361135lfj.222.2024.01.31.04.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:59:59 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Wed, 31 Jan 2024 15:59:16 +0300
Message-Id: <20240131125920.2879433-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131125920.2879433-1-privatesub2@gmail.com>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_050003_781094_6C718EFA 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: devicetree@vger.kernel.org, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
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
index 5a9d7f5a75b4..435a1e66aa6a 100644
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
