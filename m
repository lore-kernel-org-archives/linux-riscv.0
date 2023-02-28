Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF25C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAa1VaoPB17Z/MLESqTgicTEvC5nFUU68qx9SKzVNRs=; b=09xn+xzQJsM+u5O8SP9sRAYNOs
	ZGC2MzbQKr+mHC99qA5I+SK5RU4p/CprmQnmQCQQlGX1/Tm4pK8x6SQ8H/Wt9Sg+5dAnYmLE9CCi1
	7Fv9vOCMlUez9Dr28WM7kWs6CyO6GO5TopI/8XKbUotXNSChqYr+0i0XokPjHuffVm51yfcdeGLsv
	t7Jt+IXXXG5i1mzZ81/aRioWelpDJfT+3lFVqmrk1pi1LrD79t3dZ+JZFwpfsk0nJYe9DcoKLbEQB
	iOuA7B+WQnIjKMwzTYRKopJ3f7zGdQWL7O7B01i+EphNIvsxetCOVc9rgXEo4iRU0gjBUHLp6+KjE
	9U5b5LcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4NF-00DxTy-RH; Tue, 28 Feb 2023 18:06:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4NC-00DxRx-B4
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 18:06:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A0AAFB80E28;
	Tue, 28 Feb 2023 18:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A322C433EF;
	Tue, 28 Feb 2023 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677607603;
	bh=2rrPrh+K63elL1eQoqGcoJYDst8N+5jDNSgkcC6esto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbDhW8EsytBpqdpPdVqId3xBtB6/7iUHA3cNPJC9ladfQXz8e5KHXmIdKSYxhFloj
	 mIAmRTnv+EFW8KNAUUTA0O88Z2fN9rVkIBKLUFgyRWdJSQMkFCSUeo4NL14XX/3Wmb
	 7PlV+IpqYwxqX8GfHP7G4DQ+ZDP5Xr2+fgrbZm1iNcnT/3JZSpbaA+UdnpGrgR/vnq
	 pR7JZZRm2N/4AV3WpJEt+VVyzEdIvHBhU7pZ3ul2apuStiU2xqGngGFMRD7Ke247mK
	 maf1iPqHTOg8iJIgcen3M89SFzvPBSUZgz554zYusOYOaEPZKeWLa4vkhSOtHkSFK3
	 eoQM0TSwIk9lg==
Date: Tue, 28 Feb 2023 18:06:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	William Qiu <william.qiu@starfivetech.com>,
	Rob Herring <robh@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Message-ID: <Y/5Crl+76wcviHKo@spud>
References: <20230220234335.GA615198-robh@kernel.org>
 <348796cc-72d9-4dcf-9f09-4c2aa55cb858@starfivetech.com>
 <20230227222904.GC1048218-robh@kernel.org>
 <f8d2b665-ce5d-81f8-8c55-81f1a4cb62b9@starfivetech.com>
 <54f51fa0-7821-b67b-b782-eb9a35b7bba9@linaro.org>
 <CAJM55Z85fitjBOcCLqad9W-a7h3iN9bxtctVGzPgqCbf5fWobw@mail.gmail.com>
 <a0168d89-3c30-55e1-cf4c-37f7fe90aae4@linaro.org>
 <CAJM55Z8dR4TDJNeO-qiS9CurfCWM1ccNigOA1fDb7S1VKCxv2Q@mail.gmail.com>
 <be911895-4944-e983-1af5-b11ff5e8e7cc@linaro.org>
 <CAJM55Z99FZteGkzFC-cSCrTKD_qBn8huzcnynM9Xd7-4F_9rGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z99FZteGkzFC-cSCrTKD_qBn8huzcnynM9Xd7-4F_9rGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_100646_698016_EDA905FF 
X-CRM114-Status: GOOD (  36.62  )
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
Content-Type: multipart/mixed; boundary="===============8616300808773713616=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8616300808773713616==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OgGewJrsqlCKMN24"
Content-Disposition: inline


