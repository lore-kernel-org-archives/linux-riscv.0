Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60770C3600C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 15:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcNkxUd5u+KQRtWBg3yxEhy/dmuR9HXhuvrYioKSzZ0=; b=J1SOnZPW5WWC4n
	qacs1IXp+rcUyxJESPWqxV75zBSooblFC40yHC1Vxc6Mj4qWOF0/ZnaczogeNTJEWHcjoDGtxH/AE
	wAPjJKVIGvG8Iseid8xIFcE83HET0R5Q1Dm2bN6XAHkdgkrToGNIpmIGmOl4Zl58xilO4nm2V/unr
	rZw3nuTa5FfTMzFuahuHh5M5Uc74hMfxSupY9kDfyS5HoMCPwzjYLBgCaPPibJrqOl/KPQsym7KA5
	8RuUJ9ZRmrLOAQhHGx1jXm4xYCJeBIqa9l/l1N/W2IiNiolp5CBl+nxLyjMVAJCNuduh0379OJW+D
	DzWmmiF9HuXyJkON3qcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twjfA-00000003W2L-3qHW;
	Mon, 24 Mar 2025 15:24:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twjf7-00000003W14-3eSY
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 15:24:27 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742829861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jRrIB+zDteaSXRYqxWriyHX454y+VkB0De55x4GzBvk=;
	b=TGeVw+8pkcSvBNuPmnAf0Ivc1s2XnHagca3sg7spp526UKUSrce30RG8h0aA88YDXbrEiw
	pwJXg7R757B3Z0GaVLwDZONvnybOJ30Vnac4qpOXTwk34oF+ePSAKU3+ILln/rnVNUXOHS
	Pi3ukfmp0r0PD2WHvCPpttRugUa/g33TQPmMYMn1RSR8Iew3TcRY5Rkv004jpyA/O4bySF
	falp5ShQ64bFtNURR2teuoqVys2o1Ky21zqM0tzc2EjWeYJdyFwGWbWuRkayEh+yMdeBX0
	jyLdwqyHPv7BZyRc+Bh/zUKykF4aNwllVOs/IUI+0+domX7em/hsbhmOnlG/gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742829861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jRrIB+zDteaSXRYqxWriyHX454y+VkB0De55x4GzBvk=;
	b=XaiCGOxdtLXu/JxZ/a6rU1g0WPB1Doy+6lzB272lBaC+rGkX/RkUvaXyXKRfofNCOieFw+
	NvtPGMEA2YDS9BCg==
To: Ryo Takakura <ryotkkr98@gmail.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, paul.walmsley@sifive.com, samuel.holland@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pmladek@suse.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ryo Takakura <ryotkkr98@gmail.com>
Subject: Re: [PATCH] serial: sifive: Switch to nbcon console
In-Reply-To: <20250323060603.388621-1-ryotkkr98@gmail.com>
References: <20250323060603.388621-1-ryotkkr98@gmail.com>
Date: Mon, 24 Mar 2025 16:30:20 +0106
Message-ID: <84sen2fo4b.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_082426_062608_081C810F 
X-CRM114-Status: GOOD (  13.39  )
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

Hi Ryo,

On 2025-03-23, Ryo Takakura <ryotkkr98@gmail.com> wrote:
> Add the necessary callbacks(write_atomic, write_thread, device_lock
> and device_unlock) and CON_NBCON flag to switch the sifive console
> driver to perform as nbcon console.
>
> Both ->write_atomic() and ->write_thread() will check for console
> ownership whenever they are accessing registers.
>
> The ->device_lock()/unlock() will provide the additional serilization
> necessary for ->write_thread() which is called from dedicated printing
> thread.
>
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>

This driver has the same issue that the 8250 previously had. The
->startup() and ->shutdown() callbacks are called without the port
lock. However, the sifive driver is accessing SIFIVE_SERIAL_IE_OFFS in
these callbacks and this register is also accessed by the ->write()
callback. This needs to be synchronized.

The related 8250 patches fixing this are startup [0] and shutdown [1]. I
am assuming the following change would be sufficient:

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index d032de6199af..1de1b2a5833d 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -564,8 +564,11 @@ static void sifive_serial_break_ctl(struct uart_port *port, int break_state)
 static int sifive_serial_startup(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_enable_rxwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 
 	return 0;
 }
@@ -573,9 +576,12 @@ static int sifive_serial_startup(struct uart_port *port)
 static void sifive_serial_shutdown(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_disable_rxwm(ssp);
 	__ssp_disable_txwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 }
 
 /**

The fix should be applied first (and likely Cc stable) since it is
fixing an existing mainline problem.

Your patch also needs the synchronization. The ->write_atomic() callback
does not use the port lock. However, the uart_port_*() functions also
take the nbcon console ownership, so they synchronize against
->write_atomic() callbacks.

Otherwise, this patch looks good. If the ->startup() and ->shutdown()
callbacks are fixed in a previous patch, feel free to add:

Reviewed-by: John Ogness <john.ogness@linutronix.de>

to this patch.

John Ogness

[0] https://lore.kernel.org/lkml/20230525093159.223817-2-john.ogness@linutronix.de
[1] https://lore.kernel.org/lkml/20230525093159.223817-9-john.ogness@linutronix.de

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
