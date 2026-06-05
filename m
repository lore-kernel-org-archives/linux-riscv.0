Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6339CD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJUC6ewB7Bf7JXgytXAnjceMQyQIIvihj0ZjYqN/Rlg=; b=vNqAiABpAiJtG1ca0xTt7lN0sS
	WetfY3fdC1Wqy4nitZRK9RQpQZX9olSDYOxnn6J8kvSVWFIPXIwiFfcKeuBN6wGYGwlv6whXLW3qM
	mQuJlSL5OCcZURBhcQNVU7d0muRlp5M8QhteXGfEd4+7uVHL1LqHBpGoszp7HkzOo/F4twr/Px2iL
	OjixJPqmz2gQQA6OD0DNDdHAvyQGv29fAAPjqP8xToYaZy/bkKLl3eCdTwWs8y+1ogKBIjez5pske
	K8v3Upggtg/bGVGZLKREm9Q5YmJmKlXHJ5hwGmr+MC2lGuNIyXMTyuGH/sZE6VE4fqPwx19Qu53cp
	ADSvzvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWfn-00000000qWP-3CIA;
	Fri, 05 Jun 2026 15:41:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWfm-00000000qW9-2jeq
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 15:41:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B06A8601DD;
	Fri,  5 Jun 2026 15:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF61B1F00893;
	Fri,  5 Jun 2026 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780674085;
	bh=U83+pTC7j+EimUgmgyxf0pZ5n90jSKHHzJrPFFm1BB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G5APrCqNi9Qex78WpAIN/zFdzt0vTqyTgliETnwQrmDjwtv7tyxjDtq+GFUNZMpUj
	 0HwoKpC9cFsoTaQNwSCpIdobezRD/ykWmTz9rh7NwReyGC72kn8IXUL0/UdbuWrrAX
	 DEuXeh3knDYfNxG4xJu9U2gXLs8C/LWgeN2+FchUXLkt4zt4xo39aOLMvIrS+9gYSR
	 XkFzrxf0n31r1ACyrSny4egXGuGwY3E6GVf1HurbPZD3MKpV4lTM/+xSuPz/+DPTr5
	 zmNvEf0fu/+QZJ73+NArrpDfbcykfi0qrT3ylj1JEzs0HL85ifkpe2X8i/k/EDLAKP
	 5TRl+fKcWyAag==
Date: Fri, 5 Jun 2026 16:41:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Ellerman <mpe@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Message-ID: <20260605-unlivable-stardom-00ac93dfce5c@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-8-joel@jms.id.au>
 <20260604-pacifier-sludge-196f47ab3c11@spud>
 <f3fd53dc-7010-4b3d-a33c-4d1d32d3a1a6@kernel.org>
MIME-Version: 1.0
In-Reply-To: <f3fd53dc-7010-4b3d-a33c-4d1d32d3a1a6@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============5177907048071173026=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5177907048071173026==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tj74OtE0zsoX28sD"
Content-Disposition: inline


--tj74OtE0zsoX28sD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2026 at 12:02:41AM +1000, Michael Ellerman wrote:
> On 5/6/26 2:47 am, Conor Dooley wrote:
> > On Fri, Jun 05, 2026 at 12:09:53AM +0930, Joel Stanley wrote:
> > > Add initial support for the Tenstorrent Atlantis platform, based on t=
he
> > > Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG core=
s.
> > >=20
> > > The evb machine represents an internal bringup vehicle with just the
> > > interrupt controllers and a UART. This will be replaced in time with a
> > > full featured machine once details are available.
> ...
> > > diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/=
riscv/boot/dts/tenstorrent/atlantis-evb.dts
> > > new file mode 100644
> > > index 000000000000..06259cca8357
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
> > > @@ -0,0 +1,33 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/dts-v1/;
> > > +
> > > +#include "atlantis-soc.dtsi"
> > > +
> > > +/ {
> > > +	model =3D "Tenstorrent Atlantis development platform";
> > > +	compatible =3D "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
> > > +
> > > +	#address-cells =3D <2>;
> > > +	#size-cells =3D <2>;
> > > +
> > > +	memory@0 {
> > > +		device_type =3D "memory";
> > > +		reg =3D <0x0 0x00000000 0x0 0x80000000>,
> > > +		      <0x1 0x80000000 0x0 0x80000000>;
> > > +	};
> > > +
> > > +	aliases {
> > > +		serial0 =3D &uart1;
> > > +	};
> > > +
> > > +	chosen {
> > > +		bootargs =3D "earlycon console=3DttyS0";
> >=20
> > FYI, this should not be in here.
>=20
> It should be there if you want a working console :)
>=20
> I know it's a "rule" to not include bootargs, but this system has no boot
> loader, so not setting bootargs just means the DTS is no use to anyone.

I see! Could you note this please in the commit message?

>=20
> > > +		stdout-path =3D "serial0";
> > > +	};
> > > +};
> > > +
> > > +&uart1 {
> > > +	/delete-property/ clocks;
> >=20
> > Why are you doing this? Looks kinda suspect!
>=20
> On the bringup system the uart has a fixed clock, I don't know exactly wh=
y.

The reason I ask is less about the rate being fixed, and more why you
need to set it like this. You've got
clocks =3D <&prcm_rcpu CLK_UART1_PCLK>;
and I would expect (or maybe more accurately hope) that the prcm_rcpu
driver would be able to report the fixed rate?

>=20
> > > +	clock-frequency =3D <5000000>;
> > > +	status =3D "okay";
> > > +};
> Having said that, I think we talked about making this DTS match the qemu
> model rather than the internal bringup system. So if we do that then this
> will change.
>=20
> Thanks for the reviews.
>=20
> cheers

--tj74OtE0zsoX28sD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiLuIAAKCRB4tDGHoIJi
0mSrAP9aD/qgFnnd0P4iHzE4BH5EPGwhIKR11f9KCwkeSNxbTgD+MPAs45GELBYi
8YsMOMdFv88R2o2N1bbpXcORrD8v4QM=
=zdDM
-----END PGP SIGNATURE-----

--tj74OtE0zsoX28sD--


--===============5177907048071173026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5177907048071173026==--

