Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63596C83F03
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukFAL6s/4pjAWE0I89qnciowOpPw0Z/3jAruxUolLpE=; b=LAq2FNOnSe++PL
	BMxYAgWTg2xqn9SURW6Ta33vrehvrLzU1ZkrHXw9ruH82R+P+zb06zvXBrIGp8H1sOg70YLUfPT7K
	YlO+vvY1vT8dqpFU17kIiukZkdtoiJ8tS7171Fg9nraHJUVN3qBtRiaTbsjKT//lmKKkdXfgBIpue
	CIlD7g3qyDLbzh50b4lhbEpsKZ7hILTY72Y/ZaSiwiZN4t6JSRZoQzTElcsFIunkThU+Jb2B1G0uw
	qQhUeAsv+AO/lwmZvMUI6CtiTCjLxPTTIoJWIB7McN1zTsyUcg5pvat9DrtWfwiXdBf2gWz1bHKGp
	kdG7Pzst1Z6Ype+lAT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58g-00000009bY9-23RM;
	Wed, 02 Jul 2025 21:37:10 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58e-00000009bVy-0Hzg
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 21:37:09 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6facacf521eso67707086d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492227; x=1752097027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z77tQyjzfW0dcmF8i2CALNcRi1lkFInteyFHSr2VXyM=;
        b=3KOn/vm61UfCgDIybyHcB5DBxRKne8d2t/a2b5IEaF/dsbq34NLOLDhuS39JYG1hoP
         ztuvEFPp7zly7DQ9XZWotm76V/YJVJKWg5Oobg3xnglMXypS8PejQ/EFA5nSIPr34goi
         kADyjdx6OQ/dnXBU/xl2iNoWqF709Xt6jH93e6vCGco4sYNSpqZGq/iR3axdG0YO6ADY
         w4vUpL1M5Rx/OvE4HDaD1bbmzzIm3+jBC4C12shbguVixNxQpt+DOU0adeV1lPCCDKEr
         /6MO7+XIxyLElmXFJ5cYIrTFWW6RzEBcLJgOKS8mM2bK7PAg1JAPw7pp90kLQnOwz+uM
         ViEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492227; x=1752097027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z77tQyjzfW0dcmF8i2CALNcRi1lkFInteyFHSr2VXyM=;
        b=a+J0tRoiQVGT4PL0P/ZjTP8U4WgJaNI4ZnN6IO+MI+SMNU8Nkkb4t+wmkiaDO3Zeso
         KEHcvnvc6bdsEfoBz55RHiCuMZaSplm8B91GL2VJSvbU2WJBEF7E7arWa7c2V6V1LThO
         +q4e41SiaNHf3ucfwv8K7z7baLa5DQo85OEYtNWHi9PU7vyuqZeeuSXNBy1TAdKCHwFj
         MzTns0sNr/NcDkX7Ro6syB984nyUnojVW816FlTya29Ig6gy8MSjPz1+EXIu6iPNetOa
         RAvLoyPe4/JVKwP1GmIjxWmEDcwMU88oZRE3jpf+OhlhY8JMEHbaknQrEXa6pDVbR3IV
         IaSw==
X-Forwarded-Encrypted: i=1; AJvYcCWPALGxSDWQ/ejp9QxZXu+vd03jrwmUQIdAiDf5DnxFMP6Fc1ePyLVRATVlt3k0jgE5Ek2IuaXy18JCyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYLzGzhsUTYq0pEut7n3ab0WI8HaZTL9s5+LMpFUhbyGrKJT6M
	5aFkWjROH2hdM9GXzcJq6LKfujdI8p4wW35W6WBh1hi0O4fGlid6gzSPEbK9ForUSWk=
X-Gm-Gg: ASbGncuxi/In7jv6zgRLBsSQddiNgUoJt3lj9L/z9QlgIwhx8NLYWgHSwViz+DleBxl
	Bz0xGtqoIwKB/OALLOY5W1c04vdnOGNTBJcdczqKYI0yrRohXr2MJU7bhh+Jc5s88syAacED1iF
	QzkZIC33BZnFsjVpCN5fE2QKiqZnypNHor+E0N6DilO6Ul7nIBrcecAfwE0hE84MAwGIeu89GNI
	TESnnGvsc9jG5WFH/ZBNWkdEPblFgc/nTElLCh6S6ML76pOf56UcpZ+Z/kFuchayJtkz7fHCh6F
	Hh35ti9Icbn2vFqPctZirJC03QnWrjNa8nTR5ZRgGpa4qsxPFiUMwCmC32fJ2IznvyhDetRKDoT
	Iiz+z+RUeIyfmlCj2191j9nW8Zt+DOjgXi4w=
X-Google-Smtp-Source: AGHT+IGRObx6Rpk1Zs9IQPZXVPL/wda/SaVAzAggTxX0GxDaBqWEjwz2sqTqj864Fw46dZI0C1TGsA==
X-Received: by 2002:a05:6214:2342:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702b1c1ed54mr54743616d6.43.1751492226919;
        Wed, 02 Jul 2025 14:37:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:06 -0700 (PDT)
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
Subject: [PATCH v7 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Wed,  2 Jul 2025 16:36:51 -0500
Message-ID: <20250702213658.545163-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_143708_249818_3A71B7DF 
X-CRM114-Status: GOOD (  15.64  )
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

All devices supported by simple MFD use the same 8-bit register
8-bit value regmap configuration.  There is an option available
for a device to specify a custom configuration, but no existing
device uses it.

Rather than specify a "full" regmap configuration to use this
option, Lee Jones suggested allowing just the max_register value
to be specified in the simple_mfd_data structure.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v2: - Allow max_register *and* regmap_config to be supplied

 drivers/mfd/simple-mfd-i2c.c | 15 ++++++++++++---
 drivers/mfd/simple-mfd-i2c.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..3f959f4f98261 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -33,16 +33,25 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
 	const struct regmap_config *regmap_config;
+	struct regmap_config config;
 	struct regmap *regmap;
 	int ret;
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
 	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
+	if (simple_mfd_data) {
+		if (simple_mfd_data->regmap_config)
+			config = *simple_mfd_data->regmap_config;
+		else
+			config = regmap_config_8r_8v;
+
+		if (simple_mfd_data->max_register)
+			config.max_register = simple_mfd_data->max_register;
+		regmap_config = &config;
+	} else {
 		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	}
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
 	if (IS_ERR(regmap))
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..706b6f53155ff 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -27,6 +27,7 @@ struct simple_mfd_data {
 	const struct regmap_config *regmap_config;
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
+	unsigned int max_register;
 };
 
 #endif /* __MFD_SIMPLE_MFD_I2C_H */
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
