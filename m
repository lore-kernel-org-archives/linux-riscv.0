Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E3AC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 11:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BwrG832wY+NRL8x+078p4YbvA2EaIiUbpCuKlVl9UE=; b=N3WAmqIYjVsTEzEhAIq3sqNkDi
	JQrg2PkparQAp+kMJ6TyzKuRI7p1MAIhMxRyuzKuwRoISFTEVuPaQT4yPCSi6pnnseO5N1dS32hXx
	13ursp/d3HX1SWokf7AIVt2866mURheOmA7wljU6YX/1yk0bzJCDNolrxSvuJs8J2dYyY8GEKScAR
	34UtWA38GOdBKnJ/ize6PDdLfBXOdehZuk1wY6d8f6o+19Ko4E43a48pxr8LdwPr5qH878DjIg7lN
	KBtVBIpEYZ8rfpgz66vCigWi9/xM8/HjNZ6nq8iyuoKJFmAtmwNbl9z28ws9UP8pCYf+Y90j7Pu0o
	CaO/m0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IUT-007vaX-16;
	Wed, 29 Nov 2023 11:12:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IUQ-007vXf-0r
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 11:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACA0261AAC;
	Wed, 29 Nov 2023 11:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518E2C433C8;
	Wed, 29 Nov 2023 11:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701256341;
	bh=/coNSpmuwlu7aZMGLXJ3EaK+coscmuirD3fIRDyp1uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHW9BMYgIEhTEqKl/kgeus1mAfaC24bTLFknNCVdCgivrIV4xIareTJc1aZl+7sg8
	 tcJX1bZeT2v9L+VJjvSiC5P1wvRy/Kaa7TCTB/wtLhA9wymeZk/tG2lN3rTphc1yN7
	 xIDXXbyvd7kPzrMMaO0T7Et6s2qh57vQaCxKBuIdNBMubVuxknQru14j89u+71Jv2R
	 nPuTTXXcT8FyQS0Spn1TW/ubqWFQJSlS4+aBBoBUP5lels3jhRndKCOYNkjFn8yCfC
	 AXmM2L+J/u2dSrpUShsC1fUBQQ+/CTFTF0wg/cU46H+b/BIadIzGxYgmqVR0kR+5kl
	 GxePfv72XOs8A==
Date: Wed, 29 Nov 2023 11:12:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, herbert@gondor.apana.org.au,
	davem@davemloft.net, conor.dooley@microchip.com, ardb@kernel.org,
	heiko@sntech.de, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 04/13] RISC-V: crypto: add Zvkned accelerated AES
 implementation
Message-ID: <20231129-subtitle-unlinked-c0871a28ac88@spud>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-5-jerry.shih@sifive.com>
 <20231128-await-tipper-2094715466f2@spud>
 <20231128201228.GE1148@sol.localdomain>
 <E78B3BF9-8E49-417B-A89E-05F72690A92F@sifive.com>
MIME-Version: 1.0
In-Reply-To: <E78B3BF9-8E49-417B-A89E-05F72690A92F@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_031222_392952_B112878F 
X-CRM114-Status: GOOD (  24.02  )
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
Content-Type: multipart/mixed; boundary="===============8363306375348925771=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8363306375348925771==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YXU66bvB/doJduzO"
Content-Disposition: inline


--YXU66bvB/doJduzO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 10:39:56AM +0800, Jerry Shih wrote:
> On Nov 29, 2023, at 04:12, Eric Biggers <ebiggers@kernel.org> wrote:
> > On Tue, Nov 28, 2023 at 05:54:49PM +0000, Conor Dooley wrote:
> >>> +static inline bool check_aes_ext(void)
> >>> +{
> >>> +	return riscv_isa_extension_available(NULL, ZVKNED) &&
> >>> +	       riscv_vector_vlen() >=3D 128;
> >>> +}
> >>=20
> >> I'm not keen on this construct, where you are checking vlen greater th=
an
> >> 128 and the presence of Zvkned without checking for the presence of V
> >> itself. Can you use "has_vector()" in any places where you depend on t=
he
> >> presence of vector please?
> >=20
> > Shouldn't both of those things imply vector support already?
>=20
> The vector crypto extensions imply `V` extension. Should we still need to=
 check
> the `V` explicitly?
> https://github.com/riscv/riscv-crypto/blob/main/doc/vector/riscv-crypto-s=
pec-vector.adoc#1-extensions-overview

The check for Zkvned is only for whether or not Zvkned has been provided
in the DT or ACPI tables, it doesn't mean that the kernel supports the V
extension. I could see something like a hypervisor that does not support
vector parsing the "v" out of the DT or ACPI tables but not eliminating
every single extension that may depend on vector support.

The latter check is, IMO, an implementation detail and also should not
be used to imply that vector is supported.

Actually, Andy - questions for you. If the vsize is not homogeneous we do
not support vector for userspace and we disable vector in hwcap, but
riscv_v_size will have been set by riscv_fill_hwcap(). Is the disabling
of vector propagated to other locations in the kernel that inform
userspace, like hwprobe? I only skimmed the in-kernel vector patchset,
but I could not see anything there that ensures homogeneity either.
Should has_vector() calls start to fail if the vsize is not homogeneous?
I feel like they should, but I might very well be missing something here.

> >> Also, there are potentially a lot of places in this drivers where you
> >> can replace "riscv_isa_extension_available()" with
> >> "riscv_has_extension_likely()". The latter is optimised with
> >> alternatives, so in places that are going to be evaluated frequently it
> >> may be beneficial for you.
> >=20
> > These extension checks are only executed in module_init functions, so t=
hey're
> > not performance critical.

That's fine, they can continue as they are so.

Cheers,
Conor.

--YXU66bvB/doJduzO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWccjwAKCRB4tDGHoIJi
0i5BAP9Hco6K4yVD6S5aXOUTYMtHVQcZxhQ+VfDhgiERySBDLgD+LCnaxJynwJot
3xWQVY1/DM6nF8Rg8OJO6T63AZfqYQI=
=4b6u
-----END PGP SIGNATURE-----

--YXU66bvB/doJduzO--


--===============8363306375348925771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8363306375348925771==--

