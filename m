Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBCDEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdxQEbtXQ9p8zfIVTKjlvd1PWmRZmNxVYnO+6t+mmZo=; b=D7M7ZKlX7X7fJE
	jgZXonxfOzURD6yBXCXlSwZZaM+ipe+DAwDLuVWauIXdXkwEwpj7C8qq9XBCHzqGumHYSM2FEnLQc
	uh2DxnpfbN/xVH6uRr+aSRFOtyrJgOOS7SnN60C0UBRkpo8Kufwhe7oA4sXl8lgLThI7/gwVA+icp
	ujosTZc6iqgkHkPRuGm4fkpnHXR7b7czDsZIWAZdCdJx1hSTiOUBrMihiatLXrFqpUtxe3Gglyz7p
	CfCTtiWjt9nhsh6SYCZDnGL1aBHVfBk2KylP5iTmkyOFa13dkqkEyrX0mraIwYa6eIblxZWEUlvsH
	Sm8AE60oNL6wuwtLvqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0d4-005ieq-3A;
	Wed, 19 Jul 2023 06:25:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0d3-005idu-14
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rPXSCcl7xyJKFXuJ0sfDEh5nIT26utMEmgdVi+YRduc=; b=gB3sVEPO/7gOrb0Cc1KK+PaTph
	z94EMXyGsA/9tbRtYbVxj+WeHfzUilnp/heExGPOG6pTi1bKhXtB8p2x0BVTpj7UOJHcf1Hvi0ZMV
	Ig2+vTByH50CwQYKT3QAixhB9N8Y6ZqbcLJEFMys7EsvD0hGY1QjtEfUMZoIeOXEEsLUAWXyTKjzt
	JzAtweoE55yFR07QU7JV2pqmzL/fcvq9PcbhlIGKsHJiyoQBBUBVi0Bq8mEnVi2QJ7fhA89feeaDy
	ga4VZEkXZWunZNAG7cYKnBoM+aIFGHqmIPHR61lCFNwDCFJvjDfYLb8AmMtG8gvOcbzTFfC94BU5x
	8UWCLUow==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLVGF-009NOl-2J
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 20:56:14 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-55ba5bb0bf3so3030100a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 13:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689627241; x=1692219241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPXSCcl7xyJKFXuJ0sfDEh5nIT26utMEmgdVi+YRduc=;
        b=VzNOXhf+impRuQDbYHrHRlqKEi4dq4XPmar0nNzv6mvU84AiDYv9Z8hDwrbcuh/mS0
         AgX5iAz4at+qFL9Qlc9V9bUmdwa+KLbCIrTMUe+/rwDoMrjNS01UNaZCPQPFEYNXMfGq
         XrOpEMqW2ID2b5Kv7fLAl/V9ydXP2MBLtM4tZYZkv79U6vGznTx8gSRmlBPtNuu83jN/
         +CZvicmJK8bHZurlYy33pU0fBP0I6KRiOPK42VmiMb77zsTfwcERc3OiLqnHUiPRx0Od
         41lB6iSmwxSSceokNRnKYx2C1p2NehPKLu8wdS5NoDzDgEpmu7ywu/phkTrFWHNF6ApV
         tLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689627241; x=1692219241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPXSCcl7xyJKFXuJ0sfDEh5nIT26utMEmgdVi+YRduc=;
        b=W/SNb6gjZfYqKBUjQG3Dgp95+oAWu2U4yygQydr75iXzs8IKAyhNcACqhOMh9eoTPV
         g31iuzFCtIL1MMrRYUUv2hmirNvU3GaVrtH/6eFPuwL72PGrUhtFYecuhPT97tmfdr2K
         DilplpIMXTtIrgCFCC2vKf8D6vVJdc+OjFH5Nf7fWXJJN7QjJEx3xgQABDi23x8Nk82A
         d1wVnHmDFjI+fIsJhg+jyEeAgV5q16ci4nrDVcYQ2pH8iAv2RlRJfwQhtvLjpDKodM+w
         3z3iLOaR6N4yD9lVC8ZsgLtStQ5Yf9zY80xGvualXnVu2EtNb/S7NYoRTah8bBXUwWp8
         5tIg==
X-Gm-Message-State: ABy/qLbNUrLiVG8zt7g69NQ8QwikurcLllc+wLw/H/HnHteQ5D8uO4n0
	3z9califm8PPnfsnPu7sIa6Tqg==
X-Google-Smtp-Source: APBJJlFbe5gZF2ECwUGmiCHxgLHRY+XuBGqvvTomAJ08QQZ91YYr4KT3oREW1N/N6BFQf7ttY64AMw==
X-Received: by 2002:a17:90a:a614:b0:263:f3d0:7ea2 with SMTP id c20-20020a17090aa61400b00263f3d07ea2mr13459056pjq.8.1689627241539;
        Mon, 17 Jul 2023 13:54:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id z8-20020a63b048000000b0053031f7a367sm206991pgo.85.2023.07.17.13.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 13:54:01 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] gpio: sifive: Allow building the driver as a module
Date: Mon, 17 Jul 2023 13:53:57 -0700
Message-Id: <20230717205357.2779473-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230717205357.2779473-1-samuel.holland@sifive.com>
References: <20230717205357.2779473-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_215609_142409_174AF74A 
X-CRM114-Status: GOOD (  11.98  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpio/Kconfig       | 2 +-
 drivers/gpio/gpio-sifive.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
index 745e5f67254e..5941a817491c 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -277,4 +277,6 @@ static struct platform_driver sifive_gpio_driver = {
 		.of_match_table = sifive_gpio_match,
 	},
 };
-builtin_platform_driver(sifive_gpio_driver)
+module_platform_driver(sifive_gpio_driver)
+
+MODULE_LICENSE("GPL");
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