--OgGewJrsqlCKMN24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 06:31:46PM +0100, Emil Renner Berthing wrote:
> On Tue, 28 Feb 2023 at 17:59, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 28/02/2023 15:59, Emil Renner Berthing wrote:
> > > On Tue, 28 Feb 2023 at 12:28, Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:

> > > I see what you mean, but if you look into what the registers in the
> > > SYSCON blocks actually do it's not clear to me that they should be
> > > grouped with the clocks/resets any more than say the pinctrl/GPIO
> > > node. Maybe it's my fault for not giving you the full picture. Eg. for
> > > "system" and "always-on" there are blocks:
> > >
> > > SYS CRG
> > > SYS SYSCON
> > > SYS IOMUX
> > > AON CRG
> > > AON SYSCON
> > > AON IOMUX
> > >
> > > ..and it really don't see why eg. SYS CRG and SYS SYSCON should be
> > > thought of as one device, but not include SYS IOMUX then.
> >
> > ... include sys iomux as well, just like GPIO is included for AON.
>=20
> This would at least take the view that the blocks named alike should
> be thought of as a single device to its logical conclusion.
> Unfortunately we're a bit late for that. The pinctrl/GPiO bindings and
> drivers are already merged:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd6e0a660097dcdb80e7c5c859eb12f776060b02e
>=20
> > >
> > > As an examly the SYS SYSCON includes registers to control:
> > > - remapping of different peripherals from SD controller to video enco=
ders
> > > - voltage select for certain GPIO pins
> > > - phy interface selection for ethernet and CAN
> > > - QuadSPI delay chain and SRAM configuration
> > > - PLL configuration
> > > - endian selection for the SD controller
> > >
> > > To me this is pretty much exactly described by the syscon device tree=
 binding:
> > > "System controller node represents a register region containing a set
> > > of miscellaneous registers. The registers are not cohesive enough to
> > > represent as any specific type of device. [..]"
> > > In any case it's clear that however the SYSCON blocks are represented
> > > in the device tree, a driver for it would need to export registers in
> > > the SYSCON block for other drivers to use.
> >
> > You started entire sentence with "but" so you disagree but with what
> > exactly? The naming? But syscon is fine - hardware manual calls it like
> > that.
> >
> > The point was that AON is one device (consisting of multiple blocks).
>=20
> Yes, and what I'm trying to explain is that I'm not convinced that's
> the right model. The CRG blocks and IOMUX blocks don't really have
> anything in common other than the name StarFive gave them. You can
> argue that the CRG and IOMUX blocks overlap with the corresponding
> SYSCON block, but so do a lot of other peripherals as you can see from
> the list above.
>=20
> I think the IOMUX and SYSCON blocks are just named after the clock
> domain they're under, but a lot of other peripherals are also under
> the SYS and AON clock domains and we don't model them as one big
> device.

I went and bothered Rob/Krzysztof on IRC about this.
Not gonna speak for them, but I think they're now okay with keeping the
SYS_CRG (clock+reset block) separate from the SYS_SYSCON block ("random
collection of registers"). Possibly there was just confusion due to the
naming used here, thinking that "SYS", "STG" and "AON" were devices with
two register blocks, as opposed to being the name of a clock/power domain
on the SoC.

I'll leave it up to them to confirm that though!

Cheers,
Conor.


--OgGewJrsqlCKMN24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/5CrgAKCRB4tDGHoIJi
0pKjAQDTeT+TZc/EBmewPaKfdSLP7DCjgM+V1bTyEZ6/CVuCUAD+M46W4w/Jg86q
jFnVxeqFklXmTiTe/VWnQwOzTfrw1ws=
=adFT
-----END PGP SIGNATURE-----

--OgGewJrsqlCKMN24--


--===============8616300808773713616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8616300808773713616==--

