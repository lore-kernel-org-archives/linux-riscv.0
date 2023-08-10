Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9645C04E69
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x5HuGrxUfqvHrDUdimY6bgcWmeCi0ixPaloQbCkuZeA=; b=lD7zel4dR33Tud
	5zgwrPb4RC1XbNto07IlwAa5J2iPfPpEli7eGZK/ycbdNYvjua2ewp7ST0PhWl8l/6lEvJ5V6QcPW
	zxc25edEsWG1XCK5KzSCwDPC776KryBaVInmdNLdqBoCir2/Xn1VGZ90RPgK67joljBbyXbwXbJEz
	bREC1EGVJm8+MKY1I+oHj9wBcatllufz5NkYSNZZiyGgdbRQ5wW1JU9QDGjVCQSWuB18/orlz8gC+
	48QlGBtVv8X/QUb6Zl9sXkpop434jmswGLUMwssKBCeQJ0aVF2ho1XZKCNpIVDePrPh/ZDp8AARdi
	sYSTG8SNOsDu2tLJzuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU74Y-007w1m-2z;
	Thu, 10 Aug 2023 14:55:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU74W-007w0t-1b;
	Thu, 10 Aug 2023 14:55:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe0c566788so1511757e87.0;
        Thu, 10 Aug 2023 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691679330; x=1692284130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2564u1RCwp6T70h9ImuxER+KFtiLslRkuYUu2639brw=;
        b=rlgexnSBpRWcYGERk1ufOXcDU9xu+ARb+//tL549YX2UPuhsJBZI3Hod6koOcClTTT
         RWirBWharsZNGFKMhKI7SMHLkXLx8n1BROJxo41jqmjKNZP23vPDUtWNcentLk55PlKD
         8FVugWGPicg8n6pQq3u4c3I7TBhVLYN9ZGDLptK6EW0dBsxNawIBbLS7WM+no2IqkXAk
         EBaX7RDuM0F9mPw0xOG4AG5kdGweAy9m/1NqnBtGWVoOOhmM1O6Rxhr6AniRgOzWyxMz
         1PavFZGnmAmi1qRtlfupsWZh7RaOJ0w8U4PFPvnKxC3Jiw8+QBxpRq9q9jPhmwCa2FI5
         yduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691679330; x=1692284130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2564u1RCwp6T70h9ImuxER+KFtiLslRkuYUu2639brw=;
        b=eDp3yWS60HhiTsWk5bdy5LAhbVWush4h75IGG9rytzGKOKmlXJl7QPqO1YUT6tCcZT
         sfY7PUwOM6xDZOO2OQe0xHg/PlNr9fVKdyXSMLDuo98UK+7dGE/D+QJLZXpE6ozCE3m8
         zCgE2DL93Ys+XUC2upA5YKc4xtBaLAEegtK29z7fxPHqRR/TQr0aLP9wcRu5WC4bxv2J
         nrqLxjF5TgewZZ53J/IDZmbVX3Tk+TvFDrWosSpqE+fXTuw7BP3k1aXPuOgVyQnf4jTb
         uVKZdPt4boRAeJhalhcpn6I8mQ3IBcRt/XvAoXmptZOVunMn7zl1a1Y5MyWxSK+IYCM+
         csHA==
X-Gm-Message-State: AOJu0YyMDjPWR4aSo/ds/g/SbqB2eMowFf4v6BCL/y1PB0a4ZNR5jFTo
	T2tv5cx3ENoni3Qx5UA7VQ==
X-Google-Smtp-Source: AGHT+IGYJ3DnAbqcyDEcR2VWIyf3tdxbEXLnLUz4wdNvOR2aNwCwCaAWXGcie5uSYp6/E/zfOc+ujA==
X-Received: by 2002:a05:6512:3453:b0:4f8:d385:41bd with SMTP id j19-20020a056512345300b004f8d38541bdmr1941957lfr.8.1691679329350;
        Thu, 10 Aug 2023 07:55:29 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id p12-20020ac246cc000000b004fe0de39fddsm308496lfo.290.2023.08.10.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 07:55:28 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Thu, 10 Aug 2023 17:54:25 +0300
Message-Id: <20230810145443.1053387-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_075532_532539_877D07CF 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

This series adds support for PWM controller on new
Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
provides basic functionality for control PWM channels.

v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  86 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  11 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 323 ++++++++++++++++++
 5 files changed, 431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
