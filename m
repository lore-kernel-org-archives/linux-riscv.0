Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E8CC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFMiBYrb6XROlUwmCc+ZsM1rB8A5WDVQJcgAlryH/ZI=; b=vlaM8YdoRxzcDN
	JvFMXrB9w2BtO9oCS4yMJX1vVvB729SmIouwMf10NTr9cYd3NW7fPEFuzjMAc6R+onj7//Hc9EwJA
	l+4WV5UbJD5uzSfIO2LeOF8vo8OmrUdZKqPEO74cid1a1Ybr1yfRfMoCbZorEE7lqjUQC3hdnbQ/H
	hASNdxQBjltwYhCFHjX+jY16TDsVJn6+OSNpPvCovD7TIPReIq6ZONfG95I2OAixdSKYI94LecZ/z
	PPV5+22TYOyEdZ40GuRf9ckhaPxL+z/wd9YBGjWfIiuNNN/iYSylLkzj6CPO31vgkfMKme2JxNu7f
	v+X8fFC5595DdaYDq8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaQZ-0000000F5rk-2WUz;
	Mon, 27 May 2024 13:30:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaQX-0000000F5qD-06dm
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 13:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gaotFr9Z3qhj+JKsAg1inJzMtusA7qZ6jQmUAEHIia4=; b=cirjdWAIYaq+0jwGFEqDYqDnfy
	QAK1s0Vqmyf4wwn38WG/QltTYuX6Bse9wkkpj2GLCEhfD+QV7VYyE5KjJSJSKpxtSHv+uJlt6+EmR
	QK5UvYTClcMBaEmf/Js1VzcmKXIuUHP73aNRsOiQszbikKKLL92AJZCao8abKZl76o9qxj0oqNqL+
	tbySwWOQnbA66/XtuEuWxRH7atcz1nzKjwm5YUKMIw/6YVOtG9Yze9577aiOxRGyhKeU+FD8GRQp5
	PRaP6UvLFY81CKdtGTr7uNfhdUttJOea54yLzuO4pyVed0WXDNsjiWPP01dsfAQwtmMZE74wLWE11
	ysTlNN6Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33938)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sBaQI-0003Zm-18;
	Mon, 27 May 2024 14:29:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sBaQK-0002ME-KF; Mon, 27 May 2024 14:30:00 +0100
Date: Mon, 27 May 2024 14:30:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ron Economos <re@w6rz.net>
Cc: Guenter Roeck <linux@roeck-us.net>, regressions@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] clkdev: report over-sized strings when creating clkdev
Message-ID: <ZlSK2CcbLaWFRpnR@shell.armlinux.org.uk>
References: <28114882-f8d7-21bf-4536-a186e8d7a22a@w6rz.net>
 <ZlSIH1/etwPQe+bQ@shell.armlinux.org.uk>
 <ZlSJkCtx6eYPCQwG@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlSJkCtx6eYPCQwG@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_063013_101119_10BD1B57 
X-CRM114-Status: GOOD (  39.25  )
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

On Mon, May 27, 2024 at 02:24:32PM +0100, Russell King (Oracle) wrote:
> On Mon, May 27, 2024 at 02:18:23PM +0100, Russell King (Oracle) wrote:
> > On Mon, May 27, 2024 at 03:45:15AM -0700, Ron Economos wrote:
> > > On Fri, May 17, 2024 at 03:09:14PM -0700, Guenter Roeck wrote:
> > > > Hi,
> > > >
> > > > On Fri, Mar 15, 2024 at 11:47:55AM +0000, Russell King (Oracle) wro=
te:
> > > > > Report an error when an attempt to register a clkdev entry result=
s in a
> > > > > truncated string so the problem can be easily spotted.
> > > > >
> > > > > Reported by: Duanqiang Wen <duanqiangwen@net-swift.com>
> > > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > > >
> > > > With this patch in the mainline kernel, I get
> > > >
> > > > 10000000.clock-controller:corepll: device ID is greater than 24
> > > > sifive-clk-prci 10000000.clock-controller: Failed to register clkde=
v for
> > > corepll: -12
> > > > sifive-clk-prci 10000000.clock-controller: could not register clock=
s: -12
> > > > sifive-clk-prci 10000000.clock-controller: probe with driver
> > > sifive-clk-prci failed with error -12
> > > > ...
> > > > platform 10060000.gpio: deferred probe pending: platform: supplier
> > > 10000000.clock-controller not ready
> > > > platform 10010000.serial: deferred probe pending: platform: supplier
> > > 10000000.clock-controller not ready
> > > > platform 10011000.serial: deferred probe pending: platform: supplier
> > > 10000000.clock-controller not ready
> > > > platform 10040000.spi: deferred probe pending: platform: supplier
> > > 10000000.clock-controller not ready
> > > > platform 10050000.spi: deferred probe pending: platform: supplier
> > > 10000000.clock-controller not ready
> > > > platform 10090000.ethernet: deferred probe pending: platform: suppl=
ier
> > > 10000000.clock-controller not ready
> > > >
> > > > when trying to boot sifive_u in qemu.
> > > >
> > > > Apparently, "10000000.clock-controller" is too long. Any suggestion=
 on
> > > > how to solve the problem ? I guess using dev_name(dev) as dev_id pa=
rameter
> > > > for clk_hw_register_clkdev() is not or no longer a good idea.
> > > > What else should be used instead ?
> > > =

> > > This issue causes a complete boot failure on real hardware (SiFive
> > > Unmatched). The boot only gets as far as "Starting kernel ..." with n=
o other
> > > indication of what's going on.
> > > =

> > > Guenter's suggested patch solves the issue.
> > > =

> > > diff --git a/drivers/clk/sifive/sifive-prci.c
> > > b/drivers/clk/sifive/sifive-prci.c
> > > index 25b8e1a80ddc..20cc8f42d9eb 100644
> > > --- a/drivers/clk/sifive/sifive-prci.c
> > > +++ b/drivers/clk/sifive/sifive-prci.c
> > > @@ -537,7 +537,7 @@ static int __prci_register_clocks(struct device *=
dev,
> > > struct __prci_data *pd,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 return r;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > =

> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r =3D clk_hw_register_clk=
dev(&pic->hw, pic->name,
> > > dev_name(dev));
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r =3D clk_hw_register_clk=
dev(&pic->hw, pic->name, "prci");
> > =

> > How about just changing this to:
> > =

> > 		r =3D clk_hw_register(dev, &pic->hw);
> > =

> > ?
> > =

> > Since, if the device name is over-sized and thus truncated in the clk
> > lookup array that clkdev maintains, *nothing* will be able to match
> > the entry. Hence, I suspect all those clkdev registrations are
> > completely redundant for this driver (and do nothing other than
> > waste memory!)
> =

> Note that I mentioned *exactly* this point in my first reply to the
> report of the regression in:
> =

> https://lore.kernel.org/r/ZkfYqj+OcAxd9O2t@shell.armlinux.org.uk
> =

> "We need to think about (a) whether your use of clk_hw_register_clkdev()
> is still appropriate, and (b) whether we need to increase the size of
> the strings."

Note this will be my last reply on this today - it's Bank Holiday Monday
in the UK and I have the right to take this time off from working on the
kernel.

Thanks.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
