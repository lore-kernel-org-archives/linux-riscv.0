Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A92AC87FCA
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmvWYzQ/VM8H+jvK+8K43P3CyrsW6ruKCMH2HqWYC5s=; b=xE/QTLKy1U3YPY
	q/NEjc+Evbz/He718xNdMeiduRyVSyJMHxZa+gBYQoCBAWs1jbKsbLmpjYEyCTu4wApO4GBw6pIfG
	4BDhpZg9RDvJoRuGC5kq8wCcsaDj9oWmof/+HXow4grTDRg2FeXjlsPeMQ9YaqbvhKVjedTM/Ia08
	mGlyqMfPZ8CG88MKpUMFAZpbdvfsMG+qvbuCLO8dPYZxwijmeo3mKjcKWXZHK0FhNjaP9ElpBuve8
	kJzrrhAGwcLkUXuKUWQo53moxgiNnzByfB/g6zq4jJ0urSVMo/wkbpSXmKtGfVvcYtjRlHSrGKQQ0
	mmpwUpue4lS9cWQIPfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefJ-0000000BU7y-3hZ3;
	Sat, 26 Jul 2025 13:10:17 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefF-0000000BU6B-1Ncw
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 13:10:14 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-86cf3dd8c97so243044639f.2
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535412; x=1754140212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBjRH5dYFSfxMS2Dw/xrzSnit2iXBotKiwm7tMWcaRU=;
        b=BJX3QN2Qhj4VSZGmNSod5DuD5R3y7sKEnlcyK+jp9OtHhFZhuWsnyLc1SxKvRzQuDH
         0Z1/nIHaIW40i3SBWCVl2vrPJmVsoaJA4P05KHcHWDi4AcvDo3lqFkRjNJWSITyj2jia
         iky+XJBP3gHbQWu91u1sE4V/lsPjd5ncTBMXyvTWc38NoE1ZekoPc+BO8MWO7lQ8L8Hv
         Qy+7xQIZreJbjKPpgJxtlg+qj24oxb9+smTyGUzymwd6RsoruRmDYp/Pa5+TKCgvNbnW
         fXfPa8yepo27Bt26uvev2C2m0ZtGgXxdQi/VprP7N/Y1L0BradLIoYshLv8Ig/kV/JSn
         RiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535412; x=1754140212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBjRH5dYFSfxMS2Dw/xrzSnit2iXBotKiwm7tMWcaRU=;
        b=YS4ZOECVX3u2mfYzSWMPYd48KS1iBiXhyxfDscavf58ZKemYW1Ri43lQFYX7CFhxr4
         ecx1WDxWXiHzE89mIRvgjWWqqLmrWpXLLKmUV54F9i3tWkYCrESk55oeX+ZFTsjWIhIZ
         xvnCt6tRDQus4lNJy58HQa36dW6HjtR6/nShgY7kvM6lPcRk7318p5LuyAIoDFcJZtaj
         eorww6DM/dzeYaGfXoodEgDmywq+HrJgdkGbUunRHVIXoWVsGeTIjwUxw1wSXUpTjp4B
         tOfVOlYwYpT6HI7ONHqEiOyBUJty4terCu/ZRgC3UcTYrDsYYqyk6kRK/Zi6M9SA7/wV
         xpfw==
X-Forwarded-Encrypted: i=1; AJvYcCXKWD1r/DXZD7B1FeGJinYatfuCZNQZ6bQNvQ0sraqAnifb26SxsvBU+5dV1psiFB/8FMoaHP0CTvxTsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Cb9g4qhog65gozXHhnGcr9ACtZw86n4y6X4e2WqZZqUVgZL0
	gKeIdzXa8w5IXtsmCsiZrIV7lgBMF+NjNwte28ytPbO9u8Db74zrl0EHygBgYBbEwAQ=
