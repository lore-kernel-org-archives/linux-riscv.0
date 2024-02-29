Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BE8C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNVgGfIyEVtaRZkLlFqhoaRKzZPN31SwCCGwtnyrAcQ=; b=mfz8sIkRowLYKGBQNJBtodvtJ5
	2pXbrEfkCbDW3FVrMBJa9YwS2RyKtb1CNWSe8qJ5Hy8puIPGXwkW2DTZJ3yrq3Llfl8PpwaGme4eC
	v4H8tXRXa8rc+e0N1h4LaF/pNI1fbKAscC7UlWbB507bty5dsA6w7lDge99NVFD+YHmeas7TXsdJp
	1kLTKse6UwryYsiedbBXCwEPYaZyC7pOPPljsUM0AyCqib2FiP0BeniSX4lak3+AvlEnglT9lTVCS
	hkNdsLHJdkT4a2jJ0Oh8bvjrJlzrViVnBoJNf1+RXaLYbIiXSmOinfAtGA0OJ/PkBkTXEGVuGughN
	o7TNBmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflAi-0000000EjLL-1P0w;
	Thu, 29 Feb 2024 18:30:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflAe-0000000EjJp-3UQF
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 18:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33368CE1D9C;
	Thu, 29 Feb 2024 18:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC719C433F1;
	Thu, 29 Feb 2024 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709231414;
	bh=2HgWWLtX9NUghm/JjXanG4wu76srdSHYfyF5THzKR88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ni84BdSM7Em3xnOJzG6vi0AKZYqeNW7xAwZ5Us57psuqfBpI4UveM8rnKCRxxlS2h
	 VlQ80j+REd4wrXfVuNNNLx22ew0i4roVR7r5j35knJUrf5ZtrE7rZiUlhL4zrXLn2e
	 3MAwsvG+s3myp+TYpk0LLThNRVxEgai4HsbzQ79ulyOYh6SEjn9pPgcqu1iJytUC0Q
	 cKYwYNl1mMm49OHc0WiK3WHAGHwOkfvBGiI1RrL7op5eLtMRAn1dM4tXZnEQ4lC4We
	 rNaCRRkY3kx0Ah14xmQgM228rVzhXRR3tx6cliaKsWsSoZqetYk9+l4CT/v44ALhlt
	 TNFlaVoEQobdQ==
Date: Thu, 29 Feb 2024 18:30:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: samuel.holland@sifive.com, ajones@ventanamicro.com,
	linux-kernel@vger.kernel.org, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, sorear@fastmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH -fixes v4 2/3] riscv: Add a custom ISA extension for the
 [ms]envcfg CSR
Message-ID: <20240229-establish-itinerary-5d08f6c3ee43@spud>
References: <20240228-goldsmith-shrine-97fc4610e0bc@spud>
 <mhng-94e8034f-eda3-45df-bcf0-1bd5bd9cb869@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-94e8034f-eda3-45df-bcf0-1bd5bd9cb869@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_103017_242856_F7A09CB2 
X-CRM114-Status: GOOD (  31.86  )
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
Content-Type: multipart/mixed; boundary="===============5763703428983462100=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5763703428983462100==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ch+3PeRyra/9QFRf"
Content-Disposition: inline


--ch+3PeRyra/9QFRf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 10:23:39AM -0800, Palmer Dabbelt wrote:
> On Wed, 28 Feb 2024 02:12:14 PST (-0800), Conor Dooley wrote:
> > On Tue, Feb 27, 2024 at 10:55:34PM -0800, Samuel Holland wrote:
> > > The [ms]envcfg CSR was added in version 1.12 of the RISC-V privileged
> > > ISA (aka S[ms]1p12). However, bits in this CSR are defined by several
> > > other extensions which may be implemented separately from any particu=
lar
> > > version of the privileged ISA (for example, some unrelated errata may
> > > prevent an implementation from claiming conformance with Ss1p12). As a
> > > result, Linux cannot simply use the privileged ISA version to determi=
ne
> > > if the CSR is present. It must also check if any of these other
> > > extensions are implemented. It also cannot probe the existence of the
> > > CSR at runtime, because Linux does not require Sstrict, so (in the
> > > absence of additional information) it cannot know if a CSR at that
> > > address is [ms]envcfg or part of some non-conforming vendor extension.
> > >=20
> > > Since there are several standard extensions that imply the existence =
of
> > > the [ms]envcfg CSR, it becomes unwieldy to check for all of them
> > > wherever the CSR is accessed. Instead, define a custom Xlinuxenvcfg I=
SA
> > > extension bit that is implied by the other extensions and denotes that
> > > the CSR exists as defined in the privileged ISA, containing at least =
one
> > > of the fields common between menvcfg and senvcfg.
> >=20
> > > This extension does not need to be parsed from the devicetree or ISA
> > > string because it can only be implemented as a subset of some other
> > > standard extension.
> >=20
> > NGL, every time I look at the superset stuff I question whether or not
> > it is a good implementation, but it is nice to see that it at least
> > makes the creation of quasi-extension flags like this straightforward.
>=20
> We can always add it to the DT list as a proper extension, but I think for
> this sort of stuff it's good enough for now

Perhaps good enough forever. I was not advocating for adding it as a
permitted DT property - I was just saying that I didn't the complexity
that you mention below, but I was pleasantly surprised that the stuff
?Evan? and I came up with allows for this kind of inferred "extension"
without any changes.

> -- we've already got a bunch of
> complexity for the proper ISA-defined extension dependencies, so it's not
> like we could really get away from it entirely.

--ch+3PeRyra/9QFRf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeDNMgAKCRB4tDGHoIJi
0phyAPkBd+aPNH1/saAdNEh6ILJZUG6mCtcyhkUgdb1752vlrAD/RIO8+81FcJN+
11exmk/RMWj7ZuE4xehnYEvsq43w5w4=
=t2I+
-----END PGP SIGNATURE-----

--ch+3PeRyra/9QFRf--


--===============5763703428983462100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5763703428983462100==--

