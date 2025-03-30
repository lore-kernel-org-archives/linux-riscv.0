Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D3AC28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6iYG/DNlKo4GyjHFmFUNimxyvaoKB1KGVbwmD4yt12Q=; b=zQnf0d6inz3Gh7
	rkuHhUzrV+U8j1ZO54OlZ9j7mZ18gTjd9TZgffyL5gdQk+5P56tgxkN6kf1bP8c4BKVaRZxZ68kPZ
	acDyqgomEq8ty5X6fy1kj6Af0zR9mmgPqY5dS800hX6W6BvnXSbyB2+AhVoooHHV7Az2lr/uZR8b1
	S1vfYtWpBsCFwsHuSoq6Q3cj7YPfe0rKlO1Qu2mTHcxh4acEdkaUnB2tbL3n5FkYaEAnVMHDR1fHq
	uRrxJlHskKRLclFRVkyPh9q/kSL5sh+VZspKuksDdIOaDjRVXzMHWuOR/TjwkWg8WklbkbanPCZ8N
	/tW3kooioW7JhYJEB/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyul7-0000000GLWW-0v98;
	Sun, 30 Mar 2025 15:39:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyul4-0000000GLW6-18PF
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 15:39:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224100e9a5cso69308965ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 08:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743349173; x=1743953973; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Odf5uJ0Td/+P0oybq3bSP7hkpl6mnapoydQezFJvEAo=;
        b=hiE6YuspulsE+DkLsi+Ocvlw0O/lupncWToS5jCc/V+k8DxuqAV2rt1aGhPCOvT47y
         NJuCvn40lbktA066BHs9i6Lin10kJT/XTFfS7a/RwPCv64JqRpKNt+vJCBGDM2DNP9wD
         I6/E8j63ZU2WNpOsyx/neGjVKQKheQGfrdv65+n3IJQPH4fJBXMOUopW3x1TuizEBR9b
         x5QtJ6EZ3TK2E51irbZLYZal13EBjmLbBkzJmqA/CuFX1FHFcKom9dB0ParuC4lze4Ws
         MYI4YeuGsGRQ9LFe+qwZf/Q9Q2BZWqZk4NjESoye9W+n5XwEPKo+rAoOE3EKQCTBqDAi
         pPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743349173; x=1743953973;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Odf5uJ0Td/+P0oybq3bSP7hkpl6mnapoydQezFJvEAo=;
        b=wTwzHOS4IQZ8m1r+Wm2CxtgGNn5bTRdw+P2VNRaVEMb5VIDbYl6vvx9YrE/MELSolA
         4BHVNIQCVfzS4ucwc3rUB5tSdHw2+K086ARWU3DDlm7WA/n2mPou8NvdK+4Q1vmVQ0qw
         px7ABTW239+/nWrExwCPDDnI+WFmPoZJnuTbwRfgpdx02uhaEZ/MSNroGGYUvCmAtmd8
         N/ju9mJSC8JOM5vGgGNwVwvR1miEC7/QL6Xbp9M8LQZz5T/SjZQmj1E3EgEgas+Wn4XQ
         OeieGyIrfjJ2wMtgki0fURN57SRN+wTTzbqj/65wexA+q8KxHBObZKXsceFFpcQ8fYSC
         RIgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMqZqq69jKJkEo7POp+91QOZic97rUiXyFwrtiH47/SRYQxlXt4z6bC42g789GjFNcm/dYNMJZBMTimQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh+o8Oqv75jHuh4h66pvB2yYiAqerD7MB+z6y7jw72BFvNbFXy
	pmiFeOG0RZhm7s7EszW5c//+/xYi/kEO3IUYhzxeobH3zdAbnUx3
X-Gm-Gg: ASbGncvsDWHiXK/MMIvmzXlELhc7qgyn8VYpQx5wwRaf8icsZYOMuSKrj+UwruTjfWl
	IT5ujwylJJRD0kEtZXXr4LaFg/4I6smiUGZg0Kb6JD+MKshS3Lx5PPns3gNxGla7OJkdZGqVgyn
	IWMCQ1kSsp7ATzESB5DJfG2vWYkIqxsLnDp2+KCNBxWpvV1+Hc7ERejm1Vi1C5Pc/ZoBQVSd/zR
	XAt8hY06OI0C/rhLTN1DaQlcyLzEkIfTzG2+iOG1LOYdmSQnc9bro5iRRjF8PYnixWVjTdIG/Tr
	PjE38n424grFeZsHidyiSBDQBmy7rXJjv5WO60kWfW7m
X-Google-Smtp-Source: AGHT+IGSfLghLy1Qv0g2krph+jEYh4k6lQKvKQSkwKC/0u+H62Q2vpUTqwtgr3qkYZBhkZ23R3zJBA==
X-Received: by 2002:a17:902:ef07:b0:211:e812:3948 with SMTP id d9443c01a7336-2292f8a0002mr98229895ad.0.1743349172977;
        Sun, 30 Mar 2025 08:39:32 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec7309sm53793865ad.33.2025.03.30.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 08:39:32 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 30 Mar 2025 12:39:16 -0300
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer dereferences
 while probing
