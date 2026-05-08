Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AC7CD3445
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 22:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaleUFy1r1eVVsRJKwy2pq/ZdzKfPhifgrD5fPTfV74=; b=46Vzljp4w6bntK
	/pZ6sBoKfW40Qa6jXTAexdo4hrCxszvpgqzVCXES/jYasWCen4OW9JpEYy3mNLA0VaDF1D7BxP7T2
	Eo1GvU2kCqA8vluJR4SRwToIuyJBsChVhEwvh8UnFiRe03bxEb5mntMJvFZv9N3zpMnUnbTMnmbhG
	x65sgP1sgbxFWDTOKyKD42fDZ+tU1erIFBb6XVwZGxzZPI8cbhwr+QySrq9eEtjwKZvm/UYyLu/Q3
	gG6CxhFLyQlLVqjvofNKXdqnOfbFABHEH4xcV905cF+rX2Y5bZ2NGKLfxx2EG07YXgrRRIkxB8paw
	KNdcUPBikgoBp7pAW+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLU4n-00000007gF5-3ZrC;
	Fri, 08 May 2026 22:53:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLU4m-00000007gEv-49QN
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 22:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D6496057A;
	Fri,  8 May 2026 22:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74681C2BCB0;
	Fri,  8 May 2026 22:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778280823;
	bh=Z5WQpb+zG4G33yJj25V1N+RhuvaxlLgROCG8p0ek70k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6rodGnXzFO5fLA2F6JvLhozKTvSQAgFt5h9gxycbIS81LrClQFRAwWBva2odBhlr
	 EUBj8Wj05n5iXvQl45xOziN5x8j5oSr0nHKbZOtq9i9R/5z1XH3HE4bbzAZFsDFPQa
	 oqDXZwOh7B0vh6KEXpIZhS1T1/J3WZ9hLasCugGnf4ZqFWbvI6BzP8Z8EzwadcFA/7
	 Xgl/xwGbzOzgow50cvBYxgqqqIirmEDCxBuYz7S/H1sNZx++cuCCY0mv1EULhhT3xh
	 lwH1P1hn4UqSKsfCbqcnpDWUHJOxzi8veIwidTZ5qppZX9so2PWQf9aoV6t4ORRONw
	 3Z6LDKIJ53AnA==
Date: Fri, 8 May 2026 22:53:41 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <20260508225341-GKB3590877@kernel.org>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
 <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
 <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
 <DICDTHYTPDSP.210EBVHTQ6966@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DICDTHYTPDSP.210EBVHTQ6966@linux.dev>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, linux-riscv@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Iker, Troy,

On 18:45 Thu 07 May     , Troy Mitchell wrote:
> On Thu May 7, 2026 at 5:53 PM CST, Iker Pedrosa wrote:
> > Hi,
> >
> > El jue, 7 may 2026 a las 10:20, Margherita Milani
> > (<margherita.milani@amarulasolutions.com>) escribi=F3:
> >>
> >> Good morning Iker,
> >>
> >> > Add complete SD card controller support with UHS high-speed modes.
> >> >
> >> > - Enable sdhci0 controller with 4-bit bus width
> >> > - Configure card detect GPIO with inversion
> >> > - Connect vmmc-supply to buck4 for 3.3V card power
> >> > - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> >> > - Add dual pinctrl states for voltage-dependent pin configuration
> >> > - Support UHS-I SDR25, SDR50, and SDR104 modes
> >>
> >>
> >> Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
> >>
> >> However I noticed it only works when CONFIG_I2C_K1 is enabled.
> >> Michael Opdenacker told me it's necessary to enable the regulators
> >> used by the mmc controller.
> >> Should we add the dependency between CONFIG_MMC_SDHCI_OF_K1 and
> >> CONFIG_I2C_K1? (Unless some boards don't have these dependency?)
> >> Thank you for your patchset which was really nice!
> >
> > Thank you for catching this! You're absolutely right about the dependen=
cy.
> >
> > From what I can see, all current SpacemiT K1 boards follow this design
> > pattern where the SD card power is provided by an I2C-controlled PMIC.
> > However, before adding a hard dependency, I'd like to get input from
> > the community, does anyone know of K1-based boards that provide SD
> > card power through fixed regulators or other means that don't require
> > I2C?
I would object to add CONFIG_I2C_K1 as hard dependency, the reason is
that the spacemit sdhci driver (sdhci-of-k1.c) has no used i2c
api/function, it's just need I2C function via an indirect requirement,
which sdhci -> regulator(p1) -> i2c, besides, from the hardware design
perspective, it just happens that K1 use P1(via I2C) as PMIC, it's
totally possible(even in theory) to use other PMIC as power supply
control which may not be I2C interface (maybe use SPI, for example)

If we want to solve this more gracefully, I'm in favor to add explict
option enabled in defconfig..

> if K1 needs to switch between standard and high-speed (UHS) modes,
> I believe the I2C-controlled PMIC is mandatory to handle the voltage
> switching (typically 3.3V to 1.8V).
> =

> I don't think any board would want to be stuck in standard mode permanent=
ly.
> If high-speed mode is an option, why not use it? I think adding this
> dependency is a good idea, but keep in mind it also needs to depend on P1.
> =

No, as above
>                             - Troy
> =


-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