X-Gm-Gg: ASbGncvdFO+EGuxnQQeGYRzMZGQYiw+SKTo4zBVS/L2HZ5wTF4/be3FSzmE8eObepPe
	M0BYhEP+9SyKZDytl/Ibs+YjdVAbUsISAQTtSG45AwCUfMjt+WlJeR+c97b3Zbu3iuPNYNORmUE
	4H+qPV6psnMHBZvdYes9umSIsl7DRtuAemUVoZq2ZgTBahHt2DD0mCBTpJcN0uVTZuTAc2V9zZg
	APC3TIWNDNqyMV4QsPlQobmhExmYBb2Q0hayml0PNC59D36eYschR9ND9M9BB+d5ws8auedtUlr
	tj7ebpZD7ZnFLH5PsuMaZnPDdVBvh01xlZt6Re0nwDJ7pq2aA7I6vnmVZU6iV8g0JC0x+5ez/0V
	mp1c7yOnkc3wiKpCT/yZs4F015NksTR3UFvGjUF5zf0tSejRNA6CYMo4FXRdlost6qg==
X-Google-Smtp-Source: AGHT+IEMiSe1+TI8S2A/w2fU5yeWMCGvndi/cNc/yR7qunidcz9YFlCFnwcgzawUglMsdcxbT5XxBQ==
X-Received: by 2002:a05:6602:1582:b0:879:c609:f5a1 with SMTP id ca18e2360f4ac-880229bbf86mr905586239f.12.1753535412429;
        Sat, 26 Jul 2025 06:10:12 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:11 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Sat, 26 Jul 2025 08:09:56 -0500
Message-ID: <20250726131003.3137282-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_061013_367714_6C322BA7 
X-CRM114-Status: GOOD (  18.51  )
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

Rather than requiring a "full" regmap configuration to be provided to
change only the max_register value, Lee Jones suggested allowing
max_register to be specified in the simple_mfd_data structure.  The
8-bit register 8-bit configuration is still used by default, but
max_register is also applied if it is non-zero.

If both regmap_config and max_register are provided, the max_register
field in the regmap_config structure is ignored.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v10: - Rename simple_regmap_config() -> simple_regmap_config_get()
     - Introduce simple_regmap_config_put() to free regmap_config

 drivers/mfd/simple-mfd-i2c.c | 45 ++++++++++++++++++++++++++++++++----
 drivers/mfd/simple-mfd-i2c.h |  5 +---
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..3622f189c8342 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -29,6 +29,40 @@ static const struct regmap_config regmap_config_8r_8v = {
 	.val_bits = 8,
 };
 
+static const struct regmap_config *
+simple_regmap_config_get(const struct simple_mfd_data *data)
+{
+	struct regmap_config *regmap_config;
+	const struct regmap_config *source;
+
+	if (!data)
+		return &regmap_config_8r_8v;
+
+	source = data->regmap_config ? : &regmap_config_8r_8v;
+
+	if (!data->max_register)
+		return source;
+
+	regmap_config = kmemdup(source, sizeof(*regmap_config), GFP_KERNEL);
+	if (regmap_config)
+		regmap_config->max_register = data->max_register;
+
+	return regmap_config;
+}
+
+static void simple_regmap_config_put(const struct simple_mfd_data *data,
+				     const struct regmap_config *regmap_config)
+{
+	/* This condition holds if data is null */
+	if (regmap_config == &regmap_config_8r_8v)
+		return;
+
+	if (regmap_config == data->regmap_config)
+		return;
+
+	kfree(regmap_config);
+}
+
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
@@ -38,13 +72,14 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config = simple_regmap_config_get(simple_mfd_data);
+	if (!regmap_config)
+		return -ENOMEM;
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+
+	simple_regmap_config_put(simple_mfd_data, regmap_config);
+
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..6fa36b3d7a217 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -8,10 +8,6 @@
  * shared by all sub-devices.  Children can use their parent's device structure
  * (dev.parent) in order to reference it.
  *
- * This driver creates a single register map with the intention for it to be
- * shared by all sub-devices.  Children can use their parent's device structure
- * (dev.parent) in order to reference it.
- *
  * Once the register map has been successfully initialised, any sub-devices
  * represented by child nodes in Device Tree or via the MFD cells in the
  * associated C file will be subsequently registered.
@@ -25,6 +21,7 @@
 
 struct simple_mfd_data {
 	const struct regmap_config *regmap_config;
+	unsigned int max_register;
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
 };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
