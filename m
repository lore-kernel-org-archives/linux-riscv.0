Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CBFC36006
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0aSWXVLf/NB2XCagnlD1w4bxtZ3v2OXajjJ2343mDg=; b=2wNGJMMMbhPsom
	dy47dtr6NCLqWH1l1sWlCwEyn66TlnE6Oo8vUZUpfHDma6rGOkdcP1Ap8TDa6OqAblm7k6gM0p2il
	WTeo4aOfDPfYLoDb9FQA6Ad3XTBNalKnOOeoGDouuRLWbJsLYzg19IQERRHDSlGesBOkZ/w0CFAze
	RHfLfbghRfEN3DSpTibQjdUz6LNA87+mRW7Ayz6mjbuSD7AVxcNm1VxeeOOajxm8MR4zlP7SwA8RJ
	dKdYsoEq/1JlEmORN6YVWyEzdhLSE5kOXQQpCqKAXJVh02ce+IjS6sWgLqOCBnFjSYDYRa4UVmghk
	s7r02Scjgr8du+LS/ATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLpB-0000000D6Rr-2Yf2;
	Thu, 20 Mar 2025 19:45:05 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp8-0000000D6Oi-1YYS
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 19:45:03 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso41507139f.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499902; x=1743104702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9/aOcBOjeqmg8r4cUHY2uYIdNBiCau+sheqrs82fvw=;
        b=cyKsPsoghi9m6BkrDkcQGECRBxqc+aVSgWyZu0a5lWUaBVawgXm/uvpOIOxEC8nzKt
         4CmdWfsu1eWbrJKBGur5Q2wXw/WAs7R8iAhWVPNuzXb/Kz5V64D/Bi69CSojQ/zb5rkO
         pvPk6/8Iwa6Dgg8t+iRGkj+/cKGYsYrNftd3NlSwxid7D4xjT2ms156n3/NyUifI/8Ip
         7nxwZrFr3rJ5YgOYsI1UnfEBN52c81PYsiVfZg+7uNVGopEbTuguxPRyBM7KzyqqowMY
         7NK7D+3xffew8UHiXY9uj+9vvjuuXRoGi8GkwvAEafRfKXfDatY35Xy8xtSMryLe2ow5
         wNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499902; x=1743104702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9/aOcBOjeqmg8r4cUHY2uYIdNBiCau+sheqrs82fvw=;
        b=sRm4N4qvi9lsQiuNUG7rRn1gru7pQ1v2IMgZ0m4zbbLJkmLZe0UEBmo+NhRVv/EufL
         APm7sCBtOk+srJSYtCrismr3fygrvi7iLcWDmhsln4gcUDrjeyGlPgMZ+4/dKDjzT8Zz
         fp1fa0uqlGv/ULQE4k/E7Twaae1REMX2jbhJl8F+RNpPc7l9+vkYtIz9u+9/3wVYGNzN
         Z6Vlp48w6n+MqN6HnR0MEQ5YOt58ZgRCqbaqyGtn/eFJ45odsRobzijvmvQ0gTLkeoEB
         BBZqoiMLfVEo1T2q7CjRCYb+tvq29zrMpcth5/QNU2FyFJDdk1ftbooR2+xL7TQHH/SJ
         o9og==
X-Forwarded-Encrypted: i=1; AJvYcCXt4cqzS+rOqrul8vi4E9dbn8VAk0kP0+hGNRe1zvbnrVnt6FqIIajHnZWr1ASMOg5JXyLEpVTp7EzH6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaps0q9Fv+lIMAewHd8lGHjhLW2O1Q97cNHZhyRglrZZWBvSuc
	yVGAzHZt3hpit2MEXK22NxQ3b/T4ILx3f6V8vX0GZJQTJhNkVCbAoIF+8Cy9xg4=
X-Gm-Gg: ASbGncv1hHD9aZJWKCThludWNvc8zCMtV3TG6t9Im8toyTgc2lHoLGSlPNpV9WovV1h
	4fUk6Mwxf4N66WNnl2z5MAg9FAa//qrp47cidT3NUPu2Qw5pIVd7E3CpMdMbBw99b1B6FZqLSqS
	IRKXH+rJr2o9rYqG3yTPdPXIHAttVCV5JbuNGixq3TTEp7qumbcoer+lrRJhJ7+JehIrrAHhaHL
	Gg3GMNz9u050Ak0xWrQ+GCJwSxfk9PT9urHdbdx75HaM1nJU63derxCUirV6P+4Cs5mr8GCO54P
	pQVi4H+jKWckebKV1nvKXgRjJEl9TyJ68aPFSDPhqEiaCljid7EB+1Rv8HpzQBk28UQakHOMpFq
	IdO7dFkDaASFcBuMgIK4aIGSb
X-Google-Smtp-Source: AGHT+IEn/CMK8E8Bfq7MKT35OdTEokXRont9vMOJAD2LBb5xAxo4GeZ7v5aoXMHZf7pwpyUAenlrYg==
X-Received: by 2002:a05:6602:298b:b0:85b:3fda:7dbf with SMTP id ca18e2360f4ac-85e2cb4607dmr58946239f.9.1742499901514;
        Thu, 20 Mar 2025 12:45:01 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:45:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] clk: spacemit: make clocks optional
Date: Thu, 20 Mar 2025 14:44:46 -0500
Message-ID: <20250320194449.510569-6-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
References: <20250320194449.510569-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_124502_418936_C102FF28 
X-CRM114-Status: GOOD (  11.87  )
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

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index be8abd27753cb..17e321c25959a 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1830,6 +1830,10 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
 
+	/* Clocks are optional */
+	if (!clks)
+		return 0;
+
 	for (clk = clks; clk->hw; clk++)
 		max_id = max(max_id, clk->id);
 
@@ -1903,7 +1907,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	int ret;
 
 	data = of_device_get_match_data(dev);
-	if (!data)
+	if (!data || !(data->clk || data->rst_data))
 		return -EINVAL;
 
 	base_regmap = device_node_to_regmap(dev->of_node);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
