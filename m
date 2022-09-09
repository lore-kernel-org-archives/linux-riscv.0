Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F23ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wjAqdpey+p9SwulQj5XzLYJiw/G9/UlWwW51PQBNo8=; b=dG6lsexiabr3uf
	2rPXELJmWyubA6deIk86Jq6zkFVLapzBF9RuubWRPD5b+XB2WNizFW+D9ksUd199GqknstLhynRGm
	ugpqiuQiCRXsnBMMelvq74+Yx4zdz9+/e+3tKRgVBVQ+b+Ox6K4IykcwUkv++8sFQoQaRCk/pEtOQ
	I9WwXXvV2Qgs4h9vCWkz3Li00dsCJtLjwKhDQltPaqrafsK/wuKF+mTk54ApAAw7iNosWcq5v0d8P
	tdcgFqjVueat90uEXm7Mf6Xq2lAliyHRh5IlaDshhw6WbJHzAwKOuww21DPbzEHXA/BcDEIl0FBXi
	DEmlAKq72Bvgr4gnMuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWbqG-00FbdG-Gk; Fri, 09 Sep 2022 11:06:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWbpq-00FbId-1k
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 11:06:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1222A61D04;
	Fri,  9 Sep 2022 11:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFB4C433C1;
	Fri,  9 Sep 2022 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662721568;
	bh=3NEzg2EVTYL6D0L+bzYSw8gVTESohGyL9ED7X39zx8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HU5k6uR8qPVfMuxjpDGRdI+N9D1yMcepeX2HGegy4PMObnPCDRR8K5GtT7OuQmMAs
	 vXwFDf3X12zECHtFKyXBvTi9vyydPUy0yn5eZNJhWXeZSzKGqpZd5lUfzZBY8q4+kL
	 XzO/DAiVs1Vpku7HoApKQqDZ6NEUe1+9QqfgoffM=
Date: Fri, 9 Sep 2022 13:06:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Message-ID: <YxseGPHVkSVdDnrh@kroah.com>
References: <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
 <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
 <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
 <cfd16d53-6aa0-e848-91d0-dce8ff72bb4d@linux.intel.com>
 <YxiONiDgGYp8MGQA@kroah.com>
 <c66f9c98-dcef-27c-d74a-ea826f6a799@linux.intel.com>
 <YxiQVTN/jX8AfO4L@kroah.com>
 <YxiiOWQxGCUz9ktF@shell.armlinux.org.uk>
 <2197faa3-0217-41e0-8ff0-b5396561c623@www.fastmail.com>
 <5feff23c-9458-616c-66ce-13cca5829162@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5feff23c-9458-616c-66ce-13cca5829162@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_040610_520226_26AFE005 
X-CRM114-Status: GOOD (  29.16  )
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

On Fri, Sep 09, 2022 at 12:53:04PM +0200, Jiri Slaby wrote:
> On 07. 09. 22, 16:56, Arnd Bergmann wrote:
> > On Wed, Sep 7, 2022, at 3:52 PM, Russell King (Oracle) wrote:
> > > On Wed, Sep 07, 2022 at 02:36:37PM +0200, Greg Kroah-Hartman wrote:
> > > 
> > > Of course, it would have been nicer to see the definition of this
> > > macro, because then we can understand what the "ch" argument is to
> > > this macro, and how that relates to the macro argument that is
> > > shown in the example as a writel().
> > 
> > I pulled out the 'ch' variable from the macro to avoid having
> > the macro define local variables that are then passed to the
> > inner expressions.
> 
> Note that I had "port" and "ch" as a part of the macro parameters in [v2],
> but it didn't help the situation much.
> > > Maybe a more complete example would help clear up the confusion?
> > > Arnd?
> > 
> > Here is a patch on top of the series that would implement the
> > uart_port_tx_helper_limited() and uart_port_tx_helper()
> > macros that can be used directly from drivers in place of defining
> > local functions, with the (alphabetically) first two drivers
> > converted to that.
> 
> If there are no objections, I will push the patches this directorin. I like
> this more than [v2] or [v3] (the helper macros). Actually, I mentioned this
> wait_event() style in [v1], but I perhaps simplified the concept too much to
> completely eliminate the need of a wrapper function. And that made it too
> complicated/too hard to understand.
> 
> Except I'd drop the "_helper" part from the name. Originally (in [v1]), I
> had uart_port_tx() and uart_port_tx_limited() functions. In [v2+v3], I added
> _helper to avoid confusion as we were generating a helpers using the macros.
> Yes, technically, uart_port_tx() is still a helper, but I think it's
> superfluous to have it in the name now.

No objection from me, thanks for doing this work!

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
