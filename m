Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77BBCD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AI5cVJkeV3QfIBp8Keiy+e+8XQGwEq1v+BS6PPSlTtA=; b=ZLe1zuqOhRoQW9
	D8jSjAUhSdiheun+XFqStXkCoE8GPlV7SOFgY0hYutnsJ4x8sUUSJyUrnvvH18KUdkOWr0Aq9lb0P
	EhDY9jAH/jfp2FfVEPXy//TOXgXsyLIXICEx61bY/zISFGBtFwvRo+KfhcGCnyG1y70dK2R8rciu/
	9jO+GoWJVCYcoQUWXxJpUIueLh1VK0XBLshJ6NLUMVPI+uphipxJyrS1zIDBJ4S/uSbe7FW25CIks
	MOZ8yRbthnPHCPTywbQ3WJ4Wh3NgXUxdjmmYJL+B5f1MYl14Z1iEQCSGxpVdmocOGzXGPi2Bzog0T
	Rhf6XTVj9TkAWiYxyZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGAu-00DoT9-2t;
	Tue, 10 Oct 2023 17:05:40 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGAq-00DoQP-0R
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 17:05:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c5db4925f9so318615ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957535; x=1697562335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoCkBvDoaE+G9yGkJwlCtJkOL/TuRqipkz8zh1jvWHI=;
        b=P8XzMIy9E8CvWkmDrOSvHdT5bA5fD/Ao/aG7U2W5YM8tH8pcVr2qobvXI/cThj6ZND
         EkcHjkmdCFxPHZBm1kSBxHKEiNIl3fP//DFrbUaXwUREPaOppuOOhhA340JP8xpnisUM
         aSEAbCgKAybMInDAYDdWvSRkheofd5xK/zzGd2Uq77GYoH65oS52fVeOwueNhdy8i441
         CQxQX04R3KgYTYPzrZZeHjzPtAU32x0cqDmFv7/8oA9/vJxSlLHTKmPJARR2Pu2bugLY
         wBKjaMB4Ro0DvjxPjrCk4GU89O1HHCbgOWpPO0eoneTfnWpjhFy5p4gKKUKUMFx2n6F3
         VmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957535; x=1697562335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoCkBvDoaE+G9yGkJwlCtJkOL/TuRqipkz8zh1jvWHI=;
        b=FeYPYFgEx+NwQf6/ulqdx9/pBA3Kg2ckCgF+9pYoSB2xug22Naok7TtgwG6ism23bt
         2/HVpRI9iQc3LuKPHvDnaMB2BJLicY53uPlwCePi/mYHc54GKFEsYWZa+Pi7IJVnZ/+O
         Dfv9sM/yLBaDCIc8CR+iwsOB1z8Hb2+6OoOiwbsE/swPC4xNpglwv32u01HEB1IhERW6
         1QX/b5tLxffGA8A2k4MgYujLIlvYB5PM8Y5cDVNeYVawRTpUuAnleAaPnp25+Qa7qEnx
         zAmaPxdzAfZOqZ7TAjnBNMvRignqCUOW2il0YzGGHBLcwvRP3luHgz48kaYlITEnyZC1
         2c7w==
X-Gm-Message-State: AOJu0Yyc0n7gmqJ20rnLPvleWlsUfkv01rK1fU0m35mFvccpwAeR3Vqd
	23464+FoSIKeK98nypzac1frqQ==
X-Google-Smtp-Source: AGHT+IHpTSgdyOa/WMmXoVeNp80pjqgJQqPCX1bVN2+pKlqZykfXt/hGxysni37Tvg40ZjWZcGGrLw==
X-Received: by 2002:a17:902:d2ca:b0:1c3:76c4:7242 with SMTP id n10-20020a170902d2ca00b001c376c47242mr26123429plc.22.1696957535339;
        Tue, 10 Oct 2023 10:05:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/6] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Tue, 10 Oct 2023 22:35:01 +0530
Message-Id: <20231010170503.657189-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010170503.657189-1-apatel@ventanamicro.com>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_100536_173402_6A0D28DD 
X-CRM114-Status: GOOD (  13.92  )
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

We extend the existing RISC-V SBI earlycon support to use the new
RISC-V SBI debug console extension.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 35 ++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index bdc568a4ab66..cec46091a716 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -87,7 +87,7 @@ config SERIAL_EARLYCON_SEMIHOST
 
 config SERIAL_EARLYCON_RISCV_SBI
 	bool "Early console using RISC-V SBI"
-	depends on RISCV_SBI_V01
+	depends on RISCV_SBI
 	select SERIAL_CORE
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
index 27afb0b74ea7..b1da34e8d8cd 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -10,22 +10,49 @@
 #include <linux/serial_core.h>
 #include <asm/sbi.h>
 
+#ifdef CONFIG_RISCV_SBI_V01
 static void sbi_putc(struct uart_port *port, unsigned char c)
 {
 	sbi_console_putchar(c);
 }
 
-static void sbi_console_write(struct console *con,
-			      const char *s, unsigned n)
+static void sbi_0_1_console_write(struct console *con,
+				  const char *s, unsigned int n)
 {
 	struct earlycon_device *dev = con->data;
 	uart_console_write(&dev->port, s, n, sbi_putc);
 }
+#endif
+
+static void sbi_dbcn_console_write(struct console *con,
+				   const char *s, unsigned int n)
+{
+	phys_addr_t pa = __pa(s);
+
+	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+#ifdef CONFIG_32BIT
+		  n, pa, (u64)pa >> 32,
+#else
+		  n, pa, 0,
+#endif
+		  0, 0, 0);
+}
 
 static int __init early_sbi_setup(struct earlycon_device *device,
 				  const char *opt)
 {
-	device->con->write = sbi_console_write;
-	return 0;
+	int ret = 0;
+
+	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0))
+		device->con->write = sbi_dbcn_console_write;
+	else
+#ifdef CONFIG_RISCV_SBI_V01
+		device->con->write = sbi_0_1_console_write;
+#else
+		ret = -ENODEV;
+#endif
+
+	return ret;
 }
 EARLYCON_DECLARE(sbi, early_sbi_setup);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
