Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E45C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WY/wJmF1hjfL6TpGQn5jJwSvc69vHv7xF8sr8Jb88qw=; b=gpfYhFOE8YcgEe
	ltVpuq9IJD9g2fExl75wi5HmwulbbkugKVTLP5zO3WQCvxd78SGM6NXYcShdq+SWnh5sybr+YJVYJ
	iRhyp65iKgLq16nPeUN/zEg4FIUHv3FDdfFoHKQkj6Esiel0ynweHznfVDHzf1HrmUBtBgQSv1mrb
	Cb4Mc/TdTupDVi+mKKUxyZ8Uyu3I62eHnYVROKcwcfI9jamzO/HKsBK40Poet2KzGR2k+kQObs5a6
	N293i/qOsoK78GZNpgpzbH8ZxIalC6n4lQ+NpYtmh4VSJ2W+LfDfoaDfRKTV72iSqM7kURvshcDLP
	mqRAIFRSxCg8Udz+gtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSsxW-006fnH-0u;
	Thu, 25 Jan 2024 06:11:30 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSsxT-006fls-2y
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:11:29 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2046b2cd2d3so4667037fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706163084; x=1706767884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s517sYCaoEVuNYB9syue5DUwwMbcTuE6IgQKf5uVU5s=;
        b=BQnV+xKpYV7M/th3SDDVBuQgiNPm7SNNTLm0/hHO3+avooUPBqQq+Dz9wXIA/4lUH1
         K3ym9lTw39ApQ2EFx3cR54p76qciyv3WhYg/vIUgKckPkeJpSWO3qtBL34QseZ53SyMg
         TBUWgpuZpNR/XzJpCmphwQM2TGrqRqVUZnXSaf2UMdSy8XCnCohdHG6JAhuv43lncRS5
         IufMkMEjEVkqt23iNLVY0xFuz0d6D4AfqI24KWxFFQmy/rBTDRhni7uqUXrA6/HWM+sy
         Z/run0oYbAjJVj9Pi9t84xMNi040Oxvk4mbj3zUlnQDsHvxwfeb4EDW5Nj0rVMlsUp7S
         BMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706163084; x=1706767884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s517sYCaoEVuNYB9syue5DUwwMbcTuE6IgQKf5uVU5s=;
        b=iiG97nzvPGzH4yLskz3D2GWon12E0AJyVhE9RHJVRkchf+mka4mMzyptRJHqkEG5L+
         QYi5SW9UaJxmQQ8yPm6OKqGKk+deXuQYvgpOPw9l3ggagKL8SjAmxvo61eFlACqRKvCE
         tOtaxUdn00796x65HbXssD4OxmZTYW214yyLPfNa46TAZ+02XDMyc/zy6nl9uFrTNw1s
         /hunyUa4UutN3WYTwQSqf4p+LX4yIo2SO4P2o3pL83SVR2dEgXY6KJScL8Dse7TR/dPr
         Ui+q9L6ARnOl3+MdItpTRb8FXrJgaPaKKasJeM2rT7kPDLS3TSBahE9JcOuowyWMNbRm
         CDWA==
X-Gm-Message-State: AOJu0Yzw2rrFab36TnaazsDg8hPDZ0UA0oa1/MRxeLLHb8k2O8y4EoqS
	fq7qaUVPQZz5IADd38P6vF39xkyv+Dc/wyn1tSNzS1E1AWwS/bZ9
X-Google-Smtp-Source: AGHT+IEQ9QanoWE9WjkHB5disI5RqKPULpsFY5mHnV3nVO8tLPap+XHggGE5/ZXYYkVX3otzhrBTDQ==
X-Received: by 2002:a05:6870:c0ce:b0:1fb:165c:473a with SMTP id e14-20020a056870c0ce00b001fb165c473amr524241oad.57.1706163084004;
        Wed, 24 Jan 2024 22:11:24 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id o6-20020a9d5c06000000b006dbffa39d39sm2910066otk.55.2024.01.24.22.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:11:23 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v2 2/4] reset: sophgo: add SG2042 reset generator driver
Date: Thu, 25 Jan 2024 14:11:14 +0800
Message-Id: <34650036ea5f1c500da54c67c3a67b91c4419399.1706161530.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706161530.git.unicorn_wang@outlook.com>
References: <cover.1706161530.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_221127_965653_871C6F88 
X-CRM114-Status: GOOD (  15.26  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Reuse reset-simple driver for the Sophgo SG2042 reset generator.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/reset/Kconfig        |  1 +
 drivers/reset/reset-simple.c |  2 ++
 drivers/reset/sophgo/Kconfig | 10 ++++++++++
 3 files changed, 13 insertions(+)
 create mode 100644 drivers/reset/sophgo/Kconfig

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index ccd59ddd7610..09ba59cc4bc5 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -318,6 +318,7 @@ config RESET_ZYNQ
 	help
 	  This enables the reset controller driver for Xilinx Zynq SoCs.
 
+source "drivers/reset/sophgo/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 818cabcc9fb7..276067839830 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,sg2042-reset",
+		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/reset/sophgo/Kconfig b/drivers/reset/sophgo/Kconfig
new file mode 100644
index 000000000000..9ad96e49e1dd
--- /dev/null
+++ b/drivers/reset/sophgo/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RESET_SOPHGO_SG2042
+	bool "Sophgo SG2042 Reset Driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	select RESET_SIMPLE
+	default ARCH_SOPHGO
+	help
+	  This enables the reset controller driver for the Sophgo SG2042 SoC.
+
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
