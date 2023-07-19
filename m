Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAAFC001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMKELCgzsi/kpKIXHaTKV3VRb9HQaD/Kks24jFf5QWM=; b=h3YPzKuqXicTgK
	QrgNecvtDwOsMFQ/l/sJ6UtKiLbRg2mkrBPFSXPPNt/qmykkGzTmuIeRy6BWr8uVpG/FziN1hdM7y
	9Tq8jCrUEW54EPDFaaOyHtolcDbVTMo1qj4A+A+LAWkEwkOoNEljjDcuhe88OAi4WTJysP1lSadM0
	vMypFGjTd2q0PQDX/9u3WKEinFADzDcgTrMFcDa3F5lEkwzFuMFjvtxUwzyjZZR6AlSJa9TRpvizP
	XBSL03XQfkfOrQntOMSRRWBXycos4J5TDsqcvUwnHLx857BzuETv0ofsuTwDb8q8xr/tkLkMSTh+r
	zuNs8aZPnbPTOBYGpC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8e-0089YS-0a;
	Wed, 19 Jul 2023 16:34:56 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8a-0089VJ-03
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:34:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b852785a65so7322245ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689784490; x=1690389290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3Vmf1NOG+ODjCHOgvNL111a44nf8BOJMta6b8HQDok=;
        b=KM4n0tGjZndeHQmSDMlsp7ofZX/LnEb4qirUfsAM54X9Oy82L0EZEHRalHPNnDygG6
         nNx8cSdB5UYvQ/u+WH4OGpsBvnwtGTv2kudZfZ7ShkkiQauK8i3dA2eaFQwDICEyTDiA
         FOTbe5VBBGE6ukx1/g8oMY1+FT6DFqHeDxFS1sLciRyq295/ddfMs1GkCUjXxbtD8B6/
         4mIi3jh018Joh4zJWwGo7ikDeLCV0a2pg+1+judZ1neV+8/tFxzqjyWxWN5qPIE6WWdD
         Ys2+SxdHHuZLUcEIQr3Tehb8+F4be5mG7as7vi4F8o97xpSw8PRqEqxRlBxQJdZokZsb
         X9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784490; x=1690389290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3Vmf1NOG+ODjCHOgvNL111a44nf8BOJMta6b8HQDok=;
        b=hxXcVGnAnYDAatwFgoIKb9+E66MaalJcHLXxKBau9u2HaG69m5eL0blqR9fJ/uqj1r
         GW+zAs9fC9eSBJWkT5BmOkVUsRsBYq9pxgFh4/1AfuOZ2xNDCujP1iqyytMCfM3baMIJ
         bVa3KUZW5wAvee3CcFk2bvZK7Og0cWdVJtyv75A335Jh3DYBUyXwC7lBRNjM8iAOzEZ1
         kbpFAQPsl+X19rEg8VS1xukwQ6wt140hWcrtVNGuu6h1+fqNSIpaDfztGtaF6tagW6z0
         DRmWdFc1ZUn9v5wlLwlCeZQ9f1llWSresHuEzUGOCC1CiM/3HXkPlOUHgiV4wL+pCo4D
         +h2g==
X-Gm-Message-State: ABy/qLbJU0CnHtAwh5kH+5/7oE2BCdgIfGfPW8IQpJgTaD9rcWV74bwe
	+jgXyHlUqyhlOkZszKBshePC5g==
X-Google-Smtp-Source: APBJJlE7hFmGHGL/6El2RN8C/gzU454avPKtZQT3f8vkHvUEcVT/8J+Y90iWWwoCNkPuUZMQ0MWfDQ==
X-Received: by 2002:a17:903:2288:b0:1b6:9954:2030 with SMTP id b8-20020a170903228800b001b699542030mr3456086plh.8.1689784489937;
        Wed, 19 Jul 2023 09:34:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709027c0600b001b0358848b0sm4199276pll.161.2023.07.19.09.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:34:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/4] gpio: sifive: Directly use the device's fwnode
Date: Wed, 19 Jul 2023 09:34:42 -0700
Message-Id: <20230719163446.1398961-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719163446.1398961-1-samuel.holland@sifive.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_093452_105799_603A5A3D 
X-CRM114-Status: GOOD (  13.26  )
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

There is no need to convert dev->of_node back to a fwnode_handle.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 drivers/gpio/gpio-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 745e5f67254e..ab32c952c61b 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -254,7 +254,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	chip->gc.owner = THIS_MODULE;
 	girq = &chip->gc.irq;
 	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
-	girq->fwnode = of_node_to_fwnode(node);
+	girq->fwnode = dev->fwnode;
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
 	girq->handler = handle_bad_irq;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
