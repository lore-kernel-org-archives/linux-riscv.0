Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB9CA5FE5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSYDoa9talSITG/tw0/gsZEAC/Ti1CJtfaqvRsxWiko=; b=vjm2HaWeW6ECn/0vrGIHs38Umt
	uj4zV6klqJy66vmhIryffyZNp6FUhH81EaAzHJopduwXlQ7XMEaT5m6XrQLZgu4eMlM4med28Jy3Y
	Mo910oC88ng9V14Ad9q4KCZMb4j07zOrov6K8hgY+S6hW7v4QUxzIYptyPcXt2DcLMv2RGokT6S/h
	ohbiHK9K41Ba3SWYCqwuKNGzWKSgPehPUPgd1WfqYxe3n/8bp/qevYQdQC2buYr/UtnzA3pwx+mm3
	n1sO/PvzORvS5JNy9CXZu7Y3Qx+CVt5sxBlireboG1O+bjaQYJ3lEJ44bpiBUJRzsJ4DE+xw0tMO4
	MWv+Kxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjq6-0000000CU3m-23ff;
	Fri, 02 Oct 2026 20:26:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjq5-0000000CU3c-2Kah
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 20:26:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F403C43B6A;
	Fri,  2 Oct 2026 20:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7359E1F000FF;
	Fri,  2 Oct 2026 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790972800;
	bh=tWF81GupOPiYz8DCKS1yJfWgC9i7VWNImgSAZo/oATQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h4+AIpqL9MJyUCNxnKtMPZViW7xx4423x75vdqVuQSN81wCGIZ3uIo5Fpk6j8gcC2
	 M8t23fldE1KkYMNnVRM55yty+gvSo4ddCYy4qCsQt9FzOocRXIWdKPdPhbBBJ1HoO3
	 K6JUDcxWYVHQqIKvHBzOh57nXNwidQ14FaJJqxX5CqaAgphKak9J3RyQLhIl95EYSQ
	 3qY9AwEpGF4V/RimJEXVTMkQWe8ltXXsbOZyE+yA0DetM3l6HyXO7i3/zyrrO0avaV
	 UyccYxtbBxwozDI/AjunD9WI5Mt3LLtzRf+YBTk+kwM1PgsByipIuzD/1LzUFyMDWd
	 d5Au//UMoigyg==
Date: Fri, 2 Oct 2026 21:26:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 00/23] Add basic clocks and resets for JHB100 SoC
Message-ID: <20261002-doorbell-recycler-f386e3b8d5a4@spud>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930-grafting-undertake-ff3e01060284@spud>
 <ar_4NBLHrq2W7_vc@redhat.com>
 <20261002-amigo-joyfully-6894bdfa17e3@spud>
MIME-Version: 1.0
In-Reply-To: <20261002-amigo-joyfully-6894bdfa17e3@spud>
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
Content-Type: multipart/mixed; boundary="===============4503432287860197164=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4503432287860197164==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="19rhacsLviSpo5YF"
Content-Disposition: inline

--19rhacsLviSpo5YF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 09:11:44PM +0100, Conor Dooley wrote:
> On Fri, Oct 02, 2026 at 02:30:12PM -0400, Brian Masney wrote:
> > Hi Conor,
> >=20
> > On Wed, Sep 30, 2026 at 11:43:22PM +0100, Conor Dooley wrote:
> > > FYI clock folks,
> > >=20
> > > On Wed, Sep 30, 2026 at 05:42:54AM -0700, Changhuang Liang wrote:
> > > > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > > > subsystems:
> > > >=20
> > > > The JHB100 SoC is divided into multiple subsystems, and basically
> > > > each subsystem includes a CRG(Clock and Reset Generator):
> > > >  - sys0crg/sys1crg/sys2crg/
> > > >  - per0crg/per1crg/per2crg/per3crg/
> > > >  - voutcrg
> > > >  - vcecrg
> > > >  - gpu0crg/gpu1crg
> > > >  - cpucrg
> > > >  - usbcrg
> > > >  - host0crg/host1crg
> > > >  - pcierpcrg
> > > >  - husb0crg/husb1crg
> > > >  - husbcmncrg
> > > >  - husbd0crg/husbd1crg
> > > >  - npucrg
> > > >=20
> > > > In the current series, we will only add the following CRG:
> > > >  - sys0crg/sys1crg/sys2crg/
> > > >  - per0crg/per1crg/per2crg/per3crg/
> > > >=20
> > > > The remaining CRG will be implemented in future series.
> > > >=20
> > > > This series depends on the series:
> > > > https://lore.kernel.org/all/20260806122553.182449-1-changhuang.lian=
g@starfivetech.com/
> > > > and it has been tested on the StarFive JHB100 EVB-1.
> > >=20
> > > If this revision of the series is acceptable, I'd (although I'm not a
> > > listed driver maintainer) like to send you a PR as I've done in the p=
ast
> > > for Starfive stuff so that I can get some of these binding patches th=
at
> > > contain headers as part of a shared tag to be able to unblock a bunch=
 of
