Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA1BC83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olZ47VvDYk5PHXSvB3jXKGoxeO+R0bIIqZVqw+oa2IQ=; b=5CFos2I/m3EIUQ
	FBmhXKiqWw0z9pD1eb+/NWfF5S537dnV6UdcuqjhkrCPU6e3LRfpvE2k+P62ejpbngkt800EU0wsE
	F2RcIqEtMYAJhDuE7exE+tXh8eLwk3BDGvuU9/FQtxetfbtT9WOSPdmW1qG3C9xuj7NKyJgPsQ0vm
	QI07PlyvWbiJPIczO+LvbBPdcAZ7+rCO1vtw3a7t5yxWv6XaDT8VttG0zdnhgmh2dJDd7zekWSaYD
	WdQa7PuwZo8hO7jKXglioSJZPuoBldE7JAGeYhItZCBM1akrM+m4+PcwdGB41BTFdr8uPpD7MnWvr
	OK4y+tWAivgubr+Jex3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxAO-0000000CqC5-0e0b;
	Thu, 10 Jul 2025 19:42:48 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvQQ-0000000CdMp-3mTL
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 17:51:16 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a9bff7fc6dso11469971cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169874; x=1752774674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPxd+P8tmDwx0y+W1SNnV+rw8aIzaBC1lp7afJoBcgY=;
        b=SGXS8++Wp0DIJJIJy0akRMrKcKwllEHszqF+7cyx1Gz5JHlGPOA8VIaaG7+6hyJ7po
         UM1uSkFwFlHu8+Yg+X0oOMW1/R+2iEdJ8KDMOEQheIMfWInihW47UQlWtAfXDAwntIJQ
         GRLbwxK4/AGfACWeCm+SFKMfhbiDNp1EfAw6ANzhjYBImo/l4uJz84Nb8vNeOzLcJocj
         JZ1RSMpdbMq4tyv9fFEgJwsYNeEDjN5rzjRW4eqiYLWDuYlJeW0shswtpjBLIMgv0DSX
         yTL2L7pc+kvompqHB67w84BHLkAS8hOq/tOyYZSLFPtkoYqBBIqjGf3NbxThMUnvfadZ
         l6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169874; x=1752774674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPxd+P8tmDwx0y+W1SNnV+rw8aIzaBC1lp7afJoBcgY=;
        b=P1SETX6Hzi8ATRMfRF1O+Vtv9nZBZAqDdumsfwCxA/LT9yXrH8VInNfw2u4uvOg2E/
         urzOBLQLhrcEemLT9rOb5NiokZPCCAN82Yvy9QWMYGP+Vg9ZDB2GQbow0Ya1X5jzL6pE
         wv3LWqNm6Oq/bDS7g6ym8Tm0c1kjPHdDZXEZmrXl3GBME4iicljcOu1oOeCk4A9iPVbS
         8bEywSuQrPRbyarA4RDrCTgvdmXLtQ+muNztitwomniw6ASR5w0RshWpv69OrSxjR5Uh
         GfYm0vN9ROCOM4DZ+FgpXFF1m2RxAIw8NWbx4r4K7idEal4busgfQliTRHre96vOYarr
         N+vg==
X-Forwarded-Encrypted: i=1; AJvYcCXcg5FRoDkhuYbxzATorFmFeSXQq2/DW1ps9rjiTSld8X39ZdZrUWhIWnIaZAYg3OadeVmyuN/8oFNIew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+3VpizPhCgDOML5yjZTvdJAAc441OSGROVqdCpufbD3WvpsH
	tPPfbQW+bZ+ZXd2zouK7JXh8o69HsxEFYNKGWPi7jHAb3bLzAck2OEsWDFp1vXWuRlk=
X-Gm-Gg: ASbGncsMZRkoP4aVA32djMmdp0m2u3M+BiTwcOWjEV6ktlZrE7wKod5E8FK4zYpTgty
	M11dMN1t3O4474wVlFi4XxR4fLjw2go2MH4duoOJuujHCe7H2V1vIUxMcSbew9ZBmkFu/VC/ACs
	o2Z2NdWj5ysa5X3LeqgQt5FDULd/TSU7vFXulaqHKGbr2BztxvhSnDas0SdPyOYbscI9V4AeHET
	4R8DQXlu5tXguLKvt1HFrp/aPnqjzHeWruE3qDngCYZVpu6cSYasERORvLteUIzO7ZXsQU7Cejy
	RPTG9vupEXu6B6eTQHiVNCbE6ECPm7A8uB+H+uACgHPHtSVoRM+iPLIN3r4rKH3CKHBFIdwMW66
	NtKT7aGmybGF3plmVdULbayCTTeuohh69qOrg383DOKNWeQ==
X-Google-Smtp-Source: AGHT+IEkx+AOQpLVZceBJR6aNNu41el+MInso6QxhBVwmiG6+XiP3kC1/9JcknKd6ozM3Mhkp6rCyQ==
X-Received: by 2002:a05:622a:1441:b0:4a9:a608:43eb with SMTP id d75a77b69052e-4a9fbb4f054mr2871861cf.20.1752169873838;
        Thu, 10 Jul 2025 10:51:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Thu, 10 Jul 2025 12:51:00 -0500
Message-ID: <20250710175107.1280221-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_105114_936347_4DE884E6 
X-CRM114-Status: GOOD (  14.22  )
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

All devices supported by simple MFD use the same 8-bit register 8-bit
value regmap configuration.  There is an option available for a device
to specify a custom configuration, but no existing device uses it.

Rather than specify a "full" regmap configuration to change only
the max_register value, Lee Jones suggested allowing max_register
to be specified in the simple_mfd_data structure.  If regmap_config
and max_register are both supplied, the max_register field is ignored.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v8: - Use regmap_config_8r_8v, modifying it if max_register supplied

 drivers/mfd/simple-mfd-i2c.c | 8 ++++++--
 drivers/mfd/simple-mfd-i2c.h | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..5138aa72140b5 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -24,15 +24,16 @@
 
 #include "simple-mfd-i2c.h"
 
-static const struct regmap_config regmap_config_8r_8v = {
+static struct regmap_config regmap_config_8r_8v = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	/* .max_register can be specified in simple_mfd_data */
 };
 
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
-	const struct regmap_config *regmap_config;
+	struct regmap_config *regmap_config;
 	struct regmap *regmap;
 	int ret;
 
@@ -43,8 +44,11 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 		regmap_config = &regmap_config_8r_8v;
 	else
 		regmap_config = simple_mfd_data->regmap_config;
+	if (simple_mfd_data && !simple_mfd_data->regmap_config)
+		regmap_config->max_register = simple_mfd_data->max_register;
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+	regmap_config->max_register = 0;
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..ea2a96af8bce4 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -24,7 +24,8 @@
 #include <linux/regmap.h>
 
 struct simple_mfd_data {
-	const struct regmap_config *regmap_config;
+	struct regmap_config *regmap_config;
+	unsigned int max_register;	/* Ignored if regmap_config supplied */
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
 };
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
