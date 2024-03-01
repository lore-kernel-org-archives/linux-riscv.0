Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C63C5478C
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 21:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dA3fiAWrW+zJgo+cdPpgQTLOL3P42QofuX/uigj0XmM=; b=ht/TSpd5xTxBLn
	ZjpyKulb/uTr5+4R3hwkkT64NyzvRMeq6kwJ7saFsjYB95hFvAiKRVW4OFzPctqQ1i0zUuPTcHwZT
	N0akhKiB4f/AJAjZSsCe9XUgleOtIAnWgrrlihsoWPpBhvmoq+KNb2pNuvwPCgaPbvIL9gMxf2hVZ
	tk69J9zwClIrPtOLsGbtOcF+x5k5GbEX5dvNYsSIcKdM4gO6IL9v5CRXT83GVwm1XYeshV0H0VM+E
	c7myfryxBEOKayh2DkrZ1AIvhDvZDWD50Gof7/F78uETFmxg0KmS7mVTVFmTY5otoex6KLQlEbyB3
	UcNbuTNYtxzvZQx8khgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgAoT-000000024dr-273B;
	Fri, 01 Mar 2024 21:53:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgAoJ-000000024ZN-2teM
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 21:53:03 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709329973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3rJ+VIa9zH6PXhEPo5PwUUJJVp/71Z7DvgBQX7HX44=;
	b=kXkNRzW5SN42CuG3j4/V7kKEiVAOe873xyPaCkeIungLWwGlx26c1O7Gte0RgDGuR9gXGX
	8qOyauCNcFgAhVPEwLDbj0sUHQIJOone7Vc7ygZklYUTCxaNrNrcR+EgO50IlRSv6DoVWL
	Iq0zLDH1hqr+y2QZEPDjqCZ+O0s9y4C2qpZpZA/dFeB6nolEQOUpuoiOh9bgRwplT6NCX8
	oA0Y7W/Lw76wap0jfYm4aSz3PDbld83b4N39aV6AEnJTr1oMcS8dJISzYm0DWGscBsl4X3
	bixYSHMbKe8hKAZw94bAlb502yitVjeBmw15J9VnGzQlkFf13dO3PYZifpvDJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709329973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3rJ+VIa9zH6PXhEPo5PwUUJJVp/71Z7DvgBQX7HX44=;
	b=cfVr8DqJ/HJJ86+hlhTql0ysW451KIZ/tbZ1sIj2K94z5XE31vEEP5vJ92oRjVlR7a/uz+
	3byohSZL5uh0qbAQ==
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 12/18] serial: sifive: Use uart_prepare_sysrq_char() to handle sysrq.
Date: Fri,  1 Mar 2024 22:45:25 +0100
Message-ID: <20240301215246.891055-13-bigeasy@linutronix.de>
In-Reply-To: <20240301215246.891055-1-bigeasy@linutronix.de>
References: <20240301215246.891055-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_135255_976676_9A07D9DD 
X-CRM114-Status: GOOD (  11.27  )
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

The port lock is a spinlock_t which is becomes a sleeping lock on PREEMPT_RT.
The driver splits the locking function into two parts: local_irq_save() and
uart_port_lock() and this breaks PREEMPT_RT.

Handle sysrq requests sysrq once the port lock is dropped.
Remove the special case in the console write routine an always use the
complete locking function.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/tty/serial/sifive.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index a4cc569a78a25..0670fd9f84967 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -412,7 +412,8 @@ static void __ssp_receive_chars(struct sifive_serial_port *ssp)
 			break;
 
 		ssp->port.icount.rx++;
-		uart_insert_char(&ssp->port, 0, 0, ch, TTY_NORMAL);
+		if (!uart_prepare_sysrq_char(&ssp->port, ch))
+			uart_insert_char(&ssp->port, 0, 0, ch, TTY_NORMAL);
 	}
 
 	tty_flip_buffer_push(&ssp->port.state->port);
@@ -534,7 +535,7 @@ static irqreturn_t sifive_serial_irq(int irq, void *dev_id)
 	if (ip & SIFIVE_SERIAL_IP_TXWM_MASK)
 		__ssp_transmit_chars(ssp);
 
-	uart_port_unlock(&ssp->port);
+	uart_unlock_and_check_sysrq(&ssp->port);
 
 	return IRQ_HANDLED;
 }
@@ -791,13 +792,10 @@ static void sifive_serial_console_write(struct console *co, const char *s,
 	if (!ssp)
 		return;
 
-	local_irq_save(flags);
-	if (ssp->port.sysrq)
-		locked = 0;
-	else if (oops_in_progress)
-		locked = uart_port_trylock(&ssp->port);
+	if (oops_in_progress)
+		locked = uart_port_trylock_irqsave(&ssp->port, &flags);
 	else
-		uart_port_lock(&ssp->port);
+		uart_port_lock_irqsave(&ssp->port, &flags);
 
 	ier = __ssp_readl(ssp, SIFIVE_SERIAL_IE_OFFS);
 	__ssp_writel(0, SIFIVE_SERIAL_IE_OFFS, ssp);
@@ -807,8 +805,7 @@ static void sifive_serial_console_write(struct console *co, const char *s,
 	__ssp_writel(ier, SIFIVE_SERIAL_IE_OFFS, ssp);
 
 	if (locked)
-		uart_port_unlock(&ssp->port);
-	local_irq_restore(flags);
+		uart_port_unlock_irqrestore(&ssp->port, flags);
 }
 
 static int sifive_serial_console_setup(struct console *co, char *options)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
