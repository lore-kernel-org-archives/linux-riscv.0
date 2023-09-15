Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D652EE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/h096oPTNFLiqGJdGW3OubuoWSM0r33kfXMSAooqth0=; b=rbFuVuCnlTrW/A
	EYA+hPOL7Tq7guajfXu2QgoGu9IQ0nWF46sl0un3sSUidKgwdm2PW4ojdsxajakIAAmet9OjGPKw3
	fIZ4716iPUFgAd3+CRYevLhrn8Zmxb1r1yuTcszEA9SZqIHReB9h43ZyG9TgvnFWvV2MHaTRuSvy0
	Td3lR/plubMoTvDriFBWwK2pAwhq7ToyMkLf+S1r98sYI/o80jYg0LcXuFa+QXbdQWkYthctWb0FH
	N6kmKSbQSiOll6544ArH3vcKWc4vaaUvtfYniD8P4n0mQWxz6Zq0epcp+fITaC/uu26VS10mV6Ljd
	SJNwTUDxM6IvRz0S72Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3DW-00A1vu-0G;
	Fri, 15 Sep 2023 07:26:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3DU-00A1u1-0K
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:26:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c35ee3b0d2so14520595ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762774; x=1695367574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2LlgryffFXqAnsB0AaplLotGa39fDQAXZM7QJ4rjkg=;
        b=Wm7C5yGSGd1ZW2xozifIHTAteldzCaQPTDCFUhJEihCvcyH6FVlGshbtIMcquhhb1i
         RwqN6Qnb7p8cLX9Zsj6vbOKpyoSJ8KVwQuJ/f4uesmkWQRF5z8oJsvptQ52ZbGfgcy2/
         D50SM4RvroraF7dkGFj2PQRJ2sW2vZY0RfYPA1cotrRwHcrqCeTs7KUb8Y/yMUJiNoZ1
         TCAJRdpp1JTM/+FyPY4o1+fJmDiYgeSypkmedMZvJeieTewTchgKG3mdMrZIolc0Ulhh
         0nBCxpWia0fMwX88jUlxwstDghWddZxvOwC+psNpfk//YvQGK2MJPsFtVbh1ZBd9PiQF
         XUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762774; x=1695367574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2LlgryffFXqAnsB0AaplLotGa39fDQAXZM7QJ4rjkg=;
        b=Ds4vcLgghK4qjUobuLcXA6Jp6NqOqQXZlKA3FCsYP285GlAzDeG3B7J0gP6+XpP0OX
         9yjdandMTKAxxe87L5VSy2Yi0GTHEf4mbF+b4uNjxIrON5XetpBAyRghIb8/2vQV0H0t
         cliWXJcvmKJEhNU6pMaZzEoUW2BMgue7wx3yOg50/Ou7BbqZ07g4Dz5c75udkq9Q9Aeo
         y5FSAWfn2m/VAVU1v6LHFLwxQbftS4yknGA7A2eg7P8y0OYFHF6CSYjEakgGBIfkBRkv
         AzQVQSqxV+bxQKucG241Q8X1coa17NMHL1pOlFAt4nkAWzcBq0UWi+CYp1yUJupsgHM2
         ozJQ==
X-Gm-Message-State: AOJu0YwlvJcq887vY+MvgHBCq625H6kLu9+zk4WSeaLOnpM4EpRwpCyQ
	aSK88V4sZrSOAP3qf+xXFaWY2GZapJto0A==
X-Google-Smtp-Source: AGHT+IHq5IsXi3VI2LJb1QmXm6E4DKx49u2LCFsrdNeRgmTzjAomgQYQ3nGiPLmT+k5b2KUOcIbwcw==
X-Received: by 2002:a17:902:6903:b0:1bb:b855:db3c with SMTP id j3-20020a170902690300b001bbb855db3cmr667277plk.41.1694762773826;
        Fri, 15 Sep 2023 00:26:13 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902768200b001acae9734c0sm2752110pll.266.2023.09.15.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:26:13 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH 10/12] serial: 8250_dw: Add Sophgo SG2042 support
Date: Fri, 15 Sep 2023 15:25:58 +0800
Message-Id: <20230915072558.118325-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002616_145429_30B88932 
X-CRM114-Status: GOOD (  11.12  )
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
