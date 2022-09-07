Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40963C38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3p3rfG4joUWzYKEjCOF+EXhvCTS4hZN+Qu5kUk0RD4=; b=PCohTyoH0W+mtH
	6S0ieBWCrckUiykN7mC9vBoUg3kbIboOxl5LuBuW4s3vSHzTt3CO5upQGuZd9J7k9oN6Ou+X3OXzL
	6tpOOFTL9dgdY7utQ67zB921warlG7mvozDAncFu8caWeCA1Oz2UOlSJ9bmNt8NgerEQ5kNrKIjBT
	XELgi6uZynONpvHVxdJIulsFrW4lRovg/HhW18IxoYOJPU7UNSUKNf4Uj6SO2aChPYl5if/K+ZywI
	D4NDuK0aZoLYyQDbGH7KHsIobVbEQZwScq4upm3WIF9uuWl5RIfYXImttYYkRkBlupyRfcLPXZlYx
	dvowvCFRIh0xabNU8wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVvXU-006fDG-3X; Wed, 07 Sep 2022 13:56:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVvXQ-006eSY-G5
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 13:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tCjY/QLdprUhf7WTcDGbAKlrnkf5jVx/ryaWR+dwtH8=; b=GIwenM/qxvktpWk+ynw5s+7XBo
	NxlXbk/3I26vSXz691UpGfggJkyclumiQG0P7Fdno0A8V7yF4hkfBMtSUnBbxCPcYkGhNrglx6VW4
	JDP+fLL5bd5kZeEYw+zdzq3y1/WNg/rc7HnpKTnPujcHh8uHZ2r9lEZqWJPrDHL1+sS0qJZgQ5K+G
	T5C2pNlLsN5ZnYOdW6+0TMdZC8P7Fg/OeWpOKRNxCEe+1GaQx3u7bDJG5f/y1uFUg9cV5W5/lzXJr
	6Akgtj4N4giZsUhXhvbZeVVTqiq1ffu7wgn+/4CrODR6B1ZJRbpA5YuPKLhoSD2km2JlW4nG2smfQ
	Rb/slnaA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34176)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oVvUM-0005SY-QH; Wed, 07 Sep 2022 14:53:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oVvU9-00019I-RD; Wed, 07 Sep 2022 14:52:57 +0100
Date: Wed, 7 Sep 2022 14:52:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Tobias Klauser <tklauser@distanz.ch>,
	Richard Genoud <richard.genoud@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Kevin Cernekee <cernekee@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
Message-ID: <YxiiOWQxGCUz9ktF@shell.armlinux.org.uk>
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
 <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
 <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
 <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
 <cfd16d53-6aa0-e848-91d0-dce8ff72bb4d@linux.intel.com>
 <YxiONiDgGYp8MGQA@kroah.com>
 <c66f9c98-dcef-27c-d74a-ea826f6a799@linux.intel.com>
 <YxiQVTN/jX8AfO4L@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxiQVTN/jX8AfO4L@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_065620_717762_508E17CF 
