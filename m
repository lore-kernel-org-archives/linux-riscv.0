Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052C2D0D17F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RpKogtFF7Hj+LTcu6uNMWeBMS0g5rlXgBiQMzXLv34=; b=Qk4gp+YMCkxVVF
	NsLaXEquqh789fZOb49n0YaPtx74/7I/hdz+4jWHkuWUPBpo8krelsF2uyMYIKthr2IiyASogQPw2
	/Fc/UJw4QoMbm9s/Kzkw837+VbhZtF6uj+PBv5icSM0Udomc/fTpbVxlnH+m6y+9V+qOZdNpJ1jJ2
	Xta9VltpCUH1PWEz0pZAzqBcw9MqkgcXcExxjci4yBcEZhiKGGJIA5uAW0g9T9R+msAZWxk1fqYCU
	2Dt5rjKbnqHIAvPK4Flv+SIctYct7efjhL56Xveo05tQ0KrDTllopoJ9H0yDs0Ewnd/sj1E4bKD2x
	2Sc/vSQxj5Z+ClhI42xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqus-0000000HKYF-1uIJ;
	Thu, 08 Jan 2026 14:23:10 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqup-0000000HKX1-3zEb
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 14:23:09 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso2002133a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767882187; x=1768486987; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EL8qeXIFUBprMt4HB/lPCre3+ycNyMSxvOH+cskZlVc=;
        b=cqaCuQQc/lpBCvmXeYoxeLsafdEtnY7G+SA1XXgnIOV3WJAJ8550vGOI9t/fEWiMIo
         KlsM6J1e99t6F9ubMfXXyNkX8TBEMC8UmE9T7njSwyCmCdGEf8yP07vjecljnU3m3DPK
         tgMmNh9Qjrtml8/4c10ZYhn0xpSJ1v0bWTUtDvqNoK/3rDhnYWNcDxFumG3V/wFFpzFW
         Ug+r6NwCZ71bpYDPhgrQ5POwSQUWGXGUiRWwsVFVJqCqiFD/Yb4SQ78gR8azru7rDoyU
         PG7PJuLJJARUpLO8ri9E9kVv5wdAfEIuMKi5EUe8F9bFzfiLtN99/pjWt1a21jm7mCbh
         12mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882187; x=1768486987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EL8qeXIFUBprMt4HB/lPCre3+ycNyMSxvOH+cskZlVc=;
        b=qybnXztVHJjjRiWugZrhYcaBTLLS4Vf03G7nTYiDGSQR3e7y1U8BXXz/+2GNDo0HPp
         jX+ckEFfSYgvFqA+7clA1NLQ9FVC1efw+sOtobjmbiQYU/6qGUqaO9Ajkr0yfQstOEg6
         XW0dSxZDHU0NBF47ARffjwuXbl1aMTDt4XERcVOc3rrXB/FrBLrSY9DrXHtoAAIhyN3D
         DyWpppk2ibi6EXNfmZRCBwhTpJsIzGDmpW+cgSTaO44IeZkXpZb8ATDGDqBbHYI4q2lL
         /kCZlQqN4IAsDmLPPfcyV7B4vRcphajPL+H+gtQUegZRi1HedWw//CgL957LhuY5QSTa
         PbOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWXXcr+78UR9+gpJHUIVgROd6GamQ4ImZ0LT0SR9Kkd48IfT0W32DahX8+64PbePKVmBmK0fUVCIaQWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxBd2dM/xJSzagC5ndf0428/fO2H1V7HCnXPiKKP4qMgfY/Mt4
	458ud9dR7K1JJU10ERfP+7WwKNEtDVaK7Cb/L1/h6G1FMPqhihuXPXdjZiS8WFLzwvg=
X-Gm-Gg: AY/fxX5MlGBAINotjYxbYyn74o2c23KkWgMq4zeP7fvXwQKTe+N4BpTjV9Hh2K26W9D
	2Ow1EPI2UYFkDyjw8Q9xQ+voRos6IyskWaQHbDMstBzIlRDzM62GDrPhNJaRY3YjmsRF5/goOXw
	DYaZk1LiQoDHYGhq9YXtCWCFNkKhYMju6GfKTvUTJQYTVW9y1251FBAChB7OQ4w45yKCVAX79sq
	GMLU1H+epK2m9DKNq6HAdc77T9jcePbSVGdJKKr49jFLhQnRPv1nhatJV1TjlknzxmHJNEOAnPb
	PgjKtleUJKNMJRJ0lmblCfsWyDvaATA1uoJm4dR+6nuwA63PzLzLeXKMdQtPYWOQ/iS0kWKEFIp
	cvOxECrYZv8IqgtHCrFDKzOXgKCC1ajwDVThgG3e4kFf4kW9jb5wnD2dr5F9U21QkDQjEQ6ibyD
	2DIjKzqO20Kxo/lG/Yqh+D/qhWt6QZofA=
