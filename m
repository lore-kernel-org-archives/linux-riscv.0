Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F94C36008
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQ56dXRR/2gfI2W5R0Z3IfJ+PIHi1ysVqQ1gv8I9BWw=; b=Al5mz50Vd+bTHd
	qYs87Tool9X0B2Aa8kdjRYgeGG1Ox61EYq4WBYXkQ6hPwJngZmCw1oW2wJzXE9w8oE3fgfXJySP2j
	ZJgcCgyHx7MBeilYf9IBikClHbTAruvKsO1rugQUYcbxxUqakSp52nTSFL5tz6AHVCAJqrQYSZRkt
	mZV3iFSXK1pvbvg4+LPT1eBGYS0ATDHHrpyJPh0a8a2EL/8jA2QyzJudgpvKIHYdH1svmOJLPsSUP
	YRgbIKP1yvPDrjcxLsaCSc0Hqfo1ZPJUh+3672/W/SB1/pZ9tjmksnZNsdIoDeY2cF21f8JqmiVPB
	H0GxXFeAV7vCvU8s4VVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tygjE-0000000Fg84-197G;
	Sun, 30 Mar 2025 00:40:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tygjC-0000000Fg7h-0b1s
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 00:40:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223f4c06e9fso63249475ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Mar 2025 17:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743295241; x=1743900041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMZHL0UOoWagu8ugPnApvJFimUNmRJzmGaDhx8HHglA=;
        b=XawrT4Cvz7Z+rTVflTjHmqppi0794Q/dOF583vkdMjsmB7MsX00OTtkByH8XBi1yhc
         BiKn0m5lMV/Ktyrev4/4nxgElGtEOfKnpx4yh3FbY5pTMTMSzwU61yKiW5LM04rl2ORf
         2zW4bqFDjR986Jz6rVcDSUdkRnevvCvZvztdmajEzduJjxbgPHirBWTNhMgymBVra1iw
         AFn0/1ES4+sO4sh6Pzo5EjGQdpqoLAe9+8Cmt9gIk2ipkIkeeDBijAyjt9xmCPyLWzP9
         w3PNwY3FVdZ7leKpy7lXlcvRwXRxB1tppmqd1RlMb+MIV6pspdXQuKZZZhTN+6XTXQAL
         HSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743295241; x=1743900041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMZHL0UOoWagu8ugPnApvJFimUNmRJzmGaDhx8HHglA=;
        b=QoQtd9vsQRtIs8A2HhrUwO/ynkgB2hzg6Rxked5kCLT7XCp7lW+xWf2he0HgYq+sN3
         +DIEoqjpwXvPPyhJs3F1vH5NHhkx1PcPQgRB6Lk4pVLxMwRzzYmh6xUpWWVK/tESgLe6
         OVZCEUH6AvhAZUBUdUJ5UviLRE3GOC7jEYVcb1fOx3IdFfXeXALQQTnYLoTpshOeJFtM
         9fmJpHpXUpnhCWv4EefuJrSfhta7gu6VJGpZchjmlmStZjA/fEKk40hzCquYP8UHkl8A
         N7FGtugJuAjT2PyhBRg+pQNPP/wkvlSAa56Hz740HJRpHSB8F5+ozfI/d/Q7M014vCJB
         vJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVILptxKm/j4XhcaJRP501vM9Vam9r5NJQdVq7t+TguLTCCsLTzheFxfNrW7aHpUZq5rkIymFfmcgMTHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbCHVuHYlFhQqxaQn0dt4yP5VyGxJVuawb4TgrsN7VhOxHCnrX
	UnKQ6rOjMhkVLcLk2MGmc6rAZesseGnWJSnjjiq+FU1YOMXP7RVt
X-Gm-Gg: ASbGncuaxjo4dWryYZhjIyyFxD1bnyVJ9/Wrhe+O4jB/5hRy8tmwQ/DhOlSqwCEMWLk
	QRiDhAKSMPcGv2g0WzQV2WBx9tBzD3rbKHzwB3tVW16DBP8J9qj1EwILYyHPhiZojtXBNp9HI5S
	S5CiSeBfhlZuR1TIsek+qwHDdUYy0TnxXuVJedgIFwx7//KFJYEgWVtCVin7bKjYS4LAamQY3w0
	irg6UAokR6zTHgxhAvgI0G4YATb3KhC1vg6bvYjG5pKGvLqJ0IMWiIOjLTuOGT4yEz+UI7nbziZ
	XfNBSTj874JQcIAWjvdYHwOg0/3KgDPMU36d5TMMk/bCoXSYdV1QyyVr7iUGhAHHF8HmDpOWKqm
	XFjovCX69PLaYgX+zglJl42pLRUKb2UC/fru4ANkkpA==
X-Google-Smtp-Source: AGHT+IHFOyCEAeJmbkmn+i+Vl5fMBQ+7z+CMVVak4iT79a/beE+79Yk9mFZKRySVNG7yZkoJnU70Tw==
X-Received: by 2002:a17:902:e88f:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22921d25b63mr125070065ad.16.1743295241191;
        Sat, 29 Mar 2025 17:40:41 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22346sm4246537b3a.46.2025.03.29.17.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 17:40:40 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH v2 2/2] serial: sifive: Switch to nbcon console
Date: Sun, 30 Mar 2025 09:40:07 +0900
Message-Id: <20250330004007.386978-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330003058.386447-1-ryotkkr98@gmail.com>
References: <20250330003058.386447-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_174042_184799_DD4557C6 
X-CRM114-Status: GOOD (  16.70  )
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
---
 drivers/tty/serial/sifive.c | 87 +++++++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 054a8e630..37d5820af 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -151,6 +151,7 @@ struct sifive_serial_port {
 	unsigned long		baud_rate;
 	struct clk		*clk;
 	struct notifier_block	clk_notifier;
+	bool			console_line_ended;
 };
 
 /*
@@ -785,33 +786,88 @@ static void sifive_serial_console_putchar(struct uart_port *port, unsigned char
 
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
@@ -829,6 +885,8 @@ static int sifive_serial_console_setup(struct console *co, char *options)
 	if (!ssp)
 		return -ENODEV;
 
+	ssp->console_line_ended = true;
+
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 
@@ -839,10 +897,13 @@ static struct uart_driver sifive_serial_uart_driver;
 
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
