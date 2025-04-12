Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4488C369A2
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 00:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jZl3HikLbfs4bS6BkTLExIVNOkX/Gn6ZxFLwBvFG0BA=; b=e2lKDClijwP3b9
	r8XpLXbZjO3OVto4ut1S2pR0WUcBrct042qomvE/CobZgHhy9RbGZwmlXxg+U5bltYrhKN150v66S
	8oyO+EuVeq07h9KtvpOXR1OoqM/s9wf7mFHQw+G2rU5gnmNsNrsFzjTqopgFtGh7O5iCOB0eeBYzG
	MAu0HJyMgiw84Ey0gdaIZVrPYHRaE5JeE85CGp8VzRNFnk64PqDO7O9c1QwIx8dDOjKJhEdReKLU1
	qNhtTXiSbuYRkh/zofDX5b3xx/vcCQJfdxpJQUwHRX1BuFFa51tvKLzGTLhK4pK5hEwmpRozsGCAL
	/UsX/qxBTpfADFLF7ulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3OhE-0000000FASG-2j0g;
	Sat, 12 Apr 2025 00:26:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3OhA-0000000FARb-2FpF
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 00:26:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-224191d92e4so26280525ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 17:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744417563; x=1745022363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPh3Lw9dyl7oBJ7A7OStIjrcHnhiJHHTBrQQ+YXhdeo=;
        b=nCjSGCup8jf+dcKBlzxAfPWMey2n09WpD5QSI+/udaQJYrKoAy2MnLGExOckvMuouh
         VxLFUFj5MrTedJc5Nu5IDZGX9+DTpwR3f8lW11ppciQPFLn404UuaF8YmDzNaYQI6uns
         A2B4M4ldRtK3EeJ87Li6A5BXdXP+q3gqYf1WWG5VDLfodwmrAOrMcXO3shPBaJEqO2xY
         0w0Umr1y37tAwYAgK5DiyEUShKTcPQ/vBU/e1Wnv7lYBAyfRwJHVayMoPfHs2lVe0j1h
         0/oIlF7qg+FWRmRSnGkEfXXtTUv53vjCvmp6pHH0mTmb9dHJA3l/J764ElQJIFUYFT4a
         mEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744417563; x=1745022363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPh3Lw9dyl7oBJ7A7OStIjrcHnhiJHHTBrQQ+YXhdeo=;
        b=T2xrno0jWHV06jS6LjmwoR+tgNGbPTJgrNdMGLGr+UNXx9X+KbDsENh7+d1vT/SRPA
         lcnrnCAun7NN6lNb6sXqUfBVHg04xt2bzFtSmVUWolB5Pp6KiSNP9nehqv4aLrO3IhxC
         xsvSEm7Z7hB9I98uxPtzV75Sip3tzadEgkbGgLdGkmI/HIOo2ZF/eJ2HTIWLi4oUN4oT
         T5OYeVh/otbPxHop9haDUN8VsZLNiQggJ2irtbfNZpAbq2wh3XsU9J1EZrg2s1aWJGn6
         eE6cC75qPJw7+K5YTfo54aRO39ZLHjP26Yij5dRgty1NRUD4xrCLVtTZoHFmpTpMbJGB
         pjaw==
X-Forwarded-Encrypted: i=1; AJvYcCUvo4WpSe83ssak+MYtGqWtRuM1qE+5jXCvVnvcNdjiPB/O8dNqTHvYozY3QHYU0+LQhl8htxpwdOvXCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPhNqTSpQxA7oBSsVTyDyG036RNFCc5T7W2IxWX0UZpTrl8ezr
	eWqwcqsaV49SESP4Uo/OSJ0XPutm/wxyS8qmH+96150K6rwnve/m
X-Gm-Gg: ASbGncspda8bjDQqpBm177UYLm5HgUY9km4eS9UnjJMS7fZ+Gtxa6y96PaIM+29OJFq
	Js8ppKz1Jx7FmfRKRn9HkmCSItnZ1jQrGLKyITK25MTNKCMm06iuS+Ya9PuapKc3iLawTBa6P/X
	OFdDy0SfVVirE8A8wqgCrDaoWc1ZFGrzUcz/EjIVI/9g+MKymwK9v7hv+QhqxvDo30W90RvTL88
	Ru26u0TYnDVxStaA8tsg2oul9/rL1iHUBhi30A0VPhJObsKhw7IS8JfKmsUCLI/lVaKFVifRE5/
	wHLWAxI+9jXpX+w5ZKgeSkl6qtvjJKLk1mLxJK1i6k55p00lZotciJBNoMNzGpGmdGl0ddQlvfU
	imKWIJq4SjnjtwNVA7Hwsg7fwDFUsRflbQGSE3A==
X-Google-Smtp-Source: AGHT+IHNMCmo/zYLdO9QUIUBBdZzNR4oWzDbUlcg7z8C3X1JbFehjejVr9yom0CX0KeOdepN99ml8g==
X-Received: by 2002:a17:903:2f8e:b0:224:160d:3f5b with SMTP id d9443c01a7336-22bea502b47mr58301375ad.49.1744417563376;
        Fri, 11 Apr 2025 17:26:03 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cc9202sm56878125ad.211.2025.04.11.17.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 17:26:03 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH v3] serial: sifive: Switch to nbcon console
Date: Sat, 12 Apr 2025 09:25:44 +0900
Message-Id: <20250412002544.185038-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_172604_580100_6036E81A 
X-CRM114-Status: GOOD (  17.13  )
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
Reviewed-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---

Changes since v1:
https://lore.kernel.org/all/20250405043833.397020-1-ryotkkr98@gmail.com/

- It was sent as part of series but resent as a single patch.

Changes since v2:
https://lore.kernel.org/linux-serial/20250405145915.493173-1-ryotkkr98@gmail.com/

- Add description for @console_line_ended.
- Add Reviewed-by by Petr. Thanks Petr for the review!

---
 drivers/tty/serial/sifive.c | 88 +++++++++++++++++++++++++++++++------
 1 file changed, 75 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 054a8e630..110d67613 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -141,6 +141,7 @@
  * @baud_rate: UART serial line rate (e.g., 115200 baud)
  * @clk: reference to this device's clock
  * @clk_notifier: clock rate change notifier for upstream clock changes
+ * @console_line_ended: indicate that the console line is fully written
  *
  * Configuration data specific to this SiFive UART.
  */
@@ -151,6 +152,7 @@ struct sifive_serial_port {
 	unsigned long		baud_rate;
 	struct clk		*clk;
 	struct notifier_block	clk_notifier;
+	bool			console_line_ended;
 };
 
 /*
@@ -785,33 +787,88 @@ static void sifive_serial_console_putchar(struct uart_port *port, unsigned char
 
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
+	__uart_port_lock_irqsave(up, flags);
+}
+
+static void sifive_serial_device_unlock(struct console *co, unsigned long flags)
+{
+	struct uart_port *up = &sifive_serial_console_ports[co->index]->port;
+
+	__uart_port_unlock_irqrestore(up, flags);
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
@@ -829,6 +886,8 @@ static int sifive_serial_console_setup(struct console *co, char *options)
 	if (!ssp)
 		return -ENODEV;
 
+	ssp->console_line_ended = true;
+
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 
@@ -839,10 +898,13 @@ static struct uart_driver sifive_serial_uart_driver;
 
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
