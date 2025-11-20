Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F468CF64A0
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 00:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyUD42mscwzqpu2Tf88qrDzTgA1XzYUEjSc16iXRYwc=; b=qCBleauMUHn/9jW1MgucH1/Yn3
	vUK+63tQGTqT23UMqWLC+8BohrNCcESEnvR4utLFbGqdTUbzte3fY696iVYdnylJfaq2UOhNx0jWO
	+0+KJjO2mRwvkE6f6QwmJ307iK2BDwxOb+pa+yBWCpOC4uyjRiAhIaWKG/A1vjmiRXuakJX0RUSAJ
	jB3bp78FhrVjpnnAPh30RcccyKGlLCsfYHwjC+tHsgfFuqJX0c1pkpX0HKaSxemH72U3UwY41UNdA
	VK5uMnAIjkJaGvWmZPdp1pnvpCEkj9m2wuSENnpPfXqSd+qXCvO9y3sZtjKXjuduHpaTQH3vWCvBL
	GIoiLonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLspv-00000005uBA-3zza;
	Thu, 20 Nov 2025 00:47:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLspt-00000005uB4-47c3
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 00:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2889960188;
	Thu, 20 Nov 2025 00:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CABBC4CEF5;
	Thu, 20 Nov 2025 00:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763599664;
	bh=/Z2MAozJnU/LYuNLYNctu23sEUYxIs/9YPAdnmPT4PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0a9AQ/Qmx4jMEFAgLrq3xe8iw45ICswS3k4qtjFM5dOQwoiVX+cJPX2VlnyoRIy/
	 K5Hwr+lg9UG00h481Jem88rTyyTruJ3CVKXqfFka8x/R2usbysdZm0UyHXlcnTVRmu
	 gqdTnWBQQVmjHDGN9a9M2iaWIcIdlRtn0z+eqRVkHyUlFBajdgcADHtSvu9axoSy1r
	 r47SrRNhOa8aMNWZ+KK+c+UtNhuIo6J9R3Gp1/ritXWHWQqD5AD+ORJtJPhBDS/d6l
	 tB9QeKGGjVdDBnYhrRp7ZTT0KY9W4yk1CCwfBAEOE4hJbOroV/OkY23VFql3dU0F18
	 rgmUdAyCZa5Rw==
Date: Thu, 20 Nov 2025 00:47:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, E Shattow <e@freeshell.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Message-ID: <20251120-ambiguity-obsessive-b4ebf225d293@spud>
References: <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
 <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
 <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de>
 <ZQ2PR01MB1307DADE17FFEFCE70C3F391E6D62@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20251118-throwing-marina-14a87d65465a@spud>
 <CAJM55Z-MfpVX3EuQ_AjvDSk6FwR51R5cQdN5RybS9pbJ8r9NNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z-MfpVX3EuQ_AjvDSk6FwR51R5cQdN5RybS9pbJ8r9NNg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5042770636714075742=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5042770636714075742==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HczvwQk9dFBg2zrj"
Content-Disposition: inline


--HczvwQk9dFBg2zrj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 05:27:30AM -0800, Emil Renner Berthing wrote:
> Quoting Conor Dooley (2025-11-19 00:10:08)
> > On Tue, Nov 18, 2025 at 02:12:58AM +0000, Hal Feng wrote:
> > > > All,
> > > >
> > > > I repeat that the suggestion was made months ago (by Hal) to split =
out the
> > > > OPP tables per-board from the period of time when I was complaining=
 about
> > > > 1.5GHz JH-7110 operation pushing TDP into over-temperature thermal =
limit
> > > > on Milk-V Mars CM SoM.
> > > >
> > > > Whether or not JH7110S is a new compatible should follow precedence=
 in
