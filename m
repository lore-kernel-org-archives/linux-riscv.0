Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B655CC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKSING3fkOOebe5NCmOo8CdEmV9L7znGKDDfU6vcV8k=; b=cOEznBrRWe3jcq
	K2BPMouqFgVseW20cKrItVMbuAWxHX6Vgr/zlVTV6iKjHCsfzxvlH72v7YkTMCznnl2TQESjZyRwW
	qEOghJb4ZQUhsKFBdciwp0zIfj2LroPtsU115daELdAQxPKnlelfXLGbm+cGmgwneQFzXd501LJEA
	+bGKVD8wmz66IeTiZIX/+hb039UAt9a/jOAhe3VvybbU5cQWBnbYtLDcPxrcrBkbm9XOmwlm7o5pz
	UZBH0vR1rzrng6zzpfbd9voxwPDwBBPJINoMtTCdNh9MtQEpDkvIUHx0NgaUAJBbRRUfU00bknyMF
	inV2yxCHL4+0cD668UsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVu9e-0065lu-Dj; Wed, 07 Sep 2022 12:27:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVu9b-0065kU-Mv
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 12:27:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 11A87618C2;
	Wed,  7 Sep 2022 12:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51819C433D6;
	Wed,  7 Sep 2022 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662553657;
	bh=MlcvCBFONM0Q3HGbf+iu5vcYE7JzglxZtv5RjeJdq+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdOVSndiMaKnKdCVU0AFeYdJlV0AWftG69PoYHflE6v3waleOO98fvvEamHA42AG+
	 YO5EOWxtmDOwY/kO3/mrzEoReruOTHgb04vtiUMQChXVb9WG+GNy6xSjEHlwTBvo0a
	 nGNHdBbsgJxCTG0eDBYk7qhnJE2ZUSJJGxhvM64E=
Date: Wed, 7 Sep 2022 14:27:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan@kernel.org>,
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
	Russell King <linux@armlinux.org.uk>,
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
Message-ID: <YxiONiDgGYp8MGQA@kroah.com>
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
 <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
 <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
 <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
 <cfd16d53-6aa0-e848-91d0-dce8ff72bb4d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfd16d53-6aa0-e848-91d0-dce8ff72bb4d@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_052739_870624_4FFD45A5 
X-CRM114-Status: GOOD (  42.75  )
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

On Wed, Sep 07, 2022 at 03:21:28PM +0300, Ilpo J=E4rvinen wrote:
> On Wed, 7 Sep 2022, Arnd Bergmann wrote:
> =

> > On Wed, Sep 7, 2022, at 12:16 PM, Ilpo J=E4rvinen wrote:
> > > On Wed, 7 Sep 2022, Jiri Slaby wrote:
> > >> On 06. 09. 22, 13:30, Johan Hovold wrote:
> > >> > On Tue, Sep 06, 2022 at 12:48:01PM +0200, Jiri Slaby wrote:
> > >> > NAK
> > >> =

> > >> I'd love to come up with something nicer. That would be a function in
> > >> serial-core calling hooks like I had [1] for example. But provided a=
ll those
> > >> CPU workarounds/thunks, it'd be quite expensive to call two function=
s per
> > >> character.
> > >> =

> > >> Or creating a static inline (having =B1 the macro content) and the h=
ooks as
> > >> parameters and hope for optimizations to eliminate thunks (also sugg=
ested in
> > >> the past [1]).
> > >> =

> > >> [1] https://lore.kernel.org/all/20220411105405.9519-1-jslaby@suse.cz/
> > >
> > > I second Jiri here.
> > >
> > > Saving lines in drivers is not that important compared with all remov=
ing =

> > > all the variants of the same thing that have crept there over the yea=
rs.
> > >
> > > I suspect the main reason for the variants is that everybody just use=
d =

> > > other drivers as examples and therefore we've a few "main" variant =

> > > branches depending on which of the drivers was used as an example for=
 the =

> > > other. That is hardly a good enough reason to keep them different and=
 as =

> > > long as each driver keeps its own function for this, it will eventual=
ly =

> > > lead to similar differentiation so e.g. a one-time band-aid similariz=
ation =

> > > would not help in the long run.
> > >
> > > Also, I don't understand why you see it unreadable when the actual co=
de is =

> > > out in the open in that macro. It's formatted much better than e.g. =

> > > read_poll_timeout() if you want an example of something that is hardl=
y =

> > > readable ;-). I agree though there's a learning-curve, albeit small, =
that =

> > > it actually creates a function but that doesn't seem to me as big of =
an =

> > > obstacle you seem to think.
> > =

> > I think it would help to replace the macro that defines
> > the function with a set of macros that can be used in
> > function bodies. This would avoid the __VA_ARGS__ stuff
> > and allow readers that are unfamiliar with tty drivers to
> > treat it as a function call.
> > =

> > So e.g. instead of =

> > =

> > static DEFINE_UART_PORT_TX_HELPER_LIMITED(altera_jtaguart_do_tx_chars,
> > 		true,
> > 		writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG),
> > 		({}));
> > =

> > the altera_jtaguart driver would contain a function like
> > =

> > static int altera_jtaguart_do_tx_chars(struct uart_port *port,
> >                                        unsigned int count)
> > {
> >        char ch;
> > =

> >        return uart_port_tx_helper_limited(port, ch, count, true,
> >                 writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG),
> >                 ({}));
> > }
> > =

> > or some variation of that. It's a few more lines, but those
> > extra lines would help me understand what is actually going on
> > while still avoiding the usual bugs and duplication.
> > =

> > If the caller of that function is itself trivial (like
> > serial21285_tx_chars), then the intermediate function can
> > be omitted in order to save some of the extra complexity.
> =

> I'd be ok with that. There's still a small startle factor associated to =

> passing that writel(...) as an argument to a "function" but it's the same =

> for other things such as read_poll_timeout() so not an end of the world.

That's going to incure the function-pointer-indirection-call for every
character that Jiri's original submission had, so I don't think this is
a very viable solution, sorry.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
