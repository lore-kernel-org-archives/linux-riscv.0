Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EFD606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4TVUWib/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dn26AmIH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tQfjffTeU1vSPiyhxiYwKgbEkLL1TgLkLnLALPyDIAQ=; b=4TVUWib/3exe903N5zaf7QKT8B
	jsBBZn8K4LShVMR9mC07vDvKQxPZPPbOfGoKIGG8zc/RrM3/7ahVhKeccpDH4t+DRiaYKtFAXEKrw
	iFqYtdXbYGJKEHDtxZBCQMRQ6nWvwPhmjC/MjouSX9B32wezgz/4/pRE8M56AyYdi33x9uJSwRWyd
	srKjKqwORUj+Z4i9BVyf1g7SWoKma7mtE2tJqSMeZo1ZKI2qhh6VQuXj0fktskosuw9N+LYxaQ/Qm
	ZvZ7Q+SLuKcr48z5XXo0NsjrhA+U/UdRzkW8khS/D+qditSO4uflpRRXl+/+I7HHh4s94yuy4X1OP
	jbEKTodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVgC-0000000AEby-0uGG;
	Thu, 29 Oct 2026 19:20:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVgA-0000000AEbk-1L5S
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 19:20:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B095414F9;
	Thu, 29 Oct 2026 19:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A211F01824;
	Thu, 29 Oct 2026 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793301649;
	bh=6cRbs5oqkT6KWm1ocQa4weQvb7ZtTfs7ITLdAIDLxX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dn26AmIHNql4k0vIhoTKyGSjVJ4cgpmGwE2pX2CE4VKQsm6Aexk95CuLDLOIYVU0F
	 dG8fIXm2p+2PJFCUzbUmZr5GOw8cxUaUmNM23yD2hphNspemteyEWIW/MC4Sy9KDE3
	 SexvEyi1ceDvbO+PdJ1eiePZ1xsHiGMc3+rH8c5x3NB5CXsBj4+KT3cHsM8+QqvFWn
	 n1l65j/tMmv2hvUkghE7K8NY9edNcBbAz9AnLDeq0cEXSWI3z5TwslHlT+sQbbJ4K8
	 nWprPv/+kXp+D0rD60DtBZxyT3Bp70dJ+EK7ZFm7SF0RNJbQintERb8KV5No3StC9G
	 1vSTaxHQy7IMQ==
Date: Thu, 29 Oct 2026 19:20:41 +0000
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
Message-ID: <20261029-amuser-savior-6a6ab062f471@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-spyglass-evasion-772697094cb9@spud>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2635656255682259787=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2635656255682259787==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FP9ChwAHSeteGPVI"
Content-Disposition: inline

--FP9ChwAHSeteGPVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 07:08:56PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:53AM -0400, Kwanghoon Son wrote:
> > Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device tre=
es
> > and Rust serial driver and abstractions.
> >=20
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  MAINTAINERS | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a=
81b626c73b422c0d4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4926,6 +4926,19 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
> >  F:	drivers/iio/imu/bmi323/
> > =20
> > +BOUFFALO LAB BL808 SUPPORT
> > +M:	Kwanghoon Son <asdfkwang@gmail.com>
> > +L:	linux-riscv@lists.infradead.org
> > +L:	linux-serial@vger.kernel.org
> > +S:	Maintained
>=20
> Missing git tree, unless you're expecting me to apply patches for the
> platform for you?

Additionally, are you actually going to add wider scale support for this
device? Like a clock-controller driver and the various other
peripherals, or is this really just a vehicle to support your rust
serial driver work?

>=20
> > +F:	Documentation/devicetree/bindings/riscv/bflb.yaml
> > +F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > +F:	arch/riscv/boot/dts/bouffalolab/
> > +F:	drivers/tty/serial/bflb_uart.rs
>=20
> > +F:	rust/helpers/serial.c
> > +F:	rust/kernel/serial.rs
> > +F:	rust/kernel/serial/
>=20
> These should probably not be maintained under the arch support since
> they're not platform specific.
>=20
> > +
> >  BPF JIT for ARC
> >  M:	Shahab Vahedi <list+bpf@vahedi.org>
> >  L:	bpf@vger.kernel.org
> >=20
> > --=20
> > 2.47.3
> >=20



--FP9ChwAHSeteGPVI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOciQAKCRB4tDGHoIJi
0kaYAQDe/U5aSNMnBN+gfEYMXHcowI6WsE/iqPlFmGa663zB1gEA7nC4tnTPdBIy
gnEMK9pC2q6MB8djjcDHvekkukxybgc=
=vdAX
-----END PGP SIGNATURE-----

--FP9ChwAHSeteGPVI--


--===============2635656255682259787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2635656255682259787==--