X-CRM114-Status: GOOD (  49.58  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 07, 2022 at 02:36:37PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 07, 2022 at 03:32:44PM +0300, Ilpo J=E4rvinen wrote:
> > On Wed, 7 Sep 2022, Greg Kroah-Hartman wrote:
> > =

> > > On Wed, Sep 07, 2022 at 03:21:28PM +0300, Ilpo J=E4rvinen wrote:
> > > > On Wed, 7 Sep 2022, Arnd Bergmann wrote:
> > > > =

> > > > > On Wed, Sep 7, 2022, at 12:16 PM, Ilpo J=E4rvinen wrote:
> > > > > > On Wed, 7 Sep 2022, Jiri Slaby wrote:
> > > > > >> On 06. 09. 22, 13:30, Johan Hovold wrote:
> > > > > >> > On Tue, Sep 06, 2022 at 12:48:01PM +0200, Jiri Slaby wrote:
> > > > > >> > NAK
> > > > > >> =

> > > > > >> I'd love to come up with something nicer. That would be a func=
tion in
> > > > > >> serial-core calling hooks like I had [1] for example. But prov=
ided all those
> > > > > >> CPU workarounds/thunks, it'd be quite expensive to call two fu=
nctions per
> > > > > >> character.
> > > > > >> =

> > > > > >> Or creating a static inline (having =B1 the macro content) and=
 the hooks as
> > > > > >> parameters and hope for optimizations to eliminate thunks (als=
o suggested in
> > > > > >> the past [1]).
> > > > > >> =

> > > > > >> [1] https://lore.kernel.org/all/20220411105405.9519-1-jslaby@s=
use.cz/
> > > > > >
> > > > > > I second Jiri here.
> > > > > >
> > > > > > Saving lines in drivers is not that important compared with all=
 removing =

> > > > > > all the variants of the same thing that have crept there over t=
he years.
> > > > > >
> > > > > > I suspect the main reason for the variants is that everybody ju=
st used =

> > > > > > other drivers as examples and therefore we've a few "main" vari=
ant =

> > > > > > branches depending on which of the drivers was used as an examp=
le for the =

> > > > > > other. That is hardly a good enough reason to keep them differe=
nt and as =

> > > > > > long as each driver keeps its own function for this, it will ev=
entually =

> > > > > > lead to similar differentiation so e.g. a one-time band-aid sim=
ilarization =

> > > > > > would not help in the long run.
> > > > > >
> > > > > > Also, I don't understand why you see it unreadable when the act=
ual code is =

> > > > > > out in the open in that macro. It's formatted much better than =
e.g. =

> > > > > > read_poll_timeout() if you want an example of something that is=
 hardly =

> > > > > > readable ;-). I agree though there's a learning-curve, albeit s=
mall, that =

> > > > > > it actually creates a function but that doesn't seem to me as b=
ig of an =

> > > > > > obstacle you seem to think.
> > > > > =

> > > > > I think it would help to replace the macro that defines
> > > > > the function with a set of macros that can be used in
> > > > > function bodies. This would avoid the __VA_ARGS__ stuff
> > > > > and allow readers that are unfamiliar with tty drivers to
> > > > > treat it as a function call.
> > > > > =

> > > > > So e.g. instead of =

> > > > > =

> > > > > static DEFINE_UART_PORT_TX_HELPER_LIMITED(altera_jtaguart_do_tx_c=
hars,
> > > > > 		true,
> > > > > 		writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG),
> > > > > 		({}));
> > > > > =

> > > > > the altera_jtaguart driver would contain a function like
> > > > > =

> > > > > static int altera_jtaguart_do_tx_chars(struct uart_port *port,
> > > > >                                        unsigned int count)
> > > > > {
> > > > >        char ch;
> > > > > =

> > > > >        return uart_port_tx_helper_limited(port, ch, count, true,
> > > > >                 writel(ch, port->membase + ALTERA_JTAGUART_DATA_R=
EG),
> > > > >                 ({}));
> > > > > }
> > > > > =

> > > > > or some variation of that. It's a few more lines, but those
> > > > > extra lines would help me understand what is actually going on
> > > > > while still avoiding the usual bugs and duplication.
> > > > > =

> > > > > If the caller of that function is itself trivial (like
> > > > > serial21285_tx_chars), then the intermediate function can
> > > > > be omitted in order to save some of the extra complexity.
> > > > =

> > > > I'd be ok with that. There's still a small startle factor associate=
d to =

> > > > passing that writel(...) as an argument to a "function" but it's th=
e same =

> > > > for other things such as read_poll_timeout() so not an end of the w=
orld.
> > > =

> > > That's going to incure the function-pointer-indirection-call for every
> > > character that Jiri's original submission had, so I don't think this =
is
> > > a very viable solution, sorry.
> > =

> > I don't think you got what Arnd meant. It must still be technically a =

> > #define because you cannot pass
> > 	writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG)
> > as an argument to a real function like he did in the example above.
> > It's similar to how read_poll_timeout() and friends are #defines despit=
e =

> > being lowercased.
> =

> Ok, no, I don't understand what Arnd meant here then :(

Arnd's opening sentence when proposing the new thing was:

"I think it would help to replace the macro that defines
the function with a set of macros that can be used in
function bodies."

Given "a set of macros" and the quoted example, I take
"uart_port_tx_helper_limited" to be one of those macros - it has to be
a macro because - as others have pointed out - you can't pass
"writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG)" to a function.

Of course, it would have been nicer to see the definition of this
macro, because then we can understand what the "ch" argument is to
this macro, and how that relates to the macro argument that is
shown in the example as a writel().

Maybe a more complete example would help clear up the confusion?
Arnd?

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
