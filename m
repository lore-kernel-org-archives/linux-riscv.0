Return-Path: <SRS0=8WcR=PY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA3FC43612
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 19:29:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D84620840
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 19:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWyHsUeI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XclubeIf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D84620840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:
	From:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BjGAi3s9WVIgdx0+XQh58GMi6r4cU8nZaqDUrD9ziwY=; b=PWyHsUeIWMQYA+od3gxffZjPT
	KEopUPrEl0UdMPwBqBvsBbg82h/r8LDuyTtsQy9gWNwAEmsidcSCRrgyiuf5SR5xIj90JVbwR+GaL
	zrb9X1t0OCkYzedRzTCuen7OyvalRvDQUkMi4I7vANL+fMwBf/smvkCFuDadf2fkAm1kgLX8nCewx
	/9jfsCXY0xNNwShjnfi0Ou204IY9ASe3slxGWAWo7xTntb8dXdNhqbjWUiHMIQ2ACOCMrjleJvK0m
	sqQr5/LOKSUypNmzrHKqtzMQmZaS5Rxf8ghoTknv7bFUln5ZHv+0ibSR3diVJHeWa8dMi1aT6y2Vf
	KS+1Z+70A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjqsf-00038q-CJ; Wed, 16 Jan 2019 19:29:41 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjqsc-00038Q-7q
 for linux-riscv@lists.infradead.org; Wed, 16 Jan 2019 19:29:40 +0000
Received: by mail-pl1-x643.google.com with SMTP id a14so3464017plm.12
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jan 2019 11:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version:content-id;
 bh=RAu4eV14vLpBzsP4krmBFF9G7i8PwwT0ayyHlmOy1Qs=;
 b=XclubeIf0BYCHxHW05MV1PSQGGKDfXajfK31ePm4QgvbkLVKjfzuLNdRnMwO6Nxc6J
 XaxQPJV6WTEXrSytV2VsK5wYKM+t7QFFtqDrlS7JatP6n8M9l9tgJtX+lrUsssrX0agp
 P2OJFWJsuZDnFOLPVMR4zNhni12CoI3973FxWGBFrQqshcVBuU+zFQITF2oH0sSAnjgO
 XBfvwrivvFr2TVxZvxR5O/zjCoWHwlfRTVMhP+XDaH45vQtxsuKA0NtQz2ZeZuYZBV0/
 pbFmqWAR4AwZn1DflrKwrMcsTyS/kLeeoIGIukUMbwr1OdE6T7GvSFo2KBXyjePufyPX
 rmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version:content-id;
 bh=RAu4eV14vLpBzsP4krmBFF9G7i8PwwT0ayyHlmOy1Qs=;
 b=HM8Mmq0Jtbix9F3g2wAZfRKVFrgekMJqvhjfQIC5TsFneR36F9fjtue1PkuGW18U92
 Dg8AmT1WZF7h+NPSK1okbJvAWuHRV/wlLmJenUkDn5OcQSr9RN15x4SOW/byfUPlzO6a
 eMnNRU9PAFDj2wSYFFKCSw6Pc4Uhfj8qEpiawW/A2OCoipahxr+epbFuuc8h5Nlz7Nuu
 PACgJdmvrvyno7XZLtjxunEnMzDpXzK9nv1bWdZTw08bPasMk+nTvJh6bbBI7LNdhhpS
 FD93jZfBvOct9CIvGYp1xQAeh/jXpLKYwyA7oH/8L+FOptOrOyg9FsZufcDxhrFAQH5U
 sq2w==
X-Gm-Message-State: AJcUukd5mrzMy7nUygeiPPRCDegXtwWiobVRwBYHGF7jW76VTHsvCdjo
 3J4R/UPZ2QKq+LUlqpWtoeg+fw==
X-Google-Smtp-Source: ALg8bN5Py2xaAdyugqsxBRY2PE9rGGBIL5NC+1fpGvkAc/eFjdcHpK/tKf5hr+LpPIT0l1KZDfKtWw==
X-Received: by 2002:a17:902:654a:: with SMTP id
 d10mr11328254pln.324.1547666977478; 
 Wed, 16 Jan 2019 11:29:37 -0800 (PST)
