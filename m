Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EE0C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyfsHrmkEPUeNtus2eVVX3lzMThrrR4+p+X+ytXjxBM=; b=gQtQZVWktlM7Z0
	eaqq3pHJ1dHO2LudfQi3c6wapjEbNBnuc0GNrucEr8yEVWVjhb2IYSqqfS3U5shYLZdKwyM1wqNZB
	vbyk9L+OZ80w7mu5axTBngOqZ6k8aAQXA8SzhUM/QHhbL/jEXZnUZX1VVzG13ePB5sSa68G0w4sMA
	f0LE91oBet6jv8Hymz2tyR7tcC6xK8r+4H9ArpjHt6QdKyhivgKaQ2Z7a2Vc0ieozadMq7JBtcjMy
	LDQhRSXwYU/bdGdLUx3el61dlDgNKN2OLC+hO5T6FVtJWuK7ghWGMKIE/kcZjLYAP57qNyjWx22wn
	paYXK6vyRoPbgYoj4ldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTwC-0000000HWsb-325n;
	Thu, 15 May 2025 08:27:32 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTrg-0000000HVM2-1FKN
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:22:55 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso341149a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1747297362; x=1747902162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwF2mpLnEXgp6MS24DBfTJGU9J3NTQxVKIISS1QkMRY=;
        b=bS8lrOqwMsF54i32e2I/K2AnHdY4XzkVCsFGAwzMSBg87LeRvResphrm3QZunxa2N8
         GUwJ8mn14vND+LQqz3d9e16/tUCUn9eq/I0Wo/+kdO4ib0usz6LNkGnKIC8F2T4AW1pm
         SAMYt10HOkgmR1YthtXVDz+2dbdYd6uJdF0vCHxwpMQ+OEpLQl+O+4AQJn3RnWdoBa9O
         2yz8DQdnGVkKxYSM73bbN3J/kMM9zn6sFnrzgq8/yGHR8f58ZeDVhuGDb0kKnUgacMiG
         quGITMvPRJ7BFIm+zNin3zqdeqhtCKsyixbX3zHfyS4/ZBiGNwfdjid4k9vgSASrurdr
         14uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297362; x=1747902162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwF2mpLnEXgp6MS24DBfTJGU9J3NTQxVKIISS1QkMRY=;
        b=q0+kYTX9uvJLAHDDpeQGgZtBIJ+JKhkDLnUs4s2CFJUV6DBQSlERj1GONnH4KdhDYR
         +rGDJablIUwAkpqYJvCtm/HF8MF4HCdecBphGoKREn8Pfc0r8QY87ZsmScU4HVpuEA5j
         64hI3U5nMJiRtv4aRx1WUQ1bx45CyQOPeWm16Yizjgc2i4KK0e8aMtG46m3oY4vuLZtr
         pMqkCC0KdtX5disQDDNayw+9tH3Xx653iMR+s4vPkpWkGZavY5JnlU6dh4bCE4UCFXTq
         15lnLIJzErV8gYX8lVaNYf8uoWspeHP9KUNkqnc7RAHbhsY2sHLO0n3C9bC+BaE1pWLm
         Zovg==
X-Forwarded-Encrypted: i=1; AJvYcCUzWiclhKn9aHNfc1fT0PpyMnY8OJrjFc6VpS0QaxK5bkY9AQdua2qxVK30w+QXmMNY6VJJfXs2BZdxFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGXbJI/haAc4ZOx0V+xQZd7pkixYqL11JqD7nTzoZkJyBI3W11
	Wn1i5jlhZzowlcPQ+fmt40rUW13snfJ4Vz28KFlmt8Pfa0N9uKmyLti6eqAKlak=
