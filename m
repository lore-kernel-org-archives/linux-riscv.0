Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91658C5478C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 21:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUh/jio5H5/fAD3TQcY3Yu4B+DQCzFDbN1wED/5rhX8=; b=Qy+XUmRRoLkAqh8dILpqJKEJWG
	rq1gV8NOjJsDA5fbYGQY6PABaeKc5ZDFv7F1s2bst1bB8+yIjvkPo/lvWDpKzv0tzwoLQ4iagPRV/
	wHhYOsgU4S28IMNBnCGPBP0F1Z3JmTvQhtviTp1fjyUf0I/L7bkEljJ8+Bhdc59WDC9D3q4/jTjBr
	uaKCrbbOEw6dMrNzK+cKujvwKLEwQOeMfqyGIwbmToXcKG7LGiROnztriRjjRWxr+Ca396BllR45D
	95uuJCNqBb+m9v5Eh3tjh8MJl/kr57/TBKnqZYyIJNAJOl4eLaDHk+WfbkfvWMS+H0Ku6ItYmXrUU
	YrBcx8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reiY9-00000002hhz-16E3;
	Mon, 26 Feb 2024 21:30:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reiY5-00000002hgT-3C0a
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 21:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB410CE1748;
	Mon, 26 Feb 2024 21:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51282C433F1;
	Mon, 26 Feb 2024 21:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708983005;
	bh=zjn4FAEggIcuF3yKsLZHJqmJCdDBGnSpMPbFVggTO3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DItVn8FzrzmNOghOMNojZv1uKdkDrHaNOjPUSbdrFyk9RGrqvJpYljlQEb1YwYPHq
	 mGpH26IyFXbI8Ejwq+3VKEB+SjnIE5q5AjBUiUZJaAyphPyM8em7Q2gFdhXvYgoVbm
	 N2nkA1sfeWI1mBHNCq6RE6KW1w8izhS6NmXmiKC6N1yr+MSk08/ARMZOtrnWuKAHZK
	 zaT7ACH/FKu4FjFP1NespKDQ4zFigtHVQVYFI7nxIDDDyZNtD/PewlcCmuGwtYB5Qp
	 8FpRak7ynTOBnnCfgZo3Z6THMS9eQOnlyr7VVOwvXRRaeCaArtf/W6iSrWeBoeAb6Q
	 81IEiB8G9Oskw==
Date: Mon, 26 Feb 2024 21:29:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Charles Lohr <lohr85@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
Message-ID: <20240226-jolt-earwig-91c7b0eb868f@spud>
References: <20240226140649.293254-1-cleger@rivosinc.com>
 <40dee2c1-ff24-40b2-a13c-6934139ba869@sifive.com>
 <ea356036-5a0b-47ea-aafb-f9813cc6ec9b@rivosinc.com>
 <20240226-pajamas-okay-51e16426b0f5@spud>
 <CAGu26P_v9FjYq9Bncvfd-dBhdHQevvN3HpO1nqjA2hYFCpG7hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGu26P_v9FjYq9Bncvfd-dBhdHQevvN3HpO1nqjA2hYFCpG7hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_133010_175518_ED5117E1 
X-CRM114-Status: GOOD (  27.28  )
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
Content-Type: multipart/mixed; boundary="===============5367403185308235391=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5367403185308235391==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r/gcDu4EFBEr9fnP"
Content-Disposition: inline


--r/gcDu4EFBEr9fnP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 11:00:41AM -0800, Charles Lohr wrote:
> WOAH! Please DO NOT deprecate NOMMU. I use the NOMMU build constantly
> and NOMMU Linux on RISC-V is the avenue used by many FPGA soft cores
> for Linux, as well as some limited systems.
>=20
> I get new copies of the kernel when there are releases and test them
> frequently to make sure everything is still working as expected.

That is great - it is good to know that people are actively testing.
I was aware that a lot of the soft core folks did run nommu kernels (and
I know some do use XIP also) but everything I ever saw was running on
old kernels (5.x).

> On Mon, Feb 26, 2024 at 8:03=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Feb 26, 2024 at 04:25:24PM +0100, Cl=C3=A9ment L=C3=A9ger wrote:
> > > I guess I could also mark XIP as deprecated.
> >
> > I'm not so sure, people recently added XIP support to QEMU (and sent
> > kernel fixes in December). XIP is also not nearly as much of a problem
> > to support, there's far less that it does differently, the main barrier
> > was the inability to test it which is no longer the case.
> > That said, XIP is gonna kill itself off I feel as it does not support
> > runtime patching and therefore is extremely limited on extensions, given
> > we use alternatives for all of that (although I suppose if someone has a
> > usecase they could make nasty macros worse and implement a compiletime
> > switch in the alternatives too).

> For us we just don't care about XIP. I mean if someone did push it
> through to fruition, I'd also test and use it, but I urge you please
> do not deprecate this.

XIP does work. What I was talking about here was supporting something
"fancier" than rv{32,64}imafdc.

> While it's sometimes needed a bit of a
> creative build to get everything working, I've never needed to patch
> anything in the kernel beyond patching in a custom console for serial
> output.
>=20
> I am happy to discuss the possibility of me and or one of the other
> RISC-V soft (FPGA) core people stepping up to try to be more active,
> but so far we've just been very well serviced by the current NOMMU
> Linux setup.

Most of the issues aren't with nommu actually working, it is the extra
effort in development as it has to be accounted for. I would estimate
that 2/3 of the build issues I report on this list are nommu. The
best thing that you can do to ensure support for things you use is:
a) scream when someone wants to remove it
b) actively let people know you're using it

Seems like you're doing a) but maybe getting someone that provides
Tested-bys whenever you test the releases would be good.

Cheers,
Conor.


--r/gcDu4EFBEr9fnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd0C1wAKCRB4tDGHoIJi
0u/MAQCeW2ubw3mJ60qwhWI9XYdVEt3d//hBXTomA1zTo7JPogEAjynbFf7kHRRo
t6KM+bwe0KkDGAzlO9lor7hooH2m2A8=
=JHXN
-----END PGP SIGNATURE-----

--r/gcDu4EFBEr9fnP--


--===============5367403185308235391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5367403185308235391==--

