Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A6BC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zk19tGrHeYc08EH/xBd8fKxZpTkT32zfgrecMXmbKlg=; b=drcMhQcldMOYtG
	TPlnnAKPa6FRld8DJAnIzZxvOJwnmR3RG/Gw46F1/A9vMnr5MPBK8kWEQrEpqZGwJxBl6N99AV0Wv
	aVKNKwirkbhKS/UK6kx2BZpmGeKtVXKjus0PwfM77q4qmjDQWymVjOENLGCJwLhTeKF0+r/WB6Xmi
	gpUgsL6ntlxfQKJxM9b/YVo7GtgTkmUmSTxJyHqyXcSmtMKqYGiupp6NbS/8KZAQNGSqmI9JwggIK
	4XQODA076JZ3X5n/ZYiq9DKkok/kAQFWy6SXYp/BFrp1QNpE32ufqkyERW+qJJ4DnokfbcmkNu5fm
	VsoHKwW73zZITt16DTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAWG-0000000Eydx-2byc;
	Fri, 27 Jun 2025 14:57:36 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9z2-0000000EtwN-22B8
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 14:23:17 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4a43972dcd7so29130591cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034195; x=1751638995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEeEDXRCRhzfd7WiQWk3nSeJTZHMTuZTnU4CBiNxmaU=;
        b=0KtisoUivtNDcMAA84YIwjOaIkK7bXWnCNsv3OFyJXbMmjMkvU0n3N7sXgxBtZBIe/
         XK8EFd56yLYvBjl8gPFiyH0ABxnnJtD8otiTIH2HZf0BMkhrS0eG73Sc1nWrjek4Lgzy
         t/rZ20EE2EN/hQx8nCYy4QBnaX58sehYZe04ZBDp3s9F5ETSF3Uj9JOuG96lNDlG1xqc
         O4wni0pefphY+vNUfTjX06U9A8lB1NbuWWkqpm79T9tF0ZDVzp2WzZWtUWK7opPX01wG
         wKIOHTDED2l76yHDfrjDSQ3DyNWJSYTVNO8ED3b7UAB9+Q4XvUauUqqbTDBbt5nziJUu
         psag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034195; x=1751638995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEeEDXRCRhzfd7WiQWk3nSeJTZHMTuZTnU4CBiNxmaU=;
        b=TxKuPZ7eIxJlg9hcZ9Du27HID8WPwWsm8XbJOnQXjKJXnvVXt4yAanHxEgGlTfUGIY
         yEHKDNV5CT+iO49mPMxh1436x8ALlKWhH3rFfSgvSSsvmUUNQrwhn98NG93PYUJSzL7P
         VCs7yc3jb/4IJqPDaFaKI3hkxiHyzYPOOhJ7v9PCfylNofnyRZU7NuLPbHXlf7Ln/N3D
         qykKtg7RkC60QY+AsGwHeYOeozTD8irOLYggu7iOIQvvqX3XQQAGvGmKUepivZy+fl5S
         E5VtG2bSCKpXuPNgJl21i/lAXd3Rn1gP54D+vZN43bclW6ViHdQpzYOqY0xBHs06xpSC
         BSNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxJkLTHNFssiIqH0fQOMy6h8vcT8P0QoDxTJt8UR7nPpS8bvP5/Qpfa4FysZKgnqjmCG4SNMo3YFRxxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFU5oM406pGetnPUFTFYnZEyo9rltNosWmHatguzRWx8HtFNVD
	HIdyASYx+2kUxU9btNjW/ulSm/jP5WY6Wme0PTeK3h1dA7Cp1bKAA+6Z6wJQDeMaXu8=
X-Gm-Gg: ASbGnctdmi6fWcc1jLg9R28AFHiUWXC3zkHQJTueIzOarjw5ABP8gxV/k4b+hPuylSR
	6303mG0fTJNtlAVKutJiSMtOYf+KKbqlK8xwPvWKzicEjeasRudPXq1TsMmJ/8vJuaV/CwxamJI
	y8gTCt0ZHG/AwAffyCliJBd966jaqF5F0K9uf6XBEOmDcn3VC9pNY5eZ6gpwKHyTQb4cq+XsTqv
	6JhabAXtkMXlasF1u3/Wnq+icavWA2zwlVfiJ9hIzdl1SNMWAwp47TGPnw+QUE5oRnBI32DuMCt
	9yuEMkWcmGUNJyG1XFQDU2Xy+KH5ikUoFipGK+9po4mLGVLavO3BjgtgvDztZbOLUeUlEtQcheQ
	YXA4Xj+/tO8msQzrqD2wy27J7p7iC22nZ7J2ITLUAWNpk4w==
X-Google-Smtp-Source: AGHT+IHjeJKicOQMrv5A2JPa7JA08EcBfBp+Vurfdw26JNZtOFtPu0+xcyBQuRqWuhl/FSD4KBiKAg==
X-Received: by 2002:a05:620a:2b87:b0:7d3:8ee7:ca10 with SMTP id af79cd13be357-7d443935786mr517736085a.2.1751034195204;
        Fri, 27 Jun 2025 07:23:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:14 -0700 (PDT)
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
Subject: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Fri, 27 Jun 2025 09:23:01 -0500
Message-ID: <20250627142309.1444135-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072316_523618_D91CA34F 
X-CRM114-Status: GOOD (  16.10  )
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
for a device to specify a custome configuration, but no existing
device uses it.

Lee Jones suggested modifying the simple MFD implementation to
remove the generality of the full regmap configuration and add a
max_register value to the simple_mfd_data structure.  This can
be used in the regmap configuration to limit the valid register
addresses if desired.  It's simpler, and covers all existing and
anticipated device types.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v6: - New patch, changing the simple MFD functionality

 drivers/mfd/simple-mfd-i2c.c | 18 ++++++------------
 drivers/mfd/simple-mfd-i2c.h |  2 +-
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..c1dc315d44dcf 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -24,27 +24,21 @@
 
 #include "simple-mfd-i2c.h"
 
-static const struct regmap_config regmap_config_8r_8v = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
-	const struct regmap_config *regmap_config;
+	struct regmap_config regmap_config = { };
 	struct regmap *regmap;
 	int ret;
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config.reg_bits = 8;
+	regmap_config.val_bits = 8;
+	if (simple_mfd_data)
+		regmap_config.max_register = simple_mfd_data->max_register;
 
-	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+	regmap = devm_regmap_init_i2c(i2c, &regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..4121fe1bc1d70 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -24,9 +24,9 @@
 #include <linux/regmap.h>
 
 struct simple_mfd_data {
-	const struct regmap_config *regmap_config;
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
