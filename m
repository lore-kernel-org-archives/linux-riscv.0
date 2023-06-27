Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6561EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 16:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTFzl+sE4uBFffnE+cqj9kswS+TCfPpRvBlpVL2XA4U=; b=kMIBBhJ4t6vktMvlW8WFR+UJ2b
	cfZ866ZUzel3OkgYky1oav9cv4womjr65ypehtNcgv8FOLeAGreK7bWHvovH2da7DlhYLW0RMcj9D
	T2ADnrfEwdsnoKGDlaNqrafW4Ylht3Q3mgH30eQvStHx7AGyBNnReobjdebka0Vfjtq87gzHh1gBU
	tXGcUSDHQufQpN7DwduN6vKIkgfqasF9plgz0utJG9hnQEFqwE5DKRp0tnZUkoZf1K7HY+xbgBbZv
	4pzff/dP0R9qb7rfObgdr4/4KjKAlabSAzjLS5eYdUWIg18mOpp7FWU1wsfZ4gaVLCMC0X1Toug7B
	uiaSAIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEBJG-00Dbzd-1J;
	Tue, 27 Jun 2023 16:12:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEBJE-00DbzB-1P
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 16:12:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCC826119F;
	Tue, 27 Jun 2023 16:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A378FC433C9;
	Tue, 27 Jun 2023 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687882371;
	bh=Atowo/Wdq8Wn3n/cF+7b1vU9PFbSs4wDejX0PorKzhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWuiKcz+ehV1BaqmYd2RhpqhTVU2Hy4o6C60TsJLTWVZeFMcBQredWMdzs32lm2Qb
	 uaxd9396K6uiWiM85HdPl1aVaEL+jgP5xu8Rp91YSg8yba4grUiXS2Mo8iQieGTYJc
	 udBxm2/uXbnL6l6/8V1NYd8ZuAU6JmyvWVC7Kg4DXCjztnUPSwIg1RAVt+e0KKBOab
	 YwRyJ9Ot+h6be6ysUQbMwcrKHv50IG9FRnJuUaUlHleX546jP2d4rZ85xMXXAad9vo
	 3Y4Jxa9VnoVqrJR+S06HD65aS/jrxVlnHmYxf5Z6I3ysZfKsCRJMbR8Q/R49XSm3IZ
	 N52B6S18uz83g==
Date: Tue, 27 Jun 2023 17:12:48 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] RISC-V: add T-Head vector errata handling
Message-ID: <20230627-sandlot-purity-1a27aa7a5275@spud>
References: <20230622231305.631331-1-heiko@sntech.de>
 <20230622231305.631331-4-heiko@sntech.de>
 <2285267.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
In-Reply-To: <2285267.ElGaqSPkdT@basile.remlab.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_091252_517118_7FF7F8DA 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: multipart/mixed; boundary="===============5737861313133193719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5737861313133193719==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7Jm+8Dk91hzbNw/2"
Content-Disposition: inline


--7Jm+8Dk91hzbNw/2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 06:21:14PM +0300, R=E9mi Denis-Courmont wrote:
> Le perjantaina 23. kes=E4kuuta 2023, 2.13.05 EEST Heiko Stuebner a =E9cri=
t :
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >=20
> > T-Head C9xx cores implement an older version (0.7.1) of the vector
> > specification.
> >=20
> > Relevant changes concerning the kernel are:
> > - different placement of the SR_VS bit for the vector unit status
> > - different encoding of the vsetvli instruction
> > - different instructions for loads and stores
> >=20
> > And a fixed VLEN of 128.
>=20
> Ultimately, conformant hardware also has a fixed VLEN of some value.
>=20
> So why is that relevant here? is the vlenb CSR not implemented? And even =
if=20
> so, c the value not be retrieved with vsetvli?

I was looking around a bit, and saw a random comment on reddit today
claiming that the c920 has a vlen of 256. Obviously that conflicts with
what is written here, but it is reddit...
Do you know if that is true Heiko, and if it is true, does the c920
populate archid/impid with non-zero values?

Cheers,
Conor.

--7Jm+8Dk91hzbNw/2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJsKgAAKCRB4tDGHoIJi
0kfgAP43QhAxOT/5IwgRnyxkK6qhWDiZ1qZc1F/Lanjb9m9pqQD/VIcThgWq5jRw
kfxGCjFxJjLt+HGatIlgUbhGBvUmUgo=
=vJyD
-----END PGP SIGNATURE-----

--7Jm+8Dk91hzbNw/2--


--===============5737861313133193719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5737861313133193719==--

