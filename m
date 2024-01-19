Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26634C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6TjdpQkaO2uMODBoihIfeKFKw5Ou1Jg4SewzByo64U=; b=0qWrxaILCg1Iv2
	QUdqdtF56+pnCMhqdaGVct8oZBuh6a4wfmbUG8NnU6GiD4vaIgDfDQ5PmKWrULA4PcsTGv3KYrNmb
	L4IZhRNazRoELOO9qfpPjRYFeHBuyoUQ7zuosvrXW0KHRr+IwaYLDrRD7iuUA7BW3qCWwQnYBsJtS
	RFMiwgEPTmgioKsoIwcrd9zbWOsCsDSghO9L+Hw8FB1oTbjtklQfdWLNEN9fcSFPzcdZdKGCyES5m
	lD6p//h5u81eYe5akks54BYFAmnbcRs9HXkAO2B7CzpeWIowc4UdyG6nPzJfFocefoTT+m6Sx0S4N
	NTYenr499Q7zdXByaGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9g-005Eob-0Y;
	Fri, 19 Jan 2024 11:35:24 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9d-005EmC-2Q
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 11:35:23 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-361a741722bso2192815ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 03:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664118; x=1706268918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZs1DnoR+BqoPfBEx3sAKhKPyFXu5PFqqMfZZxzp+sc=;
        b=MhRuAxlXMwYdDQLFk+e62j1sFMaEHdgVe6A/yARuMT48wab+2Dzjds0rHqekojYjkH
         HT+aGYKxR6teXdsfv6aXljNHqYLubs+RXBq259N4iIS9/y1Ety2ltcrkQ6ST4QHQLJ9a
         TA75dTlAy8q2HXr5G0cvlBggmzmT3+DP38SXh3p3flVpqJHo6gwMsYaWlYzhtNkOO7KF
         ipMmF9popeot4PQnqZDpOjli0tPYNjVMIt7rciWMy1KiDDxirYrILLdCZrHjKMaVEmqG
         jlXA8o/73W/cc4iCR9FpvbaNUZkyw82rmj6aUPNNIOpa58ZBTfZcn5fEIXbUEZOj49u4
         tPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664118; x=1706268918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZs1DnoR+BqoPfBEx3sAKhKPyFXu5PFqqMfZZxzp+sc=;
        b=uDHBYRLZG0ZbnT+IUAVg9PNVBjYrMaG/lSjaS6S+oT0S8ndKX+mf27QM5nLAcNy7Or
         rFYJQrxCJQJWGh5LGqjLFGfXWQ4ZgT2AgJFSEBTTNhL6mwRivEE8pQGJhIRslB1xBQ4N
         4PTkFVJAnIpFz8twGjWLq+MG3LmVmEbRaewcawHEG+YjA2cKSumifn8t+8ojrVnDLtF5
         T8HwA3Fy+D1q5XlnH7+rgbzOWkFdwse7FC4LjHXFAHOh+MftO5LK92S/LAcXQK1yDJ8C
         UtHe7jDlQatjt02lRRekg/T1obFZEkE6kWBtHVeAd+wQk6lNMclq127OZb4j7zjd6RG0
         jGeg==
X-Gm-Message-State: AOJu0YyCXecGz2GM40fxoiQckTnnJO/dXxyjgXc4C51U2vCVuOesPEvy
	7dnyjdnadOp/gdOJj028+0sHXOgAZiC37xwvwnHPtbphY1/zAnNDy7hYIdRy2FQ=
X-Google-Smtp-Source: AGHT+IE5xOPzOXRmI0mkKVIo636pZPAAvH16YB5jTX+cVYfv6ns2lQLatq8j8BbSiFb/JfVg9KHVDg==
X-Received: by 2002:a92:bf0a:0:b0:35f:cd02:1dee with SMTP id z10-20020a92bf0a000000b0035fcd021deemr2663290ilh.3.1705664118669;
        Fri, 19 Jan 2024 03:35:18 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:18 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 3/5] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Fri, 19 Jan 2024 17:04:47 +0530
Message-Id: <20240119113449.492152-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
References: <20240119113449.492152-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_033521_787028_CA9FCDC8 
X-CRM114-Status: GOOD (  13.65  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 27 ++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 8b1f5756002f..ffcf4882b25f 100644
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
index 27afb0b74ea7..0162155f0c83 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -15,17 +15,38 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
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
+	int ret;
+
+	while (n) {
+		ret = sbi_debug_console_write(s, n);
+		if (ret < 0)
+			break;
+
+		s += ret;
+		n -= ret;
+	}
+}
+
 static int __init early_sbi_setup(struct earlycon_device *device,
 				  const char *opt)
 {
-	device->con->write = sbi_console_write;
+	if (sbi_debug_console_available)
+		device->con->write = sbi_dbcn_console_write;
+	else if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
+		device->con->write = sbi_0_1_console_write;
+	else
+		return -ENODEV;
+
 	return 0;
 }
 EARLYCON_DECLARE(sbi, early_sbi_setup);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
