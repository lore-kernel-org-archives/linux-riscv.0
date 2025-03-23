Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687AEC36008
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 06:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t1aofl5Vv58qLoXQqScFwhCGsvCQiszw+7vM38JbIUg=; b=OLREarDMBYZVrY
	6Q0eGHmRVaSnY8T2or9lraLi2dpHZdwAHH48dtZtHN4V3uvtbMhGN9lmB2W1/dn9fmE2MXGB/8s/t
	TnFurMsnlWrtVhFt8K7T0p7/cDor2ym1EAI6cn/C2EEeTVA0wADlyViAo+DpHpTOFyqC7LO/fabge
	utDWlSYWHIZVf60A/pN7dZkmYS6cqjhW3y23vC/08gRSM8gNyKor9aOEhlNhRqldwrzTp/ttiRqBT
	3V868fzwQAZPEffWjoYb5TV9UBohHSOFty9Aq+Tn8ueW94gA+1kKTkuE50NrN5Wu+p7mhQazWtJa7
	yARTkTv+HJEj1aPSb4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twEU0-00000000jrr-1bn7;
	Sun, 23 Mar 2025 06:06:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twETy-00000000jrN-0nGS
	for linux-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 06:06:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227b650504fso853395ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Mar 2025 23:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742710009; x=1743314809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/hRrLYrQqWoUWab1kJtk8tDpV6Q/Kh0bvdM9UsTNmZY=;
        b=at7VBduAeitsXitLnG/JTCUYP0eKw3MWPrwixhtcnK+eofKtCnFZ/UDDLeCvIYm5wL
         bRBBUVgKf8+nnBR7NA7Bq1KC4cBuJCMmtxu6FH1hIs4tuWvfQNIQAzTcASNqssuUNtPC
         SKlMIvn6kyu/3C9dukF2Km+iOK+LS+dh3wZfokAmM7XQDTihw1PK7jLAUYHHQEDuJR3u
         bLiJ57n8UiWyvutHrlUlwrODhdflnoCo7zsL7aE8DEEsDsXCyiFSG7YdIdVm/IHw7HFW
         MSz0FJ/SpTgK1eFpFLDIrYtclxa7QAEs7ohuQUBm9GRX9FySbYCLkxlG5rmCt/h3wGF7
         E8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742710009; x=1743314809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hRrLYrQqWoUWab1kJtk8tDpV6Q/Kh0bvdM9UsTNmZY=;
        b=d+qOEeAq2T9qFnpyXlmIDv9yQARm/ZshpcHWWJxqHTT7YI6m2YMpvDPmOpwaAe/sf5
         Aii/GDZhaEUXIq+MQLtGMgaCthdipPeWR7SA8324gXNQiYVjyFUrz/ySJRHJDaKei4zI
         aIajFttD2ijgEEYdXPyRRlcZW/8JlryVJLgnldbe6ZvZYJRm13rnXMBfD5/nITvUkU1J
         0k2AVbVXuOfr8fCp6N3Lv1sRknhHey8Q4bvN4aJPZCNb51bovi/HPcle0v0Hm6Vs8N7k
         6fCPttlLtsVxeabipSRDc+PedOxqNUBKi8+r91aTjfQ3d5C95Et/++m1ioV0D6YLuupl
         3Jgg==
X-Forwarded-Encrypted: i=1; AJvYcCXmkscSR+GUuuNWCA+xCdQ1Lnri3O/3mTmf4ZxltdYvim/aEuAOkodRN5Q3DO+54ZL39NS46IjjcbI+bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzADMK9HQEeCLz0XjKtGj119Lpn2EhmWkN5jCes3L18sbw2xR2k
	aGRd18Xa7kgCExJ9+cYUYYT3Iu5pmkUoDNWcndEaopkkem/HuICe
