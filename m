Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BCAC636BD
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Yt6nDVnR2C0ClDK1Rp4JAGxUTElrPzHv1lwKxX+yjk=; b=I//Qn5CKw1jGqv
	x4d9iC36nSfUiBk3DKIQzaCXQ7tEsbUhZhKGgQZlQJhBOee05R1aCGwXfg0rChZJ8lqJ7iRUSyV4M
	5zoI1mRlmG12kd9uWoeLtSKZuQ8h/7GizUp8lPVwH7sejAZVJRkMWgn6xUjzrc3vwyil+7xmRFdhk
	/kk2Uxg0st8ToBRQ8Rr6ffffeXsL9eRR6z0SnN8M0cSVrB1PNCS0AbskAiUyN08bQaqguQKmLN/zH
	LqJFlKGhhaBoZjBJy9ckp82VFddxcYwMF/ibe0oQg00IiPu6tUZ1bW8dyHa52cmaxulxxcmXpvgMq
	tXcQ+Vd4tlY0c9xxKDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKm-006LbP-20;
	Fri, 24 Nov 2023 07:10:40 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKj-006LaN-39
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:10:39 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5845a94dae1so731971eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809836; x=1701414636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQhHGwPmQ4TCzhQ9rEz5VPF8mnM3VrFDuBPe9IkpS1Y=;
        b=RlRUX6vyPrZjuWhWcpJr4/XiC+bj8MbdhDkrl4jkWaPin+geuZ1U9VKq2ZEwnc6fkI
         BxVw/mSAEbobOyh2H+o1mWmFp9UVhPtx5VVlfSGB/wRypTC7Ll+1J1M1k0UA30jf5mh/
         hre6fFormSK4kNxkdZX5RevG6r/ZRyDSPyDcrVIGdu3MooUnrT+AvjMgONv6NHUidAEY
         BN/gP4oRyiT+AbBxVTSU1go8jk/keojpe1MI6HccauCTCRawiSlm1BRLr/3Rmnl0mgPu
         iNn4za1j2kboPMjeyPnL3j7igvFdtO5zgKsKBiQ/oBf+qtoAXzKauRSzbqoS5sO1rsKM
         uSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809836; x=1701414636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQhHGwPmQ4TCzhQ9rEz5VPF8mnM3VrFDuBPe9IkpS1Y=;
        b=FuhCae7UbqaODbP0rTKRYV+lg/TSn1opzHTOirqdOXCIEN8n/nKTdyS4Uedea9GmfD
         gdHvb5CqAmc59gXp9TMzsRz5Tux6BsKT1oKoGETvuH+7KoA8AXvZjkjbsrkcUDLHHFHM
         2WsIRTgUqU5+3hf6N2v8S/IhorJwF1d+wmMGa/zc0Avf6PbXOsOvdRSFgc6nsFe7kbP8
         bySqXglkwC6U5yMR2vXQevy8r+s79DkPC5V5ZJRw6jQxHbkvj2lbnfqC1sfuoaHUKCqP
         kJEQR2T888uMlPhI6Q2jr22XjG1NRYRHClnd+t/899OUjo3EVfqWgSJtO00g5cD3f8Bi
         mYTg==
X-Gm-Message-State: AOJu0YxOIXVhJXwExtFwV8DlYjofgO6cGfZRxdRVsE0GEq1HWgAM7C+M
	hyb5hMJfN9b+KdyV1zIURvnpwQ==
X-Google-Smtp-Source: AGHT+IGvJOScqEUs5x/NC1+xkb/+ZzFxNOvJHJDnrqYvAj8EJtKq+m+RbFE9B8BNRcDqThajOtvZdA==
X-Received: by 2002:a05:6870:4729:b0:1f9:d22e:6339 with SMTP id b41-20020a056870472900b001f9d22e6339mr801112oaq.23.1700809836602;
        Thu, 23 Nov 2023 23:10:36 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:36 -0800 (PST)
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
Subject: [PATCH v5 3/5] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Fri, 24 Nov 2023 12:39:03 +0530
Message-Id: <20231124070905.1043092-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_231038_029115_FDA18311 
X-CRM114-Status: GOOD (  13.63  )
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
---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 27 ++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 732c893c8d16..1f2594b8ab9d 100644
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