MIME-Version: 1.0
Message-Id: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKNl6WcC/x2MWwqAIBAAryL7nWBKYF0l+vCx5RKYaEQg3j3pc
 wZmKhTMhAUWViHjQ4Wu2GEcGLhg4oGcfGeQQk5CKcHvQPFMxvOdXj5rb4XXTllU0JOUset/t26
 tfT4lQMleAAAA
X-Change-ID: 20250330-thinkpad-fix-98db0d8c3be3
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Damian Tometzki <damian@riscv-rocks.de>, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_083934_321230_33CD68F7 
X-CRM114-Status: GOOD (  14.54  )
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

Some subdrivers make use of the global reference tpacpi_pdev during
initialization, which is called from the platform driver's probe.
However, after

commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")

this variable is only properly initialized *after* probing and this can
result in a NULL pointer dereference.

In order to fix this without reverting the commit, register the platform
bundle in two steps, first create and initialize tpacpi_pdev, then
register the driver synchronously with platform_driver_probe(). This way
the benefits of commit 38b9ab80db31 are preserved.

Additionally,

commit 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")

introduced a similar problem, however tpacpi_sensors_pdev is only used
once inside the probe, so replace the global reference with the one
given by the probe.

Reported-by: Damian Tometzki <damian@riscv-rocks.de>
Closes: https://lore.kernel.org/r/CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com/
Fixes: 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")
Fixes: 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")
Tested-by: Damian Tometzki <damian@riscv-rocks.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Hi all,

The commit message is pretty self-explanatory. I have one question
though. As you can see in the crash dump of the original report:

Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x30
Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x10/0x10
Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [rfkill]
Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230 [thinkpad_acpi]

The NULL dereference happens in device_add(), inside rfkill_register().
This bothers me because, as you can see here:

 1198                 atp_rfk->rfkill = rfkill_alloc(name,
 1199                                                 &tpacpi_pdev->dev,
 1200                                                 rfktype,
 1201                                                 &tpacpi_rfk_rfkill_ops,
 1202                                                 atp_rfk);

the NULL deference happens in line 1199, inside tpacpi_new_rfkill(). I
think this disagreement might be due to compile time optimizations?

Well, if someone knows better, let me know!

(This driver is going to give me nightmares, sorry for the bug!)
---
 drivers/platform/x86/thinkpad_acpi.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0384cf31187872df90f5ac3def9b1d6617e82ed5..a17efb68664c9c7723daa2aba023ba0cbc6b96dd 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -367,6 +367,7 @@ static struct {
 	u32 beep_needs_two_args:1;
 	u32 mixer_no_level_control:1;
 	u32 battery_force_primary:1;
+	u32 platform_drv_registered:1;
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
@@ -11820,10 +11821,10 @@ static void thinkpad_acpi_module_exit(void)
 		platform_device_unregister(tpacpi_sensors_pdev);
 	}
 
-	if (tpacpi_pdev) {
+	if (tp_features.platform_drv_registered)
 		platform_driver_unregister(&tpacpi_pdriver);
+	if (tpacpi_pdev)
 		platform_device_unregister(tpacpi_pdev);
-	}
 
 	if (proc_dir)
 		remove_proc_entry(TPACPI_PROC_DIR, acpi_root_dir);
@@ -11893,9 +11894,8 @@ static int __init tpacpi_pdriver_probe(struct platform_device *pdev)
 
 static int __init tpacpi_hwmon_pdriver_probe(struct platform_device *pdev)
 {
-	tpacpi_hwmon = devm_hwmon_device_register_with_groups(
-		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, tpacpi_hwmon_groups);
-
+	tpacpi_hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, TPACPI_NAME,
+							      NULL, tpacpi_hwmon_groups);
 	if (IS_ERR(tpacpi_hwmon))
 		pr_err("unable to register hwmon device\n");
 
@@ -11965,16 +11965,24 @@ static int __init thinkpad_acpi_module_init(void)
 		tp_features.quirks = dmi_id->driver_data;
 
 	/* Device initialization */
-	tpacpi_pdev = platform_create_bundle(&tpacpi_pdriver, tpacpi_pdriver_probe,
-					     NULL, 0, NULL, 0);
+	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
+						      NULL, 0);
 	if (IS_ERR(tpacpi_pdev)) {
 		ret = PTR_ERR(tpacpi_pdev);
 		tpacpi_pdev = NULL;
-		pr_err("unable to register platform device/driver bundle\n");
+		pr_err("unable to register platform device\n");
 		thinkpad_acpi_module_exit();
 		return ret;
 	}
 
+	ret = platform_driver_probe(&tpacpi_pdriver, tpacpi_pdriver_probe);
+	if (ret) {
+		pr_err("unable to register main platform driver\n");
+		thinkpad_acpi_module_exit();
+		return ret;
+	}
+	tp_features.platform_drv_registered = 1;
+
 	tpacpi_sensors_pdev = platform_create_bundle(&tpacpi_hwmon_pdriver,
 						     tpacpi_hwmon_pdriver_probe,
 						     NULL, 0, NULL, 0);

---
base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
change-id: 20250330-thinkpad-fix-98db0d8c3be3

Best regards,
-- 
 ~ Kurt


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
