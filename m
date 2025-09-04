Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5174ACA1015
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yr1lkOb33HqpK6XWH06Zvzva036adHmkFQ1/SFwPnQ=; b=sVn/eMvz+cWHyWVTm1biabwVmb
	XcUKcoKetbwOdzpVvRg3jz/qJ2V8STAmKtCGdlkVbSsFyAcPaz16s5davsQLSvBOyB7ZtSqLLZM3m
	0V5KnzX9wGP8AnL9Z7bIM9VZ22FIEG9cXavwwniB3Hc6O3nJF9THSIgEka5Tn4Tw1mMNxMugbvqQB
	fzKxwToobH2vVWl9tA1BOd1oYpZi0eoB5PqASgS+ktWR9hxcGAvwSQyjSft6ELUE+j7y7qt01YIxu
	d/HyZ3k/b8FwhPCNJyXC2aIVhAtZOc4OUgSS54fzNBkl/ol91u+5kQkDS+uo2rjNH+ibSPzuQ1WBj
	1vWFPUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9zd-0000000Bsef-1ECQ;
	Thu, 04 Sep 2025 13:27:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu88f-0000000BEOY-33O3
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 11:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C0B5601AB;
	Thu,  4 Sep 2025 11:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D0FC4CEF0;
	Thu,  4 Sep 2025 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756985304;
	bh=tIBxjsccm8kHR8G43oxDZfY3p0spp/YY+1CMvOCugxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcUFedeGgYbOan+Gw1UzKa7IwKeF8ZNKF/wQhqY5w1osyqXlYOKvT97RRZoamD3qz
	 xjJmcCeSKLXAQXLZS1p1HPmqNA6eqWzAfSUZQUXc+odCBBkOzqErAlx2n1h4OQVGox
	 BlY2foolbjZJs4mjSkD/UBJ/9r/eQ6+RXbMyIRa7+pL/PV/LhhpunnYylMAOOaumEK
	 WfUY+xkMMKwBKUQy4P7vs370ATiHsBSfwE9cNExcpwnxPnpqFxmYJDjU++3Z7IkA+i
	 3XNFaaPPPxYXZjhty73Q1QcR8l2jGPA81YsNppPOHLpjE0Ln6CIPi7dvh0g3WAeVPK
	 WJlNm9xf7/KqA==
Date: Thu, 4 Sep 2025 12:28:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna <spriteovo@gmail.com>
Cc: Jason Montleon <jmontleo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: RISC-V: Re-enable GCC+Rust builds
Message-ID: <20250904-little-fester-546dac576c72@spud>
References: <68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com>
 <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250901-lasso-kabob-de32b8fcede8@spud>
 <b1734c45-42ec-46c7-9d4c-2677044aacab@gmail.com>
 <20250901-unseemly-blimp-a74e3c77e780@spud>
 <e48699fb-287d-42a9-ba6c-5edad86965f4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e48699fb-287d-42a9-ba6c-5edad86965f4@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2096499115914203945=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2096499115914203945==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SyMjmTdRNomxZcq3"
Content-Disposition: inline


--SyMjmTdRNomxZcq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 03, 2025 at 08:59:29AM +0800, Asuna wrote:
> > That particular one might be a problem not because of -mstack-protector=
-guard itself, but rather three options get added at once:
> > 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls		  \
> > 				-mstack-protector-guard-reg=3Dtp		  \
> > 				-mstack-protector-guard-offset=3D$(shell	  \
> > 			awk '{if ($$2 =3D=3D "TSK_STACK_CANARY") print $$3;}' \
> > 				$(objtree)/include/generated/asm-offsets.h))
> > and the other ones might be responsible for the error.
>=20
>=20
> I still don't understand the problem here. `bindgen_skip_c_flags` in
> `rust/Makefile` contains a pattern `-mstack-protector-guard%`, the % at t=
he
> end enables it to match all those 3 options at the same time, and
> `filter-out` function removes them before passing to Rust bindgen's
> libclang. Am I missing something here?

If they don't ever appear with gcc + llvm builds, that's fine.

> > Similarly, something like -Wno-unterminated-string-initialization could=
 cause a problem if gcc supports it but not libclang.
>=20
>=20
> Yes. However, this option is only about warnings, not architecture related
> and does not affect the generated results, so simply adding it into
> `bindgen_skip_c_flags` patterns should be enough, I think.
>=20
> > I think you're mostly better off catching that sort of thing in Kconfig=
, where possible and just make incompatible mixes invalid. What's actually =
incompatible is likely going to depend heavily on what options are enabled.
>=20
> Sounds better, I'll go down that path.

--SyMjmTdRNomxZcq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLl30gAKCRB4tDGHoIJi
0kP/AP9CtL+bSxb0+e1UR7kmpRdoVFQ8gp0n5r5uvuNmnl4EAAEAhso8p2VU8aLB
Z1AplovqHG+RP/1oJ11HofF9jAa44wA=
=5wPA
-----END PGP SIGNATURE-----

--SyMjmTdRNomxZcq3--


--===============2096499115914203945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2096499115914203945==--

