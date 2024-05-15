Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CE9C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgU6eW74ziQv1zg7FHXNSCwj8FWWUUIQcUlpwEN2DPk=; b=XC7BeXb8ZoW0XBKcUGUB24Z99F
	WtT8DxrFYmb1aWfyHde1kiD++g95ZzfRFqAHXvP0J1fNlHdKoLOZ6pqVQtGXABR3cfM9PTj6DzCxg
	bNMyEMonLhgsHLMfL5HC9vp3DpM/Y006RAoaCHsuoFLxN7+oiRhIAIJS1N54a6QsmO73g+suDDpAa
	X/W0NcgdkGwOHNOIGQy6YkO1VhKn+vI7Rzc6R+cWRkzoamHfyIUOCkxEOGX/LMaY+BEalH3jE4xaE
	JjkXpTukz3ME7hV0OxLgDRKCVTmtgdZttnxdW4jmxpHPXshyebN8uv7+rTQ1SLIbt76gv3kDgBEQJ
	QJEV9BJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Fjn-00000001q3E-3d2n;
	Wed, 15 May 2024 14:36:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Fjk-00000001q0p-2Ba5
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 14:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA7B8CE1707;
	Wed, 15 May 2024 14:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C58DC4AF07;
	Wed, 15 May 2024 14:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715783680;
	bh=j/XnY4Ou9a6eJs+MOmPai9peUKhp5Tll7YO5cG6SzzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UUEUoATWfr34myIc0rnXR0ELSQlSHOVVtrffGh6wdBaiV1iMv8fn/Dylc4VdJ7eIa
	 z/IFSMUy5AAksOk8fPYFcD+kchrQ7y3ZuqZNyKrqyK3WKhfCnBGUNFqGE5++MQtMe9
	 UWv8nfk3G7wo27kskoEEljP1JbNJa912uxc7ud7NiI9Dqq3CjYG1CXz82ykprcqjcC
	 XJbjW1RX5pJ/KbOjpoC8Dh/uCKH/UBs1EkGLSo9sWLNnh7y2agam9IlM7QXGabTwn7
	 uxFm+Y7weh8PId23dRle1mBqIN8DBiLDmd/w/HHsHJzZu9tb5esgvWVkYo0Zs1n4W/
	 bIqV0TDUTF60Q==
Date: Wed, 15 May 2024 15:34:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V
 Kconfig option
Message-ID: <20240515-subpar-implement-6fcf333ce9d3@spud>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240507-compile_kernel_with_extensions-v2-2-722c21c328c6@rivosinc.com>
 <20240510-earthly-regress-7a8c8dba55db@spud>
 <Zj6U7sZNNh8GQPYM@ghost>
 <20240510-pursuable-oppose-e0b8430271f6@spud>
MIME-Version: 1.0
In-Reply-To: <20240510-pursuable-oppose-e0b8430271f6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_073608_934168_4CF494BE 
X-CRM114-Status: GOOD (  30.78  )
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
Content-Type: multipart/mixed; boundary="===============5575216869865377522=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5575216869865377522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZKjQ/5BhNQvy54yM"
Content-Disposition: inline


--ZKjQ/5BhNQvy54yM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 11:26:22PM +0100, Conor Dooley wrote:
> On Fri, May 10, 2024 at 02:43:10PM -0700, Charlie Jenkins wrote:
> > On Fri, May 10, 2024 at 09:43:33PM +0100, Conor Dooley wrote:
> > > Hey Charlie,
> > >=20
> > > On Tue, May 07, 2024 at 06:36:28PM -0700, Charlie Jenkins wrote:
> > > > Current versions of the kernel add "v" to the march and then immeid=
ately
> > > > filter it out such that "v" is not passed to CFLAGS.  Instead of do=
ing
> > > > this filtering, code blocks in the kernel that want to use vector
> > > > assembly have been changed to locally enable vector (using ".option
> > > > arch, +v").
> > >=20
> > > Other content in the series aside, since this is a change that could =
be
> > > made independently of the main series objectives, I figured it was wo=
rth
> > > pointing out that this is not a change without downsides: I think that
> > > it would drop support for vector with most versions of LLVM as
> > > .option arch support there is much more recent thing than it is for g=
cc.
> > > Off the top of my head I don't know exactly the versions involved, but
> > > it is something like LLVM-14 supports vector but only LLVM-17 and lat=
er
> > > supports .option arch.
> >=20
> > Toolchain incompatibilities are always fun. It does look like .option
> > arch was introduced in LLVM-17. That would be a regression. We do use
> > .option arch for every other extension, but vector was treated special
> > when it was introduced unfortunately so maybe we have to live with the
> > weird march parsing hack.
>=20
> I wrote out a long message about the history of some of this, but right
> at the end I was scrolling through my chat logs with Andy and realised
> we actually did make it depend on AS_HAS_OPTION_ARCH, so it should be
> safe to do without regressing anything. I didn't notice in the diff that
> the AS_HAS_OPTION_ARCH was a movement, not an addition. Maybe Andy knows
> why, despite the dependency on the assembler having it, we didn't use it
> everywhere.

And while I remember, the bits of this doing the .option arch conversion
should be (IMO) split into a different patch to anything dealing with
Kconfig options etc.

Cheers,
Conor.

--ZKjQ/5BhNQvy54yM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTH/AAKCRB4tDGHoIJi
0szcAQDBzSfhT6hyr1aMrYz0B6QSH4FaqNn9GXsP9yi3ZgA6aAEAqEXaBTtCPjux
6DPqxss1XZfW3iAObMh2xDZIwaJlnQk=
=+Ld6
-----END PGP SIGNATURE-----

--ZKjQ/5BhNQvy54yM--


--===============5575216869865377522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5575216869865377522==--

