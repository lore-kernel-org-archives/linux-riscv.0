Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD62C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJVVgfWU932b95k+RSn9RToBc2xUo71DUeM2n2V+Qfg=; b=xIQvzscR0IBwP7
	5y58fM/4thchCVqr3SOiNBQ8V16Cz9J8VneygwfPvnYSmhrA7zY7jBrzw0b0b80prQIyAjW200elH
	nZQy2oRO1WSXdG/mmcQ/p+igf9KSxw1Te5zHqZplqkkNniuKGvS/XrFtjFkGPqVJFtlsAjspCzILt
	aqbJINIV3JVPmwFmmRJJUY/PJ1txCDqtGVyAbyVCdOMmKfpVZwXw+VMNj07KR2Lsz1cr2p4g+18hn
	AURr8pGaA1ny12NAA27ofZbZO0HZaMbXVD1voOlslNoybKf2TDX2vOSG6hMHO5aZ9RwPBWFzZd3GQ
	yNgFAf7Z/KLCV5OBc9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8o-0089dj-17;
	Wed, 19 Jul 2023 16:35:06 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8j-0089Xc-1I
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:35:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b8bbcfd89aso42576975ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689784494; x=1690389294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKB5qFFhQfmSiP15ZwnXAvSg+5ghnoWFBwWWZp0+n88=;
        b=Fzuo/o3DY4Sh5Qgsn7fB60HWZEm8qGCWfWwgkORpj1Uwy42N1moshxGGiv1RhmQuTp
         VFcCfw/xlYoOkI+FAmpTbSI+DdJ3jReOTIqODtR6XdLpfN4N3VIlGaXC05aJ++w/kGpe
         RFfW+Knv7wWpKU6Uf+gGYkSmiI6jzgU5UOUZtFnFqL4zJwQu2KHE44WrbnPWBRsHJayd
         lLlQCVrl3BPnXJfJPEwUsEMXpma82wUKYiTejzT4M+7yDWyvaf7lKyBAGA2kKf1CVG7H
         szfCCXrfRq8DHlKaOXiAAkaAi7Wl+TDX8tVsZkev8j2LX4Eg3R9xUjcQ+V9dfZ9Vc3gT
         j1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784494; x=1690389294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKB5qFFhQfmSiP15ZwnXAvSg+5ghnoWFBwWWZp0+n88=;
        b=Q6oZ/uFsQq+qlg1z1Zd/Mhu28LNAdmQWrHK8yOyPSyMCNdfkMhYrfJ2oRnbIMkqx3g
         iuX9mauXb31e11jdZElICDRQs7Xm2uXLybJaE2dqxVZAhp7F2xnDu9xGXvf5LTFmG4JT
         KqQlqTS4z2I4aLKcQBm+nejtuGpLOM/85mrIr66vAqmvWmemjJA9zYUqQ822ovDQ0KDy
         6ZdF+K4F1M8p1MZAYbYkA/a/SMHGTJw6z8al9aFpXmtFlSdA7WBZB1UbRnT1IIUMD94B
         yNFPc/aBW7+lv0l/bmpqHC/1Qcgfb+u9DxvzdHl+4g3pNo/sC+p5G5a7lEj+ZsAMgLcp
         VLSA==
X-Gm-Message-State: ABy/qLb2R6tbG80PVcwDv3OubVTWrmtvgGS5HYlaKsQdWxOz+Nq3crGD
	vtD+YvMi9Ghe29bu2+4gPbZuUQ==
X-Google-Smtp-Source: APBJJlEr2JhRNQslVvd4bf3YmcEKWm1LZVkXGrEjXE4E1ojG1uF3du72OmlgajKo9Nox25sMHDZYHA==
X-Received: by 2002:a17:902:7589:b0:1ba:1704:89d3 with SMTP id j9-20020a170902758900b001ba170489d3mr14046930pll.54.1689784494582;
        Wed, 19 Jul 2023 09:34:54 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709027c0600b001b0358848b0sm4199276pll.161.2023.07.19.09.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:34:54 -0700 (PDT)
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
Subject: [PATCH v2 4/4] gpio: sifive: Allow building the driver as a module
Date: Wed, 19 Jul 2023 09:34:45 -0700
Message-Id: <20230719163446.1398961-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719163446.1398961-1-samuel.holland@sifive.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_093501_558540_51A87608 
X-CRM114-Status: GOOD (  12.98  )
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
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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
index 46a42109d6f5..eacd67982de0 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -258,4 +258,8 @@ static struct platform_driver sifive_gpio_driver = {
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
