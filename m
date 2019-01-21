Return-Path: <SRS0=UFm3=P5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39065C2F421
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 15:11:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF8820823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 15:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9YUkHj0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF8820823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VicL1dx31TI/Y1fI372vW6CfDMBI4N4eWchC8tA7L24=; b=i9YUkHj0irEFCw
	d3johwbPkW6AsY+WSvNeE2zy7bbhgIf0D+cJ5WYA2eorqk7UrJbbQ5URpZ/oWTtRUvhDRlvGHwCEd
	YczX1oiY5ByEzw1z0vehFV3cpo7LZzbjm06mgZkP5yan9MkLuwYO1H/DfxxEMW6dhXeWcv+h23l5r
	8WB9yVr6SNDtHQekuXruDxBJlO1kgGIcPaiD+hskL6lqckthiu1LWIMk8KYOhRgxkZ6jo0PDMcI+X
	XY9nucOoBtqxtS4jbj+JEtk3oSr43nPILSPjrIKBzl1jnsTSTWyUXDVJilus0pJFKMrPHWmHNNBwd
	ZY/tbRZpc5aDTClX7WcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glbEE-0003L8-Lq; Mon, 21 Jan 2019 15:11:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glbEB-0003KE-GM
 for linux-riscv@lists.infradead.org; Mon, 21 Jan 2019 15:11:09 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1glbE9-0002GD-2R; Mon, 21 Jan 2019 16:11:05 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1glbE7-0006A3-W5; Mon, 21 Jan 2019 16:11:03 +0100
Date: Mon, 21 Jan 2019 16:11:03 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190121151103.vdwkgte4a5ybyrid@pengutronix.de>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
 <20190115220046.etgbno6ymsux75dk@pengutronix.de>
 <CAJ2_jOEuU_=bpbVmdsq7FFEKEm_wHza-h7Hu8QmZ3BgsGgi-ng@mail.gmail.com>
 <20190116164640.mi3zjbhbhc6k5v7p@pengutronix.de>
 <alpine.DEB.2.21.9999.1901160909540.19681@viisi.sifive.com>
 <20190116172849.h5qdfa5wc3vaprbn@pengutronix.de>
 <alpine.DEB.2.21.9999.1901161015400.19681@viisi.sifive.com>
 <20190117081956.hpj4ewdihpwuoonz@pengutronix.de>
 <20190121115455.GJ16756@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190121115455.GJ16756@ulmo>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_071107_742204_EF3EE266 
X-CRM114-Status: GOOD (  44.55  )
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
 Sachin Ghadi <sachin.ghadi@sifive.com>, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, kernel@pengutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Thierry,

On Mon, Jan 21, 2019 at 12:54:55PM +0100, Thierry Reding wrote:
> On Thu, Jan 17, 2019 at 09:19:56AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Jan 16, 2019 at 11:29:35AM -0800, Paul Walmsley wrote:
> > > COMPILE_TEST made slightly more sense before the broad availability o=
f =

> > > open-source soft cores, SoC integration, and IP; and before powerful, =

> > > inexpensive FPGAs and SoCs with FPGA fabrics were common.
> > > =

> > > Even back then, COMPILE_TEST was starting to look questionable.  IP b=
locks =

> > > from CPU- and SoC vendor-independent libraries, like DesignWare and t=
he =

> > > Cadence IP libraries, were integrated on SoCs across varying CPU =

> > > architectures.  (Fortunately, looking at the tree, subsystem maintain=
ers =

> > > with DesignWare drivers seem to have largely avoided adding architect=
ure =

> > > or SoC-specific Kconfig restrictions there - and thus have also avoid=
ed =

> > > the need for COMPILE_TEST.)  If an unnecessary architecture Kconfig =

> > > dependency was added for a leaf driver, that Kconfig line would eithe=
r =

> > > need to be patched out by hand, or if present, COMPILE_TEST would nee=
d to =

> > > be enabled.
> > > =

> > > This was less of a problem then.  There were very few FPGA Linux user=
s, =

> > > and they were mostly working on internal proprietary projects. FPGAs =
that =

> > > could run Linux at a reasonable speed, including MMUs and FPUs, were =

> > > expensive or were missing good tool support.  So most FPGA Linux =

> > > development was restricted to ASIC vendors - the Samsungs, Qualcomms, =

> > > NVIDIAs of the world - for prototyping, and those FPGA platforms neve=
r =

> > > made it outside those companies.
> > > =

> > > The situation is different now.  The major FPGA vendors have inexpens=
ive =

> > > FPGA SoCs with full-featured CPU hard macros.  The development boards=
 can =

> > > be quite affordable (< USD 300 for the Xilinx Ultra96).  There are al=
so =

> > > now open-source SoC HDL implementations - including MMUs, FPUs, and =

> > > peripherals like PWM and UART - for the conventional FPGA market.  Th=
ese =

> > > can run at mid-1990's clock rates - slow by modern standards but stil=
l =

> > > quite usable.
> > =

> > In my eyes it's better to make a driver not possible to enable out of
> > the box than offering to enable it while it most probably won't be used.
> =