X-Gm-Gg: ASbGncsB6ShdCiL/7zMmIfpztfI9UYHP8U++ol/Fp5/9+rgeXP1iCmwiG8txcK0NIMT
	g3PaumHKWj7+fJr81Xs14sxA8jOyUD8/A6wFo39sEakRy3jeY4MqeUU6sGydplJ2jgDUG/5hR0t
	2feRTzips8APjl5lQYPdT2tvfkHuhq+TfLlwcNgZ1DXRuHvO8SMtfHbH0tkY+RXaLVuKpp7QjRl
	PCuJGy1IrhwLZJ2pqDG+0NP36/6j+vx/t7aFj1ld6NFXO0nsjlwDF4l63yUl+PE2tY/dj/c/9dC
	matozSzl96a2+uk6wXQHyxFm/nzSqc0DrLJraLneiaYiRzu1CP3w9iQ8Ow+p5FFvOWNLeBijE7C
	BDZLUrOGcx3+me847vkvqqzE3F8S+kc30XemH8PgeFuM=
X-Google-Smtp-Source: AGHT+IFoAqDUpGzwC9J9Vfxc7d04H0Ld+rHi4ImfRVH+QnmmS1i9bVST/jFIeL7kigUyfhHbFokLQQ==
X-Received: by 2002:a17:90b:55d0:b0:309:fac6:44f9 with SMTP id 98e67ed59e1d1-30e51947471mr2175743a91.31.1747297361651;
        Thu, 15 May 2025 01:22:41 -0700 (PDT)
