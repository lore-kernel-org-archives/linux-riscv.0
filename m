Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E20606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1jSfryPD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xydLvQKD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x36qZTMEhl/ei+njBwf9Wd9vIAe6u8nyMGu8XVJM1rE=; b=1jSfryPDNeh7nn2PL5brb67l2k
	2pnq+H/XPpbK2VQ4DOnCzZVyylEqHXMvZ0+Kys1YShUddjtwx/pQXpMMcX3W+LvBvrcPYNq6V9HQc
	1oeHnEDieDQ87Wu7LNOep/DzR1MmmYF3AdjqwIXoELEX2pDY5OceE8d9UHApYMpcyPHyfAHCihdE8
	/7qf00cygWDGPWWR3F6TlmjvEheA6PB3Jlhw4seGCbjUgXEuaSgcDxVrc9rDumZsxHZXqZjGPrzgI
	VT9cWz/tkcxV3SbzBnoyHIWS7wHUqIMF7r9JPfFjEKN880EeQs2beknxa6pknheqC39fV0ruV+gQH
	1cAnX9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf89-00000002cSU-27tT;
	Tue, 10 Nov 2026 06:14:53 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf86-00000002cRS-292K
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 06:14:51 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3370702eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 22:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794291290; x=1794896090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hmsn5rju1QEih4whYeeXauh44x6sfy0wW0ureLZw7mY=;
        b=xydLvQKDJgzMiZTDP7nnyD7vjspXAs/qibSqVWPSALy7VsbawHWwIm6hg2s50ChH0V
         cRIfwcqgVNB3FNzu0ARFGcqQLWKnV4yQXDGmQoY6H7pnzDmCYohVCpRltT3em4X3CH0r
         /lqH395gt6gayjIMEvlehh7l6AN4GJuIbKAAxOj5RJaAMtCcR/gni8LANm46AGvyliEg
         Ioy6a2YwU5BBPuVkAmW52H/mkShpoAynndzLHzXKM/9bjhbFCDbQklVW1RnDiIK1bccb
         A/OGM9ywaK9BIjrEP0iedZRaNgSlPYmkkwn36oFVYBiOkO6JXM7IpPlhVtyqzkcfQLQb
         sUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291290; x=1794896090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hmsn5rju1QEih4whYeeXauh44x6sfy0wW0ureLZw7mY=;
        b=wU7MPlILjS/Sb19Ynjj6qe/wHwZJBlW3dg5w/eaqPR0ac9OQ/4qM1a0vUFusqNJYqc
         s58o763oJQ66xBgrTREqDC7DAQSzFFjT1hK4U0MCW5d0L7IK7B6XOtAugsSI1o1nWL82
         NzjSFasfyMijO2WaIFEDg1sapiqRseaNUmyGvBnlLSuWMq28fjsTEzIpsVL3/9dlaN1d
         ZFOyl+LUBdZfR+qSco/J+t6itFW+Hu86315KMUu3ZT3+4WmjX6CiA06YGbwa2MSdDwkW
         9pAVscx/U7cx0CB0B8N+BoD8lmoKnyxzx/Fyx7amjV4cClB9TkLFxdm24RLuwnhziOdx
         4/kA==
X-Forwarded-Encrypted: i=1; AL+hErEPru80JYpv7ByYAP8tj+xIqVR6pQYQIB9wcS3jh8NCcjRktdsvum9ALaKYqKtmNkf/VElgiUbXnkIxfw==@lists.infradead.org
X-Gm-Message-State: APuU4Z99iPT+jJkXiX+mbB1JLG9MOu5K+kV7OOC70j2gT/HoStWq9COg
	5Nb1Lgk8zoZk6l7kJ7WJz+Vvig7QuKRgffvyAztPpq3nDhZVainNqsEu
X-Gm-Gg: AYBFou1So/pdA9fHii60MUNH8CSsMIO6i8NbxOETvBrJnPsC49F5hLaho6omztqNyA4
	NqVJVNeo1aDTJETKK6d+Gi6iZGvtdP0ggUbBKwc9NnBp8lNnx4dmnn/Mudk3hVSjmAcaur36bjM
	8eigrvNAcFwGYgrXhwpGPNQM1mnqbph10FZB9Lw65WueRhrxFALuAOyVOpBWfGlxKflvyuGP/B7
	UHFrI9p4HRsg6FNrdy7kxmXyiYeODEEYCqOFPPJOIrY5hvFVlepfeS1r7WlcYBKzt0CNQ0KNDuo
	8AO9qB2RDnJJiJkVZH1iCJFKvxaZPalWa0pU5fFpFmOge9gzc5FYxNZlkpSfVW+z5Z+GG9lwCm7
	csw9j7RZqOYlwYLmxOrloaZ46WuKVdZUkAV4Y8Y3ecTNgnlcJ2xYgbljgargtanSjcj65lCFuOU
	8eq5FVSgquq5DorIlqy5fRqMoOGyuIJvYcHnGTc+SMh73ImHt30i0YZvNUVXRROv1FySE52xW/w
	xjuDi5m/t/4aPch625+5N00AxqkHPqaEqahGxsRIo47m/2UzfIiHxKbfOIHZWT2vG7ZjPjRNB/k
	I+I1hv37e92bBZoZyQmUWORtaOS8XmDg
