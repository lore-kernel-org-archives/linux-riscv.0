Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3209EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 00:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPvb2wYzNii31BSlaB/vF3q5ktAkQkMDSo/4YuwdMe0=; b=Ktyqd1PAi/5QiX
	dYYnj3lAQm0W03nwrcmvUP+dWrZITrLvt0NOUuN4b43ybsb6erOey/CGC9XkYtQLObR1vPR5jShKd
	xrsZnivX7OkjrxH4/R1Z30Ai1a3sCHlR+bT5sHPGx5t5Ddeq5dRNkGYXF+K4z8YdI1m77Sc8hsK6w
	8FYxpmv5DaHxqECxJnv3vdqXyGSaimx6AQjeB5eydpNMxpXq+Ln3pc9YqHRdBf3LusKIGTnJJXdus
	bigOEH7a0N5vkUSZaLnR2K4rRFU9em0cKZWujGpB5UgF9J2vuNeADoA0vV+6vr6rgUqHJ1XYNc1f/
	iQoRxztz11w+RUNahx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO68d-005lO7-2Y;
	Tue, 25 Jul 2023 00:42:55 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO68b-005lNP-02
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 00:42:54 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-565f3881cbeso3483772eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 17:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245772; x=1690850572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb3Vvpjv1LmFtv57q/x9jijKmz7uqCPq02odS2uEdoE=;
        b=NJz5PqvzKA92Zx6p/keou7qhR4dQjMQTGZKceWN2gyyZABNNExi9h9o6AsUcaoHajk
         l2JHilIUtr+3NvwhkDMJHlH7sAUJQRGdWWLCPwhZWey4RMvp8ksoxj3Q+7fb6fXuQu2S
         FIlXGfZFfparRohpUUi7z8Aa58ncz1lz0ihykjLa8mM3fdx9rBxIei/vy4OcsRc0OxRz
         Nbpp5bkxj6JFCFYct3COrH2sM7Lh8rrWSATU1tzBP0K7o3qOO/YomOpvn6ExEeKE0DBh
         0V4ipv7rGgmC2k1QtEcavM2waIfEj41z2ths0NsmFwxUs2TlDUXssTL2sG+D8vkbbGNH
         ImPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245772; x=1690850572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cb3Vvpjv1LmFtv57q/x9jijKmz7uqCPq02odS2uEdoE=;
        b=VS041XPuajtQjU5jp4YoJff7xNGoStY7AsNigfcKdQQJaiG2L9s8HA0gDFwyN3ZjJR
         dbjGhN0KPG/yNsEDeYpmQcIk5tofsS8DbvN5btBue4VpbGWeQnOQe1T9p09ZkUlwhqh7
         sGrsCMvwn80jBItH5cQbfawjH6m7jUoZnebqn53h9HDShwEUoxJEax8cEB4t3Qyj+QQN
         iVSmCMjJQb4OVUcnx5h6/2wpOPteYvh/atm6az5pLdG5aJA/OxmzKKCdloxLPmMQTqTL
         O7rWyP6Lc6tGnALYdbvjSEezB2LjlOkALYIfdJg+ZNiEtq8fjoIoKiau0lvL4WrK6Bpm
         NR+Q==
X-Gm-Message-State: ABy/qLYemLR1BU0KIWJJGxzyzBh5/+Eny7UCSxc5itAPfErNKkQ6nVMJ
	5Jj+FCMvs1PcNB3+3mjBbAAujA==
X-Google-Smtp-Source: APBJJlEx7Lam5DEiLmiCEtXu/zND0jtP2cw7V2ldx1yMXL+Jl9Vp1s5OuX0uRGjreEk9+0xSHerGvQ==
X-Received: by 2002:a05:6358:52d0:b0:132:d07d:8f3b with SMTP id z16-20020a05635852d000b00132d07d8f3bmr11668726rwz.28.1690245771818;
        Mon, 24 Jul 2023 17:42:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id u135-20020a63798d000000b00553b9e0510esm9042655pgc.60.2023.07.24.17.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:42:51 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] clk: sifive: Allow building the driver as a module
Date: Mon, 24 Jul 2023 17:42:48 -0700
Message-Id: <20230725004248.381868-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725004248.381868-1-samuel.holland@sifive.com>
References: <20230725004248.381868-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_174253_048664_172D2D58 
X-CRM114-Status: GOOD (  13.72  )
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

Changes in v2:
 - Add MODULE_AUTHOR and MODULE_DESCRIPTION

 drivers/clk/sifive/Kconfig       |  2 +-
 drivers/clk/sifive/sifive-prci.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 2322f634a910..49597d95602e 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -10,7 +10,7 @@ menuconfig CLK_SIFIVE
 if CLK_SIFIVE
 
 config CLK_SIFIVE_PRCI
-	bool "PRCI driver for SiFive SoCs"
+	tristate "PRCI driver for SiFive SoCs"
 	default ARCH_SIFIVE
 	select RESET_CONTROLLER
 	select RESET_SIMPLE
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index e317f3454e93..09a76248a710 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -7,6 +7,7 @@
 #include <linux/clkdev.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include "sifive-prci.h"
 #include "fu540-prci.h"
@@ -618,9 +619,8 @@ static struct platform_driver sifive_prci_driver = {
 	},
 	.probe = sifive_prci_probe,
 };
+module_platform_driver(sifive_prci_driver);
 
-static int __init sifive_prci_init(void)
-{
-	return platform_driver_register(&sifive_prci_driver);
-}
-core_initcall(sifive_prci_init);
+MODULE_AUTHOR("Paul Walmsley <paul.walmsley@sifive.com>");
+MODULE_DESCRIPTION("SiFive Power Reset Clock Interface (PRCI) driver");
+MODULE_LICENSE("GPL");
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
