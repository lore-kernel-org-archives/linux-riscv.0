Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71177C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 20:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anMP9VpH264YyKchQecqfF1ZRvmqfQL64b0h+oR7HZw=; b=lB/+Q9gMtFqyUe
	s/sS2qOsFViUi2sSC7v2EBm6bp9vOZOvOILbk+j5ov8rwT0e6njnkHogFkQkD+34p2oSSOVT5MvbQ
	Vcp6HgCtcvomnGZNOD0s9xsnB2wOn4rYwNtxMwmar8EtKkSYHADvd8it4TQ+IxXQU+v6wC2iA9TQF
	UIxWFxVKZUlkGRlPhX/TXcY+kwy600MG+sTENxtWCkbjGNNVnhjQdBDbtFx3qT6vZ+Rb6VagbZexO
	ro6oE4BNHz0JdHtG3GLeesnSU79XnyEvOiN+pjHH+ij3h/QngB9TDQ4qIzzIgaw7W8lnB9Gf0LdKz
	kxtXDGuZBBXXAqMH7FXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXfB-00Ce5C-9I; Fri, 29 Apr 2022 20:56:29 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXPh-00CYYK-Ey
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 20:40:31 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 1D9FD92009C; Fri, 29 Apr 2022 22:40:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 169AD92009B;
 Fri, 29 Apr 2022 21:40:26 +0100 (BST)
Date: Fri, 29 Apr 2022 21:40:26 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] serial: sifive: Remove duplicate `clkin_rate' setting
In-Reply-To: <alpine.DEB.2.21.2204281344190.9383@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2204291656150.9383@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2204281344190.9383@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_134029_742411_EB17F2ED 
X-CRM114-Status: GOOD (  11.18  )
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

The `clkin_rate' member of `struct sifive_serial_port' now duplicates 
`uartclk' from nested `struct uart_port', so use `uartclk' throughout 
and remove `clkin_rate'.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 drivers/tty/serial/sifive.c |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

linux-serial-sifive-uartclk.diff
Index: linux-macro/drivers/tty/serial/sifive.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/sifive.c
+++ linux-macro/drivers/tty/serial/sifive.c
@@ -148,7 +148,6 @@
  * @port: struct uart_port embedded in this struct
  * @dev: struct device *
  * @ier: shadowed copy of the interrupt enable register
- * @clkin_rate: input clock to the UART IP block.
  * @baud_rate: UART serial line rate (e.g., 115200 baud)
  * @clk: reference to this device's clock
  * @clk_notifier: clock rate change notifier for upstream clock changes
@@ -159,7 +158,6 @@ struct sifive_serial_port {
 	struct uart_port	port;
 	struct device		*dev;
 	unsigned char		ier;
-	unsigned long		clkin_rate;
 	unsigned long		baud_rate;
 	struct clk		*clk;
 	struct notifier_block	clk_notifier;
@@ -463,7 +461,7 @@ static void __ssp_update_div(struct sifi
 {
 	u16 div;
 
-	div = DIV_ROUND_UP(ssp->clkin_rate, ssp->baud_rate) - 1;
+	div = DIV_ROUND_UP(ssp->port.uartclk, ssp->baud_rate) - 1;
 
 	__ssp_writel(div, SIFIVE_SERIAL_DIV_OFFS, ssp);
 }
@@ -648,8 +646,8 @@ static int sifive_serial_clk_notifier(st
 		udelay(DIV_ROUND_UP(12 * 1000 * 1000, ssp->baud_rate));
 	}
 
-	if (event == POST_RATE_CHANGE && ssp->clkin_rate != cnd->new_rate) {
-		ssp->clkin_rate = cnd->new_rate;
+	if (event == POST_RATE_CHANGE && ssp->port.uartclk != cnd->new_rate) {
+		ssp->port.uartclk = cnd->new_rate;
 		__ssp_update_div(ssp);
 	}
 
@@ -678,7 +676,8 @@ static void sifive_serial_set_termios(st
 	__ssp_set_stop_bits(ssp, nstop);
 
 	/* Set line rate */
-	rate = uart_get_baud_rate(port, termios, old, 0, ssp->clkin_rate / 16);
+	rate = uart_get_baud_rate(port, termios, old, 0,
+				  ssp->port.uartclk / 16);
 	__ssp_update_baud_rate(ssp, rate);
 
 	spin_lock_irqsave(&ssp->port.lock, flags);
@@ -996,9 +995,8 @@ static int sifive_serial_probe(struct pl
 	}
 
 	/* Set up clock divider */
-	ssp->clkin_rate = clk_get_rate(ssp->clk);
+	ssp->port.uartclk = clk_get_rate(ssp->clk);
 	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
-	ssp->port.uartclk = ssp->clkin_rate;
 	__ssp_update_div(ssp);
 
 	platform_set_drvdata(pdev, ssp);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
