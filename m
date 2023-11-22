Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63ACC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYM/9ShnVwsX/XhpTnDe2SZ8vC5L+g0bERGQz1RolZ8=; b=YTLiU/i+TDeoZafSF+GmIF9UuW
	y3mbOanwMHoyoN0X5PuNKmXr/1EARkeo5eJJb1gbDfkpFY/1foy6//6e8uJiAruOWUyCmysFv/FuC
	xYxhlY7CDnbHNpocCd29OGXXvKV+BMBsCxkAmR448QYAMOf96buOyxq6kYOyQc8u6Nv5OB+iu+9ny
	H/g7O6lZiC/DvTE062Up/363qLAX63EZ8c9t4Nrct2b0Sx7FyTaV0qopdMKaisNjOx/1m8wXomuSF
	j/b7xXOSMbB96UVjWuIkwk0ZFPKFpN5acMlJrxlE8Mvs6ocpC/HiYZtSEhx83tEK2cigPPG3O9pa8
	uCzjerQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rpc-002ngN-1k;
	Wed, 22 Nov 2023 18:20:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rpZ-002nfC-0G
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 18:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3923CE2563;
	Wed, 22 Nov 2023 18:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73061C433C8;
	Wed, 22 Nov 2023 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700677206;
	bh=nkZlaJwfo+V2BOfC+0q1NUdNuKi157V0je+RZmbYjyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqMb3fRtSGpM264Q/X+r9Lc4ASZuUM8LRktFpUUOJ3hdGw+wHbwis7LyCwxrXzNYT
	 swSwg0XYFEOhwB9k2wV1Fye/mohrmhIiAce+Uhu6yl7adJ1qPtWWAY05yGxDStf231
	 3GbmhcLMee8pYot3pZRKhX4/AwIFGIDSTtCZKBLpeGlEHRq2GyS+9gC0TqFLNLMxM7
	 w0tQUvxan8VETFkQEFkWZBa+NaZtk6vmLhWS3WxriAf6K/+ok/O4o6Xa2axSTWz5Ea
	 GTAV06iAJrxIGhgh/zQonRDlzpbp18XIlJcQjb+g1w28RCn2pQCbPgObD3W/IyMNs3
	 j94dmdB/IdptQ==
Date: Wed, 22 Nov 2023 18:20:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, andy.chiu@sifive.com, greentime.hu@sifive.com,
	guoren@kernel.org, bjorn@rivosinc.com, heiko@sntech.de,
	ardb@kernel.org, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
Message-ID: <20231122-bulldog-deceased-7e3dadf3a833@spud>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
 <20231102054327.GH1498@sol.localdomain>
 <90E2B1B4-ACC1-4316-81CD-E919D3BD03BA@sifive.com>
 <20231120191856.GA964@sol.localdomain>
 <9724E3A5-F43C-4239-9031-2B33B72C4EF4@sifive.com>
 <20231121-knelt-resource-5d71c9246015@wendy>
 <3BDE7B86-0078-4C77-A383-1C83C88E44DA@sifive.com>
MIME-Version: 1.0
In-Reply-To: <3BDE7B86-0078-4C77-A383-1C83C88E44DA@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_102009_585508_D6CE1609 
X-CRM114-Status: GOOD (  25.39  )
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
Content-Type: multipart/mixed; boundary="===============1333885808099410113=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1333885808099410113==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vzAb+aUYU4qXrR/Z"
Content-Disposition: inline


--vzAb+aUYU4qXrR/Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 01:37:33AM +0800, Jerry Shih wrote:
> On Nov 21, 2023, at 21:14, Conor Dooley <conor.dooley@microchip.com> wrot=
e:
> > On Tue, Nov 21, 2023 at 06:55:07PM +0800, Jerry Shih wrote:
> >> Sorry, I just use my `internal` qemu with vector-crypto and rva22 patc=
hes.
> >>=20
> >> The public qemu haven't supported rva22 profiles. Here is the qemu pat=
ch[1] for
> >> that. But here is the discussion why the qemu doesn't export these
> >> `named extensions`(e.g. Zicclsm).
> >> I try to add Zicclsm in DT in the v2 patch set. Maybe we will have mor=
e discussion
> >> about the rva22 profiles in kernel DT.
> >=20
> > Please do, that'll be fun! Please take some time to read what the
> > profiles spec actually defines Zicclsm fore before you send those patch=
es
> > though. I think you might come to find you have misunderstood what it
> > means - certainly I did the first time I saw it!
>=20
> From the rva22 profile:

"rva22" is not a profile. As I pointed out to Eric, this is defined in
the RVA22U64 profile (and the RVA20U64 one, but that is effectively a
moot point). The profile descriptions for these only specify "the ISA
features available to user-mode execution environments", so it is not
suitable for use in any other context.

>   This requires misaligned support for all regular load and store instruc=
tions (including
>   scalar and ``vector``)
>=20
> The spec includes the explicit `vector` keyword.
> So, I still think we could use Zicclsm checking for these vector-crypto i=
mplementations.

In userspace, if Zicclsm was exported somewhere, that would be a valid
argument. Even for userspace, the hwprobe flags probably provide more
information though, since the firmware emulation is insanely slow.

> My proposed patch is just a simple patch which only update the DT documen=
t and
> update the isa string parser for Zicclsm.

Zicclsm has no meaning outside of user mode, so it's not suitable for
use in that context. Other "features" defined in the profiles spec might
be suitable for inclusion, but it'll be a case-by-case basis.

> If it's still not recommend to use Zicclsm
> checking, I will turn to use `RISCV_HWPROBE_MISALIGNED_*` instead.

Palmer has commented on the rest, so no need for me :)

--vzAb+aUYU4qXrR/Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV5GUAAKCRB4tDGHoIJi
0oykAP4922JGXnpu07g8YFB8/6OUEt+yMcyfCYkI5roxjxUMvAD+IKrCIgs4o3KE
2V2NnvtXaLmpQQqGQ0bwPy/0N681yg4=
=fOfP
-----END PGP SIGNATURE-----

--vzAb+aUYU4qXrR/Z--


--===============1333885808099410113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1333885808099410113==--