X-Gm-Gg: ASbGnct0K7zDSZhidWSgy8K5loPtbr3Rw8kzcUyZgcuQjGbcbVdy7GeDSHGqWs8GQG9
	FS08/Dr4i8Hlz29UZi1kRDpwxcftdwhrpiItRjPVkiE6lJEuyNyv6ABDYoT0BRaj7Y3Lgw/Hfde
	l75wuLrw0IFYNqxl0xb2D7jfyjxqKQh7BOKHtRMPGmOYpFDx/qDC9GYUumT/XpDUj+j0ClXAwks
	njKjZKW5gdFlQvIWAvVsgb1d7tDtjaoJN/cb4E2voGmcOIMUDgsmKilEcF4NuJqYsTHzorR3YQC
	TOjiVTIA0MSrG5wWuRSZRb6z5HikWpBcssTlVbu32QBclHjE06u6DgX1F3kPkOMGwg6EM+xfign
	nKDx2lRS4J9NjkDYTFovx/B6F+8grz70=
X-Google-Smtp-Source: AGHT+IFdTzdYwVw4qAZHzhbbTSWg3s2s5hfhGqEcU9flZ/U2rK2lNN4Qh8/poZ0SnK+VH3t/JQOFQQ==
X-Received: by 2002:a17:902:e803:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-227ac2a2536mr25143875ad.23.1742710008825;
        Sat, 22 Mar 2025 23:06:48 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3a2e0sm45406045ad.39.2025.03.22.23.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 23:06:48 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	john.ogness@linutronix.de,
	pmladek@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH] serial: sifive: Switch to nbcon console
Date: Sun, 23 Mar 2025 15:06:03 +0900
Message-Id: <20250323060603.388621-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_230650_234963_2BCEE644 
X-CRM114-Status: GOOD (  17.34  )
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

Add the necessary callbacks(write_atomic, write_thread, device_lock
and device_unlock) and CON_NBCON flag to switch the sifive console
driver to perform as nbcon console.

Both ->write_atomic() and ->write_thread() will check for console
ownership whenever they are accessing registers.

The ->device_lock()/unlock() will provide the additional serilization
necessary for ->write_thread() which is called from dedicated printing
thread.

Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
---

Hi!

I referred to the already converted console drivers 8250 [0], imx [1]
and amba-pl011 [2]. I tested the patch for each of the NBCON priority
(PANIC, EMERGENCY and NORMAL) on riscv qemu.
Hope to get feedbacks, thanks!

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/lkml/20250107212702.169493-1-john.ogness@linutronix.de/
[1] https://lore.kernel.org/linux-arm-kernel/20240913-serial-imx-nbcon-v3-1-4c627302335b@geanix.com/
[2] https://lore.kernel.org/linux-serial/20250204044428.2191983-1-fj6611ie@aa.jp.fujitsu.com/

