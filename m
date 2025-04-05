Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379B0C36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jItpW5GHyGCGNWO5jx4M1kaN0Ks2pQ/z7zolv3x7H9c=; b=TU0U8nykESRxFN
	XlnHWn90JjXEra+0wXuOjpJPtVoD2zryGBzjlujqNOGrXcnHrcxv96Llhw4w9XIxs3itjw9B4w3sA
	/Y1CNS1qqxGqh3ejLpMHLnng1j+zeRlq2hSG3boSGOzM2emrvnzKly+IrKQXAlKFPJufQOyP/Rc9+
	QBMp67LQpCh3SSzsYeF76wgl8ttAswqkYmyC+K4XGRTGbeHz+VyIkyWuVbzOAoZOK7ApWC+QKuqvJ
	eoXTY6E1A1ax96Kwwm7g/1t2677So1RhtH26d80dCg9omn7PdnsQeztWukYpiia48V8FeU3Z+vo+S
	qG2BkbFnxDa5y/Z7f4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u14zp-0000000E6AB-24tC;
	Sat, 05 Apr 2025 14:59:45 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u14zm-0000000E69o-3cLT
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 14:59:44 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-736aaeed234so2472555b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Apr 2025 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743865182; x=1744469982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U78dvPgCsVKsDHDJLPZBi8BzFbKiqAV3z5zJs3Q3Vas=;
        b=YEAAwXBd43zrumfDyPyG6O8J2FJnJjFCCV6AktLXPCfj86bBf9CpD78yue7IWekkLW
         eoHiawPwD7+DKXLlMeks0+Gj5BKoX5uTUYU5SL005Gvyf1NRZNWf6B7VT8Rmspm3zrSs
         GqmOoREIzZaNfVH49QD7DaC+JZPDSgKuQSkusVEgwyjt5CSgLl40rucajwqkoo1JA336
         sh0LWlC22YNlFDEh4rjccYy0q4YWMNKVudQteXXU5Dn77W/d1yPikYVNuOegjDBiY53U
         rsX3GoRQkWLAZnLiqWg71UIQGJRWxU2xBLod1l8ip87ucwL7nzRgJQYJ5Z4tYZ3gRpru
         LD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743865182; x=1744469982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U78dvPgCsVKsDHDJLPZBi8BzFbKiqAV3z5zJs3Q3Vas=;
        b=ZgLGn+4cxZJSR8vMejbfmEgot2As3na7iIvoRehAcILRGNBXY4X6nHHHBeONnS0iNF
         DnApOSgjm4HINIKZe8trQntIev+SN0XPVAZMdGjZfgF9lL6gkbhHKvBdhx47GUu4Zh5Z
         ixotv5kgzopZMNnOKhEM4kz2+Rsa226RZ/oQOepwzy42oGlq4fZtwQC0Hi9GDFxzLRPa
         peUhOHIdtHYqVUGaun/IAofM8Mx1YzbFpxJ//APmirp/gZTd/0N0zlXsjLRHCZL5Aan2
         EgNHYKc9h22eSbF0j8JINmhLfG1kJReJuhhyTs+2gPaI8V3YE0rdKHf8Y9upQSif8bpy
         euvg==
X-Forwarded-Encrypted: i=1; AJvYcCVeI/8SFg1LPsX6Bi7rhIcTi8UtnX4uKOeM66mmDfVGPuvJkV7qg8jcso/FuUiZp6YUY0/mgJSWZkOmEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd85OUaHZ5QrxXej5XvMQeUsSG/8hX1HRwxSKXpzXxPSgWXDZh
	WvsWVGuHBA/5B3rp7uc7+kaZcvV5deuY2CcDUTxFsIIyE8Qp6AuY
X-Gm-Gg: ASbGncvQsiAchl2iNSNK8x0XBw3WoJx4vc6TxeUrw0RC+qe8T1QeMONGrjHBclFLlWk
	2/bckXvGTFCw3eHqM5+TpvjsqqNX2MCXJ62c4qbDpLKAT75TNEt7QePQx0qOjqIaaofxYGCO5zI
	IT33Ve5cFTKCW7tiahzjUE3NlffchLteYsDDT3UzwCmNGIbsYlHEJBX/8ZxpEXE6nIjphi909iI
	LiB2Wm+uA+i3KVz1d0PigIIuiAoMkC/TjGfVZQKlyksOLUPQ40QDMzNuZqniyuvi7d5wv3n0yjV
	9QKqsuNuGKej4Svjn4UJJ8SFCjVtEzX5VpGW9NYk0tuEtrwcBO97p1EWMl+0YIU0+xtzdPQoqHr
	kCXwmoGJHdwMmGCTJVkLgqqF8YszrlNXy5jtJfJ2o9w==
X-Google-Smtp-Source: AGHT+IEIfr1PeRtQ/aHXxthPr+Pi+Ht9Cr3z0rBJ0mKi+8MkYMU1eZES+TqJkWwXtuflwGedDx7QRA==
X-Received: by 2002:a05:6a00:3a0f:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-739e6ff6b10mr8332137b3a.10.1743865181802;
        Sat, 05 Apr 2025 07:59:41 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea0991sm5497003b3a.106.2025.04.05.07.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:59:41 -0700 (PDT)
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
Subject: [PATCH v2] serial: sifive: Switch to nbcon console
Date: Sat,  5 Apr 2025 23:59:15 +0900
Message-Id: <20250405145915.493173-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_075942_899506_5C724172 
X-CRM114-Status: GOOD (  16.76  )
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

This patch is once again sent as a standalone patch for converting sifive
driver to nbcon. It used to be sent as a part of series. The related fixes
along the way can be found [0].

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/all/20250405043833.397020-1-ryotkkr98@gmail.com/

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
