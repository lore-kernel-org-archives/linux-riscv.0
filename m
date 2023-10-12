Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AA2CDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGxO6y30kaKBnNWRN0vi3lSfp9A42a5XTgQcsrJA0Kw=; b=CpbOGcz/8Vrfns
	/x+Hv3a2D+2PiivgPyBD6OOsLaeX6UpDSggCSz9l/dyO5blN2ktaoSG1elgUdCkWwfkYGtVmXyXjp
	Zb9HYGQ9Zygm6m8o/qfjR0DiX/angu1Vu8uDwChmyyo6El6HiR2EwESljsN/OFKhaFOxhsPnvz6gF
	QGhZHz0LDxul3CcWEBUC6b9En4rZiTn5rCYPVOqdCwXwOkSNY2Y7IDa9zIz/h72iJXoGH5q9MHHm6
	QfzDodovd+On2oFskU0K4IFaO245hTnlpWpVahyTPTCnilNzTX86vIvyiHbkJKtZK30+qsefXLwpm
	HRKv6pdXGd0RiYKSYNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo33-00HRLO-2O;
	Thu, 12 Oct 2023 05:15:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo30-00HRIf-0n
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bdf4752c3cso4311625ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087745; x=1697692545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KVKi7QKmfPZrGchNrI6Bys6/KZCng6FE4wZxaod/J0=;
        b=SiWIZ4zle2Sh742A3TjDscxJ0J4J2jTR8c7X2WxnrwxMYCRxQbY273nNHkem99QP5g
         pPkrOeL+M6irT6gdznGjOLQKpD3MZCPTTYMisUJKNHpfahzLnnRNPYFj0HvKy7p9n6zK
         fwBdoOwYHkIHSsSvSj9WDHANtQwpM+nMbiPscgQJZfhm6SESsVGJ6Mk6llyjrMzE8hLh
         UvqwE56gcb4+33sHtQv6i5z2ApkHsiSg+binie9UV2xvGoxBXWVCujG1My93AflyPjiK
         4JU+5bTnqM5otM8ZqOfclzX1SuarN+aUNcT/5T7UOTqH6EiYqkR2+RjgcHwjj0HNbjY5
         5nPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087745; x=1697692545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KVKi7QKmfPZrGchNrI6Bys6/KZCng6FE4wZxaod/J0=;
        b=Fnuy+PICbXP6+kIAPm9z2uRNSJbsqYOveJvRAv3wJzHOJ8crpyyVd2D0rJwPjIAwHW
         cMsPfW0BOZXiAm9saCCfjt9dCk+S+CxeUtmhJH+l/3Xo4F8fa74FSg+AtXasZISe2Hkh
         VxgYv98nCbJVAsxUpyMzzajjSD+sIb+UbePNbvzu6ndSrwdksodETF7FYILA65uwBY7Q
         b9asW8dXSU2tZVc/vzcpe8RSILHZ4P9BaPJ2SIOCa0VXMuAEWe3OmTk9hbj4dTZeXrH7
         aZaw45uJRdk0A3dS6tIYqEm7FgX3yi8sA2z6FSOkkTtVRXpgqOnP43YG/zMEND2sMkS/
         wTrw==
X-Gm-Message-State: AOJu0YxO012d8xU/5k5rHuDTfRGXbEANgz7q3QDk6Kioc0OyvUhxW4i/
	Hzu5VtRKEC3j9jFj2mr1rpg3GA==
X-Google-Smtp-Source: AGHT+IGQA5WgnUWZWzG9GzMA7WhXboUt0Cn4w+hL60tDRhhBnvH97ndWcYP/2d/cQ1fXpGrnegy9iQ==
X-Received: by 2002:a17:903:278e:b0:1c9:dc52:9d69 with SMTP id jw14-20020a170903278e00b001c9dc529d69mr1250864plb.64.1697087745576;
        Wed, 11 Oct 2023 22:15:45 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:45 -0700 (PDT)
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
Subject: [PATCH v2 6/8] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Thu, 12 Oct 2023 10:45:07 +0530
Message-Id: <20231012051509.738750-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221546_285354_AB6D8755 
X-CRM114-Status: GOOD (  13.69  )
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
 drivers/tty/serial/earlycon-riscv-sbi.c | 32 +++++++++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

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
index 27afb0b74ea7..c21cdef254e7 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -15,17 +15,41 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
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
 
+static void sbi_dbcn_console_write(struct console *con,
+				   const char *s, unsigned int n)
+{
+	phys_addr_t pa = __pa(s);
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+			  n, lower_32_bits(pa), upper_32_bits(pa), 0, 0, 0);
+	else
+		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+			  n, pa, 0, 0, 0, 0);
+}
+
 static int __init early_sbi_setup(struct earlycon_device *device,
 				  const char *opt)
 {
-	device->con->write = sbi_console_write;
-	return 0;
+	int ret = 0;
+
+	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+		device->con->write = sbi_dbcn_console_write;
+	} else {
+		if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
+			device->con->write = sbi_0_1_console_write;
+		else
+			ret = -ENODEV;
+	}
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