> > > the soc tree stuff. With conferences next week I understand that, wit=
h it
> > > being -rc5, it's probably this doesn't make v7.4 but I figured it was
> > > worth getting my intentions out there!
> >=20
> > I am going through this series now, and I have a few minor changes to
> > the clk drivers themselves.
> >=20
> > Feel free to send a pull for the bindings and headers though.
>=20
> Okay, PR below.
>=20
> I won't put this tag into my linux-next branch until the drivers are in
> the clock tree, but it'll let me get my ducks in a row, particularly
> beneficial given next week I'll be somewhat AFK! Duck alignment is
> currently ongoing in the "jhb100" branch in my repo..
>=20
> Thanks Brian, Conor.
>=20
> btw, will you be at LPC or OSSEU?

=2E.. As I went about aligning more ducks, I recalled that the syscon/pll
series also depends on some of the binding header files in this series.

I've made another tag with an additional binding that you'll need to
apply the clock patches in this series:
https://lore.kernel.org/all/20260828095608.19955-2-changhuang.liang@starfiv=
etech.com/

This tag will actually appear in linux-next as of the next iteration,
because the socinfo driver I will definitely submit as 7.4 material.

Thanks,
Conor.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ clk-star=
five-jhb100-plus-soc-header

for you to fetch changes up to c4a545d3e428e9600d670fa8a08098b7bc82d5ec:

  dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules (2026-10-0=
2 21:17:31 +0100)

----------------------------------------------------------------
jhb100 clock binding + syscon binding shared tag

This is a second shared tag for the Starfive jhb100 clock bindings, between
the riscv soc tree and clock tree.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Changhuang Liang (8):
      dt-bindings: clock: Add StarFive JHB100 System-0 clock and reset gene=
rator
      dt-bindings: clock: Add StarFive JHB100 System-1 clock and reset gene=
rator
      dt-bindings: clock: Add StarFive JHB100 System-2 clock and reset gene=
rator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-0 clock and reset =
generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-1 clock and reset =
generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-2 clock and reset =
generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-3 clock and reset =
generator
      dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules

 Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml      =
 |  70 ++++++++++++++++++++++++++
 Documentation/devicetree/bindings/clock/starfive,jhb100-per1crg.yaml      =
 |  70 ++++++++++++++++++++++++++
 Documentation/devicetree/bindings/clock/starfive,jhb100-per2crg.yaml      =
 |  76 ++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/clock/starfive,jhb100-per3crg.yaml      =
 |  76 ++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/clock/starfive,jhb100-sys0crg.yaml      =
 |  63 +++++++++++++++++++++++
 Documentation/devicetree/bindings/clock/starfive,jhb100-sys1crg.yaml      =
 |  71 ++++++++++++++++++++++++++
 Documentation/devicetree/bindings/clock/starfive,jhb100-sys2crg.yaml      =
 |  64 +++++++++++++++++++++++
 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml=
 | 115 ++++++++++++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/starfive,jhb100-crg.h                           =
 | 554 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/dt-bindings/reset/starfive,jhb100-crg.h                           =
 | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 1348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100=
-per0crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100=
-per1crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100=
-per2crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100=
-per3crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100=
-sys0crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100=
-sys1crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100=
-sys2crg.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive=
,jhb100-syscon.yaml
 create mode 100644 include/dt-bindings/clock/starfive,jhb100-crg.h
 create mode 100644 include/dt-bindings/reset/starfive,jhb100-crg.h

--19rhacsLviSpo5YF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasATegAKCRB4tDGHoIJi
0gNVAQDDCEw/giCQo5Gwo5U4UO0qJ8YzsmgsgM5J++eAapwcUAEAna5ZUJoPL6B9
VEOP9JmwIIKAejBVDHKexT2t1AgjaAQ=
=ZFHw
-----END PGP SIGNATURE-----

--19rhacsLviSpo5YF--


--===============4503432287860197164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4503432287860197164==--