Received: from localhost ([2607:f598:b382:d300::14ef])
 by smtp.gmail.com with ESMTPSA id q5sm10990596pfi.165.2019.01.16.11.29.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 11:29:36 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Wed, 16 Jan 2019 11:29:35 -0800 (PST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
In-Reply-To: <20190116172849.h5qdfa5wc3vaprbn@pengutronix.de>
Message-ID: <alpine.DEB.2.21.9999.1901161015400.19681@viisi.sifive.com>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
 <20190115220046.etgbno6ymsux75dk@pengutronix.de>
 <CAJ2_jOEuU_=bpbVmdsq7FFEKEm_wHza-h7Hu8QmZ3BgsGgi-ng@mail.gmail.com>
 <20190116164640.mi3zjbhbhc6k5v7p@pengutronix.de>
 <alpine.DEB.2.21.9999.1901160909540.19681@viisi.sifive.com>
 <20190116172849.h5qdfa5wc3vaprbn@pengutronix.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-266195263-1547665898=:19681"
Content-ID: <alpine.DEB.2.21.9999.1901161115270.19681@viisi.sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_112938_296861_39DEA4FF 
X-CRM114-Status: GOOD (  26.67  )
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
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Yash Shah <yash.shah@sifive.com>, Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-266195263-1547665898=:19681
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.21.9999.1901161115271.19681@viisi.sifive.com>



On Wed, 16 Jan 2019, Uwe Kleine-K=F6nig wrote:

> On Wed, Jan 16, 2019 at 09:18:45AM -0800, Paul Walmsley wrote:
> > On Wed, 16 Jan 2019, Uwe Kleine-K=F6nig wrote:
> >=20
> > > On Wed, Jan 16, 2019 at 04:40:42PM +0530, Yash Shah wrote:
> > > > On Wed, Jan 16, 2019 at 3:30 AM Uwe Kleine-K=F6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > On Fri, Jan 11, 2019 at 01:52:44PM +0530, Yash Shah wrote:
> > > > > > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > > > > > index a8f47df..3bcaf6a 100644
> > > > > > --- a/drivers/pwm/Kconfig
> > > > > > +++ b/drivers/pwm/Kconfig
> > > > > > @@ -380,6 +380,16 @@ config PWM_SAMSUNG
> > > > > >         To compile this driver as a module, choose M here: the =
module
> > > > > >         will be called pwm-samsung.
> > > > > >
> > > > > > +config PWM_SIFIVE
> > > > > > +     tristate "SiFive PWM support"
> > > > > > +     depends on OF
> > > > > > +     depends on COMMON_CLK
> > > > >
> > > > > I'd say add:
> > > > >
> > > > >         depends on MACH_SIFIVE || COMPILE_TEST
> > > > >
> > > > > (I guess "MACH_SIFIVE" is wrong, but I assume you get what I mean=
=2E)
> > > >=20
> > > > As of now, MACH_SIFIVE/ARCH_SIFIVE isn't available.
> > > > @Paul, Do you have any comments on this?
> > >=20
> > > If this is not going to be available at least protect it by
> > >=20
> > > =09depends RISCV || COMPILE_TEST
> >=20
> > There's nothing RISC-V or SiFive SoC-specific about this driver or IP=
=20
> > block.  The HDL for this IP block is open-source and posted on Github. =
=20
> > The IP block and driver would work unchanged on an ARM or MIPS SoC, and=
 in=20
> > fact, SiFive does design ARM-based SoCs as well.  Likewise, any other S=
oC=20
> > vendor could take the HDL for this IP block from the git tree and=20
> > implement it on their own SoC.
> >=20
> > More generally: it's a basic principle of Linux device drivers that the=
y=20
> > should be buildable for any architecture.  The idea here is to prevent=
=20
> > developers from burying architecture or SoC-specific hacks into the=20
> > driver.  So there shouldn't be any architecture or SoC-specific code in=
=20
> > any device driver, unless it's abstracted in some way - ideally through=
 a=20
> > common framework.
> >=20
> > So from this point of view, neither "depends MACH_SIFIVE" nor "depends=
=20
> > RISCV" would be appropriate.  Similarly, the equivalents for other=20
> > architectures (e.g. "ARCH_ARM") or SoC manufacturers (e.g.,=20
> > "MACH_SAMSUNG") wouldn't be appropriate for any generic IP block device=
=20
> > driver like this one.
>=20
> The dependency serves two purposes:
>=20
>  a) ensure that the build requirements are fulfilled.
>  b) restrict configuration to actually existing machines
>=20
> When considering b) it doesn't make sense to enable the driver for (say)
> a machine that is powered by an ARM SoC by TI. If you still want to
> compile test the sifive driver for ARM, enable COMPILE_TEST. That's what
> this symbol is there for.

COMPILE_TEST made slightly more sense before the broad availability of=20
open-source soft cores, SoC integration, and IP; and before powerful,=20
inexpensive FPGAs and SoCs with FPGA fabrics were common.

Even back then, COMPILE_TEST was starting to look questionable.  IP blocks=
=20
from CPU- and SoC vendor-independent libraries, like DesignWare and the=20
Cadence IP libraries, were integrated on SoCs across varying CPU=20
architectures.  (Fortunately, looking at the tree, subsystem maintainers=20
with DesignWare drivers seem to have largely avoided adding architecture=20
or SoC-specific Kconfig restrictions there - and thus have also avoided=20
the need for COMPILE_TEST.)  If an unnecessary architecture Kconfig=20
dependency was added for a leaf driver, that Kconfig line would either=20
need to be patched out by hand, or if present, COMPILE_TEST would need to=
=20
be enabled.

This was less of a problem then.  There were very few FPGA Linux users,=20
and they were mostly working on internal proprietary projects. FPGAs that=
=20
could run Linux at a reasonable speed, including MMUs and FPUs, were=20
expensive or were missing good tool support.  So most FPGA Linux=20
development was restricted to ASIC vendors - the Samsungs, Qualcomms,=20
NVIDIAs of the world - for prototyping, and those FPGA platforms never=20
made it outside those companies.

The situation is different now.  The major FPGA vendors have inexpensive=20
FPGA SoCs with full-featured CPU hard macros.  The development boards can=
=20
be quite affordable (< USD 300 for the Xilinx Ultra96).  There are also=20
now open-source SoC HDL implementations - including MMUs, FPUs, and=20
peripherals like PWM and UART - for the conventional FPGA market.  These=20
can run at mid-1990's clock rates - slow by modern standards but still=20
quite usable.

So or vendor-specific IP blocks that are unlikely to ever be reused by=20
anyone else, like the NVIDIA or TI PWM blocks, maybe there's still some=20
justification for COMPILE_TEST.  But for drivers for open-source,=20
SoC-independent peripheral IP blocks - or even for proprietary IP blocks=20
from library vendors like Synopsys or Cadence - like this PWM driver, we=20
shouldn't add unnecessary architecture, SoC vendor, or COMPILE_TEST=20
Kconfig dependencies.  They will just force users to patch the kernel or=20
enable COMPILE_TEST for kernels that are actually meant to run on real=20
hardware.


- Paul

--8323329-266195263-1547665898=:19681
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-266195263-1547665898=:19681--

