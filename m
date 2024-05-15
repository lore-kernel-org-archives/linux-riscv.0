Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B7AC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzMyIKEG8HgfALS1xGYegbLDZTyO27KEZLr+zuFv96w=; b=bKZqKzVErNIXsWhv6+CIqV7Hme
	0L2cxqNV2ZlOAunqcpZD5z8DqpebMP6hVI269KqDA7v7rXydvJgo8KTWMNExlXa8GIynJorgHiDGb
	q7jJOhQ0scf6NznGvk5d14zT4HvowGNqri9S5oz5KcNaq+4D8x7LwlKSF1l4KC4FfqSFLlR2JrY6i
	5lcaO0ZH9fv18UHFB4/CJjXYwius1ND/v1V4SDQuWADJLM06xs+quKK1iomZz9YIcBDoObrB7yy6y
	eGPhyat42mMpQ0VqcAgoHuHrHQ6i0GeMG0oS2Bve9UAyCiOaY4yN5EtXCzTpiXbw6R5Euog79cy/L
	zNYVvh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7GqX-000000020Jh-41XQ;
	Wed, 15 May 2024 15:47:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7GqU-000000020Ih-3UNX;
	Wed, 15 May 2024 15:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C70D2CE172D;
	Wed, 15 May 2024 15:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E30C116B1;
	Wed, 15 May 2024 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715788027;
	bh=3i/POYwuo5W+l1r5f3w06dIkd/xGPKue75hnlbOliL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DF8iYYpJshvHDiL0aN1ynB1Xamqclpnm5VsF7Gb/scp5CbHlyYhY5T6KjtGiHzTWB
	 sWCeWecwaskt/I+Se+I3+9jzLZjdY5WApFbu3g1OU5/C6SaH5PdArGhjOmQRjdOnga
	 oP59kEoDooOB60AOf8sX0eXbvIVaWJXrLq5c73G96g77s/fPb3AdEbaGIB9tW30mZy
	 cuqbdplphnJa87SWxpquy/ytCaiuCmEJ4wGgHYnHeLM1rq9VjxZzEFYhy2Yfl5qbj3
	 +bkm2C9PCQexxHPocoNrwfFVB3ivvjrBCzeuYrYS9/WwLBVfG515YR8ixV2OW91ZdT
	 UvrWLVPJ+JMqQ==
Date: Wed, 15 May 2024 16:47:02 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 02/11] riscv: add ISA extensions validation
Message-ID: <20240515-bucktooth-squiggly-4facfc989f28@spud>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240514-headcount-shrill-390ac0b9233c@spud>
 <7a26604f-2653-4140-9294-637b340282d1@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <7a26604f-2653-4140-9294-637b340282d1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_084711_075369_AF39393E 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Type: multipart/mixed; boundary="===============7630912815719355602=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7630912815719355602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B+OPq6rJ8plGHjIi"
Content-Disposition: inline


--B+OPq6rJ8plGHjIi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 03:26:23PM +0200, Cl=E9ment L=E9ger wrote:
> > This function is badly in need of some new variable names for the first
> > two parameters. It's hard to follow what each of them is meant to be
> > once you're inside this function and removed from their definitions.
> > The first parameter is the source bitmap that we've already filled from
> > the dt/acpi scan of that hart and the second is the per-hart data
> > structure that we're gonna assign it to and keep "forever", I think the
> > naming should reflect that.
>=20
> Yeah, wasn't sure of the naming at all. Would you be ok with the followin=
g:
>=20
> - source_isa: Input ISA bitmap parsed from ISA string (DT/ACPI)
> - resolved_isa: Output ISA bitmap resolved from the first one
> (configuration and extension dependencies matching).
>=20
> Since I'm a non-native english speaker, I'm not sure at all if it
> correctly means what they do, feel free to tell me if you have some
> better options.

I think those are fine, thanks.

--B+OPq6rJ8plGHjIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTY9gAKCRB4tDGHoIJi
0gfyAQD3gQ7fCpehp/K+Pj9OiStbPvZMpDXqnSuJw6Duajbu8AD+NUc2u8OiReCl
xfifv7AgIuj7zJ7HphX1WRFq4KJc6wQ=
=cKSf
-----END PGP SIGNATURE-----

--B+OPq6rJ8plGHjIi--


--===============7630912815719355602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7630912815719355602==--