---
 drivers/tty/serial/sifive.c | 87 +++++++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 5904a2d4c..d032de619 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -151,6 +151,7 @@ struct sifive_serial_port {
 	unsigned long		baud_rate;
 	struct clk		*clk;
 	struct notifier_block	clk_notifier;
+	bool			console_line_ended;
 };
 
 /*
@@ -779,33 +780,88 @@ static void sifive_serial_console_putchar(struct uart_port *port, unsigned char
 
 	__ssp_wait_for_xmitr(ssp);
 	__ssp_transmit_char(ssp, ch);
+
+	ssp->console_line_ended = (ch == '\n');
+}
+
+static void sifive_serial_device_lock(struct console *co, unsigned long *flags)
+{
+	struct uart_port *up = &sifive_serial_console_ports[co->index]->port;
+
+	return __uart_port_lock_irqsave(up, flags);
+}
+
+static void sifive_serial_device_unlock(struct console *co, unsigned long flags)
+{
+	struct uart_port *up = &sifive_serial_console_ports[co->index]->port;
+
+	return __uart_port_unlock_irqrestore(up, flags);
 }
 
-static void sifive_serial_console_write(struct console *co, const char *s,
-					unsigned int count)
+static void sifive_serial_console_write_atomic(struct console *co,
+					       struct nbcon_write_context *wctxt)
 {
 	struct sifive_serial_port *ssp = sifive_serial_console_ports[co->index];
-	unsigned long flags;
+	struct uart_port *port = &ssp->port;
 	unsigned int ier;
-	int locked = 1;
 
 	if (!ssp)
 		return;
 
-	if (oops_in_progress)
-		locked = uart_port_trylock_irqsave(&ssp->port, &flags);
-	else
-		uart_port_lock_irqsave(&ssp->port, &flags);
+	if (!nbcon_enter_unsafe(wctxt))
+		return;
 
 	ier = __ssp_readl(ssp, SIFIVE_SERIAL_IE_OFFS);
 	__ssp_writel(0, SIFIVE_SERIAL_IE_OFFS, ssp);
 
-	uart_console_write(&ssp->port, s, count, sifive_serial_console_putchar);
+	if (!ssp->console_line_ended)
+		uart_console_write(port, "\n", 1, sifive_serial_console_putchar);
+	uart_console_write(port, wctxt->outbuf, wctxt->len,
+			   sifive_serial_console_putchar);
 
 	__ssp_writel(ier, SIFIVE_SERIAL_IE_OFFS, ssp);
 
-	if (locked)
-		uart_port_unlock_irqrestore(&ssp->port, flags);
+	nbcon_exit_unsafe(wctxt);
+}
+
+static void sifive_serial_console_write_thread(struct console *co,
+					       struct nbcon_write_context *wctxt)
+{
+	struct sifive_serial_port *ssp = sifive_serial_console_ports[co->index];
+	struct uart_port *port = &ssp->port;
+	unsigned int ier;
+
+	if (!ssp)
+		return;
+
+	if (!nbcon_enter_unsafe(wctxt))
+		return;
+
+	ier = __ssp_readl(ssp, SIFIVE_SERIAL_IE_OFFS);
+	__ssp_writel(0, SIFIVE_SERIAL_IE_OFFS, ssp);
+
+	if (nbcon_exit_unsafe(wctxt)) {
+		int len = READ_ONCE(wctxt->len);
+		int i;
+
+		for (i = 0; i < len; i++) {
+			if (!nbcon_enter_unsafe(wctxt))
+				break;
+
+			uart_console_write(port, wctxt->outbuf + i, 1,
+					   sifive_serial_console_putchar);
+
+			if (!nbcon_exit_unsafe(wctxt))
+				break;
+		}
+	}
+
+	while (!nbcon_enter_unsafe(wctxt))
+		nbcon_reacquire_nobuf(wctxt);
+
+	__ssp_writel(ier, SIFIVE_SERIAL_IE_OFFS, ssp);
+
+	nbcon_exit_unsafe(wctxt);
 }
 
 static int sifive_serial_console_setup(struct console *co, char *options)
@@ -823,6 +879,8 @@ static int sifive_serial_console_setup(struct console *co, char *options)
 	if (!ssp)
 		return -ENODEV;
 
+	ssp->console_line_ended = true;
+
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 
@@ -833,10 +891,13 @@ static struct uart_driver sifive_serial_uart_driver;
 
 static struct console sifive_serial_console = {
 	.name		= SIFIVE_TTY_PREFIX,
-	.write		= sifive_serial_console_write,
+	.write_atomic	= sifive_serial_console_write_atomic,
+	.write_thread	= sifive_serial_console_write_thread,
+	.device_lock	= sifive_serial_device_lock,
+	.device_unlock	= sifive_serial_device_unlock,
 	.device		= uart_console_device,
 	.setup		= sifive_serial_console_setup,
-	.flags		= CON_PRINTBUFFER,
+	.flags		= CON_PRINTBUFFER | CON_NBCON,
 	.index		= -1,
 	.data		= &sifive_serial_uart_driver,
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
