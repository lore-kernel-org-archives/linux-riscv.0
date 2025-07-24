Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D0DC83F26
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eiI2bLcvFdOGKC4pm1cB5UcpMqJ1Rho7yvzBkxdmqE=; b=N222y98a22/9Aj
	t1MxM57pFXRM5EoujY/yjqGS3Z7TZ/EZerTpJOuOdpuZjfgHVzGLCMaZqVZ0tWSUfbeihVQkxGMR9
	cMmciqgcPy6Ni//7iKW35yKCU7dQ+c4d8Kd/Rjo/yR/XnUOmsf+pn8ut3SuFp3QyF5yz62c5vIlG9
	xqr6ZsZbhTUU8f/mTNqYePLt3IorxFdj/wWHY86Mls3f6yiPreOo58OiLxpupLiFqFPliyr4vTDK3
	qeznfl8A7QcNyOU2lmRDfiaIqTYOXuyzUbN9EKJ6dRkiet7ocDVLruUS0GzQhcx9pK6NQO30eF9/f
	N/URf+ru4JoGaG3APNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VH-00000008Nsb-3VYh;
	Thu, 24 Jul 2025 20:25:23 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VE-00000008Nr4-0gCM
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:25:21 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-87c4bacb68eso43729639f.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388719; x=1753993519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUWJeO10MspBNvjbgvonhw7oiCj7Ud69EwF31dVMKc0=;
        b=dewzfAHbWmpnFznqZiuW7UZzOZ0tFUoK9YZ1ZPd9Caa2tq2iLFWMUJDepfvPkZ1xg5
         Vpc9ABdYZ4lH9/MOULbER8jJq987lnRFv5N8OqK0mf3agRX5ZnZtOvYbeOWmQCioD+yD
         W9VqFDwr/VYQfiAYU3RoylWV262SNdW0G2ddgWu0K7vdBH3AhPrj+wyNmb3mlnSkfBfK
         vAeZB9DKV5S2lMZwfdF1q7hp84CY4i/NV3Ra2P135/Uz48/ptG/2jAEG/tpYMkkYCeWF
         VDxgqL+kkSdyKKqxWR52YX4qaOrH3KZotqboROph+JDIRW+iIeXe0aRzAlL4cXC6Tk5S
         Woag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388719; x=1753993519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUWJeO10MspBNvjbgvonhw7oiCj7Ud69EwF31dVMKc0=;
        b=TgScVvPAnDckH8FwcZcdys2hJpw37SwVm5y5zLtM9mWL32CGiFG/wgGkt826Y3JxpG
         +TBFyqtZKfCCqxBcaQIswrGKrrgqz+KWS6lHwTm2hlRixFRehEx/xVJZM6FMNW19/MCR
         sy9HcoUhw0qpUtK32niFhrjTp8Gm/UDtQbIkJ1aV6BpWFea53A1s8HODS7b3R8EQ1FYN
         W6SS+dJZ9d2dnQSPY7KpA4wtwtUHOdiWPqiSMF3in0ek91p+hMETV3hyESE2OfFngpYg
         LnYF4N/c9T/oQC60s1sc4dJRijgga93qFRaC/jAWFwl34/t7cZeHze+nl2oH+RFc/SQt
         JrIw==
X-Forwarded-Encrypted: i=1; AJvYcCUh+/ZVs2RAmSd1jcssVpeCSZJgj4GAjP8u+XPSjzQeEFxGgvVjWOVNiFFDTrEML04Es2hxcxULExy9gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymV6ntt5MfU93waS6CHF9ndy7sYGDxRHETq9rOcuwU4h6Js+s5
	KWHLhyVhObwUAlxS+0X4exekFdz2CN1sz3a9aIGp+8pj4W4TEF1/BhBdayfk0OZf3QM=
X-Gm-Gg: ASbGncsSBx57b13WdEJWCiUZ61gvj/JGuOZQJm0SGQIQPYsyYA9LTP94a2X5s+n6dq3
	F+6txnENlkr2FanHM72Xsk+TrlMcoEF9Vm5oj8Z0WBGJrWzL01aBdMaQzTz6k/P6ZwFJUFWQUek
	iDPhClWDyCKGZkRx/NtiV+pkrZ/T/+XV4Kzc0Qm0jqsze35OAeUhGtK1Gp5nJKoezI9ywv7KxZ1
	TAZGVDEuSu89v6DI5sbi2+UTLSx/83HpuFEnxUlmo3z4QJFSKrFFZGPWkJM1Pml369DsLE8pAtp
	597VoXOi/qfdDG35dj0O8yT1cFaQrWc2DKlPPhEfOylFmFr6jZFvKT/TPEjYRfQKI6F//0BbBoB
	X1GaAPZr6nkZBgxJISFRznwhYXxCqls3ZAfVqVL+Z
X-Google-Smtp-Source: AGHT+IFUp9h4K9IBStIoZAgqsn9asnHHUeYZME463FiGof5MP3p6oGHeDXOYqEh2MNkn2bzq84JyzQ==
X-Received: by 2002:a05:6602:b8e:b0:876:7876:a587 with SMTP id ca18e2360f4ac-87c64dc5c35mr1342670039f.0.1753388719095;
        Thu, 24 Jul 2025 13:25:19 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:18 -0700 (PDT)
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
Subject: [PATCH v9 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Thu, 24 Jul 2025 15:25:03 -0500
Message-ID: <20250724202511.499288-3-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_132520_199548_0A26F121 
X-CRM114-Status: GOOD (  18.68  )
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
v9: - max_register takes precedence over regmap_config in simple_mfd_data
    - New function simple_regmap_config() encapsulates providing config
    - simple_regmap_config() allocates a regmap_config if necessary
    - A small duplicated comment is removed in "simple-mfd-i2c.h"

 drivers/mfd/simple-mfd-i2c.c | 38 +++++++++++++++++++++++++++++++-----
 drivers/mfd/simple-mfd-i2c.h |  5 +----
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..f3ba79c112d4e 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -29,6 +29,36 @@ static const struct regmap_config regmap_config_8r_8v = {
 	.val_bits = 8,
 };
 
+/*
+ * Determine regmap config to use.  If no regmap_config is provided,
+ * regmap_config_8r_8v is used.  If max_register is specified it is
+ * (also) used, whether or not regmap_config is provided.
+ */
+static const struct regmap_config *
+simple_regmap_config(struct device *dev, const struct simple_mfd_data *data)
+{
+	struct regmap_config *regmap_config;
+
+	if (!data)
+		return &regmap_config_8r_8v;
+
+	if (data->regmap_config && !data->max_register)
+		return data->regmap_config;
+
+	regmap_config = devm_kzalloc(dev, sizeof(*regmap_config), GFP_KERNEL);
+	if (!regmap_config)
+		return NULL;
+
+	if (data->regmap_config)
+		*regmap_config = *data->regmap_config;
+	else
+		*regmap_config = regmap_config_8r_8v;
+	if (data->max_register)
+		regmap_config->max_register = data->max_register;
+
+	return regmap_config;
+}
+
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
@@ -38,11 +68,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config = simple_regmap_config(&i2c->dev, simple_mfd_data);
+	if (!regmap_config)
+		return -ENOMEM;
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
 	if (IS_ERR(regmap))
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