Received: from localhost.localdomain (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33451e97sm2909715a91.25.2025.05.15.01.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:22:41 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 15 May 2025 16:14:39 +0800
Message-Id: <20250515081449.1433772-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515081449.1433772-1-chiang.brian@inventec.com>
References: <20250515081449.1433772-1-chiang.brian@inventec.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012252_333627_C619070A 
X-CRM114-Status: GOOD (  18.89  )
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

The TPS53685 is a fully AMD SVI3 compliant step down
controller with trans-inductor voltage regulator
(TLVR) topology support, dual channels, built-in
non-volatile memory (NVM), PMBus interface, and
full compatible with TI NexFET smart power
stages.
Add support for it to the tps53679 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v6 -> v7:
	1. Modify the type of device_id from u16 to char *
	2. Run make.cross with ARCH nios2, powerpc, and riscv
	- Link to v6: https://lore.kernel.org/all/20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com/

v5 -> v6:
	1. Add information about tps53685 into tps53679.rst
	2. Add additional flags when identifing the chip as tps53685
	3. Adjust length once returned device id is terminated by null character
	- Link to v5: https://lore.kernel.org/all/20250314033040.3190642-1-chiang.brian@inventec.com/

v4 -> v5: 
	1. document the compatible of tps53685 into dt-bindings
	2. add the buffer length as argument for %*ph
	3. Add Changelog
	- Link to v4: https://lore.kernel.org/all/CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com/

v3 -> v4: 
	1. Add length comparison into the comparison of "id",or it may be true when 
	   the substring of "id" matches device id. 
	2. Restore `return 0;` in `tps53679_identify_chip()`
	- Link to v3: https://lore.kernel.org/all/CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com/

v2 -> v3:
	1. Remove the length comparsion in the comparison of "id".
	- Link to v2: https://lore.kernel.org/all/CAJCfHmUteFM+nUZWBWvmwFjALg1QUL5r+=syU1HmYTL1ewQWqA@mail.gmail.com/

v1 -> v2: 
	1. Modify subject and description to meet requirements
	2. Add "tps53685" into enum chips with numeric order
	3. Modify the content of marco "TPS53681_DEVICE_ID" from 0x81 to "\x81"
	   Add marco "TPS53685_DEVICE_ID" with content "TIShP"
	4. Modify the type of "id" from u16 to char* in `tps53679_identify_chip()`
	5. Modify the comparison of "id". It will be true if the string "id" matches 
	   device ID and compare with type char*,
	6. Add the length comparsion into the comparison of "id".
	7. Modify "len" as return code in `tps53679_identify_chip()`
	8. Output device error log with %*ph, instead of 0x%x\n" 
	9. Use existing tps53679_identify_multiphase() with argument 
	   "TPS53685_DEVICE_ID" in tps53685_identify() rather than creating one
	   tps53685_identify_multiphase()
	- Link to v1: https://lore.kernel.org/all/CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com/

 Documentation/hwmon/tps53679.rst |  8 +++++++
 drivers/hwmon/pmbus/tps53679.c   | 36 +++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/tps53679.rst b/Documentation/hwmon/tps53679.rst
index 3b9561648c24..dd5e4a37375d 100644
--- a/Documentation/hwmon/tps53679.rst
+++ b/Documentation/hwmon/tps53679.rst
@@ -43,6 +43,14 @@ Supported chips:
 
     Datasheet: https://www.ti.com/lit/gpn/TPS53681
 
+  * Texas Instruments TPS53685
+
+    Prefix: 'tps53685'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.ti.com/lit/gpn/TPS53685
+
   * Texas Instruments TPS53688
 
     Prefix: 'tps53688'
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 63524dff5e75..01fefaef1688 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -16,7 +16,7 @@
 #include "pmbus.h"
 
 enum chips {
-	tps53647, tps53667, tps53676, tps53679, tps53681, tps53688
+	tps53647, tps53667, tps53676, tps53679, tps53681, tps53685, tps53688
 };
 
 #define TPS53647_PAGE_NUM		1
@@ -31,7 +31,8 @@ enum chips {
 #define TPS53679_PROT_VR13_5MV		0x07 /* VR13.0 mode, 5-mV DAC */
 #define TPS53679_PAGE_NUM		2
 
-#define TPS53681_DEVICE_ID		0x81
+#define TPS53681_DEVICE_ID     "\x81"
+#define TPS53685_DEVICE_ID     "TIShP"
 
 #define TPS53681_PMBUS_REVISION		0x33
 
@@ -86,10 +87,12 @@ static int tps53679_identify_phases(struct i2c_client *client,
 }
 
 static int tps53679_identify_chip(struct i2c_client *client,
-				  u8 revision, u16 id)
+				  u8 revision, char *id)
 {
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
+	int buf_len;
+	int id_len;
 
 	ret = pmbus_read_byte_data(client, 0, PMBUS_REVISION);
 	if (ret < 0)
@@ -102,8 +105,14 @@ static int tps53679_identify_chip(struct i2c_client *client,
 	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
 	if (ret < 0)
 		return ret;
-	if (ret != 1 || buf[0] != id) {
-		dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
+
+	/* Adjust length if null terminator if present */
+	buf_len = (buf[ret - 1] != '\x00' ? ret : ret - 1);
+
+	id_len = strlen(id);
+
+	if (buf_len != id_len || strncmp(id, buf, id_len)) {
+		dev_err(&client->dev, "Unexpected device ID: %*ph\n", ret, buf);
 		return -ENODEV;
 	}
 	return 0;
@@ -138,6 +147,16 @@ static int tps53679_identify(struct i2c_client *client,
 	return tps53679_identify_mode(client, info);
 }
 
+static int tps53685_identify(struct i2c_client *client,
+				 struct pmbus_driver_info *info)
+{
+	info->func[1] |= PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+			 PMBUS_HAVE_STATUS_INPUT;
+	info->format[PSC_VOLTAGE_OUT] = linear;
+	return tps53679_identify_chip(client, TPS53681_PMBUS_REVISION,
+					   TPS53685_DEVICE_ID);
+}
+
 static int tps53681_identify(struct i2c_client *client,
 			     struct pmbus_driver_info *info)
 {
@@ -263,6 +282,10 @@ static int tps53679_probe(struct i2c_client *client)
 		info->identify = tps53681_identify;
 		info->read_word_data = tps53681_read_word_data;
 		break;
+	case tps53685:
+	    info->pages = TPS53679_PAGE_NUM;
+	    info->identify = tps53685_identify;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -277,6 +300,7 @@ static const struct i2c_device_id tps53679_id[] = {
 	{"tps53676", tps53676},
 	{"tps53679", tps53679},
 	{"tps53681", tps53681},
+	{"tps53685", tps53685},
 	{"tps53688", tps53688},
 	{}
 };
@@ -289,6 +313,7 @@ static const struct of_device_id __maybe_unused tps53679_of_match[] = {
 	{.compatible = "ti,tps53676", .data = (void *)tps53676},
 	{.compatible = "ti,tps53679", .data = (void *)tps53679},
 	{.compatible = "ti,tps53681", .data = (void *)tps53681},
+	{.compatible = "ti,tps53685", .data = (void *)tps53685},
 	{.compatible = "ti,tps53688", .data = (void *)tps53688},
 	{}
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
