Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF392C71133
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aawFU9pgz/u0K25JC/ytVHavwDqE/uv62ISa5eSW9eo=; b=UTA8kRCcMIPivM
	KZd64cgikfB9k6BAdF+BcVjxjGzj0PUpw8LD1INhpt7rqE+Kcxhal7rP6voygBGQMiFeqygDhVCd3
	2PssVEo8plriQMB0r/GX0u3BbNxCvSSG5z533AZO+swvUibtPFq3HPbkPr84rgtGQhI94P2tSSfXx
	AWohVtjL6xB/3c4Q1Ma+ZaU9XzUItEuHR+QfK7IEq1u81vuySgReU86BmezrJVsaLn7VwKwuaoJd8
	KVYKnWQwDVIqCO38XsEqCfTY2ePu+l0G0rzcTaaMkbdL/ZBL15IUZswPbCRzcHaGPOYE6qXuOxBwK
	JWvdmtROaGmR3rqVmeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5p-0000000AZG8-0HKg;
	Wed, 11 Jun 2025 16:14:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL3Y-00000009ttg-0f11
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 12:59:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2353a2bc210so57849995ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646791; x=1750251591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7o24DxeXgIvRNvf36TN4y++evYbOInZZuq385XvrXzk=;
        b=lm/3JeZu9OPtajwTFu7MzsYAXQNTo9ndH8YkD/dJevtdNaObW+CqoD2IQ8BZ+I9lt+
         VOH8i+nmLPKadncXiXfwp/29VZlrbtFez6jcvZwIzKmBwD+lVqfV6CoNGK7wVXCdmOpS
         1fHULPt4o27WBxFemeqUJnGN9Lh5V+ziLY2YVYrj0DjgJUmeoxI55iH4RLCoaYMJa0KC
         2s3egzLIi9HUz3We28OPfA9iDiQk9ZvR+pQF3MFvfBYQ4bOcQH84bDmi0aCe0/iGqfPh
         jeASREc797Ze0s3/Z1QZUyd11mQ9iEUAD1//k1A1MdwmBM6UpTxuRUWAol9eky34obRf
         tyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646791; x=1750251591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7o24DxeXgIvRNvf36TN4y++evYbOInZZuq385XvrXzk=;
        b=rn2wbLpNs06Wh3CtAFn8MV+6TK6joXooSTyi4haXvTDkRN/MzGBVJayuW6THpIKuf/
         miUmPR8ihYjM7mGYqcZrRyNIvXN4KjDelNJyuzErio2XL30K1kBsf41Bz6O9TAeHJfaQ
         aworTM4uYBMWNeJ+FPxGLYm6hLXg/6uCJxeACMb5dLAK2mD0WkLIm0MhNoJ6MnfmtF6i
         G0MwLRQG/E9k/T0Te39tjM5PNTFYePTWACbchbAutdiu2SmNBX17QOotD5i0HHy3WSbn
         /H7t4iYGdJ0ZdKwINjsdo/7eydmMVNKmR50c9YXm3bHteNAlWUjIBOWc5zau2766F1lJ
         91Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/pZqkXxYoY3vQjhqzFlakgrisYNUysKFPqnnlki3W33vxuddCHBDWhXhbUuVL4iExb2VcWVPP6Dd6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+BZhQXN1tsaYw8ZavS7VYyzGmm4TtEt5Um7Dsr9YUX7scBrmE
	ddhWuWoY6hKNJV2Ii8Xt2vWiLP+i2Blc9eU7omnWW0JOdoXTDWNf5/bQUuLUCagO4Go=
X-Gm-Gg: ASbGncuIP0K7pwyeTj3Hrd0sXNuNKl9imGfPQeIXShYdH++yV/j1vEWYIAH5VpqaLh0
	Q/eCjUadwXIwFnu+N9b2rZiD6EgfboTAz5DLjWgYDIoqLm8OQSuVI5bpWALAgPEzQU9jloQID8M
	pE1XnoyzTNoyljrgHcLsPqsqfzwt/cDP5zFKeHFcpANqJjL2YwV90QZXITdXLVzEP3cHTWCeEqf
	6NbTx7sICtDNBA4/G7Rr+01qalBP8JQ1hhP7iuZI+cSLzqNX+Yfz0gSxEGNd/QmCIZfOSH4KI9k
	3hrEiuFGbAXgBvMr5lKpepWBI2tYwbUPM/FfgkGHEsqic0JIsW3BTh+/0SlIoHI4Lt7Sy4nf3YM
	my0HK3PI8OKHPOsVzyt7x6Y7WjksTqxZd
X-Google-Smtp-Source: AGHT+IH7USNXfR5sNsfQYnJhCwki/U4RwupJq6yD1CeMplQGSscMAoiL9MAMbLTMCcEmy+9woSzN4g==
X-Received: by 2002:a17:902:f70f:b0:234:a139:1203 with SMTP id d9443c01a7336-23642683ebfmr42207415ad.32.1749646791610;
        Wed, 11 Jun 2025 05:59:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:51 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 3/8] dma: mmp_pdma: Add optional reset controller support
Date: Wed, 11 Jun 2025 20:57:18 +0800
Message-ID: <20250611125723.181711-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055952_194828_1944C309 
X-CRM114-Status: GOOD (  12.67  )
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

Add support for hardware reset control in the MMP PDMA driver using the
devm_reset_control_get_optional_exclusive_deasserted() API.

The reset controller is retrieved without a specific reset name,
allowing platforms to define a single default reset line for the
PDMA controller.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/mmp_pdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 4a6dbf558237..fe627efeaff0 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -16,6 +16,7 @@
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1021,6 +1022,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	struct clk *clk;
+	struct reset_control *rst;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1043,6 +1045,11 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
