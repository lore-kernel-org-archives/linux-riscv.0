Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2138C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41XuMGP4W2x/8BkqnUdg0btd4UBsV4N66D6CIEDjk1Q=; b=lO+AGcchbQp8wAxcC0czmR7SCq
	h1sZUrAUk2iBFHRgybm74QOk0Uiekr0YEnn9Vla2kYteFm+IochRe4M+OnM0SI8LGAFljzSFh2O1n
	AT19ufUVGO87tpJ2ScQz9M+CIKy/d1DhDtMy2wozW1m2ChTt3zQPwFBQhiIWsKvPcl39hLpKJ1Ml4
	Xje9KfU5vm+m/1PiygoujNwwmJa0MW8zcr3IZsClMyuhiO844zeijN2unVMwjjQcRXynrS/cvMvYJ
	DXX+uKlDcm36tBqtkqc1/wLGbLgmherZtvmzeuUe3P/ozynN6saTYqOJx5UhZwx7KmIafr1aFXD5m
	hyLuNWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVu3t-0063gX-JH; Wed, 07 Sep 2022 12:21:45 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVu3q-0063eV-Hu
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 12:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662553302; x=1694089302;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=i5as+3xhYVCZyfsyjas1dxePnfSBwW/4rUe+OF92EJg=;
  b=ICd76LC06FBuiSMR/pU3r6SZgsncFQtlMgHkien4L61fp6ZsC+EmtKqo
   8lCjRgUXoe6+MMikXkF5vmzLd2r0Ctcoy5sa9oeyncdsSIyUchcfzF0V7
   cDHLSx5LYA4Bqn7eQbZX5yb5OULplu/7PV4yYJHjv42JKyYdBDvnKdhie
   hZ297hq4N9TpQukLGF9KvoYAq6iXifYmfR8W+96EphDVqepcrzGLh/KSR
   noIjlwBPzFENB1tyZZd47b9n7V/l4uh6W8H8g/+sayfRcJzZ4vhBfvVM5
   Y9A15CvVYvlyIw2Ax/PgCNVanl7wvZmdqolgC32XHx3/eX5izuRjLFL6v
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="298172200"
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="298172200"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 05:21:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="644594732"
Received: from dmatouse-mobl.ger.corp.intel.com ([10.251.223.53])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 05:21:30 -0700
Date: Wed, 7 Sep 2022 15:21:28 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
cc: Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, Tobias Klauser <tklauser@distanz.ch>, 
    Richard Genoud <richard.genoud@gmail.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@microchip.com>, 
    Vladimir Zapolskiy <vz@mleia.com>, Liviu Dudau <liviu.dudau@arm.com>, 
    Sudeep Holla <sudeep.holla@arm.com>, 
    Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
    =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Florian Fainelli <f.fainelli@gmail.com>, 
    bcm-kernel-feedback-list@broadcom.com, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Kevin Cernekee <cernekee@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
    Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
In-Reply-To: <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
Message-ID: <cfd16d53-6aa0-e848-91d0-dce8ff72bb4d@linux.intel.com>
References: <20220906104805.23211-1-jslaby@suse.cz> <Yxcvbk281f/vy4vb@hovoldconsulting.com> <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org> <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com> <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1356709510-1662553299=:1717"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_052142_659027_AB75E3A8 
X-CRM114-Status: GOOD (  37.82  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1356709510-1662553299=:1717
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Sep 2022, Arnd Bergmann wrote:

> On Wed, Sep 7, 2022, at 12:16 PM, Ilpo Järvinen wrote:
> > On Wed, 7 Sep 2022, Jiri Slaby wrote:
> >> On 06. 09. 22, 13:30, Johan Hovold wrote:
> >> > On Tue, Sep 06, 2022 at 12:48:01PM +0200, Jiri Slaby wrote:
> >> > NAK
> >> 
> >> I'd love to come up with something nicer. That would be a function in
> >> serial-core calling hooks like I had [1] for example. But provided all those
> >> CPU workarounds/thunks, it'd be quite expensive to call two functions per
> >> character.
> >> 
> >> Or creating a static inline (having ± the macro content) and the hooks as
> >> parameters and hope for optimizations to eliminate thunks (also suggested in
> >> the past [1]).
> >> 
> >> [1] https://lore.kernel.org/all/20220411105405.9519-1-jslaby@suse.cz/
> >
> > I second Jiri here.
> >
> > Saving lines in drivers is not that important compared with all removing 
> > all the variants of the same thing that have crept there over the years.
> >
> > I suspect the main reason for the variants is that everybody just used 
> > other drivers as examples and therefore we've a few "main" variant 
> > branches depending on which of the drivers was used as an example for the 
> > other. That is hardly a good enough reason to keep them different and as 
> > long as each driver keeps its own function for this, it will eventually 
> > lead to similar differentiation so e.g. a one-time band-aid similarization 
> > would not help in the long run.
> >
> > Also, I don't understand why you see it unreadable when the actual code is 
> > out in the open in that macro. It's formatted much better than e.g. 
> > read_poll_timeout() if you want an example of something that is hardly 
> > readable ;-). I agree though there's a learning-curve, albeit small, that 
> > it actually creates a function but that doesn't seem to me as big of an 
> > obstacle you seem to think.
> 
> I think it would help to replace the macro that defines
> the function with a set of macros that can be used in
> function bodies. This would avoid the __VA_ARGS__ stuff
> and allow readers that are unfamiliar with tty drivers to
> treat it as a function call.
> 
> So e.g. instead of 
> 
> static DEFINE_UART_PORT_TX_HELPER_LIMITED(altera_jtaguart_do_tx_chars,
> 		true,
> 		writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG),
> 		({}));
> 
> the altera_jtaguart driver would contain a function like
> 
> static int altera_jtaguart_do_tx_chars(struct uart_port *port,
>                                        unsigned int count)
> {
>        char ch;
> 
>        return uart_port_tx_helper_limited(port, ch, count, true,
>                 writel(ch, port->membase + ALTERA_JTAGUART_DATA_REG),
>                 ({}));
> }
> 
> or some variation of that. It's a few more lines, but those
> extra lines would help me understand what is actually going on
> while still avoiding the usual bugs and duplication.
> 
> If the caller of that function is itself trivial (like
> serial21285_tx_chars), then the intermediate function can
> be omitted in order to save some of the extra complexity.

I'd be ok with that. There's still a small startle factor associated to 
passing that writel(...) as an argument to a "function" but it's the same 
for other things such as read_poll_timeout() so not an end of the world.

-- 
 i.

--8323329-1356709510-1662553299=:1717
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1356709510-1662553299=:1717--

