Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FD0C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 00:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWG1dcx46CtCATFsdl0WL+Hi30JGs+A5YJUJXpRSe9g=; b=gl7eCIJrBrl4KF
	+PYwr4fSRfDw+7j/GAVKRm3/o+AkthO4tfjZRiV/XEOY4xDwcTxMbeb8fVHSmt8Z4O42Xqq8HovIn
	g5Wgeu4hxGU06xbukxxfCwk13s/tGHPLvKjRcbbqVn3Muhch/GI5v/AgAAn3cARVELMWe1USgDmDs
	lYoV8GC+CkMMLBAEghs/yii6CkwrBoIp0aPYV2Hfk+a0lMgCryBpPJW0IcTPHEcvZmGwqU1WLHBcv
	x+MlrAjGwScqSf57En/oP5Py1SGXiumXOuubx9NiSBHxH9oqL7eUt0IXdyfrQg9LhBkIF36g/z6Ic
	vHB8bsTD+aA7HeWBDbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66i-005kyU-07;
	Tue, 25 Jul 2023 00:40:56 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66e-005kw7-09
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 00:40:53 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-56372a369d3so2335167a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 17:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245651; x=1690850451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/7J7W9/s0ktyQK4BY9a6mNX04p7bPwNQDg3KLPOfkM=;
        b=P5bkF8Z6mF9jk7ij0sXr0gmtxntUZIEPfvXkrIF5IsH4hLgRx7uXgVHGdw5At7g9qd
         EENZq1PvE3GQ3V7NfQaS0zxIPvN8X8ucMSct1aL1gpKJdet4RL1Di4ZgSgUPId7oBV9H
         2q8aiXT314DQjnF0Fp32oaIGuTNVoR4SOdxUQsSjNcmCqNb+LYM+L099s9dMFdO6FnCS
         NblA5iwYPRSHpSu4CuxDq/BJR/twkmJM8N00cQr4K87FOhR9jLffcoUTfc237osg2sqQ
         JvvfkMyM4pB0FOC1Z38yOrvxbqlqzoH/8xa7xdzUZjPxlQeQfZQtfmFs5GvK3j+7AInY
         WUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245651; x=1690850451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/7J7W9/s0ktyQK4BY9a6mNX04p7bPwNQDg3KLPOfkM=;
        b=Ev4oy9Hmv4aEbHM6ebLxM3JNIzqaAXpOMfICr8uI4U5zN+qGjJfs7dCqqPvfkl8Z4i
         ygYjxEDyoRv2JATNjBg0BBnPRu9jKFmcD/CCC3+Gc85dHOb2vHcXKS59uhkV6yqm3OC3
         0zIUaViU+12EFCSCCXalBQuFFxYXcdzat+nP66agpEQOtTiswaYvNRg76w456Cv0FjNi
         d51q7Nfgig9jPdo39tEjxavcqJQMBguAajH90rw6I6nyzXXnCfgMEyfcZ/0KmzSzW0Ok
         1NZSI50LD+A+elvvKgTaZOiCrhR9FqE9kQ4iCNESi7UN3JVrpZgejt/3FK2cMzsfG+yq
         aSbQ==
X-Gm-Message-State: ABy/qLbmj5zlIKJxO2bmS1yHzUTaI4V6CTXve9blapZf6mIHLmEjZ0E5
	Yd7hSqcpTiobx6kz2VS3Ujtyqw==
X-Google-Smtp-Source: APBJJlEPq4iZZyiipTRgAqIyXg56eqA2/VJM2xXD73NNrvuCdDF9GyOVyXgg+dj8FpJWzMor2BH8OA==
X-Received: by 2002:a05:6a20:7d86:b0:137:9622:17d0 with SMTP id v6-20020a056a207d8600b00137962217d0mr10548315pzj.58.1690245651000;
        Mon, 24 Jul 2023 17:40:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id be11-20020a170902aa0b00b001b8a3e2c241sm9528297plb.14.2023.07.24.17.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:40:50 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/4] gpio: sifive: Allow building the driver as a module
Date: Mon, 24 Jul 2023 17:40:42 -0700
Message-Id: <20230725004043.381573-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725004043.381573-1-samuel.holland@sifive.com>
References: <20230725004043.381573-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_174052_088523_E65D90A7 
X-CRM114-Status: GOOD (  12.30  )
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

This can reduce the kernel image size in multiplatform configurations.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Add MODULE_AUTHOR and MODULE_DESCRIPTION

 drivers/gpio/Kconfig       | 2 +-
 drivers/gpio/gpio-sifive.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e382dfebad7c..1a8e8a8c85d6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -564,7 +564,7 @@ config GPIO_SAMA5D2_PIOBU
 	  maintain their value during backup/self-refresh.
 
 config GPIO_SIFIVE
-	bool "SiFive GPIO support"
+	tristate "SiFive GPIO support"
 	depends on OF_GPIO
 	select IRQ_DOMAIN_HIERARCHY
 	select GPIO_GENERIC
diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 3545bc0fad13..bbc58ef0b6de 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -266,4 +266,8 @@ static struct platform_driver sifive_gpio_driver = {
 		.of_match_table = sifive_gpio_match,
 	},
 };
-builtin_platform_driver(sifive_gpio_driver)
+module_platform_driver(sifive_gpio_driver)
+
+MODULE_AUTHOR("Yash Shah <yash.shah@sifive.com>");
+MODULE_DESCRIPTION("SiFive GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
