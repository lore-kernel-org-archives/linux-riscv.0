Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5368606A32D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ww3XF+cI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6Hdo+hz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fneNDxudQVCj9nTMZmsiRLUIwGU8+0DovLpmAIyCgk8=; b=ww3XF+cIDIdYVV2fESCZcTDNa5
	9iHoOKC2/M3VbOdTKLpBC2wNtRab1BN3gVrM6wrJdJ+ToiRFxZn3qJm/IUDp8xNOo4k4QjqQhgAze
	jxhQwmbC0vioksq82EYFu73qTgU3UGN6X9JV3A6orlEZqqmSYmLRfT0Wha9djA/Ibo135GFY9umBN
	ADlpBA9EwIc8i/KIzTZotssfsMhr0JF3y7GBLBX/kPtPzy7MMFbePOxoBQrfXXFFRNXx+XgTl6IbU
	yXLB8GBGhULL9XFHAk8cwR2DMkO5YbuiiifT/nR1ukRGKUsKxsx/rkDNt4X8i2FbnPPl7wkuiBhcE
	lu2tqPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyFM-00000000GJU-3Hy8;
	Mon, 02 Nov 2026 20:03:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyFL-00000000GJI-2edk
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 20:03:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACB9660120;
	Mon,  2 Nov 2026 20:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BAD1F00A16;
	Mon,  2 Nov 2026 20:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793649790;
	bh=8f53qSaOUew/yduHzYAT33Sw2UKphgT8s54cwVuq9zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6Hdo+hzAM2aCE2yQ8wCZI1E6GJUxrrbCQEknhiE/gjw6+GJfM09ra7ImVB1dXmv1
	 X3nGRPBTQJVmzPrSs/z91HwdgBceJXITyLZ3R1hHYACecmOBgd3tygryGmNZpglEzM
	 mp5JNuk23aI58tr5io/JBr6I7Nxs9Elc4SGO+NE1H3KhSmnynlwEP4/CFTP1tFTlmJ
	 xfc83r9QPWcZUhsjIGLxPH7dnrQvoFsew+Kfv2OdzzuuyvR/oNBjCCZDKE5tT/ckTB
	 0zPhV8w7eEbQo7m4CPyA0QZhqc5JWCPsJhDQyIEOnSE6974xmUcMk1l5P5B1yhiDpf
	 Gx8L+kVhNHtqQ==
Date: Mon, 2 Nov 2026 20:03:02 +0000
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
Message-ID: <20261102-throng-botanical-b244058ecc37@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <auXQaY25XfYzxEb1@debian>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3714819678923563711=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3714819678923563711==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VKJ1YVFC0pQdfxF2"
Content-Disposition: inline

--VKJ1YVFC0pQdfxF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 07:26:33AM -0400, Kwanghoon Son wrote:
> =20
> > Okay, that's good - but that's more of a response to my comment down
> > below about splitting the entry, not a response to what I was asking
> > here about the lack of a git tree. Are you going to send the SoC
> > maintainers PRs for this platform or were you expecting someone else to
> > apply the patches for this platform (IOW, me).
>=20
> Thanks for clarifying.
>=20
> Could you take the BL808 platform patches through your tree once they
> are ready? (If that you okay with this way)

I'd rather not really. I shouldn't be the maintainer for platforms I do
not care about, but I will do it if you're unwilling to - in part
because I expect that the volume for the platform will be pretty low.

Please read through Documentation/process/maintainer-soc.rst to see what
the expectations for a platform maintainer are.

Cheers,
Conor.

--VKJ1YVFC0pQdfxF2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujsdgAKCRB4tDGHoIJi
0rvXAQCHO96kr3fe760sxHNQfps8aidw4ByhVix9gyeGS+Q7WwD/XoV2kQ70wj6S
Ayz1b9AlQkWnpQ7NCsg4w9US5ybLXgQ=
=TfLH
-----END PGP SIGNATURE-----

--VKJ1YVFC0pQdfxF2--


--===============3714819678923563711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3714819678923563711==--