> > > > Linux development. JH-7110S is evidently the same tape-out as JH-71=
10 and
> > > > however you deal with that in Linux is the appropriate way to deal =
with that
> > > > here. Selection of OPP table for correct operation will be determin=
ed by
> > > > bootloader, where, it is demonstrated by patch series sent to U-Boot
> > > > upstream to be selected ** per-board ** based on EEPROM content as =
if it
> > > > was any other JH-7110 board deciding dts based on EEPROM content. G=
iven
> > > > that it is the same tape-out I do not find a valid justification fo=
r a new
> > > > compatible in the stack of adjacent software besides going along wi=
th some
> > > > kind of marketing-driven answer about whether or not this is a new =
SoC.
> > > >
> > > > What I care about now is that the VisionFive 2 Lite series is in go=
od enough
> > > > shape and there's a possibility to act on this months-old suggestio=
n to split out
> > > > the OPP tables which as we have confirmed the JH7110S is the same S=
oC as
> > > > JH7110 it makes a lot of sense to do.
> > > >
> > > > How is it supposed to work for binned silicon in Linux?
> > >
> > > Hi, Conor,  Emil,
> > >
> > > What do you think about this? Hope to hear from you.
> >
> > Can someone just give me a yes/no question out of this thread? I'm not
> > really immediately sure what's being asked of me. What exactly do you
> > want to do with the opp-tables? "Split out" isn't super clear. Does that
> > mean into board files? I am guessing it does, since you're saying that a
> > particular board cannot support the 1.5 GHz mode. It's not unusual
> > though to use delete node for unsupported opp-table entries, could that
> > be done instead?
>=20
> Yes, as far as I can tell we should be able to just add the board descrip=
tion
> like this:
>=20
>  jh7110.dtsi               # JH7110 SoC description
>  |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
>     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boar=
ds
>     |  |- <VF2 boards>     # Final VF2 board descriptions
>     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
>     |  |- <Mars CM boards> # Final Mars CM board descriptions
>     |- <other boards>      # Other JH7110 board descriptions
> +   |- jh7110-starfive-visionfive-2-lite.dts
>=20
> and have it do
>=20
> &cpu_opp {
>     /delete-node/ opp-375000000;
>     /delete-node/ opp-500000000;
>     /delete-node/ opp-750000000;
>     /delete-node/ opp-1500000000;
>=20
>     opp-312500000 {
>         opp-hz =3D /bits/ 64 <312500000>;
>         opp-microvolt =3D <800000>;
>     };
>     opp-417000000 {
>         opp-hz =3D /bits/ 64 <417000000>;
>         opp-microvolt =3D <800000>;
>     };
>     opp-625000000 {
>         opp-hz =3D /bits/ 64 <625000000>;
>         opp-microvolt =3D <800000>;
>     };
>     opp-1250000000 {
>         opp-hz =3D /bits/ 64 <1250000000>;
>         opp-microvolt =3D <1000000>;
>     };
> };
>=20
> This seems to be the minimal amount of changes needed. I looked through t=
he
> latest OpenSBI and it does match "starfive,jh7110s", but it treats it exa=
ctly
> the same as "starfive,jh7110" and Hal have not really given any other rea=
son
> we'd need new compatible strings.

FWIW, chucking in the extra compatible is pretty straightforward if
there's a respin to adjust to the above file layout, so can probably
just go and do it.

> E: I know this doesn't split out the opp table like you suggested, but I =
think
> that can come later if needed. Let's just start with the minimal amount of
> changes to get the VF2 Lite supported.
>=20
> Hal: Do you think this could work? You might need a patch to move some mmc
> properties out of jh7110-common.dtsi

I'm going to consider this "Changes Requested" then, and I'll expect
another version with the file layout above.

I was starting on my 6.19 PRs today, and I remembered that I actually
have some dts material for the second week of the merge window, so
you've got an extra week out of that Hal before it'd be 6.20 content
instead.

Cheers,
Conor.

--HczvwQk9dFBg2zrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR5lKwAKCRB4tDGHoIJi
0oBcAP48VjJAVIyq9kjFr/K/aTwxVR0ytZbmiCj2Yw4bGqqWWwD7B2lP8xHnX6C0
KOZFF18PpPgtMTG5AzDsCkU8YfJRbQ0=
=YKzs
-----END PGP SIGNATURE-----

--HczvwQk9dFBg2zrj--


--===============5042770636714075742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5042770636714075742==--

