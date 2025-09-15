Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75C3CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQF3OjNS6pVkDkIXV8HKi/4nFdcSRoMBJsB6lG9rjx0=; b=EatCfPiKgJkCMGa8rq9kv2Bk7V
	/ilZiZB0mMmDV59hNAD0dO4bK9LaOip+VrIFi02uU0iE9ishl6zSdxai3hO2pyvRH5lSlstcJd0Iw
	5bw7+jGn+uwhF2xx9cGHaF0pqWXadQDJNZSBulOdHLw2cqYr7z4tDK8mCrPLjNUPs7iUbl+H5f392
	xdnO125pUYuua2F5I3uUikD3fJaYBVbKUtfYDhj9G8KczSadtDpB7iI5xz6Pn1/8iqziaWJeuuV5w
	qgjcYFtGvzhL434H4NCSYmHN5TKxPfgCS6jqkq73Y7ZfA3hqCOhIKp5ZJbvRq7SP3bLRurKh3AMuQ
	C6H2ZA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDN8-00000005Kzi-05G5;
	Mon, 15 Sep 2025 17:52:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDN6-00000005KzH-3f7h
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 17:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E56C601EF;
	Mon, 15 Sep 2025 17:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA69C4CEF1;
	Mon, 15 Sep 2025 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958732;
	bh=GY/cjv6c1PVfRCGBIc8RNi9uaVExam9Ygo6g40J/0Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGFtRFFITkNXVYjH2I0j0HVurK6zMABxDqrusB4ZhGmIrIBBSiC7+pObxmH02Bw8Y
	 q0Lto6u6JbAcg1/EpFRiTRjBTcZVdSwKg0jSRccDFwCsO9pEmltKFLMBjjxYDQGXyu
	 s+mPUJ1zetFlnA8pYHAJXkSQPsVwvbAEx+vtrHnF23c6JFzKZIkT7034/paCDvnxdZ
	 wUuhzMfthGKQiHfhqH67kV7RfSLmysKwzZ0NxyfiTlhotlrjtJFSp+eygXZuzpqj4B
	 sUojLoE+ktgDve7eBVgbso+8i/s2KqJTVs2LDjXFXAWBsaltOUukxxj93XtIKjw9AP
	 ZJxHWerU4X8Sg==
Date: Mon, 15 Sep 2025 10:52:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <jms@tenstorrent.com>, Joel Stanley <joel@jms.id.au>,
	Michael Neuling <mikey@neuling.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 6/7] riscv: dts: Add Tenstorrent Blackhole A0 SoC PCIe
 cards
Message-ID: <aMhSSka3gyIcND/L@x1>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-6-ddb0d6860fe5@tenstorrent.com>
 <20250915-mouth-banner-ddfb2e48bdb3@spud>
MIME-Version: 1.0
In-Reply-To: <20250915-mouth-banner-ddfb2e48bdb3@spud>
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
Content-Type: multipart/mixed; boundary="===============4130655715896012269=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4130655715896012269==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="epd8RCdqG9ORGx07"
Content-Disposition: inline


--epd8RCdqG9ORGx07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 05:47:08PM +0100, Conor Dooley wrote:
> On Sat, Sep 13, 2025 at 02:31:05PM -0700, Drew Fustini wrote:
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b2b08023643a2cebd4f9245=
79024290bb355c9b3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts
> > @@ -0,0 +1,14 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/dts-v1/;
> > +
> > +#include "blackhole-a0.dtsi"
> > +
> > +/ {
> > +	model =3D "Tenstorrent Blackhole A0 SoC PCIe card";
> > +	compatible =3D "tenstorrent,blackhole-a0-card", "tenstorrent,blackhol=
e-a0";
> > +
> > +	memory@0 {
> > +		device_type =3D "memory";
> > +		reg =3D <0x4000 0x30000000 0x1 0x00000000>;
>=20
> This isn't at address zero as the node address claims.

Thanks, I'll fix the unit address.

>=20
> > +	};
> > +};
> > diff --git a/arch/riscv/boot/dts/tenstorrent/blackhole-a0.dtsi b/arch/r=
iscv/boot/dts/tenstorrent/blackhole-a0.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..517b6442ff0fe61659069e2=
9318ad3f01bc504e2
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/tenstorrent/blackhole-a0.dtsi
> > @@ -0,0 +1,112 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +// Copyright 2025 Tenstorrent AI ULC
> > +/dts-v1/;
> > +
> > +/ {
> > +	compatible =3D "tenstorrent,blackhole-a0";
> > +	#address-cells =3D <2>;
> > +	#size-cells =3D <2>;
> > +
> > +	cpus {
> > +		#address-cells =3D <0x1>;
> > +		#size-cells =3D <0x0>;
> > +		timebase-frequency =3D <50000000>;
> > +
> > +		cpu@0 {
> > +			compatible =3D "sifive,x280", "sifive,rocket0", "riscv";
> > +			device_type =3D "cpu";
> > +			reg =3D <0>;
> > +			mmu-type =3D "riscv,sv57";
>=20
> > +			riscv,isa =3D "rv64imafdcv_zicsr_zifencei_zfh_zba_zbb_sscofpmf";
>=20
> What's the benefit of retaining this property?

Nothing depends on the legacy isa property so I'll drop it.

>=20
> > +			riscv,isa-base =3D "rv64i";
> > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "v", "zicsr",
> > +					       "zifencei", "zfh", "zba", "zbb", "sscofpmf";
> > +			riscv,cboz-block-size =3D <0x40>;
>=20
> cboz block size, but no zicboz in your extensions list?

My mistake, the core does not have CBO so I'll drop this property.

Thanks,
Drew

--epd8RCdqG9ORGx07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaMhSRAAKCRDb7CzD2Six
DGbvAQCjny2kDWZcvX8nIkeo10FVBexoproAQqTYdLJgrg8BpwD+LWnC/ty998Pw
OV40oqnmYdANreDohNTKKi+bgOiNIgw=
=bqJY
-----END PGP SIGNATURE-----

--epd8RCdqG9ORGx07--


--===============4130655715896012269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4130655715896012269==--

