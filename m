Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BC606A329
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 18:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yqth/ACN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dne/oRkf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4/p1pYY0WhX3qFngfXrWyx7AFBihI1cAaiSJf2b315U=; b=yqth/ACNH5q45EpbUZVB5KSYDs
	zLp9npCSUVrfKFCE0OVagAx7eBRtRA00aM754NWVsuGcR/Op/hxvWAWojrhr+IKXpcTwDJbmmoJux
	y8MrwPG9B7MR9gZfQ+jgHTQq6VMHfDoLIaS3K82nAs9eZoV4sVQ6vGWS7zPyGNSM5guNhIhPOu03s
	PZsqOwW7NYwKl+WvXzqWlmoNdj4sUwrGn2TeGibSPw5FZnDIPMbUe8u/R6LNiT8ivgwFHTFfEHo0L
	qjBxpr1yFTNMBpAcbPYKNGaHNZTVPCYVKcnXLZ7gaQGaqi8W8g7fmuyo6nxK4F85tOXyk9mCLm9wE
	iKYuPk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMreo-0000000CQLj-1V2y;
	Fri, 30 Oct 2026 18:48:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrem-0000000CQLM-2tgC
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 18:48:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CD38601EE;
	Fri, 30 Oct 2026 18:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A2C1F000C1;
	Fri, 30 Oct 2026 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793386131;
	bh=R/eIeqkBzYBk/a7bk6HBVW5bw90Y01K8kHpJhRb/ZEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dne/oRkfLYri4BFiKeyLkAjOPPkE4/MjbAS5xLOIkxVFiO5Tz3S2GwZy5vqztJS+S
	 SlH+BLaXRWJjUvYldSciyH5tr9fj5GWB0DP21dSZHUny+9haPdib/8Z30pmXR7tkAS
	 y3oj2gFInLggMWmmTMengisGONlGd/GwvWkGpGeeZCP6JMUvOlmta8IJO9XKXxR2tT
	 3+Wqci9W9kMknmBQor273A8rkAUmN7ziVLIDMzDZ+Ke+Rgh/IxRyj/0AQMxGdIZjdB
	 EaBnqu3AgerPufv67HsyfTChzJu9jO9qgHDrHbPI8ofwt5Ru/5fWgEPGUcOBPW1QYk
	 XyBu0HOERGGYw==
Date: Fri, 30 Oct 2026 18:48:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Kwanghoon Son <asdfkwang@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <20261030-slider-finished-360b10521e0b@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <auSDJH9V31wmbrYv@debian>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5816478320800731773=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5816478320800731773==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z09qSibq+nPgici6"
Content-Disposition: inline

--z09qSibq+nPgici6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 07:44:36AM -0400, Kwanghoon Son wrote:
> On Thu, Oct 29, 2026 at 07:20:41PM +0000, Conor Dooley wrote:
> > On Thu, Oct 29, 2026 at 07:08:56PM +0000, Conor Dooley wrote:
> > > On Thu, Oct 29, 2026 at 01:05:53AM -0400, Kwanghoon Son wrote:
> > > > Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device=
 trees
> > > > and Rust serial driver and abstractions.
> > > >=20
> > > > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > > > ---
> > > >  MAINTAINERS | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >=20
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c=
958a81b626c73b422c0d4 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -4926,6 +4926,19 @@ S:	Maintained
> > > >  F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
> > > >  F:	drivers/iio/imu/bmi323/
> > > > =20
> > > > +BOUFFALO LAB BL808 SUPPORT
> > > > +M:	Kwanghoon Son <asdfkwang@gmail.com>
> > > > +L:	linux-riscv@lists.infradead.org
> > > > +L:	linux-serial@vger.kernel.org
> > > > +S:	Maintained
> > >=20
> > > Missing git tree, unless you're expecting me to apply patches for the
> > > platform for you?
>=20
> I added this entry after seeing checkpatch's MAINTAINERS warning,
> but made its scope too broad. I'll separate the BL808 platform support
> from the generic Rust serial abstractions in MAINTAINERS.

Okay, that's good - but that's more of a response to my comment down
below about splitting the entry, not a response to what I was asking
here about the lack of a git tree. Are you going to send the SoC
maintainers PRs for this platform or were you expecting someone else to
apply the patches for this platform (IOW, me).

>=20
> >=20
> > Additionally, are you actually going to add wider scale support for this
> > device? Like a clock-controller driver and the various other
> > peripherals, or is this really just a vehicle to support your rust
> > serial driver work?
> >=20
>=20
> Yes, I'd like to extend BL808 support beyond serial. I have local work
> on peripheral clock/reset support, pinctrl/GPIO, SPI and PWM, including
> an SPI display on the M1s Dock.
>=20
> I'd like to bring those pieces upstream incrementally as they are ready!

Cool!

>=20
> > >=20
> > > > +F:	Documentation/devicetree/bindings/riscv/bflb.yaml
> > > > +F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > > > +F:	arch/riscv/boot/dts/bouffalolab/
> > > > +F:	drivers/tty/serial/bflb_uart.rs
> > >=20
> > > > +F:	rust/helpers/serial.c
> > > > +F:	rust/kernel/serial.rs
> > > > +F:	rust/kernel/serial/
> > >=20
> > > These should probably not be maintained under the arch support since
> > > they're not platform specific.
> > >=20
> > > > +
> > > >  BPF JIT for ARC
> > > >  M:	Shahab Vahedi <list+bpf@vahedi.org>
> > > >  L:	bpf@vger.kernel.org
> > > >=20
> > > > --=20
> > > > 2.47.3
> > > >=20
> >=20
> >=20
>=20
> Thanks for review!
>=20
> Best regards,
> Kwang.

--z09qSibq+nPgici6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauTmigAKCRB4tDGHoIJi
0kS/AQD87LyZbjxV+0reytTO2JJdLqp7qGXF8E+JLF1EVO2SNwD+PJ0smcHb0yyh
KcwNJW06vgZpnTnI5RXuUEIPuE3QcQs=
=UI1l
-----END PGP SIGNATURE-----

--z09qSibq+nPgici6--


--===============5816478320800731773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5816478320800731773==--

