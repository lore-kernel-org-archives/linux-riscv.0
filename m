Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DEFC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qRzQZ2roOfFxb4K4JHkrvfpwgDgBMtYMQpxbCWdxbnk=; b=ERWiYUQ86Fozir
	View8WKsX5wRhEKgEOD9fM+DdO1o/Mz3/g0ohyR/+qDS2aMrBmq48F1BbTeHYRgss4xtin8ZJ5yFk
	txu8BkTgPjVKWIADPKUla85bPUM10Vxr72M4k8GDeWEV9f913OaPr8sMXJqoW9Es1Q3lvca2xiFnt
	AsKcb6C9i4XYbu6MpxRWlOby56+5bmBUGSj7HpnE8Z2LKQ/2Qf4qPQ4kWPrhXVq5AivjqfWVN8dW4
	mq2gIuo928Z1JV981f6O5NSdLKEPOcHKvyGE1WncZffRHTOr2AyyTXF7gXplY22jDITJn0HTAyUKp
	vGoZDRTIoHzTbCQ8MlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8poe-002qPI-UY; Tue, 05 Jul 2022 21:10:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pgC-002nIO-RC
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:01:58 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2732040A98
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 21:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1657054909;
	bh=bQMwaeYKMT6usnwDyo75UwU6twU1bHQlELRjvpkCaBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MJNHhJA6xLXtRlxAJ6d+Ku5q9zmFXFuG256+5KoQdf0F86q8w9MgLQAxrJSmc44mx
	 QsHQM/iMnGD8NWQI4J74m+m/ysiVEN7fMWAUgcJIpdS+qsQ8iaZn4g+qiOvVs9+OqH
	 D+NPrt9/dVv6svaP9RLc6FfmrDaL0wC1xm3LvhCkTHY+wdSgGsWPNvLhGKFgPYyr+S
	 1suZ1i7cCDnuqxguERcpkM6z6BXEsKLz4O8NgcEKq63WaKBTpRsB0WcdDih3P1Cn8E
	 9kQvXiqd58VHyyz/dsqI/BCgt5i9BinPpCGo4DUE9w8ldHNzTUEBs3EvhKgY9elLrq
	 CWG0KwlUj3t2w==
Received: by mail-wm1-f70.google.com with SMTP id i184-20020a1c3bc1000000b003a026f48333so5737665wma.4
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bQMwaeYKMT6usnwDyo75UwU6twU1bHQlELRjvpkCaBs=;
        b=68pbniVuDBUyZ86x1kPlkstGbCHKKX1BnV3jUlfJf/rsMESFEScduSzNiZGK28VJMe
         mrya1n+o+z9vyhDl7/K4ndxw2kF7mZNEeC2j59Y2Ez3MFPIQz0UX442a2eYldPO9aEKg
         yeySd87/O6wPpCa7o7Z+0lchKSh/K1zyFnWo2HxrZLMfBJwqYvhNBfI0rrEC0Hiklqhq
         rXufmLCxGZ5K+f1vm/J+UcZn2xDs0ycobraEMKR/0XMhJGHxVpgTFUxFj2+EDDvX9alj
         8e9MBvjYD3RzCpxCxG3JtxSp3WYi7msbgl0/zMWC3nHjTIIZYIgxTT/llsK+WI/5QSvt
         GeRQ==
X-Gm-Message-State: AJIora/E5m3E8ci1OPhfZoeQHpTbTawNBre2iBOCglcHiDgx9GiEe706
	5lm/Xr2dUCu3BGvGPrEHfnoKgxr9lcQhqw2vD2oHcQMG69ESU7arQHH6VbNqfSLPP4M85ZygHMY
	85q7T6lz4yBmoyxTTurp4/rqyQ7ScJOYg/sPqEUCl8bMzLQ==
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id bg42-20020a05600c3caa00b003948fb80716mr39682318wmb.105.1657054906726;
        Tue, 05 Jul 2022 14:01:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tZxXj9wYCQn8xRiwSdoNr+XF9lf5AtfECiLDauDGWvaTlvbMHbvHq3GJc+TGPSmAuxJVR2KQ==
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id bg42-20020a05600c3caa00b003948fb80716mr39682293wmb.105.1657054906543;
        Tue, 05 Jul 2022 14:01:46 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm2517667wru.28.2022.07.05.14.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:01:46 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Vincent Pelletier <plr.vincent@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ron Economos <w6rz@comcast.net>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Stephen L Arnold <nerdboy@gentoo.org>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	David Abdurachmanov <davidlt@rivosinc.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/4] leds: pwm-multicolor: Don't show -EPROBE_DEFER as errors
Date: Tue,  5 Jul 2022 23:01:40 +0200
Message-Id: <20220705210143.315151-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_140157_072162_F7C67E7F 
X-CRM114-Status: GOOD (  12.42  )
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

When requesting a PWM it might return -EPROBE_DEFER if it hasn't probed
yet. This is not an error, so just propagate the -EPROBE_DEFER without
logging anything. There is already dev_err_probe for exactly this
situation.

Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index 45e38708ecb1..eb67b89d28e9 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -72,8 +72,7 @@ static int iterate_subleds(struct device *dev, struct pwm_mc_led *priv,
 		pwmled = &priv->leds[priv->mc_cdev.num_colors];
 		pwmled->pwm = devm_fwnode_pwm_get(dev, fwnode, NULL);
 		if (IS_ERR(pwmled->pwm)) {
-			ret = PTR_ERR(pwmled->pwm);
-			dev_err(dev, "unable to request PWM: %d\n", ret);
+			ret = dev_err_probe(dev, PTR_ERR(pwmled->pwm), "unable to request PWM\n");
 			goto release_fwnode;
 		}
 		pwm_init_state(pwmled->pwm, &pwmled->state);
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