X-Received: by 2002:a05:693c:6007:b0:36c:da71:37e0 with SMTP id 5a478bee46e88-3751c6350e1mr2197912eec.2.1794291289618;
        Mon, 09 Nov 2026 22:14:49 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm3802316eec.28.2026.11.09.22.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:14:48 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C transfers for power-off and restart
Date: Tue, 10 Nov 2026 11:44:27 +0530
Message-ID: <20261110061429.2036-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_221450_558946_E0DBC552 
X-CRM114-Status: GOOD (  18.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
to access the PMIC. However, these handlers run in an atomic notifier
context (specifically within an rcu_read_lock() critical section), while
the I2C-backed regmap uses a sleepable mutex.

This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
context switch in the RCU read-side critical section during shutdown on the
Banana Pi BPI-F3:

[  563.803475] WARNING: suspicious RCU usage
[  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
[  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
...
[  563.841445] locks held by shutdown/1: 2, last CPU#0:
[  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
[  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2

Replace the regmap operations with atomic I2C transfers to avoid sleeping
in an atomic context. Preserve unrelated register bits through
read-modify-write operations and check for atomic I2C support before
registering the handlers.

Obtain the I2C client from the parent device and verify that the adapter
supports atomic transfers before registering the handlers.

Tested on the Banana Pi BPI-F3 (SpacemiT K1).

Assisted-by: LLM
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/power/reset/spacemit-p1-reboot.c | 86 ++++++++++++++++++++----
 1 file changed, 74 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
index c0454b547718..8fcb3eadddf3 100644
--- a/drivers/power/reset/spacemit-p1-reboot.c
+++ b/drivers/power/reset/spacemit-p1-reboot.c
@@ -4,8 +4,9 @@
  */
 
 #include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
 #include <linux/reboot.h>
 
 /* Power Control Register 2 */
@@ -13,13 +14,68 @@
 #define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
 #define PWR_CTRL2_RST		BIT(1)	/* Reset request */
 
+static int spacemit_p1_read_atomic(struct i2c_client *client,
+				   u8 reg, u8 *val)
+{
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags & I2C_M_TEN,
+			.len = 1,
+			.buf = &reg,
+		},
+		{
+			.addr = client->addr,
+			.flags = (client->flags & I2C_M_TEN) | I2C_M_RD,
+			.len = 1,
+			.buf = val,
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : ret < 0 ? ret : -EIO;
+}
+
+static int spacemit_p1_write_atomic(struct i2c_client *client,
+				    u8 reg, u8 val)
+{
+	u8 buf[] = { reg, val };
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = client->flags & I2C_M_TEN,
+		.len = sizeof(buf),
+		.buf = buf,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+
+	return ret == 1 ? 0 : ret < 0 ? ret : -EIO;
+}
+
+static int spacemit_p1_update_bits_atomic(struct i2c_client *client,
+					  u8 reg, u8 mask)
+{
+	u8 val;
+	int ret;
+
+	ret = spacemit_p1_read_atomic(client, reg, &val);
+	if (ret)
+		return ret;
+
+	return spacemit_p1_write_atomic(client, reg, val | mask);
+}
+
 static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
 {
-	struct regmap *regmap = data->cb_data;
+	struct i2c_client *client = data->cb_data;
 	int ret;
 
 	/* Put the PMIC into shutdown state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_SHUTDOWN);
+	ret = spacemit_p1_update_bits_atomic(client, PWR_CTRL2,
+					     PWR_CTRL2_SHUTDOWN);
 	if (ret) {
 		dev_err(data->dev, "shutdown failed: %d\n", ret);
 		return notifier_from_errno(ret);
@@ -30,11 +86,12 @@ static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
 
 static int spacemit_p1_restart_handler(struct sys_off_data *data)
 {
-	struct regmap *regmap = data->cb_data;
+	struct i2c_client *client = data->cb_data;
 	int ret;
 
 	/* Put the PMIC into reset state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_RST);
+	ret = spacemit_p1_update_bits_atomic(client, PWR_CTRL2,
+					     PWR_CTRL2_RST);
 	if (ret) {
 		dev_err(data->dev, "restart failed: %d\n", ret);
 		return notifier_from_errno(ret);
@@ -46,21 +103,26 @@ static int spacemit_p1_restart_handler(struct sys_off_data *data)
 static int spacemit_p1_reboot_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
+	struct i2c_client *client;
 	int ret;
 
-	regmap = dev_get_regmap(dev->parent, NULL);
-	if (!regmap)
-		return -ENODEV;
+	client = i2c_verify_client(dev->parent);
+	if (!client)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to find parent I2C client\n");
+
+	if (!client->adapter->algo->xfer_atomic)
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "Atomic I2C transfers not supported\n");
 
-	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler,
-					      regmap);
+	ret = devm_register_power_off_handler(dev, spacemit_p1_pwroff_handler,
+					      client);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to register power off handler\n");
 
 	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler,
-					    regmap);
+					    client);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to register restart handler\n");
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
