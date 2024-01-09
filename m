Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E58C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pppaE9U6xf4y//J++IQvEmmuRuR51kAhnbKFuLCBN2s=; b=f0glk48s2ojOGc
	CPaQjTFVKrHLTWm5N2SJTqhvInjgwM/0zYVvsmSNO1SE8n2PUwfz/q5TAt/NBGSiUagb2BrWfQoBq
	3lqgEtyWQfUrPBAFWvRZeJ1vpGJ1SNXUN3oE0NEmh538/ahIYTaywQLzu+MbsjhxZcUONge2e5DUq
	tK5dALUEaE2uHqLQ1ZMUTMFiMwkLC3neT/c8NnS45Amb3d1Jo3qfRJ54wT7nbPI4P0/mg8l4NeoOD
	H2/qH/uBs92xHc33SZ0p2oeHG/3v/SS/MPvW0xmQwTZ/ZDraYavM7g6a7pS8NY+homAIuUmDYrUh8
	ENSHV3yjFIM9zNU2Bkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN8Ek-007T7H-2s;
	Tue, 09 Jan 2024 09:17:30 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN8Ei-007T5Y-0K
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 09:17:29 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6dbfdb41a63so1854142a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 01:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704791844; x=1705396644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWGh9TyULl5axYB+y4TjSKeR1pcTY+hQLJUbaZKUyYM=;
        b=RhlvzdDtqINv+VfTP0A2+tvFAODORG3HI44b4XngynhPypywz9kEooF8s0rTlW3jxu
         rs3qV+JZAQ6IotNYJOXyqwmZdBd0GW2sCmB0JvyHYsnOkehWYbfHhJqspB7FKZj2R/do
         I7ysWK3JTZ6m6Z6jd4a8c9v1Zm5g//vj8rJy9Vt85HgTJiUogAmyhlgycimkkUCYWtqP
         eQp3Ybif1b8C0WqaTzoVAZTR4myPXtWj2FUCAjkO364fZP5bDsRqTXEQe8887I53uP2z
         SoPHP8rsHd9GjdXyLl0gTCwviebyL98RoipWGKuNwefhH7732odnpDnou/R1J7oiRiky
         HmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704791844; x=1705396644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWGh9TyULl5axYB+y4TjSKeR1pcTY+hQLJUbaZKUyYM=;
        b=oWMwpCkDY2660TCSIbBvUe43FZDqqM6XHHoBm8hjT3RZdadb22iNsE7KB35BUc7MBE
         mUkZrqlBzLqu4AVAAbz8jRlSVyWdYhj4J+EEamSq9EbwMCdmkhatLet+DQco6K7MOFiY
         8t9cjS5lKBA6N+69CujnNDPNsU046oyo8OV0ZWdhuLvZ20tfu2r000Fe0Tkxmmx5ZPfR
         ZI1HngFkd1lpcGkryTijWb6FMaupJRLWasMA2kAeqONUV6cUwDVM9brtu3uUBG8svwNR
         Q494U9BPpAqlUYT/ekegwV8aOhtvEyq6+FGYlSidr16Czjtt3dVXECTGX7cos3VrYNtf
         jeLA==
X-Gm-Message-State: AOJu0Yyz0SiP9MJ5a/dm5IUMi3DInHPS2NtDVgGLuS6ruqYOzE3+Z3v8
	+Zl2yLo4kLQewJ34F4TigQs=
X-Google-Smtp-Source: AGHT+IFKxoZ8douUKwO8MFgZ99uh8kdpDWRiWeKVgDWpGH6Bgdpj0FIy2C86fhkHBmvt++YSJBspxA==
X-Received: by 2002:a05:6871:3a26:b0:1fb:17cc:1786 with SMTP id pu38-20020a0568713a2600b001fb17cc1786mr6467549oac.4.1704791844714;
        Tue, 09 Jan 2024 01:17:24 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id o22-20020a9d5c16000000b006dc0802ddf5sm305361otk.5.2024.01.09.01.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 01:17:24 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
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
Subject: [PATCH 2/4] reset: sophgo: add SG2042 reset generator driver
Date: Tue,  9 Jan 2024 17:17:15 +0800
Message-Id: <06e493ad0d64c1ba5c5897eb452ff04095f05e7a.1704790558.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704790558.git.unicorn_wang@outlook.com>
References: <cover.1704790558.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_011728_139716_1F9585A5 
X-CRM114-Status: GOOD (  15.23  )
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
index 7ea5adbf2097..69b631eb8127 100644
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
