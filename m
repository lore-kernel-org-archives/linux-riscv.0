Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F30C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ACE56109E
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6ACE56109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wriLZJJBokxVuMcnzEBQM5yvn9Q4vjMr1+Zbns4m64s=; b=FSj/J0z/C4FfEH
	d1HehDq+h0Sw4PLHbfWs2NuawSq2ZWlO0jKzw2xg/l/s+jtP4+VQeeQkQI14UgS6YrYEw6TESYJjq
	lw71xsax3O7ZLU4YJ8SSmW6xaNa4glH0/QfIKyqfTHB9QjyMWQM2TbC+zNTY2JM1kK92U200q+gx3
	X2vWlTDOdhVf25blkhsJg7HWdrXzMo3DmPYNeV0zAVwtFdStUHKdidHHYequ3lIIY6yjU+VnblSpS
	9BrFWbHCVBZni1Sa0noOdGnv8WmdWxQkxtcG03iq9NoMEIRvvdlkji4BqhMEfUtNkSbWgmlSl9LQ0
	yGrPV+cXvWh3SNlKlb1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqOq-006Dw9-U9; Wed, 27 Oct 2021 21:23:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJs-006Atv-GH; Wed, 27 Oct 2021 21:18:50 +0000
Received: by mail-lf1-x131.google.com with SMTP id bi35so8959448lfb.9;
 Wed, 27 Oct 2021 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VpMTaQaJ0cjNLgvNqh3di7liIGTew7KcJqDZRitT+Gs=;
 b=IWwdEP2zbLaLlU4mCU5s8PpqrkaIWlck+oA3xnCuAzsOirLY91m5COquObIzRO/SOa
 ZZIFcDLGTP22p0/7Hcw3xr55ftJZWhQ4nU6sBNGCfWjV2gTeJrHUPc9jLo/fr5xO0l0l
 0SNS1n6R63fMlbNJFT3gbKkQCc0Ia7/EAvKfYLtASP95KzfXrWNNTSb1yRqxn8x5d6xD
 hciHreIyBYgx6dcdUlzTSBb07ys9RFpq3Y5/l5Vd2vvkqxnAXOO/WD9ek4xsO4aDTsfM
 H41ne9Olkj2NqvJkNPysdfnoteByPeCFY3T52VBJFYJ9FKDG6+cEspYVw2UY7y4ppIDD
 pOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VpMTaQaJ0cjNLgvNqh3di7liIGTew7KcJqDZRitT+Gs=;
 b=oj8ctbbt8bXFBvrAMk1kVflMw0CjpMehrgJDyBAN+WmOXUhAi8+lq0ChtAFyGzm9qT
 Vd2novti1oTBjskx7y8ExylenVvWhoDylOXU6m5unXv6pbnOt58aw6XmqbtkGTPqFm2X
 3PHLe+xi4wLQpqiXSZfjO6AvNMXoyGbbbjqPRa6tr2dHFBcVjhDn/6YewtEK6YTvLMd/
 DQd04aBrmg7Iis+WbzI0OZYjvirQ651J2UlwoyLoGgqFX0158qRtgDlXGplBRtR2Zt5T
 V05SxfFevnZ+NoRxD06UxQZKpqnHMUWh35ut2Xzctb1Jq/P2cWEJkIbA2Fp+D4QeC5I8
 FagQ==
X-Gm-Message-State: AOAM531P9jw78gCfJLZcVmAngxkdF/UpyhkVCsUBN32jmSTxway/R6Ly
 WerQ8ndNPjJJcDd26sb0DZk=
X-Google-Smtp-Source: ABdhPJys0u/+wFsWDr/9j4b/C5x8WEos0EuABuOI0MYqETh3mbRQO/mjL91g1gnGx/4TO6/Fje2n8g==
X-Received: by 2002:ac2:4c9a:: with SMTP id d26mr128014lfl.344.1635369526848; 
 Wed, 27 Oct 2021 14:18:46 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [PATCH v2 29/45] mfd: acer-a500: Use devm_register_power_handler()
Date: Thu, 28 Oct 2021 00:16:59 +0300
Message-Id: <20211027211715.12671-30-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141848_686956_3D3A8179 
X-CRM114-Status: GOOD (  17.30  )
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

