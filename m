Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A25EEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 00:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UBQdloAAZZx23Xbu8R0aXFlXgVCoBY3n302M2e2avY=; b=JPPPP8v2ZbIfYi
	NpPRjegWgh1gRUQg7mbgQRiVvV40YUd1YIVeOpWEwW2aHDEE8DQHc3aERsrgEc3euJn7sCqxfXDsB
	4yYTHzzR1eFOnG6UtwkhH0czagHwZ8DeO1ccVXesOMCVVzDvXzq7HceZUr38y5n/phPlcIRW9mCwT
	CEHSJRnc+Bdwo4gQtPwCrNGNGEV9OMaruJJvtVLKx+mF+uOCj0+A8rv0wOY1+lLbsJ0AjA7QkMnVl
	gDqNoRvuyHkf7+zzZBq4rFEFAlaPQ3lUzIJDpKph22jkxA9jE3FiH9T1S/S5x9YbgdER2wc5/Qrvd
	Ap7lwYCxblo3hhYuZobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66g-005kxW-1B;
	Tue, 25 Jul 2023 00:40:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO66a-005kup-2w
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 00:40:51 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b9e9765f2cso25176455ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 17:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245647; x=1690850447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whF81jM7MxzV+FT+tijidotVjimKPtD8G7YJMe5VYT8=;
        b=Y7GUiu94wEBaKDhmb78iePTU5on4Y8af9I2D4KfrJx0c0JhIJBSRxWayKzgqvjmnOS
         5LPHTZAppCbaxsEmtyQSbWzbp6i6vAQT6d8PZRKl4zoDuWsyYwMj5k+/WmvN3iFDIVD5
         ENo/xB84IHvM25lxI+DrkCISNIo9ZvSYFA0IfdPDwfFM2/NhkRZMKBMJEM6gTRN2BAqf
         8NRSfFyztf8TfsLhhRk2xs8RCtcNKPbbbrffPegyGnI+gmeNU5YkRTIHxdJrCueNvQan
         K6CXnrRwZfIkIYH9fNB2g0kIXYiXyWjXB8Ha3zgWiqOQG+kb9u9YsM49vOs1+EAH60ab
         wNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245647; x=1690850447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whF81jM7MxzV+FT+tijidotVjimKPtD8G7YJMe5VYT8=;
        b=OEdbFG5jiYCmt7TUMMUJ9TCFP/YT5lZWknAcD/jqwRiFl58yaoRat6x/Fw94a0LWbg
         uOsNeQr3HPAzPEnz3JJXJ6q5fuErQROu6KwT/mqHaDw9A0tQCz7RTwGESOynhtf/iADg
         G0jyr8juaKMcfvp0Eq3vnsijTa44zPJVUT1gLrDAMVpYW1oEafw1RIT1OPmve2nBNRq/
         ++4wcyMJOy1NiqINOIP/CuaA+mh+q1jV2DyHg1cJw3MiuopMi4bqgVGMIvEHM6qovR92
         7PmiumlDwO8LebXEYaSDCn69VwDTd7YnvAFLdqbb2AvlLA3kO/nGqE3LjFwSWuDGHDSd
         PO2Q==
X-Gm-Message-State: ABy/qLZp9o/nYWzrtZ9dDyUSraJkqoZgBO4qRrdLrSs9I1btX1v2bd4o
	QfcKd6m2aoprmg7FRKK9LN9DQw==
X-Google-Smtp-Source: APBJJlGtHTO7CDSyW8ZxxmrwBceXzI8CW1XujT4EsoRt4RpIH7jo6YBL5pbDPxWysOIgsa2tw7yuCw==
X-Received: by 2002:a17:903:41cc:b0:1b8:9044:9ede with SMTP id u12-20020a17090341cc00b001b890449edemr10398291ple.62.1690245647479;
        Mon, 24 Jul 2023 17:40:47 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id be11-20020a170902aa0b00b001b8a3e2c241sm9528297plb.14.2023.07.24.17.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:40:47 -0700 (PDT)
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
Subject: [PATCH v3 1/4] gpio: sifive: Directly use the device's fwnode
Date: Mon, 24 Jul 2023 17:40:39 -0700
Message-Id: <20230725004043.381573-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725004043.381573-1-samuel.holland@sifive.com>
References: <20230725004043.381573-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_174048_947105_820671B4 
X-CRM114-Status: GOOD (  13.02  )
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

Changes in v3:
 - Use dev_fwnode() instead of member access

Changes in v2:
 - New patch for v2

 drivers/gpio/gpio-sifive.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 745e5f67254e..db480cd7271a 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -10,6 +10,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/regmap.h>
@@ -254,7 +255,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	chip->gc.owner = THIS_MODULE;
 	girq = &chip->gc.irq;
 	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
-	girq->fwnode = of_node_to_fwnode(node);
+	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
 	girq->handler = handle_bad_irq;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
