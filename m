Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F7CC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 19:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VwrltTcnF7U6zpGeevnH10GkknX4/FSVk+/uzjvjh8=; b=L2RRKJJ9kWLD+0AOypNabF0tje
	FYf+XXEth+7XChntmZ5bg7V6c8K3zQyIvn9Gl1hm5TGY94sG/d3pwou4Zxonwt0DPyGHvMesc9wuX
	S5f7dGPhZ5vYxkd5ikMBY8tOgENqVCA5ElqxLyJhdwPm6IcD3TgcRbLNjAQNgEV8MmbgdnXubQmMA
	6evAYlWoTnx7KjLeA8qfkCdeiR31p4AcA8VFI44Hhp1fxq6uP7KpSdxWDBbuY5YOwT13Z9CukOiMM
	7cSUCWPPhKQuApNnUN939HBHSOFnozA9pfbs4DY6r2VSxQMOyWtZf2RiHjhFD2u4Y7N1E/kW6efcn
	M5Eg6uKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAaNC-00000009gE8-1xOe;
	Fri, 24 May 2024 19:14:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAaNA-00000009gDZ-0nhk
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 19:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5948963200;
	Fri, 24 May 2024 19:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0339FC2BBFC;
	Fri, 24 May 2024 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716578075;
	bh=KDWjHn6X23J3MNH+ElTxn7OMjIfbknqvcHnHXTliwfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKyUccAgahk7VOYtR0R1dCMT3bwKqK5liRZoBAAl0rAsQw6FLIEKCI88WrZ4+UQiW
	 GnpWcFrq3Pk8gPG90y5ixLlH+1hUxqEU3e1vpq/hCdjezG9siNHoTiwJr8frig4mYj
	 KZ6XlacY8WZVrYXqbyn6h4MoZ5kz1r+BuiK97LuRgp1goPfEVL3H+RW0+HSdHELwax
	 4gC3Cp/s09ry6oBTnUFwwO7lgn6nA/B+/Ks9VjC17ENI0YNRDJIqW6/nrCkQprFPlJ
	 Y2qXpNP196n9xSeUY993vNhD6+qCymuK2joQa2R9f0UUMvV86MubkoBR2C0w22GBtK
	 MMQU8O7G4290A==
Date: Fri, 24 May 2024 20:14:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
	costa.shul@redhat.com, Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: RISC-V: uabi: Only scalar misaligned
 loads are supported
Message-ID: <20240524-ruckus-trickily-1cda26c1a455@spud>
References: <20240524185600.5919-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240524185600.5919-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_121436_304074_31E5197B 
X-CRM114-Status: GOOD (  17.56  )
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
Content-Type: multipart/mixed; boundary="===============3805905434684185399=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3805905434684185399==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/ZOy8tql2JsUXvLD"
Content-Disposition: inline


--/ZOy8tql2JsUXvLD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:56:00AM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> We're stuck supporting scalar misaligned loads in userspace because they
> were part of the ISA at the time we froze the uABI.  That wasn't the
> case for vector misaligned accesses, so depending on them
> unconditionally is a userspace bug.  All extant vector hardware traps on
> these misaligned accesses.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  Documentation/arch/riscv/uabi.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv=
/uabi.rst
> index 54d199dce78b..2b420bab0527 100644
> --- a/Documentation/arch/riscv/uabi.rst
> +++ b/Documentation/arch/riscv/uabi.rst
> @@ -65,4 +65,6 @@ the extension, or may have deliberately removed it from=
 the listing.
>  Misaligned accesses
>  -------------------
> =20
> -Misaligned accesses are supported in userspace, but they may perform poo=
rly.
> +Misaligned scalar accesses are supported in userspace, but they may perf=
orm
> +poorly.  Misaligned vector accesses are only supported if the Zicclsm ex=
tension
> +is supported.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Now we just need to find someone that cares sufficiently about Zicclsm
to write the bindings, detection and hwprobe key for Zicclsm. Maybe I'll
be the lucky fool, depending on what the x280 does...

Thanks,
Conor.

--/ZOy8tql2JsUXvLD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlDnFgAKCRB4tDGHoIJi
0j7sAQDFc2gfp1NN+WtHV5hOv86OGvZlIMu340StRhWaH9OJVAD+P0fMN7A4/i2x
j7jW9XsRLDijgGsUemTQdO+5qHFSpgQ=
=FnYL
-----END PGP SIGNATURE-----

--/ZOy8tql2JsUXvLD--


--===============3805905434684185399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3805905434684185399==--