Use devm_register_power_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers. It also
provides restart-handler support, i.e. all in one API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/acer-ec-a500.c | 52 ++++++++++++++------------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/mfd/acer-ec-a500.c b/drivers/mfd/acer-ec-a500.c
index 80c2fdd14fc4..fc864abc0049 100644
--- a/drivers/mfd/acer-ec-a500.c
+++ b/drivers/mfd/acer-ec-a500.c
@@ -31,8 +31,6 @@ enum {
 	REG_COLD_REBOOT = 0x55,
 };
 
-static struct i2c_client *a500_ec_client_pm_off;
-
 static int a500_ec_read(void *context, const void *reg_buf, size_t reg_size,
 			void *val_buf, size_t val_sizel)
 {
@@ -104,32 +102,35 @@ static const struct regmap_bus a500_ec_regmap_bus = {
 	.max_raw_read = 2,
 };
 
-static void a500_ec_poweroff(void)
+static void a500_ec_power_off_handler(struct power_off_data *data)
 {
-	i2c_smbus_write_word_data(a500_ec_client_pm_off,
-				  REG_SHUTDOWN, CMD_SHUTDOWN);
+	struct i2c_client *client = data->cb_data;
+
+	i2c_smbus_write_word_data(client, REG_SHUTDOWN, CMD_SHUTDOWN);
 
 	mdelay(A500_EC_POWER_CMD_TIMEOUT);
 }
 
-static int a500_ec_restart_notify(struct notifier_block *this,
-				  unsigned long reboot_mode, void *data)
+static void a500_ec_restart_handler(struct restart_data *data)
 {
-	if (reboot_mode == REBOOT_WARM)
-		i2c_smbus_write_word_data(a500_ec_client_pm_off,
+	struct i2c_client *client = data->cb_data;
+
+	if (data->mode == REBOOT_WARM)
+		i2c_smbus_write_word_data(client,
 					  REG_WARM_REBOOT, CMD_WARM_REBOOT);
 	else
-		i2c_smbus_write_word_data(a500_ec_client_pm_off,
+		i2c_smbus_write_word_data(client,
 					  REG_COLD_REBOOT, CMD_COLD_REBOOT);
 
 	mdelay(A500_EC_POWER_CMD_TIMEOUT);
-
-	return NOTIFY_DONE;
 }
 
-static struct notifier_block a500_ec_restart_handler = {
-	.notifier_call = a500_ec_restart_notify,
-	.priority = 200,
+static struct power_handler a500_ec_power_handler = {
+	.restart_cb = a500_ec_restart_handler,
+	.restart_priority = RESTART_PRIO_HIGH,
+
+	.power_off_cb = a500_ec_power_off_handler,
+	.power_off_priority = POWEROFF_PRIO_HIGH,
 };
 
 static const struct mfd_cell a500_ec_cells[] = {
@@ -156,26 +157,12 @@ static int a500_ec_probe(struct i2c_client *client)
 	}
 
 	if (of_device_is_system_power_controller(client->dev.of_node)) {
-		a500_ec_client_pm_off = client;
+		a500_ec_power_handler.cb_data = client;
 
-		err = register_restart_handler(&a500_ec_restart_handler);
+		err = devm_register_power_handler(&client->dev,
+						  &a500_ec_power_handler);
 		if (err)
 			return err;
-
-		if (!pm_power_off)
-			pm_power_off = a500_ec_poweroff;
-	}
-
-	return 0;
-}
-
-static int a500_ec_remove(struct i2c_client *client)
-{
-	if (of_device_is_system_power_controller(client->dev.of_node)) {
-		if (pm_power_off == a500_ec_poweroff)
-			pm_power_off = NULL;
-
-		unregister_restart_handler(&a500_ec_restart_handler);
 	}
 
 	return 0;
@@ -193,7 +180,6 @@ static struct i2c_driver a500_ec_driver = {
 		.of_match_table = a500_ec_match,
 	},
 	.probe_new = a500_ec_probe,
-	.remove = a500_ec_remove,
 };
 module_i2c_driver(a500_ec_driver);
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
