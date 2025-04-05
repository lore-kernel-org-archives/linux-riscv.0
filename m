Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF57C36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 04:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAlsmY9DywrNDP0z6xkr9rmkQ9GkcIPueyI0SumWQa8=; b=0fN4eVxM8Szon+
	EsevdvLufX6WLECYytGMNxYEdm3I64HGBGhMJOWk07gOm2iTzNYgen+3ecnio4g5AJpWGd6PnTZtj
	d/rfRzQfXC5ger46VEJHsMcOfT7fxAWlFVXMRf4K8m9icUti+AumuGY8k1jq8C3Nol24ujwOk79N5
	CirwyM+IkSRrCgIbU2+yLl02Wj/GljOi4ozLwfff85GRRmaK4URA2ZWhbt8lnD5Li5ga53I95sqlR
	Jo57Gbz9r/k3MbZlBrk5nYAmkGDGuT/qzpHwAsUZ2w7VCNz6OoVdbA1vk2TIxWgMmatBTtiGHlZ9l
	XAiSxVVM/qTBkabo8X2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0vSH-0000000DT2y-3WsL;
	Sat, 05 Apr 2025 04:48:29 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0vSF-0000000DT2Y-16JQ
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 04:48:28 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so2213135a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 21:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743828506; x=1744433306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOkDjWl0tPtnVRw3Yhbh47uy8y4J+a0KMVbJXu1GpRE=;
        b=IFZLK7oJxS1SoA12z4y2CO3O2v2SIAnQSqXl227ZyfVktDhEjipiechFxMpqKYULtz
         VyvqDArAtCZMH4UZNLbzb2adnD6ihWCU4kMggU9OSMh6QNmB4YmmUVnsDNx9ejKMKfLo
         gMFyvQUULKVNyK6epCNylveY01o+aqT87Op09jE2QShUPC1MQTV9H49wqqYbLBa/sx5z
         5mHsFjMcbHJdnzRWK3oZzP7lvyZj68XAkN3IHRPwpPSmKMI3h6C+ThsmfS2RVNEeClQb
         gB7RyUUF2bejXcjgmU3gWoUDEmAcPWFzOaDwF3/hDTW7TwYmz2kTyVRzG777yzEyH3R0
         uoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743828506; x=1744433306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOkDjWl0tPtnVRw3Yhbh47uy8y4J+a0KMVbJXu1GpRE=;
        b=E+R457dIC1sm2yrIKswAovnJrTwC4syTYzzcWrvyfQ0VpcYXUroORAKX692Qj+IQjS
         axVDB4NhrhxuzKKfQY1eRqVqhqu+rJFjuyft7u+NW9wnWbQsxbFEtlxd7pInpyA8T015
         rzBHkPyorgkTqY68v/e11n3+sAIhZvqS5PQ3DDpiImUujSBeqTyXXJ0OClXEmyRETLEa
         PXFnbBGXhuGL60HrjBpLcKQWhRdlmy3q4Gk62GQ3tiY7IMwKI4wFJahuPG2UyHocdV5o
         BpLFmhClgE785BvT2VJGG2u1d1GN9EVvdwJNTbNEYnCxNSA3mye4bJfUlwzO7jBRZWZP
         eg8Q==
X-Forwarded-Encrypted: i=1; AJvYcCViPWdWITp3atZzWZsgAb+56YDfPwJZekW/DJSURY2jtyZk0pPYfNdDg0G4D+B+12z3QFJLtf9VzaWmLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDsDxZYHLfs1jSkv8EMrOj4pI9qwr9CNHRWBT4PvRQb2LnjqWm
	7r5SOroI0g3eblsLoP1/jivAJhPtkHO4Lo7Ejp2p+9CuE8yIPy64
X-Gm-Gg: ASbGncu1gqfV9Fs/4BSFf63T+j3BJtTPfsrRzrGvSr7WWyQqtneJBG7iqQQAqFLj6+f
	36gBOKUjAP2RfzPR2pIlG3z7NPL+tUuyGVkf/1V+0uN0bD4tfDO8WKOpQ6LDo6KlqlwH4RfcEeS
	IFMs3MBLoy+SEAzT5PrnD1BQuHI5M5KuwI3rbXfa1KeDqae3fQD+p8bYiir2zhNKVaqr0iIW+eu
	1UDNXD08mRmrnFF4xbrlBWnDi33F9ohBQj7byiiCqsKQnvWokh+h785cnvsNV+60uSjTaB6r4nk
	sToYXPRyFbfg5SMXTE8VE3Hmg/YuZaWpOc6zXf+PeTCzVL9XXVDjj3vifLF133rHp46XRouWlLB
	5f4dkgi3kVkBagKK4nY92uo/Zz1eUQbE=
X-Google-Smtp-Source: AGHT+IHayKYESoyQUebzW8OHMxuspJNCiiNnavvSdkWttXkg7u4SpFb0YVtZ8myPQ+8pc7VdcOH8RQ==
X-Received: by 2002:a17:90b:50c7:b0:2ff:71ad:e84e with SMTP id 98e67ed59e1d1-306a612c906mr7676516a91.10.1743828506170;
        Fri, 04 Apr 2025 21:48:26 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca5163fsm5196338a91.19.2025.04.04.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 21:48:25 -0700 (PDT)
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
Subject: [PATCH v4 2/2] serial: sifive: Switch to nbcon console
Date: Sat,  5 Apr 2025 13:47:39 +0900
Message-Id: <20250405044739.397456-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250405043833.397020-1-ryotkkr98@gmail.com>
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_214827_301294_AA7A6C42 
X-CRM114-Status: GOOD (  16.09  )
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
index 054a8e630..8f7f770ec 100644
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
