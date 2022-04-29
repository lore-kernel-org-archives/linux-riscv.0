Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5183C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ff++pMqZV0mWBCePLGLETcsB3afrlpUcO/AC7M9rXO8=; b=QKRcCz6xX6XanD
	Cf3s1X6XXuzjT3JaN+zvE1LrLbSmOuGbuIu/Xhj1D76gl8+WhN/aOO7EwHMhxJovpRg+7B4ypDjWq
	edNBvvfQMCey9gtoYaDnz6DODAb6uBkPUptZor0pWp4UN/F8ibSh/CiAD8MnEZT9DOR5lZcTnA8Tj
	KWN1ZZ0/j7nLlHUh5xBYXol6AUzBedIe1y82rYqKrTQtfi2anG70puEzrU9x23wvBkI8/w0ZfYO1P
	V91j+dgdQjKU6FxD/bD874ya9gktmHuXgKrxvtWIzEryAhgdE9D/blqf3tIPvH3et4EK3MgZw9dNM
	rNETvw5SkZ8fC/LLzpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXez-00CdzN-G6; Fri, 29 Apr 2022 20:56:17 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXPZ-00CYVQ-D6
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 20:40:23 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id A56B192009D; Fri, 29 Apr 2022 22:40:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 9F1A892009B;
 Fri, 29 Apr 2022 21:40:18 +0100 (BST)
Date: Fri, 29 Apr 2022 21:40:18 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] serial: sifive: Report actual baud base rather than
 fixed 115200
In-Reply-To: <alpine.DEB.2.21.2204281344190.9383@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2204291656280.9383@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2204281344190.9383@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_134021_688328_278AE634 
X-CRM114-Status: GOOD (  12.87  )
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

The base baud value reported is supposed to be the highest baud rate 
that can be set for a serial port.  The SiFive FU740-C000 SOC's on-chip 
UART supports baud rates of up to 1/16 of the input clock rate, which is 
the bus clock `tlclk'[1], often at 130MHz in the case of the HiFive 
Unmatched board.

However the sifive UART driver reports a fixed value of 115200 instead:

10010000.serial: ttySIF0 at MMIO 0x10010000 (irq = 1, base_baud = 115200) is a SiFive UART v0
10011000.serial: ttySIF1 at MMIO 0x10011000 (irq = 2, base_baud = 115200) is a SiFive UART v0

even though we already support setting higher baud rates, e.g.:

$ tty
/dev/ttySIF1
$ stty speed
230400

The baud base value is computed by the serial core by dividing the UART 
clock recorded in `struct uart_port' by 16, which is also the minimum 
value of the clock divider supported, so correct the baud base value 
reported by setting the UART clock recorded to the input clock rate 
rather than 115200:

10010000.serial: ttySIF0 at MMIO 0x10010000 (irq = 1, base_baud = 8125000) is a SiFive UART v0
10011000.serial: ttySIF1 at MMIO 0x10011000 (irq = 2, base_baud = 8125000) is a SiFive UART v0

References:

[1] "SiFive FU740-C000 Manual", v1p3, SiFive, Inc., August 13, 2021, 
    Section 16.9 "Baud Rate Divisor Register (div)", pp.143-144

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 1f1496a923b6 ("riscv: Fix sifive serial driver")
---
 drivers/tty/serial/sifive.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-serial-sifive-base-baud.diff
Index: linux-macro/drivers/tty/serial/sifive.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/sifive.c
+++ linux-macro/drivers/tty/serial/sifive.c
@@ -998,7 +998,7 @@ static int sifive_serial_probe(struct pl
 	/* Set up clock divider */
 	ssp->clkin_rate = clk_get_rate(ssp->clk);
 	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
-	ssp->port.uartclk = ssp->baud_rate * 16;
+	ssp->port.uartclk = ssp->clkin_rate;
 	__ssp_update_div(ssp);
 
 	platform_set_drvdata(pdev, ssp);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
