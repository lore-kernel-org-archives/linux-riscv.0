Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658DFC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUTAbvZo+laO6wVpph/5HzX0/QWLa+8lbCJjaAHj+cE=; b=TV0l9ylHacPn76
	dyp/v0iBZ8PV288wV55vChWkzShktoSoipTgWz8vZrvv2VrFaQoqGFTTawr7nj0m5tr/2I9Qdl4oP
	OwM3DGoQz4hHbnVEsOI9mTxZAe5AuaKalwQVTkBOR7Fw8WY6tz7LT7TOtXt2u+EWTStqyoXHpcCWV
	A4H5zCjaj5fBm5WQlrHaUZtrypZuOcMi31EwZ4ry82wJW+zAcCENxGsk/4/1J9/PBZV3nhN1t9iwW
	2yFfFCjxXzDKi8DfGBCFu5BDHxrHZc2l5TkRfd8tBwnt8tdCyLoXzzQCpFNuYDAIau8d2TfiQ2X0z
	LwXiULgfM2x8wXd6wMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5iN-00DOJS-Dd; Mon, 21 Nov 2022 12:15:55 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4d9-00Cmqa-VY
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 11:06:33 +0000
Received: by mail-lj1-x229.google.com with SMTP id l8so14069721ljh.13
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 03:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyWwGeNhRFmvWfv+vCOYlIM/UFkEFOWpWKA/JfKWszY=;
        b=k1zR2LZGJzgjCfmMp4p4sU+lt9Y/jVgcaRyvmTurxH242gX8IQXQ/MjQg7EUV7qPIt
         Uocx5kN58tws2Qih7DmeyVqq2zI1PiY7WtbxX0Vqnp47COj5UTsxlGsTBd5Wl+uEIrIM
         znlDN9X06BKuJ8t3bWEeuK4hDuMdNeiwc7hmSsyJuwHor8VOB+IozAqcJtzsXFTFSqnp
         BAvpVY23qpQTdFU+5YR6MFtjqOF7YDE9y2+1WIPKLJz8k1FKV7oBPXJ1iT5SNYu8EFn4
         aIlRvpPlykkiIQhw6Gzo5jqzl0qGOlMgAgnCb/uRZuFaGL67r5tTmVBcXdviOBviPPgy
         Le7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyWwGeNhRFmvWfv+vCOYlIM/UFkEFOWpWKA/JfKWszY=;
        b=hZKfJLMlT1emZPhZ9Js6JJ8eojPSwg8X0DkY7c1QY7eH+Vjxv1WL+7cYYY0srBLXC2
         kHYlUsOncq49hDf0euN9v/vRBuCpOq02B/NAkj/QooTM/txFO8W3vNK1a+/UmCIR80TG
         ZeBFv7SakN6y+yGMZLzWIXYRwZQ5tF+jn17tFm+yIKSF9Yjzce3BT2BSjzBWzoRKv7cW
         H3yjYY5uQ0JJFNgRreqlDHHZ/rKA2tXd/5oUvAAuguaDBQPL5M3/6eX8Rrp4sUpyKYl/
         Cq+wc5IPG94Tqyg2KFh+xx8ENS3Hs1uO0Efor5OH11FBKBO0O3mlgKTJFtDGLr9OmP6Z
         nC/w==
X-Gm-Message-State: ANoB5pk4eohIGdKlzjEswBWLIykMXx5seMGfG4+d5QPXS65cKe4Xzl7p
	fBQS9w8kSR0ugizquPbUa1wIAg==
X-Google-Smtp-Source: AA0mqf6U7Ox5Cg3AOmfzFZsyMueM2uMreFj1RmdNjod5QJ6XQGeJ0gdoX1HOEA4iywF9yX/nrfBnTw==
X-Received: by 2002:a2e:9786:0:b0:277:2e8a:bc59 with SMTP id y6-20020a2e9786000000b002772e8abc59mr5136640lji.344.1669028784202;
        Mon, 21 Nov 2022 03:06:24 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n1-20020a05651203e100b0049313f77755sm1991521lfq.213.2022.11.21.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 03:06:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/9] dt-bindings: memory-controllers: ti,gpmc-child: drop redundant part of title
Date: Mon, 21 Nov 2022 12:06:08 +0100
Message-Id: <20221121110615.97962-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_030628_060692_DC9A2511 
X-CRM114-Status: GOOD (  12.96  )
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

The Devicetree bindings document does not have to say in the title that
it is a "Devicetree binding", but instead just describe the hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/ti,gpmc-child.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 4a257fac577e..383d19e0ba26 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc-child.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: device tree bindings for children of the Texas Instruments GPMC
+title: Texas Instruments GPMC Bus Child Nodes
 
 maintainers:
   - Tony Lindgren <tony@atomide.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
