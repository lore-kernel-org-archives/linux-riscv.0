Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472EEC7EE22
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DuXyHpSkbzWt4qLgSAH2D7HzDRhBAY6C6I2hU6i9Ho=; b=SJ1dyBGe61npEJbSqJHE7uz9uA
	cDqhvlMynOx9SKRsU4w8HpseM2EA8WiAPvQgX7QTKTrHtTzcL6EO7teN5vq7r3gpIfnF2fYfwnrRX
	FrrP+hWUQhUjKPjxL5LqyI3OTkztLcjBo/G8z+nvSL4F6yL5lzHc4WdBapdyPLjRjworAUl2vwkmW
	a7XJ/GZBZf5BEOlP5wktXq337u9zC6PVT9ARb5mvEj4unoHbSsqZtKV4tGIcha1FQmT5ppygwugko
	yPvA0UhPNfIhjPv69U7eXgC9GCYIeunzAD+Oy1jW4gpSGtJsTyK87qdZHFq8GTMfFUJqGTgt3Mkd5
	VZt+05Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1py8Mh-00Gsa0-1b;
	Sun, 14 May 2023 09:50:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1py8Me-00GsYl-2t
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 09:50:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2496A60B04;
	Sun, 14 May 2023 09:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559DFC433EF;
	Sun, 14 May 2023 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684057798;
	bh=guNSqaaUlESAbLan9+RG8kL1OCMP8ebtJ0mKqjsMlwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlAlSaeN8+EXCybzzrEALb2hrhC2bu60CCiNxgOm1/pbpcXlbfRzCi3V0XN1V2uVm
	 sYd/3l90AhWk+z8jQOxZ1tFURcrgiKPs9OXer92bAGkbtrWwczy77FY0bB2dafbAeU
	 3Fqhi5XUc/JAfKmFR8HUGYHVlT6WkXPHPYeNWzhS+OAbIiyU14FNl2ruMeSUFLCKv1
	 0aecU0EqIHCMzZmDKYgVzyL9kL1clCs1mtX4rXC33UWcxKi6xeMSXZAuUN2GeozJf9
	 /UzpjqhhyvU9u9TmOIvC5OUeZaKMomzTAhT++8kRNii7j+OuJdONS62vRT60B/Fn0B
	 sPSG1uQ9BIwTQ==
Date: Sun, 14 May 2023 10:49:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux RISC-V <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH 3/5] Documentation: riscv: vector: Use bullet lists for
 prctl list
Message-ID: <20230514-proposal-resort-3ce1beeaa089@spud>
References: <20230514090432.78217-1-bagasdotme@gmail.com>
 <20230514090432.78217-4-bagasdotme@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230514090432.78217-4-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_025005_015788_38090E43 
X-CRM114-Status: GOOD (  21.31  )
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
Content-Type: multipart/mixed; boundary="===============2698442704398772186=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2698442704398772186==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JFuOQxTC7sdTVyfx"
Content-Disposition: inline


--JFuOQxTC7sdTVyfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Bagas,

On Sun, May 14, 2023 at 04:04:30PM +0700, Bagas Sanjaya wrote:
> The documentation lists two userspace prctl() calls. Use bullet
> lists for the listing.
>=20
> Fixes: 412c68cfeeb178 ("riscv: Add documentation for Vector")

Firstly, these fixes commit hashes would not be stable as this series
has been applied to riscv/for-next [1]. But also, from this commit
onwards, things seem like stylistic comments that would be undeserving
of a Fixes: tag to begin with.
Perhaps you'd be better off suggesting these changes in response to the
original thread [2], so that it goes in "correctly" in the first place?
Andy has to re-submit anyway as there are a few bugs that crept in in
the most recent revision of his series.

Thanks,
Conor.

1 - https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=
=3Dfor-next
2 - https://lore.kernel.org/linux-riscv/20230509103033.11285-25-andy.chiu@s=
ifive.com/

> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/riscv/vector.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.=
rst
> index 178b3f3f452462..c7bd701c7963b6 100644
> --- a/Documentation/riscv/vector.rst
> +++ b/Documentation/riscv/vector.rst
> @@ -13,7 +13,7 @@ order to support the use of the RISC-V Vector Extension.
>  Two new prctl() calls are added to allow programs to manage the enableme=
nt
>  status for the use of Vector in userspace:
> =20
> -prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
> +* prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
> =20
>      Sets the Vector enablement status of the calling thread, where the c=
ontrol
>      argument consists of two 2-bit enablement statuses and a bit for inh=
eritance
> @@ -89,7 +89,7 @@ prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
>          * Every successful call overwrites a previous setting for the ca=
lling
>            thread.
> =20
> -prctl(PR_RISCV_V_SET_CONTROL)
> +* prctl(PR_RISCV_V_SET_CONTROL)
> =20
>      Gets the same Vector enablement status for the calling thread. Setti=
ng for
>      next execve() call and the inheritance bit are all OR-ed together.
> --=20
> An old man doll... just what I always wanted! - Clara
>=20

--JFuOQxTC7sdTVyfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGCuvQAKCRB4tDGHoIJi
0mcyAPwPiBYobd9BA+IWlX6rYlv8XB7W4+mR4nPs6hKmYxYppAEAngC4C5RD+zHf
HIp7y9wlzNTsI+Lwk3dZR0/6G2oiNwk=
=qbPL
-----END PGP SIGNATURE-----

--JFuOQxTC7sdTVyfx--


--===============2698442704398772186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2698442704398772186==--

