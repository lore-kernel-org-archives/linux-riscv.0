Return-Path: <SRS0=9Vsv=PZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC20C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Jan 2019 07:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBEF820657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Jan 2019 07:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UDkFFzb8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBEF820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8LJm+oslxoBsYfw9UBparX8YwEbf4/4eKo4WBAI0C0=; b=UDkFFzb8pd1dMY
	5XG/Xf42GBk6inbXdpxCV7HW6o4nAVTi+ogJoWaRJb9kkaRKLK0lCP2jc5EcjC3CVEYTKePckAY8o
	XO5iB3OR+Kq8lgyxpsolMI7qzKz54nlCFiUdLZAwBnwzSgNnl4oKtQnb64GufSgPPfCZb+Pv2HE+l
	rkLjydEt+RmgK4EK7bYhL6SbdONMu36fFvnLsFmUsrq6yP+uOkYlkXrn1ZMy+KpGu7lXsyiwwcnlr
	Cg6xfFKKtYq1ZIDV/+ttDgsm/zFRzTwSamHrRmvStptWH2GEJrRH25xXesDopm5poolEvbcHdx7+A
	iBILyrea+TT5sS5Bwr6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk26g-0007BU-7D; Thu, 17 Jan 2019 07:28:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk26d-0007AE-42
 for linux-riscv@lists.infradead.org; Thu, 17 Jan 2019 07:28:52 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gk26V-0001mp-1v; Thu, 17 Jan 2019 08:28:43 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gk26T-00031b-VX; Thu, 17 Jan 2019 08:28:41 +0100
Date: Thu, 17 Jan 2019 08:28:41 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190117072841.e57tilkbrtnifss4@pengutronix.de>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
 <20190115220046.etgbno6ymsux75dk@pengutronix.de>
 <CAJ2_jOEuU_=bpbVmdsq7FFEKEm_wHza-h7Hu8QmZ3BgsGgi-ng@mail.gmail.com>
 <20190116164640.mi3zjbhbhc6k5v7p@pengutronix.de>
 <CAJ2_jOEuE1Y8G3xnYqa+aA9GSRGmN8xN7fh4nBs0_Yb68Br9bg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ2_jOEuE1Y8G3xnYqa+aA9GSRGmN8xN7fh4nBs0_Yb68Br9bg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_232851_329016_5C825523 
X-CRM114-Status: GOOD (  29.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On Thu, Jan 17, 2019 at 12:15:38PM +0530, Yash Shah wrote:
> On Wed, Jan 16, 2019 at 10:16 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > On Wed, Jan 16, 2019 at 04:40:42PM +0530, Yash Shah wrote:
> > > On Wed, Jan 16, 2019 at 3:30 AM Uwe Kleine-K=F6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > On Fri, Jan 11, 2019 at 01:52:44PM +0530, Yash Shah wrote:
> > > > > Adds a PWM driver for PWM chip present in SiFive's HiFive Unleash=
ed SoC.
> > > > >
> > > > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > > > [Atish: Various fixes and code cleanup]
> > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > > > ---
> > > > >  drivers/pwm/Kconfig      |  10 ++
> > > > >  drivers/pwm/Makefile     |   1 +
> > > > >  drivers/pwm/pwm-sifive.c | 246 +++++++++++++++++++++++++++++++++=
++++++++++++++
> > > > >  3 files changed, 257 insertions(+)
> > > > >  create mode 100644 drivers/pwm/pwm-sifive.c
> > > > >
> > > > > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > > > > index a8f47df..3bcaf6a 100644
> > > > > --- a/drivers/pwm/Kconfig
> > > > > +++ b/drivers/pwm/Kconfig
> > > > > @@ -380,6 +380,16 @@ config PWM_SAMSUNG
> > > > >         To compile this driver as a module, choose M here: the mo=
dule
> > > > >         will be called pwm-samsung.
> > > > >
> > > > > +config PWM_SIFIVE
> > > > > +     tristate "SiFive PWM support"
> > > > > +     depends on OF
> > > > > +     depends on COMMON_CLK
> > > >
> > > > I'd say add:
> > > >
> > > >         depends on MACH_SIFIVE || COMPILE_TEST
> > > >
> > > > (I guess "MACH_SIFIVE" is wrong, but I assume you get what I mean.)
> > >
> > > As of now, MACH_SIFIVE/ARCH_SIFIVE isn't available.
> > > @Paul, Do you have any comments on this?
> >
> > If this is not going to be available at least protect it by
> >
> >         depends RISCV || COMPILE_TEST
> >
> > > > I wonder if such an instance should be only a single PWM instead of
> > > > four. Then you were more flexible with the period lengths (using
> > > > pwmcfg.pwmzerocmp) and could do stuff like inverted and uninverted =
mode.
> > > >
> > > > I didn't understand how the deglitch logic works yet. Currently it =
is
> > > > not used which might result in four edges in a single period (which=
 is
> > > > bad).
> > >
> > > I can enable deglitch logic by just setting a bit (BIT_PWM_DEGLITCH) =
in
> > > REG_PWMCFG. Will do that.
> >
> > This only works for the first pwm output though.

I mixed this up with pwmzerocmp; deglitch should work on all four
outputs.

> > > > > +struct sifive_pwm_device {
> > > > > +     struct pwm_chip chip;
> > > > > +     struct notifier_block notifier;
> > > > > +     struct clk *clk;
> > > > > +     void __iomem *regs;
> > > > > +     unsigned int approx_period;
> >
> > When thinking about this a bit more, I think the better approach would
> > be to let the consumer change the period iff there is only one consumer.
> > Then you can drop that approx-period stuff and the result is more
> > flexible. (Having said that I still prefer making the driver provide
> > only a single PWM with the ability to have periods other than powers of
> > two.)
> >
> =

> I am not confident about the implementation of the way you are suggesting.
> As of now, I am going to stick with the current implementation.

The idea is to count the users using the .request and .free callbacks.
Iff there is exactly one, allow changes to period.

But please consider moving to an abstraction that only provides a single
pwm instead.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
