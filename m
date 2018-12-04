Return-Path: <SRS0=2eJe=ON=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A351C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 14:11:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8452081B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 14:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NV1vqUuv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="joVYPGyf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8452081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y1bwNyFWWGQtSoVbo3fFUwcIpgipprX0Ot0qjpoBgdc=; b=NV1vqUuv1WxnPNlJ9JyMsKuuzb
	TavOxoEl6Be8WXk+tnnej5HMu1OaiY3WPknOjjMXrbW5P70uWjfdFGAHwLtGvbBH3FbNi/Y/qdhvr
	oMqY9TKbBTKmObgCvAZxNbMiF3xnR5/SiQ4VKx6JL5ZcagPCKRZQiDs/UKit/5GsdekfLriiZ4ItV
	I+kqWxSb9YyijOLqqxlfS2/Z2h3FXld/XHWL4qfXyOxZ0aNfeUeVwTixQmFTk9HgOxlHJVLrxI3sF
	+6ht4tE7Q3WGAJqb0mf94e5w0gPaXteOPu2OaT3cfNs3F4GgJNWKYQ9t5XNO1qfOPlOJ6iGzCF+Lt
	8DGiGUWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUBPo-00071o-ER; Tue, 04 Dec 2018 14:11:08 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUBPl-0006ys-MA
 for linux-riscv@lists.infradead.org; Tue, 04 Dec 2018 14:11:07 +0000
Received: by mail-pl1-x643.google.com with SMTP id gn14so8350153plb.10
 for <linux-riscv@lists.infradead.org>; Tue, 04 Dec 2018 06:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BTPdu0Dl5dI9f0RvwZ4b3FQV4mVlXTL1ZWm0hIO3Dcg=;
 b=joVYPGyfS51dy2YuZIbN92mHTKVXiz11syOtUFtSzZNvPzULvzC/elLQ2QeqDxFeNa
 ces1AMrzpGS3kukOEVdgUjdCO05TiDmOQT53uKDD8EVDx9LJ0BaFi7oS2wFge0dp5qXt
 ZyZxRslRHXio/przej1AHS1Y/GxS5QNpzXkfJ7vaFbc9jbdS+0Nm8yA+fJn7jmod9yvn
 7c3T9KLAIingr1zzA5osaqvaCgtf7YV8Gqv8OxbHOd8av23iYyEp0+NQYWc+2qNYFf6G
 AdCqccFC3JtH1BAMbx/Nz/cpWR6qBZK71DtjgEb3JhtrGJ95x56mTZt5ib+KP9FqbTEr
 fJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BTPdu0Dl5dI9f0RvwZ4b3FQV4mVlXTL1ZWm0hIO3Dcg=;
 b=Qj8oT9DfrCNTD/NBZN7veF0uRO1V4q1SYzaqR9bG3zRAcnaNOjyfOqQsx0PvJKbldO
 ANK5l1ZMLKBn0TuygmGGCPgbQjX5FihFKIVZsWxVfCPvIJ5+gYqrxvnWv4vzLBtuVNNH
 wfgTiY6uBh+qEzofXzySA+2qG72bDzLLxOGgLlRjYvdPb3arKmNuTS/mhiDIz+K8ijZo
 Hm8YPm5zBDaFGt5qWDaEGWfFKI7G5ouQgcZeE2JlWGdndT+hysPjNMsIl2NCSc1ctE2K
 dYBU0PhtzHU8LZf1mJydEirYYP9CGN+ceP7/TzUVSrUpJn5YGEUzBTUkpISH02R+m1xb
 lp6w==
X-Gm-Message-State: AA+aEWYF8stfpGBEr1uTLLgLMUxgeAUoQsOHH0jz56NPOJsKejf6As9n
 a+QNANUKVvBnPINzahEly3lfmg==
X-Google-Smtp-Source: AFSGD/VmR50lnvpHU80Xag/uZ2hvS+h9ZbY6ijbVgs6o5BV0WQTIdzab5I/fpvMnhrFib84FA8tvkw==
X-Received: by 2002:a17:902:1102:: with SMTP id
 d2mr15988999pla.138.1543932654889; 
 Tue, 04 Dec 2018 06:10:54 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.53.58])
 by smtp.googlemail.com with ESMTPSA id
 k129sm31298884pgk.29.2018.12.04.06.10.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 06:10:54 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 1/3] tty/serial: Add RISC-V SBI earlycon support
Date: Tue,  4 Dec 2018 19:25:05 +0530
Message-Id: <20181204135507.3706-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181204135507.3706-1-anup@brainfault.org>
References: <20181204135507.3706-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_061105_728569_CE036669 
X-CRM114-Status: GOOD (  15.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In RISC-V, the M-mode runtime firmware provide SBI calls for
debug prints. This patch adds earlycon support using RISC-V
SBI console calls. To enable it, just pass "earlycon=sbi" in
kernel parameters.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/tty/serial/Kconfig              | 12 +++++++++++
 drivers/tty/serial/Makefile             |  1 +
 drivers/tty/serial/earlycon-riscv-sbi.c | 28 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 drivers/tty/serial/earlycon-riscv-sbi.c

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 32886c304641..287bb41ac814 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -85,6 +85,18 @@ config SERIAL_EARLYCON_ARM_SEMIHOST
 	  with "earlycon=smh" on the kernel command line. The console is
 	  enabled when early_param is processed.
 
+config SERIAL_EARLYCON_RISCV_SBI
+	bool "Early console using RISC-V SBI"
+	depends on RISCV
+	select SERIAL_CORE
+	select SERIAL_CORE_CONSOLE
+	select SERIAL_EARLYCON
+	help
+	  Support for early debug console using RISC-V SBI. This enables
+	  the console before standard serial driver is probed. This is enabled
+	  with "earlycon=sbi" on the kernel command line. The console is
+	  enabled when early_param is processed.
+
 config SERIAL_SB1250_DUART
 	tristate "BCM1xxx on-chip DUART serial support"
 	depends on SIBYTE_SB1xxx_SOC=y
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index daac675612df..3ce26ce08616 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SERIAL_CORE) += serial_core.o
 
 obj-$(CONFIG_SERIAL_EARLYCON) += earlycon.o
 obj-$(CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST) += earlycon-arm-semihost.o
+obj-$(CONFIG_SERIAL_EARLYCON_RISCV_SBI) += earlycon-riscv-sbi.o
 
 # These Sparc drivers have to appear before others such as 8250
 # which share ttySx minor node space.  Otherwise console device
diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
new file mode 100644
index 000000000000..e1a551aae336
--- /dev/null
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V SBI based earlycon
+ *
+ * Copyright (C) 2018 Anup Patel <anup@brainfault.org>
+ */
+#include <linux/kernel.h>
+#include <linux/console.h>
+#include <linux/init.h>
+#include <linux/serial_core.h>
+#include <asm/sbi.h>
+
+static void sbi_console_write(struct console *con,
+			      const char *s, unsigned int n)
+{
+	int i;
+
+	for (i = 0; i < n; ++i)
+		sbi_console_putchar(s[i]);
+}
+
+static int __init early_sbi_setup(struct earlycon_device *device,
+				  const char *opt)
+{
+	device->con->write = sbi_console_write;
+	return 0;
+}
+EARLYCON_DECLARE(sbi, early_sbi_setup);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
