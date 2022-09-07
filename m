Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1FEC54EE9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMkG1Ccy73nfP/0VCFuNhUJPwX4fj9X223OWVI3nqzM=; b=OVvWr5BHC1aCQJ
	9mUkNVq8qi0v3WA6BOkoBZWLlEyl1qRvETbVsrdydsgUQMJpfTuizJpJpcnx2w5WNwh+CMy2Yt3S3
	ULPOgjE9AhqcOIzMKkyPLzhmdDEcit8ARywl8dlMOmQHkN40GVJrS+xNClhybQw4D7gHiOqccyE5A
	Bl6ezx3Q2v1NT5gCSuKzqSejQhRg/vi70qROco3/0pprxpbfQF9cR2zMN46ONFMrqD+xgySUttidM
	DPmIewa+vY2ze10HVXvp2bzdj+oJm/fj6k7MG5Kl8TW2nWn/csZKG8h2x6WIbcgQMRMJURfquVG0T
	Zu7Q3f51j5r4xAsQegWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVwWm-0079Eq-56; Wed, 07 Sep 2022 14:59:44 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVwTw-0077O8-2J
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 14:56:50 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 174E0580347;
	Wed,  7 Sep 2022 10:56:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 07 Sep 2022 10:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662562607; x=1662566207; bh=GzaX5v4M3u
	YZGVDHmA54EWlyDj5TXPSzbZMQtn7o1Fs=; b=aUkat/PTyOzxfkwQburyZWVMDF
	zINi9Bqjj2XPqR5mTmzwK9PzJ983akjvAiGRcJ+mXVAqSmn4wt466gsZeKIz+ADY
	jPRHCAxfJ1NmC/vtftZ9Y8jEQl1kVZahlz/fFj0I0F9kfmNUDqIgrqbon1F7vepu
	kHZyHd+0Z8hARWxNJP3wGVb9iX8goXOJFPLCrZnpFSFWtNtum+QA6OtlrwAm74Ug
	5h1g0lRK6D3iHCZ7KeO/KlQx7FYYMq1UYT7IriJaF8yZ1OqNW5PPHlk3OlRLLcD3
	b8X5A2pAYRSs884DEMxCazB1P/Iu822qLIYn5D3PIZczYB/hZLLed+Er78Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662562607; x=1662566207; bh=GzaX5v4M3uYZGVDHmA54EWlyDj5T
	XPSzbZMQtn7o1Fs=; b=zt06cd9u9mzrt83EVzh4+WAHsSJDrO81JYvgRDVbjG4c
	qSRNA26E2GwKSRqbY0JXqQRIsnXUirNVR83xcb6/iplF/6yldHM/OID7zmuODD5e
	pG1OuCpwyJ24/Z4taYwLfG5mCcZj8QyAVYr9lP8cDPRFQDADKW8pctsuLnu97bjw
	dtAPMQ1UKlQe2xIyjNmjTPWDSFGVgczhzPf/0yooUnOyguIcWz1vsNe85/Oyovn6
	407cHGyFMuazCYDdVQnZaDQFpchf2YJYj27byUnhPDFnwaf4onOPs2nTp56rj0kx
	1hh6jAJ7APnjQRZuNr11yNox5XujqQH/DCtO6XlWwg==
X-ME-Sender: <xms:LbEYY0R0XEj4yDOEMvVxDW4C5GF5EkDKM5fM5a4BqZlugyg8NsUCNA>
    <xme:LbEYYxy1eE4dXRtcAJ_Dcj4iHYsL5w1iEoXLvhg3m1I_sOx8aR4ATUZqci27n-b95
    MD_hXhU2NDji9bL4u8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:LbEYYx2dTBE22jIXfcyjTD-fdsyGl82HY25_KNX8powQgJBGPOtAtQ>
    <xmx:LbEYY4BfZnTCJ2NIANklXIdvcvrkqWV5frmRYUfMqiW4bUckzqNS4A>
    <xmx:LbEYY9htp88nQi1vE74onKOA4pguUjvQLc0NmRqAqX7mfWuvZZLEEw>
    <xmx:LrEYY4PrHHi5doUy7UslZ59C8CDGdfom_mjzaz6Z4kBcqY3HCXmBLA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BBBD8B60083; Wed,  7 Sep 2022 10:56:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <2197faa3-0217-41e0-8ff0-b5396561c623@www.fastmail.com>
