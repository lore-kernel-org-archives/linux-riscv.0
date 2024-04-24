Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE1AC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XdCugrbxSGWw/8ZcZdfbiyStdcE/AiA4jtStahDJVk=; b=ZQNpL5lVU34SjUwrKGrv4RXlFe
	HayXma9VoA8aDp+SkVWAoNngBIZcqJqDvo0KQ2CV25QHPQLpLTQimYMzk5RNh4fRHzq4SWq3gIIsX
	FV4REg11Lqm+4vkLgYhsba6r1cObOKLsrXW0LmKQQm6bnJ/sb7jq4Ny0T9rZxZPcThGJQf+VgCumq
	7wRFf4suUCcMQT5i9lhiRfUdltJ9ZeN9KIzSdZ2SfjdfzchEwDwv+pBMl8rTPlcwPwWV4+VLeMAa1
	Bh0aJp6HpElYnH/WUO1oDSow+QLcnZ2eC5gQ77BBfJSdWNAnOybKN10pAJ0IsmnqdLduLnLBWDoMI
	Slj+uttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzk2D-000000065U4-0Vmz;
	Wed, 24 Apr 2024 21:20:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzk29-000000065TC-1c9m
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 21:20:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7194C61CC2;
	Wed, 24 Apr 2024 21:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85A1C113CD;
	Wed, 24 Apr 2024 21:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713993604;
	bh=X6Q9ghuC9MoxCqz0X5W6CSwrUiieo8LutjHaTxzEVbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fd8kvaDOeXZL5y64ttw8eQA9sONEoZWFri5CsY1hXnVWe+ukzQ8bOO55HLiBYCk2p
	 C71r+T1woIoKpvMx2Psv1DCKbo2KtIY0qayeQ957IRTCGlAuX85mVXdOcNhNodAwa5
	 nhDeAyHukDKqwe9RUMZNiarbpUnLym7XhK4c3AEYtMcS0ep+PwJzn0A+b4caZxJS4h
	 UJ2ZEKhAPsvl0fVW/RvstOJd0RaJoCRpVjzPqYr+GIy3IB56EV/b7GHi0cUvqf6YvI
	 8/0noULFpvVD7ejenEJIZQj4RmdDZyDP6q3/eLJn2aTUqIER3DB8NFpyWO9zCI3YL3
	 7FOjRmQuH+0lA==
Date: Wed, 24 Apr 2024 22:20:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] cache: sifive_ccache: Auxiliary device support
Message-ID: <20240424-recolor-deviation-29a5dd4e9499@spud>
References: <20240410232211.438277-1-samuel.holland@sifive.com>
 <d738dfc0-66af-4dad-bd60-a68c900bf807@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <d738dfc0-66af-4dad-bd60-a68c900bf807@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_142005_512298_7F926F98 
X-CRM114-Status: GOOD (  23.60  )
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
Content-Type: multipart/mixed; boundary="===============0791270373271048608=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0791270373271048608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xuJOMISUXHsgfGn1"
Content-Disposition: inline


--xuJOMISUXHsgfGn1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 10:19:18PM +0200, Alexandre Ghiti wrote:
> Hi Samuel,
>=20
> On 11/04/2024 01:22, Samuel Holland wrote:
> > As of commit c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a
> > platform driver"), the cache subsystem binds a platform driver to the
> > Composable Cache's DT node. This prevents the perf subsystem from doing
> > the same for the new PMU driver[1]. To allow using both drivers at the
> > same time without conflicts or module linkage dependencies, attach the
> > PMU driver to the auxiliary device bus. While at it, prepare to use the
> > auxiliary device bus for the EDAC driver as well, which significantly
> > simplifies that driver. The actual EDAC driver conversion has to wait
> > another development cycle to avoid dependencies between git trees.
> >=20
> > [1]: https://lore.kernel.org/linux-riscv/20240216000837.1868917-3-samue=
l.holland@sifive.com/
> >=20
> >=20
> > Samuel Holland (4):
> >    cache: sifive_ccache: Silence unused variable warning
> >    cache: sifive_ccache: Use of_iomap() helper
> >    cache: sifive_ccache: Export base address for child drivers
> >    cache: sifive_ccache: Add EDAC and PMU as auxiliary devices
> >=20
> >   drivers/cache/Kconfig              |  1 +
> >   drivers/cache/sifive_ccache.c      | 94 +++++++++++++++++++++---------
> >   include/soc/sifive/sifive_ccache.h |  8 +++
> >   3 files changed, 74 insertions(+), 29 deletions(-)
> >=20
>=20
> I took a quick look and I'm not sure if the whole patchset is a fix for 6=
=2E9
> or if only patch 1 is?

Only the first patch is IMO, but it is a fix for a patch I applied so
it'll go this week via the soc tree with those auto-update fixes.

--xuJOMISUXHsgfGn1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZil3gAAKCRB4tDGHoIJi
0tEpAQDcI7yoAdCPL60ujB1LzolN4SJJmStybk3ftfXpKvZmLwD/WvBnGvK5ezjN
smI6d1HvJ3B7DEPaIjmTZJUFrQB1TA4=
=7AyF
-----END PGP SIGNATURE-----

--xuJOMISUXHsgfGn1--


--===============0791270373271048608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0791270373271048608==--

