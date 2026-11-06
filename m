Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0745606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CTtIo/Lm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lq8VGHnD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JzAjMy5bsgwwYjMypKh0oejhupHV02f5i/nmBJFu3V4=; b=CTtIo/LmnT6DgvDuL5uCNGOOC6
	AGqLr7RrDOWz6hdUkMiDALvKVyIIp7BMyDz16xCEuAE3R1BqtTjuDANUDKqrEJ4+tMZr3jmsaLLg6
	h2om3cHTvDTUsQd/eM/HddOIxGVSfclH+p8bTdCjKJJExws0EqqukHcZNeQyN/+2B2AFG5r/50P+P
	ZM2B9k64PrSK6+zDaKkaHuwLP66GRPMjTvfPJ5AjDm9XO8768wIS3g7ob0CB48BNdgj6OPIj8av+o
	qLhzktrNHFbAxiqDQ1F5KAYgdOaKsrCNkJmcqWkx9Kus9Rf6AiDZ5s7NhYy4I/1buxhV4kQMNDYps
	CQrk9ynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOEh-0000000DKQc-0WBm;
	Fri, 06 Nov 2026 18:00:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOEg-0000000DKQF-0S5E
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 555D7601E1;
	Fri,  6 Nov 2026 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF5C1F0089F;
	Fri,  6 Nov 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793988021;
	bh=NTao78Z0+nwqj/kr7PCUlsM5HEtatNcwotA0Fg/NlJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lq8VGHnDYxh0RRUt2wtXp3vpG7zskXderJXd5WAPx+PZjb9pq436aB5jl1whO6R4e
	 KFwXxz5+yrxzUgQQTbl7+wP0w4mDIhdU/P7fXXPSWnx1cShilwI2/qHUYBZrv9b4Vj
	 l4j2L185Tx8JYxT+IsyPCBRJxjffUjkqya3bXhUzm12VwMh52nHwvbzYYkoFmC4zXj
	 SFi7AmpMG2kCDrWa7PRmud4TxEftH+to/F3hNLJU0lclgvivUbSvrQf/ZQzvGS36ge
	 ftW23GLEJf01Du5La+RogmFJQj3I2OxT0nrjegv/3mJkBLg/XEa8w1nlrWcAt9ctby
	 BEdU1Y8+LXDag==
Date: Fri, 6 Nov 2026 18:00:13 +0000
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
Message-ID: <20261106-dislike-despise-91106ac848dd@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
 <20261102-throng-botanical-b244058ecc37@spud>
 <auqC9jOIQTyieQUJ@debian>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <auqC9jOIQTyieQUJ@debian>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2333727671446538121=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2333727671446538121==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nAZw+Rabccy81wd0"
Content-Disposition: inline

--nAZw+Rabccy81wd0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 07:57:42PM -0500, Kwanghoon Son wrote:
> > I'd rather not really. I shouldn't be the maintainer for platforms I do
> > not care about, but I will do it if you're unwilling to - in part
> > because I expect that the volume for the platform will be pretty low.
> >=20
> > Please read through Documentation/process/maintainer-soc.rst to see what
> > the expectations for a platform maintainer are.
> >=20
> > Cheers,
> > Conor.
>=20
> I'd like to take on BL808 platform maintenance. I'm new to the
> maintainer workflow, so I may need some guidance initially, but I'd like
> to give it a try.
>=20
> I'll update on v2.

Cool. One thing that I noticed, and felt it was a bit odd actually is
that the uarts are fed directly from the crystal oscillator. Jisheng had
that in his original series though so I assume that's actually how the
hardware works?

--nAZw+Rabccy81wd0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4VrAAKCRB4tDGHoIJi
0hBwAP0Y6pVSxYDxvE94R7FNDUSClc7MlbdimpLzv2QjqTnZPQD+N2+2p4DXHqcg
uBvIe5LDtWCUnTdIerEB6cv9Ct+QRwU=
=Yrrl
-----END PGP SIGNATURE-----

--nAZw+Rabccy81wd0--


--===============2333727671446538121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2333727671446538121==--

