Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CCBC25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+QXwBDWHZAfARoRyVtOuBbE4ViL1pshyrmaVfavHao=; b=e14hufca9GPrLVJ4ptcD8odLkN
	1R1YcxjMw9hqTELRchIKv6lPkHg3+Jt/KF4vlgcR8/FP+KFHrbodGCckR3vDDzAuaRHpuyDHEVFS5
	+oDOU4/NUERlFzASJ+Dia7strNz1JHGV6TVPDvqadVTVE8LeON3cwjqTL4guMPDOlkMLtgrHPPNH3
	9hsUaZ3lwUE9QZHG4FOymf9NohWd4nsc0DsE7Df3tWB9DfOvQ09x/T+vmZrxJ7cOPjQkkCL+tySHq
	wf2YVa2JP7Ik82VZl6sCLVrs9kmpd1icpKK0Zcnfw/7NhYU5MzPijIl+V9mrsoz8VLP8+5zz9mpJj
	NCLqyWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5LZc-00000004Ucx-29DZ;
	Fri, 10 May 2024 08:25:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5LZY-00000004UcM-2OT9
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 08:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AE9ACE1CC0;
	Fri, 10 May 2024 08:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210FFC113CC;
	Fri, 10 May 2024 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715329541;
	bh=x7eOLArKZlJ6Jjdv6wdjIvSJbMgG4/RroQBS+sVq94A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvX2y8ZJLu3RkYqJQvbbcfiofmJLuXo21dv+0w1PP6AlhjElmbUmTWBcJJrFwvX6z
	 TYbMWTxPHVB8/qwTRmfUfsOakuPE3H+qCB1swBQKz+6VrAfxpixQbMvDODiGu2BD2v
	 /neuwXES6X9NQfx/fbQ5dRuJFrULKWHh1ixC4xcQVOZZV7DNzvZlLJ/hQq8DovubR5
	 Y6Nui23vJGpF4M5ZixJVHqGUfQlFqkl0sjFvf+vh2dWrk90McnfW5e8TOGvekx5xhB
	 7K7lFembeD4k211WzPEYLmn/CE22TvH62rysGn/qy4qK1m2aJv6bZeVkPtnRq/Bx1p
	 4UdPP3KDnzRcQ==
Date: Fri, 10 May 2024 09:25:37 +0100
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
Subject: Re: [PATCH v2 0/8] riscv: Support compiling the kernel with more
 extensions
Message-ID: <20240510-okay-trade-8826cb134979@spud>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240509-uptown-aging-5bdec4730d70@spud>
 <Zj09IUE5k1EJL08X@ghost>
 <20240509-google-passing-3e7577235c44@spud>
 <Zj1UUIY8RYV1kJLM@ghost>
MIME-Version: 1.0
In-Reply-To: <Zj1UUIY8RYV1kJLM@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_012545_067249_8D0D2D79 
X-CRM114-Status: GOOD (  34.09  )
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
Content-Type: multipart/mixed; boundary="===============4113144437047495373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4113144437047495373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EwfUi93w0+FmVOuD"
Content-Disposition: inline


--EwfUi93w0+FmVOuD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 03:55:12PM -0700, Charlie Jenkins wrote:
> On Thu, May 09, 2024 at 11:08:34PM +0100, Conor Dooley wrote:

> > Maybe if you read what I wrote you'd see what I was getting at, or maybe
> > not as I might not have been sufficiently clear. I'm not saying that th=
is
> > particular optimisation is not worth having, but rather than I wanted to
>=20
> I seem to frequently give you the impression that I don't read what you
> say before responding.

Does it happen frequently? I don't really recall it annoying me before.

> What we each view as "important" in the kernel is
> different so we come from different places when approaching a problem. I
> respond in the way that I do not because I am not listening to you, but
> simply because I have a different opinion and I am not explaining that
> properly.

If you're trying to describe a different opinion, responding to the bit
I was talking about, as you do below in your latest response is ideal.
Responding inline but not actually addressing the points I was making
did make me think you were [un]intentionally ignoring what I was trying
to say.

> > see why this particular optimisation was worth maintaining 3 code paths
>=20
> I interpreted the "3 code paths" as with Zbb + 64 bit, with Zbb + 32
> bit, and without Zbb. I directly responded to that by saying that we
> could eliminate all of the code paths that are not Zbb + 64 bit could be
> eliminated. I should have given performance numbers for these alternate
> cases too, and somebody should have asked. I agree that performance
> needs justification, and I understand that I did not provide ample
> justification in this patch. All other architectures optimized these
> code paths so I figured that was sufficient justification for riscv to
> do the same, but I understand that it is not.

And hey, if you look at the commit in question, who acked it? I'm just
saying that I think we should have a higher standard going forwards.

> > for but the commit message does not detail any of the benefits, and
> > looking at the cover I discovered that it was not tested in hardware nor
> > seemingly with a real test case.
>=20
> It's hard when riscv currently is very focused on microcontrollers.

Zbb is actually implemented in hardware, so testing it in the real world
is not a barrier. Palmer probably has a JH7110 board that someone gave
to him is not using...

> These changes are in order to help future hardware that is more focused
> about performance.

I'm not replying to most of your response rn, got other stuff to do, but
what I was trying to say is that I think the point at which optimisations
for future hardware/extensions should be merged is the point at which
those extensions are no longer future.

> That's why I contribute this upstream with the hope
> that other people, like me, care about performance.

Heh, that could be read to mean that I do not care about performance,
which wouldn't be true.

Cheers,
Conor.

--EwfUi93w0+FmVOuD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj3aAAAKCRB4tDGHoIJi
0nK5AQCoDMSe9DzUyhpQR58HC2BsiABcEwTWZgGhSBBKbfG+FgD+LfsnoPklGhGT
eJ6+WpbCfqceocD7hR5oKi+JaTKMMAs=
=9cVI
-----END PGP SIGNATURE-----

--EwfUi93w0+FmVOuD--


--===============4113144437047495373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4113144437047495373==--

