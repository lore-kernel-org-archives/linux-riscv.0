Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4592CED628
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiGt3cd26DhNTjkZKC5Jz4a3wHGI6vxnUrm5Lwzq1M4=; b=upG/Mi8g8dYe9EK7sF9lCQggt+
	p6tQJfSenLNlbEzCq4QdgKl29bJT/pBMWRV6qLQo1CN14dzd6MrlNR8n9jzWDJYiYmdBqgJceNBnd
	FZmnmx+9p0VytFDl8MvTQSFZLiIM67s/uYJ8p6cfzYCIVx3gI0lrtJsMNGT0SUqBao+oiaUYhAPR7
	OiD6CtNtOx5ZX7YHgckq6ddd4xkY15kJ9lCsszjrzWqbzccEEjY3DRORLxHSHVSAMQmqarPoXI8xZ
	rEBHii0DfZZJX0G4TqBp7XQl45VJ1/iwEXAZTpMCgJw5JurkJSg+zcBeH1hhuMYCbPX1B2OdmND2J
	04Xh7AEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRz7-00000008ROo-16TC;
	Wed, 09 Oct 2024 08:23:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRz2-00000008ROM-2yhN
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 08:23:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8271AA41AD0;
	Wed,  9 Oct 2024 08:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F038DC4CEC5;
	Wed,  9 Oct 2024 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728462226;
	bh=tf9M2MlC4GQ+rXRXyfjKzifuwRwBlSOhhIUUVgfhJ7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDFaQMJOLjfxzs4l6rDWtLLI6a1AV4e4frrw90C0fI2R6dzfy6mfjd0Hg3yJkg81F
	 O/LI2Ij8ywLd2HySu6eZGd6n6JkdcxbLqYFwhgvE7r16SQtbFeQJ4QahSsYO9Gq6hU
	 oTsFWCaeoe8umjHXfR1lBOC0IhRQsLGeQ4/Wx5rEb7LaPSTzqfXc04ABgcsLtEspqa
	 /va7AE4H0AvL6m4kMBAPJA+mzgIplmrAU9pH0WgmEYux03H6cxrTwqkFZmCxTr9Leq
	 7ONUN6CjxA5PrPbr3qi1qgvLYqWsAOYDQuA+o/xzuy7WZY2TGkvfAO3jM2toZhrd+u
	 v+0uiY2Nbku1A==
Date: Wed, 9 Oct 2024 09:23:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Message-ID: <20241009-tamale-revisit-7d2606c5fdf3@spud>
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr>
 <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_012348_854898_716613F9 
X-CRM114-Status: GOOD (  14.81  )
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
Content-Type: multipart/mixed; boundary="===============6475211495340983959=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6475211495340983959==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mdl99oyu/ETgEZlW"
Content-Disposition: inline


--Mdl99oyu/ETgEZlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2024 at 10:10:14AM +0200, Alexandre Ghiti wrote:

> > > , it is better
> > > to disable gcc + rust builds to match the original intent, and
> > > subsequently support it when an appropriate set of extensions can be
> > > deduced from the version of libclang.
> > >=20
> > > Closes:
> > > https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@redhat.c=
om/
> > > [1]
> > > Link:
> > > https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413e@sp=
ud/
> > > [2]
> > > Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with
> > > rust support")
>=20
>=20
> I also fixed the Fixes tag ^, it contains 13 characters instead of 12 and
> added a cc: stable tag.

FYI, checkpatch is not an arbiter of truth, and I intentionally left the
13th character that git determined it needed to have there. Apparently
the kernel now has enough objects that there can be 12 character
collisions.

--Mdl99oyu/ETgEZlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwY9jAAKCRB4tDGHoIJi
0jz9APsGDsRXizGa8lwr7kwUr5aboz4Zn4SpVJbVATWgXGgBFAD/aIl8X+A4kSNE
Zn3m0e/BumphE8b7xn/rF6HQW+zOywY=
=qF7b
-----END PGP SIGNATURE-----

--Mdl99oyu/ETgEZlW--


--===============6475211495340983959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6475211495340983959==--

