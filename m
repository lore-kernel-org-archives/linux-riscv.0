Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ACCC36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 13:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1q+vJ6rbDOWcWxRQVA1mIeJ5jbEwFVVRbDdMNQc67GU=; b=htiXtgM0ZTxesV
	JnvVw3fXDjktfe3fbR+kkyMmd2/DOsB1J6Bl29eZJtcJSxB2dlW1fUa45pWA+ZtXFK8iwKCV2ArG3
	zi72ESxLqcGp7k3ntEuqIw0fowfrCge6U3fFA+kn+EJSMcumB4PmT98Lr4OGsAI4RtqpwtRkFQcXm
	6cna87OpVLfqP5G5H9AxSbgFOsjtbUSjS76Fy3UbUKxnd42NSyLur1cifYZEJcjlpc/my/wUw5YgW
	MzZGfrV2fLfQQLeb8Lf8Jp3IuPNGdn6wwect/GFdtnf0xtl2J1T/Gwcaz91tegorC+7gkSnap3ah4
	UhtXuWDVmPFr0tk5Jbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13gI-0000000E0E9-2wjV;
	Sat, 05 Apr 2025 13:35:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13gF-0000000E0Df-3nyV
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 13:35:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-224171d6826so40133635ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Apr 2025 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743860127; x=1744464927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FQzVHvUxHSJNU/i0CyWe43dg67CKrHYWlJYSIJQstY=;
        b=RlxlPWW5O/mQ/yq9iJwCr2FUroNBGm3hflQzKUZ5QGq8UWXBmJA6AvSldW7XvTayKM
         GC3Il1ewy8Emmvk8ZzXZmbfV3f4kLv6oMIlYDW6nwVi4XiU2LiiYwad/mrYSRhNHln07
         VzZ/PIEZlbpEUY8T4yUAVEt9bniCWyWeQOyLSUwVDxfHRhVF+xS7g5SExwT5KLeOARcL
         YFdKz/jz4noA8uyptudxyR7f1NsBiLThTZR6tk0/0e9q0PI0rv4OmhV5ghj6QPWZJ7ff
         5KwZOmnMr1reGs8m3QiNKc7SngVJz2mO8xWZyaU5x2y8VC71adqEvwifqzG7/ynI3RQ1
         YJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743860127; x=1744464927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FQzVHvUxHSJNU/i0CyWe43dg67CKrHYWlJYSIJQstY=;
        b=SpNTFXWqZSkVNnDRegQHHun0gAvsjbwDZKiRzu+QokmnzFEojN7SG/QSa6B7DUPSvr
         hTfh71hzFtWzx/N8tPu4Fr6wf9gXTIOg/ZKBPS2BPZ9HNIKWN78AVe/TFrn2gZFaI5Ra
         CySV30J1ut8934BPIst12e9kd/KWwn8E1BoTzrUx85hg+HV3+kxf1ScNioRRbcPmraGp
         V7lnpwWxr7z4Vsu2JKAoYVfBbjwsJl2VWYeU9lEef13rF+YHfJoAL96jU/fiiT2e/8uz
         qkK0VSBPakPvm1HjyO78vUiS1TO41spLdg5Owk/qxxPElE++yz5hfWkO5Y2n7sHtjDEI
         uXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmdo0VQ9AsDEP7LVwAyma406oARDj1JGVQtquuKRpWx6JFrJ9d3XeH414heGZhCAD2JOcAHibVoVR4jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAeHdOl6sQVX3nzL2+uI8Vq92LoV2tJPLbbJ0LHPlvqyZ9BbP5
	iJd9br26Bqe5ZbVniJKQpbAsBBMgmrG6hnQXxBhjRyeO6RmDXdNF
X-Gm-Gg: ASbGncuMoLIZgcc3CCzipGK00suYTW81I8uDJMFQ9jK2FvfI36z7v3kutyLuTZawXM+
	rCArrM0THoXWo+2icwZtlvAqUPBNhzg0lzCzogQ8DdWOlIKiLGEYO1H77OXZBUY8tTiviYaRoEg
	QYKgfW6QRsfjk8U/hVNe4D/CXfoWFEyh40MMOKX/Gjwi7VdFd22oHL4jkKb1YlQgRF4Wu+yqXXY
	WrLAGzcy/IUKG/JqTlETUXCKC1Tqe9UQmljfXA884HB7X1FsLxFjsdunUF8uRD8xIRT3d6rorip
	llS2FZsjsqEYdODiX8JoxOEn6/klWOjUe8ayPRjraNDFrVIsR19HmenvSZH0jq5dtNEM+1hrE68
	Wz2TAesRw+2piK3f9pOOeNU0BKgM1t/+ysxTATITGMA==
X-Google-Smtp-Source: AGHT+IGxKomMocnLw8znvB5CA9sPxmcWTaLj9ccl9mIZAj6Kb4UW/TbsvGWqqwpRyu9AiVER5AB+Xw==
X-Received: by 2002:a17:902:ccc2:b0:224:1781:a947 with SMTP id d9443c01a7336-22a8a0556d9mr94019415ad.21.1743860126944;
        Sat, 05 Apr 2025 06:35:26 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c020dsm49579655ad.100.2025.04.05.06.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:35:26 -0700 (PDT)
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
Subject: [PATCH v5] serial: sifive: Switch to nbcon console
Date: Sat,  5 Apr 2025 22:34:50 +0900
Message-Id: <20250405133450.489780-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_063527_951540_6F156284 
X-CRM114-Status: GOOD (  19.05  )
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

Changes since v1:
[0] https://lore.kernel.org/lkml/20250323060603.388621-1-ryotkkr98@gmail.com/

- Thank you John for the feedback!
- Add a patch for synchronizing startup()/shutdown() vs write().
- Add <Reviewed-by> by John.

Changes since v2:
[1] https://lore.kernel.org/all/20250330003058.386447-1-ryotkkr98@gmail.com/

- Add Cc stable for the first patch.

Changes since v3:
[2] https://lore.kernel.org/all/20250330110957.392460-1-ryotkkr98@gmail.com/

- Avoid using return statement on return-void function. Thanks Sebastian
  for pointing out!

Changes since v4:
[3] https://lore.kernel.org/all/20250405043833.397020-1-ryotkkr98@gmail.com/

- Send the 2 patches seperatly which used to be treated as a series. 
  The other patch which was sent as part of the series can be found [4].
  [4] https://lore.kernel.org/all/20250405132458.488942-1-ryotkkr98@gmail.com/

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