X-Google-Smtp-Source: AGHT+IGxUyhcWl3pgdIJIBh8Xwg6I8nxAbuPkNaohVN6gOCkrsEZRn9ddDq3kJmePJgLlHuH3ww0ng==
X-Received: by 2002:a05:6a21:6da0:b0:364:1339:97c2 with SMTP id adf61e73a8af0-3898f8ccd38mr6576254637.14.1767882186882;
        Thu, 08 Jan 2026 06:23:06 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm7927906b3a.53.2026.01.08.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:23:06 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 22:22:15 +0800
Subject: [PATCH v2 2/4] reset: Create subdirectory for SpacemiT drivers
MIME-Version: 1.0
Message-Id: <20260108-k3-reset-v2-2-457df235efe9@riscstar.com>
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_062308_001027_5125931A 
X-CRM114-Status: GOOD (  16.37  )
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

Create a dedicated subdirectory for SpacemiT reset drivers to allow
for better organization as support for more SoCs is added.

Move the existing K1 reset driver into this new directory and rename
it to reset-spacemit-k1.c.

Rename the Kconfig symbol to RESET_SPACEMIT_K1 and update its default
from ARCH_SPACEMIT to SPACEMIT_K1_CCU. The reset driver depends on the
clock driver to register reset devices as an auxiliary device, so the
default should reflect this dependency.

Also sort the drivers/reset/Kconfig entries alphabetically.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change.
---
 drivers/reset/Kconfig                                      | 12 ++----------
 drivers/reset/Makefile                                     |  2 +-
 drivers/reset/spacemit/Kconfig                             | 14 ++++++++++++++
 drivers/reset/spacemit/Makefile                            |  3 +++
 .../{reset-spacemit.c => spacemit/reset-spacemit-k1.c}     |  0
 5 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d367040b0b380b78ce02d775a3a63..b110f0fa7bb13eff63e1939e50a926cd0106db3f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -299,15 +299,6 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
-config RESET_SPACEMIT
-	tristate "SpacemiT reset driver"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select AUXILIARY_BUS
-	default ARCH_SPACEMIT
-	help
-	  This enables the reset controller driver for SpacemiT SoCs,
-	  including the K1.
-
 config RESET_SUNPLUS
 	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
 	default ARCH_SUNPLUS
@@ -406,9 +397,10 @@ config RESET_ZYNQMP
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
 source "drivers/reset/amlogic/Kconfig"
+source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
-source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/tegra/Kconfig"
 
 endif
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 9c3e484dfd81a4f7b2f156a6226d5fa233600f9f..fc0cc99f8514cac161af59389ba1cbd5490209c8 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -2,6 +2,7 @@
 obj-y += core.o
 obj-y += amlogic/
 obj-y += hisilicon/
+obj-y += spacemit/
 obj-y += starfive/
 obj-y += sti/
 obj-y += tegra/
@@ -38,7 +39,6 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
-obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..552884e8b72afeb05cdb9b6565ad8e7fd32f990b
--- /dev/null
+++ b/drivers/reset/spacemit/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RESET_SPACEMIT_K1
+	tristate "SpacemiT K1 reset driver"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on SPACEMIT_K1_CCU
+	select AUXILIARY_BUS
+	default SPACEMIT_K1_CCU
+	help
+	  Support for reset controller in SpacemiT K1 SoC.
+	  This driver works with the SpacemiT K1 clock controller
+	  unit (CCU) driver to provide reset control functionality
+	  for various peripherals and subsystems in the SoC.
+
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..de7e358c74fd7b0fac3ec2c18d985331af64fcbb
--- /dev/null
+++ b/drivers/reset/spacemit/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
+
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/spacemit/reset-spacemit-k1.c
similarity index 100%
rename from drivers/reset/reset-spacemit.c
rename to drivers/reset/spacemit/reset-spacemit-k1.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