In-Reply-To: <YxiiOWQxGCUz9ktF@shell.armlinux.org.uk>
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
 <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
 <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
 <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
 <cfd16d53-6aa0-e848-91d0-dce8ff72bb4d@linux.intel.com>
 <YxiONiDgGYp8MGQA@kroah.com>
 <c66f9c98-dcef-27c-d74a-ea826f6a799@linux.intel.com>
 <YxiQVTN/jX8AfO4L@kroah.com> <YxiiOWQxGCUz9ktF@shell.armlinux.org.uk>
Date: Wed, 07 Sep 2022 16:56:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Johan Hovold" <johan@kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Tobias Klauser" <tklauser@distanz.ch>,
 "Richard Genoud" <richard.genoud@gmail.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@microchip.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "NXP Linux Team" <linux-imx@nxp.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Kevin Cernekee" <cernekee@gmail.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Baolin Wang" <baolin.wang7@gmail.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_075648_642385_E7371336 
X-CRM114-Status: GOOD (  21.63  )
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

On Wed, Sep 7, 2022, at 3:52 PM, Russell King (Oracle) wrote:
> On Wed, Sep 07, 2022 at 02:36:37PM +0200, Greg Kroah-Hartman wrote:
>
> Of course, it would have been nicer to see the definition of this
> macro, because then we can understand what the "ch" argument is to
> this macro, and how that relates to the macro argument that is
> shown in the example as a writel().

I pulled out the 'ch' variable from the macro to avoid having
the macro define local variables that are then passed to the
inner expressions. 

> Maybe a more complete example would help clear up the confusion?
> Arnd?

Here is a patch on top of the series that would implement the
uart_port_tx_helper_limited() and uart_port_tx_helper()
macros that can be used directly from drivers in place of defining
local functions, with the (alphabetically) first two drivers
converted to that.

I left the (now trivial) DEFINE_UART_PORT_TX_HELPER_LIMITED() and
DEFINE_UART_PORT_TX_HELPER() macros in place to keep it building,
but they would get removed if we decide to use something like
my suggested approach for all drivers.

   Arnd

