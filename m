Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E4FCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eodINPGHVp7XFRL+CTNtbb51/Tm3yRxMY0qYjSQhSGk=; b=JpAOIquv89rzBU
	AMuA7NxFniA2yeEmMEPTb41pGTrIRVqiR0ZBiGrbH4E5zx5v4S79wUnrCQlGVETqdVdX2xwpwPuaA
	sxczYzZpEJe/er1Eaq87Czm6ascyWASYhEfEtMRsx0OHvSemtjCMbZP8oosiPFoTIjE1pJT1twm5U
	c2ezd5fJEBQQGR8sre3DzOG3r7wOpP5ybCpM9g77y+H1wGW1l2uZSlLhTlsznTSqMUXtFys8Dklue
	AeX2zzBF6BrQbbWd4UROE9qa+3J377qtCsjP3upPX5q5USCMvzbbxGT25h5lLBYUs6Z6GkpjQY9lI
	GxLZ0nQ6WrB8u0S3pizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqst-0022ui-1t;
	Wed, 20 Sep 2023 06:40:27 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqsq-0022sj-20
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:40:25 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bee392fe9dso4081303a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695192022; x=1695796822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvjyR1db7d2pAH1Oe6CLGqKy2lWY6VTA87peNvZDQh4=;
        b=ePelNZUWeosdgx/KNp+HzNKvhtzbBb6QzXJ8Te4w44pWSKoCAuw+zo2fkqZBnO6psH
         +cd1dkr90jJNwj9oew2IwKCF02dAF/VGHL/rQBK49nJb8UzzyqM7MJZvWab85X6yJnI6
         EdfL0vOlMGMOhBkH5Ehb7UdoLCZN9CEh6yHRV0uxCw4yu5+FnMu9TiVlDtw9fHBZWtQu
         b7HRznGc12rHGt/QGfUGXWWLkQ+KFf++QVJ3BNfU+7x2dFwS8yFlMzChMZSp2DXDtEd8
         0xgnimlXTxCtuYhH5UF9K8siXkfedFt/tsfqAbz3FlCpDxiYdklcxNX9QlUlNYuJy63S
         c/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695192022; x=1695796822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvjyR1db7d2pAH1Oe6CLGqKy2lWY6VTA87peNvZDQh4=;
        b=qpYV7S82KSOjTEoO+Mq4rer6GW7SrEVwcmJXEHOuw9ICsuvMzzNWjHc1qIWB7RnWjZ
         bE1klVfgqXI06Po10UrnzHrLwEd2IK7N/cM9PsQnRC45KWy9hnLMQCrvFbkbv4dGHUtC
         AaY8Sqi/46NpTaLMO7hG3A8zoxMCOXa8sdql2gbNLqmOa6q12bUqeVaMgzWkrUuiAYpK
         esLvU2FuSakct+6tEEKgNvilnhGK2MHY0FTErKNCoZePUhUuWtaPZDdlb2EoaJGuXQiN
         dC0dzIrk8V/b3m47NhQZjN+FvIelgCRVPB+aZN5l+pTjKmvZUDUdGYFHpOROoKdxUPG9
         18PQ==
X-Gm-Message-State: AOJu0Yze+zKJBrvbWYLDI/lOSDYeTZuAasCBiE70uPN6iihusQGeNLlg
	RR9Cvr1tKB3qleL2DthvK1c=
X-Google-Smtp-Source: AGHT+IE4D6SNgVtGxMtnCASWGFtAKbY4L4o7i1dznoOhLX1rHn4j63mgSA5ddd38liKZSzACfqWz+g==
X-Received: by 2002:a05:6830:4a6:b0:6b9:a926:4a12 with SMTP id l6-20020a05683004a600b006b9a9264a12mr1762757otd.28.1695192022495;
        Tue, 19 Sep 2023 23:40:22 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id r10-20020a05683001ca00b006b8c6eb962esm5769619ota.52.2023.09.19.23.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:40:22 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
X-Google-Original-From: Chen Wang <wangchen20@iscas.ac.cn>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v2 08/11] serial: 8250_dw: Add Sophgo SG2042 support
Date: Wed, 20 Sep 2023 14:40:15 +0800
Message-Id: <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_234024_657122_12D0772B 
X-CRM114-Status: GOOD (  12.62  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add quirk to skip setting the input clock rate for the uarts on the
Sophgo SG2042 SoC similar to the StarFive JH7100.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 drivers/tty/serial/8250/8250_dw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index f4cafca1a7da..6c344877a07f 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -770,7 +770,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 	.quirks = DW_UART_QUIRK_IS_DMA_FC,
 };
 
-static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
+static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
 };
@@ -780,7 +780,8 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
-	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
+	{ .compatible = "sophgo,sg2042-uart", .data = &dw8250_skip_set_rate_data },
+	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