> This might sound like a good idea in general, but it's also something
> that is pretty much impossible to do. There's just no heuristic that
> would allow you to determine with a sufficient degree of probability
> that a driver won't be needed. Most of the PCI drivers that are
> installed on my workstation aren't used, and I would venture to say
> there are a lot of drivers that aren't used in, say, 95% of
> installations. That doesn't mean that we should somehow make these
> drivers difficult to install, or require someone to patch the kernel
> to build them.

If there is a PCI card that can be plugged into your machine, the
corresponding driver should be selectable for the matching kernel.

The case here is different though. We're talking about a piece of
hardware that up to now only exists in a riscv machine (IIUC). Yes, I'm
aware that the design is publicly available, still I think this driver
should not be available for a person configuring a kernel for their x86
machine. When you (or someone else) comes around claiming that they have
a real use for this driver on a non-riscv architecture I support
expanding the dependency accordingly.

What I want to make aware of is that being able to enable a driver comes
at a (small) cost. Using a too broad dependency is quite usual because
the person who introduces a given symbol usually doesn't have to think
long if it should be enabled for a given kernel config or not; so it's
"only" other people's time that is wasted.

> > People who configure their own kernel and distribution kernel
> > maintainers will thank you. (Well ok, they won't notice, so they won't
> > actually tell you, but anyhow.) I'm a member of the Debian kernel team
> > and I see how many config items there are that are not explicitly
> > handled for the various different kernel images. If they were restricted
> > using COMPILE_TEST to just be possible to enable on machines where it is
> > known (or at least likely) to make sense that would help. Also when I do
> > a kernel version bump for a machine with a tailored kernel running (say)
> > on an ARM/i.MX SoC, I could more easily be careful about the relevant
> > changes when doing oldconfig if I were not asked about a whole bunch of
> > drivers that are sure to be irrelevant.
> =

> I think the important thing here is that the driver is "default n". If
> you're a developer and build your own kernels, you're pretty likely to
> know already if a new kernel that you're installing contains that new
> driver that you've been working on or waiting for.

If you are a developer waiting for your driver you also would not miss
it because it was only selectable for riscv but you're the first who
synthesized it for an arm machine. So there is only little damage.

> In that case you can easily just enable it manually rather than go
> through make oldconfig and wait for it to show up.
> =

> As for distribution kernel maintainers, are they really still building a
> lot of different kernels?

In the Debian kernel there are as of now 39 kernel images. Some of them
only differ by stuff that is irrelevant for driver selection (like rt).
But apart from these there is still mostly only a single image available
for a given machine because multi-platform efforts are not good enough
to allow cross-architecture kernels. Or kernels that can handle both big
and little endian.

> If so, it sounds like most of the multi-platform efforts have been in
> vain. I would imagine that if, as a distribution kernel team, you'd
> want to carefully evaluate for every driver whether or not you'd want
> to include it.

The Debian distro kernel I'm running has a .config file with 7317 config
items (grep CONFIG /boot/config-$(uname -r) | wc -l). 1922 of them are
disabled (grep is\ not\ set /boot/config-$(uname -r) | wc -l). If you
find the time to only go through the 1922 options that are disabled for
this amd64 kernel, tell me, I provide you the config file.

> I would also imagine that you'd want to provide your users with the
> most flexible kernel possible, so that if they do have a system with
> an FPGA that you'd make it possible for them to use pwm-sifive if they
> choose to synthesize it.

I would today probably choose to not enable pwm-sifive for Debian on a
non-riscv arch kernel because nobody told to have a use for it and the
cost of enabling the driver is that it takes hard disk space for several
thousand machines without any use.

And given that we here have the knowledge that up to now PWM_SIFIVE=3D[ym]
is only usable on riscv, I think we should put that into the
condition that makes the driver selectable. It's not hard for a distro
maintainer to find the same information; say it takes 5 minutes (that
works here because the driver under discussion has a link to the
reference manual in the header). Multiply that by the count of drivers.

> If you really want to create custom builds tailored to a single chip or
> board, it's going to be a fair amount of work anyway.

Ah right, this is a hard job, so it doesn't make a difference when we
make it a little bit harder?

> I've occasionally done that in the past and usually just resorted to
> starting from an allnoconfig configuration and then working my way up
> from there.
> =

> As for daily work as a developer, when I transition between kernel
> versions, or from one linux-next to another, I typically end up doing
> the manual equivalent of:
> =

> 	$ yes '' | make oldconfig

I usually start with $(make oldconfig) without the yes part. But when I
get 10th question in a row that is completely irrelevant for my target
machine because it doesn't have the graphics core that is found only on
Samsung ARM SoCs or the nand controllers that can only be found on some
powerpc machines I'm annoyed and I press and hold the Enter key.
I'm well aware that I'm missing some interesting stuff then, though,
which is sad.

> if I know that I'm not interested in any new features. But I also often
> just look at what's new because it's interesting to see what's been
> going on elsewhere.

The kernel config as a way to see what is going on elsewhere is a use
case that is broken by my preferred approach. Be warned that you already
miss stuff today if you only look there.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