diff --git a/drivers/tty/serial/21285.c b/drivers/tty/serial/21285.c
index 40cf1bb534f3..a0f5c59d6128 100644
--- a/drivers/tty/serial/21285.c
+++ b/drivers/tty/serial/21285.c
@@ -151,16 +151,14 @@ static irqreturn_t serial21285_rx_chars(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static DEFINE_UART_PORT_TX_HELPER_LIMITED(serial21285_do_tx_chars,
-		!(*CSR_UARTFLG & 0x20),
-		*CSR_UARTDR = ch,
-		({}));
-
 static irqreturn_t serial21285_tx_chars(int irq, void *dev_id)
 {
 	struct uart_port *port = dev_id;
+	unsigned int count = 256;
+	unsigned char ch;
 
-	serial21285_do_tx_chars(port, 256);
+	uart_port_tx_helper_limited(port, !(*CSR_UARTFLG & 0x20),
+				    *CSR_UARTDR = ch, ({}), count, ch);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/tty/serial/altera_uart.c b/drivers/tty/serial/altera_uart.c
index 70c0ad431cf9..f81dd950cd39 100644
--- a/drivers/tty/serial/altera_uart.c
+++ b/drivers/tty/serial/altera_uart.c
@@ -246,10 +246,14 @@ static void altera_uart_rx_chars(struct altera_uart *pp)
 	tty_flip_buffer_push(&port->state->port);
 }
 
-static DEFINE_UART_PORT_TX_HELPER(altera_uart_tx_chars,
-		altera_uart_readl(port, ALTERA_UART_STATUS_REG) &
-		                ALTERA_UART_STATUS_TRDY_MSK,
-		altera_uart_writel(port, ch, ALTERA_UART_TXDATA_REG));
+static int altera_uart_tx_chars(struct uart_port *port)
+{
+	u8 ch;
+
+	return uart_port_tx_helper(port, 
+		altera_uart_readl(port, ALTERA_UART_STATUS_REG) & ALTERA_UART_STATUS_TRDY_MSK,
+		altera_uart_writel(port, ch, ALTERA_UART_TXDATA_REG), ch);
+}
 
 static irqreturn_t altera_uart_interrupt(int irq, void *data)
 {
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 7236fc76ba22..d48d2301d1b7 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -638,13 +638,11 @@ struct uart_driver {
 
 void uart_write_wakeup(struct uart_port *port);
 
-#define __DEFINE_UART_PORT_TX_HELPER(name, tx_ready, put_char, tx_done,	  \
-		for_test, for_post, ...)				  \
-unsigned int name(struct uart_port *port __VA_OPT__(,) __VA_ARGS__)	  \
-{									  \
+#define __uart_port_tx_helper(port, tx_ready, put_char, tx_done,	  \
+	       	for_test, for_post, ch)					  \
+({									  \
 	struct circ_buf *xmit = &port->state->xmit;			  \
 	unsigned int pending;						  \
-	u8 ch;								  \
 									  \
 	for (; (for_test) && (tx_ready); (for_post), port->icount.tx++) { \
 		if (port->x_char) {					  \
@@ -672,8 +670,15 @@ unsigned int name(struct uart_port *port __VA_OPT__(,) __VA_ARGS__)	  \
 			port->ops->stop_tx(port);			  \
 	}								  \
 									  \
-	return pending;							  \
-}
+	pending;							  \
+})
+
+#define uart_port_tx_helper_limited(port, tx_ready, put_char, tx_done, count, ch) \
+	__uart_port_tx_helper(port, tx_ready, put_char, tx_done, count, count--, ch)
+
+#define uart_port_tx_helper(port, tx_ready, put_char, ch)		  \
+	__uart_port_tx_helper(port, tx_ready, put_char, ({}), true, ({}), ch)
+
 
 /**
  * DEFINE_UART_PORT_TX_HELPER_LIMITED -- generate transmit helper for uart_port
@@ -703,9 +708,13 @@ unsigned int name(struct uart_port *port __VA_OPT__(,) __VA_ARGS__)	  \
  * For all of them, @port->lock is held, interrupts are locally disabled and
  * the expressions must not sleep.
  */
-#define DEFINE_UART_PORT_TX_HELPER_LIMITED(name, tx_ready, put_char, tx_done) \
-	__DEFINE_UART_PORT_TX_HELPER(name, tx_ready, put_char, tx_done,	      \
-			count, count--, unsigned int count)
+#define DEFINE_UART_PORT_TX_HELPER_LIMITED(name, tx_ready, put_char, tx_done)	\
+unsigned int name(struct uart_port *port, unsigned int count)			\
+{										\
+	u8 ch;									\
+	return uart_port_tx_helper_limited(port, tx_ready, put_char, tx_done,	\
+					   count, ch);				\
+}
 
 /**
  * DEFINE_UART_PORT_TX_HELPER -- generate transmit helper for uart_port
@@ -715,9 +724,12 @@ unsigned int name(struct uart_port *port __VA_OPT__(,) __VA_ARGS__)	  \
  *
  * See DEFINE_UART_PORT_TX_HELPER_LIMITED() for more details.
  */
-#define DEFINE_UART_PORT_TX_HELPER(name, tx_ready, put_char)		\
-	__DEFINE_UART_PORT_TX_HELPER(name, tx_ready, put_char, ({}),	\
-			true, ({}))
+#define DEFINE_UART_PORT_TX_HELPER(name, tx_ready, put_char, ...)	  \
+unsigned int name(struct uart_port *port __VA_OPT__(,) __VA_ARGS__)	  \
+{									  \
+	u8 ch;								  \
+	return uart_port_tx_helper(port, tx_ready, put_char, ch);	  \
+}
 
 /*
  * Baud rate helpers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
