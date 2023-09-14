Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA720EEAA63
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRIhJ7ii8vwAQgbb5/UZ4vP7oFT6F72Ev3enlvB0O+E=; b=lyWDcxJYpfu3N0
	1LhW9L3T06pdtrd7iNufFzMCAc9Vtp0CwDelI97ULiKPxUyaU5MmeNn6zPoK4nviAvssGF38dyhoP
	IrET3HOS+ZE/SMTExeamZFLdhdjVh56jkFH47Ra2WP4l6pTW3O1cgUqsXYYoQMhNoTTazDvIkbX2m
	RGhhnaV0ywXo3tubnmPT7LCy18lRgRP5yihkdvsFnN/yjU4zPoeFGYZXezIUmPVj/A7SJfPxRbszc
	uNn2pgGuDmBI2T7TMFwJoADyIOrblfqEIIMXrLaUvrvoL6CChsNL8Na2l0QdBHvpdQg/JLWeIhWI7
	NPudPe7VfUcq4w1Jmv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrFK-00959L-03;
	Thu, 14 Sep 2023 18:39:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrF5-0094tz-0e
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 18:39:08 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694716745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNItZDOSVbjUj/GhN7qtDvHsswbZnbm/OUZHY8Hfuqo=;
	b=wknKwa1kLvdaAYCvkZu9Z81f2T8Ta+CKva4N8RP76TA/NcMmJlm+Kil2JepCpHxBw1BEJU
	K5pPqaYbTwLXrS3/UGwnuSoqeuuWpaEqqES2YbBrkQQJBM2jxPSbaryW3lTtByRM/tMtwh
	gLrH5uhCtN8myDHRj74sRARHv9IwiNLbYc/k8O+0uLooKYlN4mT5AxH563k4Ct6BKNLKBa
	6sfWSVIRNQrC7RUyNp3GxrdgJpqbYtOp6pNuQ7JQPlbSa8eoVNCfaBWQPqRdeKSwo43PTo
	78iMfhiAozSI/V0aIgMpjYRus2ommjIBSLG4FVydEquKML+4oWBSdSlxxdKnPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694716745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNItZDOSVbjUj/GhN7qtDvHsswbZnbm/OUZHY8Hfuqo=;
	b=HCL13mxdtEEBqe3txMOM+VDtV2848oD66CWe/CXn/8/B7TEVd4hlSi4SRJ+K0c3B4MuVs7
	ZsMM+w8fmLRiVrBg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH tty v1 61/74] serial: sifive: Use port lock wrappers
Date: Thu, 14 Sep 2023 20:44:18 +0206
Message-Id: <20230914183831.587273-62-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_113907_531400_973D681B 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: Petr Mladek <pmladek@suse.com>, Yangtao Li <frank.li@vivo.com>, Richard GENOUD <richard.genoud@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, Nick Hu <nick.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

When a serial port is used for kernel console output, then all
modifications to the UART registers which are done from other contexts,
e.g. getty, termios, are interference points for the kernel console.

So far this has been ignored and the printk output is based on the
principle of hope. The rework of the console infrastructure which aims to
support threaded and atomic consoles, requires to mark sections which
modify the UART registers as unsafe. This allows the atomic write function
to make informed decisions and eventually to restore operational state. It
also allows to prevent the regular UART code from modifying UART registers
while printk output is in progress.

All modifications of UART registers are guarded by the UART port lock,
which provides an obvious synchronization point with the console
infrastructure.

To avoid adding this functionality to all UART drivers, wrap the
spin_[un]lock*() invocations for uart_port::lock into helper functions
which just contain the spin_[un]lock*() invocations for now. In a
subsequent step these helpers will gain the console synchronization
mechanisms.

Converted with coccinelle. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/tty/serial/sifive.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index d195c5de52e7..b296e57a9dee 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -521,11 +521,11 @@ static irqreturn_t sifive_serial_irq(int irq, void *dev_id)
 	struct sifive_serial_port *ssp = dev_id;
 	u32 ip;
 
-	spin_lock(&ssp->port.lock);
+	uart_port_lock(&ssp->port);
 
 	ip = __ssp_readl(ssp, SIFIVE_SERIAL_IP_OFFS);
 	if (!ip) {
-		spin_unlock(&ssp->port.lock);
+		uart_port_unlock(&ssp->port);
 		return IRQ_NONE;
 	}
 
@@ -534,7 +534,7 @@ static irqreturn_t sifive_serial_irq(int irq, void *dev_id)
 	if (ip & SIFIVE_SERIAL_IP_TXWM_MASK)
 		__ssp_transmit_chars(ssp);
 
-	spin_unlock(&ssp->port.lock);
+	uart_port_unlock(&ssp->port);
 
 	return IRQ_HANDLED;
 }
@@ -653,7 +653,7 @@ static void sifive_serial_set_termios(struct uart_port *port,
 				  ssp->port.uartclk / 16);
 	__ssp_update_baud_rate(ssp, rate);
 
-	spin_lock_irqsave(&ssp->port.lock, flags);
+	uart_port_lock_irqsave(&ssp->port, &flags);
 
 	/* Update the per-port timeout */
 	uart_update_timeout(port, termios->c_cflag, rate);
@@ -670,7 +670,7 @@ static void sifive_serial_set_termios(struct uart_port *port,
 	if (v != old_v)
 		__ssp_writel(v, SIFIVE_SERIAL_RXCTRL_OFFS, ssp);
 
-	spin_unlock_irqrestore(&ssp->port.lock, flags);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 }
 
 static void sifive_serial_release_port(struct uart_port *port)
@@ -795,9 +795,9 @@ static void sifive_serial_console_write(struct console *co, const char *s,
 	if (ssp->port.sysrq)
 		locked = 0;
 	else if (oops_in_progress)
-		locked = spin_trylock(&ssp->port.lock);
+		locked = uart_port_trylock(&ssp->port);
 	else
-		spin_lock(&ssp->port.lock);
+		uart_port_lock(&ssp->port);
 
 	ier = __ssp_readl(ssp, SIFIVE_SERIAL_IE_OFFS);
 	__ssp_writel(0, SIFIVE_SERIAL_IE_OFFS, ssp);
@@ -807,7 +807,7 @@ static void sifive_serial_console_write(struct console *co, const char *s,
 	__ssp_writel(ier, SIFIVE_SERIAL_IE_OFFS, ssp);
 
 	if (locked)
-		spin_unlock(&ssp->port.lock);
+		uart_port_unlock(&ssp->port);
 	local_irq_restore(flags);
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
