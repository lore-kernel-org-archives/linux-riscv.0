Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99979606A330
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tEBmgCRe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kw/RMWwl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C7wVELCkuLn8WWPIIAAMbJ/nNQiC9jr40rhzQd3pEz4=; b=tEBmgCReu2x0oX4I2ky2CBH7Rq
	RNM0RMT4GEW3xrlES4aDW34jnKZmUh8N/N6z5aKxiTPPZZrUjfQCrZKphcxnnV0QqY1QQwsLb2TJI
	igSVg0vQi3xnlkhc8RaOQ4YVsk8rgMwpuxozikXuVb3H9loz91zByZ/hAMFXsyQediJT1GNVIilxl
	U1uOLYFc15uOE31h2fLalP8M23ZjsWaHJcYDQTcOr6g7ueAt+OUwlrP4LlQbanaxja5mDstqlA94w
	DSTXgTv34x97hiVaovS8s0UzShZ4AfoB0xR+A0F3pf8CLT2xdJ0lTEc0+ImDwszQwPFXlUAgstRZr
	f1yXGg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0Nx-00000003ORW-3DQ9;
	Mon, 16 Nov 2026 17:20:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0Nw-00000003ORJ-2ZbX
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 17:20:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 572E443F76;
	Mon, 16 Nov 2026 17:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFFC1F000C4;
	Mon, 16 Nov 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794849652;
	bh=scd7KPiRVsbA2XxL7ASc6Bp3Xum97UozhMdMhwjKhPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kw/RMWwlR/zQZHbAxE2vH0EEg69M0lvUZrH2QSeJ/p7OwB4IE44S09DcNBW6OGVW7
	 BslOPpjPmEBzBN5LM4qb4E2LckVVJ/euPotGVii4Za5Di878LUagpYKfOa2vWOYGaL
	 C9fzd2budQoE/3X6VryI5gDUOpCCMn84stoVUffaFkGJ2Lma8Nr8rbN22mnLj0rPRL
	 DXwCYT2q+omBNLjSWRGj9/Jlu886zo+sh/kIuVLOWyRtpvTYV8EXP2lMNy9RJt1R9a
	 f2xTO0xrMJnJJtS379Z7d9ROQjOq23aMEtUzMIBw0Y2J+0PjYwhyMDgNIMYpDAXZ1B
	 9Kuqk6/e/3pgw==
Date: Mon, 16 Nov 2026 17:20:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Avi <thnkslprpt@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
Message-ID: <20261116-dreamlike-uncheck-9eebf91555d6@spud>
References: <20261028131939.1014720-2-thnkslprpt@gmail.com>
 <20261105-igloo-stunt-534496ad0518@spud>
 <CA+jvY9Ft4KKTGD7jM-pBFeN4orRuMs1pQUfcLerKGTW24KDQVQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CA+jvY9Ft4KKTGD7jM-pBFeN4orRuMs1pQUfcLerKGTW24KDQVQ@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1328648121795708447=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1328648121795708447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nbYSfbusVy/ZW6KP"
Content-Disposition: inline

--nbYSfbusVy/ZW6KP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 07:40:42PM +0200, Avi wrote:
> On Thu, Nov 5, 2026 at 8:24=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Oct 28, 2026 at 03:19:40PM +0200, Avi Weiss wrote:
> > > sifive_ccache_init() uses of_find_matching_node_and_match(), which al=
so
> > > returns nodes marked as disabled. The initializer can therefore map a=
nd
> > > access a cache controller that the device tree marks unavailable.
> > >
> > > Select the first available matching node before accessing its registe=
rs.
> > > This also handles a disabled node preceding an enabled one.
> > >
> > > Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controlle=
r driver for SiFive SoCs")
> > > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > > ---
> > >  drivers/cache/sifive_ccache.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_cca=
che.c
> > > index 71d3f94987fa..02878d54381d 100644
> > > --- a/drivers/cache/sifive_ccache.c
> > > +++ b/drivers/cache/sifive_ccache.c
> > > @@ -297,7 +297,9 @@ static int __init sifive_ccache_init(void)
> > >       unsigned long quirks __maybe_unused;
> > >       int rc;
> > >
> > > -     np =3D of_find_matching_node_and_match(NULL, sifive_ccache_ids,=
 &match);
> > > +     for_each_matching_node_and_match(np, sifive_ccache_ids, &match)
> > > +             if (of_device_is_available(np))
> >
> > Are there any devices where this is actually possible? IOW, where there
> > are 2 ccache instances.

> It's more of a defensive thing. The 2 ccache instance was an example -
> the issue is also relevant for one disabled ccache node no?

That is true.
And on the two node front, the driver doesn't support that anyway either
before or after the patch. Consider what the new code does if there are
two nodes, both enabled.

But I don't think the ccache or llc-cache successor are intended for
that kind of situation anyway.

> Since of_find_matching_node_and_match() doesn't check whether a node
> is enabled, it can return a disabled one.
>=20
> sifive_ccache_init() then goes ahead and maps and accesses its
> registers, even though the device tree marks it as disabled and normal
> OF platform-device creation would skip it.

Could we instead drop the loop and just check for availability, while
retaining of_find_matching_node_and_match()? I kinda feel like the loop
gives the impression that the driver supports multiple nodes, when it
realistically does not.

Cheers,
Conor.

>=20
> >
> > > +                     break;
> > >       if (!np)
> > >               return -ENODEV;
> > >
> > >
> > > base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> > > --
> > > 2.43.0
> > >

--nbYSfbusVy/ZW6KP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavs7cQAKCRB4tDGHoIJi
0pNvAQD5/KJVymuE7qmA071m1fi7a4OINJ983TfXYxTo/6Wq0AEA04ux8cMbfJqI
BIpTXQuSLQDewZqgUQfZE9C4L2OC2gg=
=haUZ
-----END PGP SIGNATURE-----

--nbYSfbusVy/ZW6KP--


--===============1328648121795708447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1328648121795708447==--

