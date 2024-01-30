Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1775BC47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ykb6r7s29LTji22rVrurlweNyCk5fDJV0+t8z5hUXik=; b=0uUJoEUWPretWm
	8VAvHg2Y/DMZfLwxDq8ofipDP1SiRoY+cCy/wpoz/q8VJP6fkShRnji1bDkRcQ0HgD4dq3sYxVFlj
	RlSzwW/0FRiq8gx81Uyvk1cvJR86LBDACJI+P7tGyKqMI1FP9OkZvMoqSeeaygP/a3ma+N4WhUecN
	t+8HsW3b4EubRsBN/5nFH+eMGTyut/KooBIZSnrRLE0yQzcsrz5Y9uhALXWnrb1cDkPGg1k+yY0c1
	Q7rlgdd8XOhnUFhHLi1FXz8AU24hOnlZ5HGZ6OuyqSvnG/o7wcLBl7PSUm4JxvMEeX5EZ1OiSPwJu
	r8s7JtaDpQkrt+/iD6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdGe-0000000EsjL-3H85;
	Tue, 30 Jan 2024 01:50:28 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdGc-0000000EsiZ-0ofb
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 01:50:27 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e13c6e6093so157615a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706579424; x=1707184224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+/+BqCwMuDGeOCcrnZSnGmH94q8LFSE4MJFDmMTUoM=;
        b=ZmkPjhnvqDV3B0+G0Bio127I+uMhg1G3iK49VTMTRkTh+Fb9dcaxFwXrQc9N8P/ObD
         CwX+f7dJZlvtIgy6XsLn5L0hMVFlh+KrqTY1MsOOif1ycNlHZE3pS4SgGjdeTzi36I+q
         gbdd6nvvKHGjtg8odNCiGLq3UHYy7wPO4VeJUqgIxVGmOWZWeqZ/n+Xl74ouFHffzkgt
         WASON0EIiF3UW07cg3LJnHCcXOn2vqkwcojLPYcFfua1cjP8b64LCbyg2RVEccb/CfRL
         osiTYbsvSUTxxqGjUrm2wii2o4AD8CAUvwdoJfyD5rAIBxQ+p8wo17A4xs4k29Vff4PW
         s5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706579424; x=1707184224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+/+BqCwMuDGeOCcrnZSnGmH94q8LFSE4MJFDmMTUoM=;
        b=RBOYdVtQouHxXBVkUMSNeR8yMNukQksVEzCXHdmHCFskdoAjBBcyKp6/g1GfuODi6L
         grL26kAOqHZ/uP947IjAz8Ny7VeV3Y5NfeU4VKaq0OoUXPa/aI8BD5vmpjDoky8r5t+3
         Fpna8UVX5FHBzM7DtwvxzflGdN+c3o+I3upMpPlEvwazIVF09Lew9e6bwJrq8vI0+RCr
         CGbPtG3MydIfB212rorLNaB9sWBWtdlmyeU4LTfOzV/TkXQJhyKVEBi9EQZJMuPqe/au
         RvsIfUamn3ljzi36gAAcGazM6HFbrSW8WnslJ8bPA/phbJj2DuF+xADx50dM5QkrBJ15
         32PQ==
X-Gm-Message-State: AOJu0YzEWyZOruXSAMF2LlZkLUDjOzQRTg6rVAFGTizRLUPoN+NB37N1
	KZmCZLrAlg0EjdZWH4jGMTX1/4rgyfn1QZB82YCpIPpYt/ZmJQtV
X-Google-Smtp-Source: AGHT+IFq9Xk7811v3ADb80CtutRY0zvjWZvOVPlUhN9sU9gbnK+EK7WvbooNwP/qEMA3CSlitF72rg==
X-Received: by 2002:a9d:7855:0:b0:6dd:eaaa:a33d with SMTP id c21-20020a9d7855000000b006ddeaaaa33dmr5219120otm.21.1706579424090;
        Mon, 29 Jan 2024 17:50:24 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id z24-20020a056830129800b006e13a9ff830sm194148otp.53.2024.01.29.17.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 17:50:23 -0800 (PST)
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
Subject: [PATCH v3 2/4] reset: simple: add support for Sophgo SG2042
Date: Tue, 30 Jan 2024 09:50:08 +0800
Message-Id: <1cfd7b3ba447942784c4f7aa595e962399e9f617.1706577450.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706577450.git.unicorn_wang@outlook.com>
References: <cover.1706577450.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_175026_259406_28435D62 
X-CRM114-Status: GOOD (  12.97  )
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
 drivers/reset/Kconfig        | 3 ++-
 drivers/reset/reset-simple.c | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index ccd59ddd7610..2034f69d5953 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -213,7 +213,7 @@ config RESET_SCMI
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST || EXPERT
-	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
+	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || ARCH_SOPHGO || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
 	depends on HAS_IOMEM
 	help
 	  This enables a simple reset controller driver for reset lines that
@@ -228,6 +228,7 @@ config RESET_SIMPLE
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
 	   - SiFive FU740 SoCs
+	   - Sophgo SoCs
 
 config RESET_SOCFPGA
 	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
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
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
