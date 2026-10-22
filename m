Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B82606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ClRcK8Bb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJfdPjF2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2+wCt3Jvh2oZoVZoa9KSb3Vjf5Tj+XFxYjep9I6/uNg=; b=ClRcK8Bb1Pnj1J9lwUrW8Hx3TQ
	1aSllDIppnJ6mDrQmKk2sIFr9UJcbkFqJwIEsQ4hsNE3D7pHNtTb7zJOfDXKgji7OxdBloSxYdEK+
	zJyaAyflljYNbfp89EnY1PEwJIIVC/WJFZquwGfMFLk2HvTRyyhimXY6mERbRVKwG+YAimrshw5Th
	7VwHJqLocSNtklOF8H2tFJWfXHyAjoH3ebmrxkM1L0ZBun5BoeVmGmp0MF0LSe5ZtjOBdPQC0/vK8
	0SXAcydLxWpSSdjxTVPGwmRnMfY5CyaDyD4gDpmso2pswZ7mfrCN7IIKl/1vET71rI5f20e4iygUd
	WF4Efzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxAJ-0000000EgBl-356I;
	Thu, 22 Oct 2026 18:05:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxAJ-0000000EgBa-05L4
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 18:05:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C97E407E7;
	Thu, 22 Oct 2026 18:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00321F01825;
	Thu, 22 Oct 2026 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792692322;
	bh=66xP79lt5Tjx1kcLiN+8GMbh1FpuhTHreHBKUBB8XQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZJfdPjF2alXuM40GMRoGu4hYOPz5NM3T0w3PpA4rALN1G+0hRFrXmN/qk3AIaAuL6
	 z8Q26ZQNS/HkJ1knitkpc+NlkxL+hhPNz6+JejM2ufAJtp/V92Em4/QvBMsIxy3jmE
	 U9VX2UvFEng+RGSS7ekzg5RC4+puHIc4jwnCmS4rXz1UY7VMKFTY6mswJA29cKkHrs
	 kd8uQa1FaZUfQkEsVkxPA5WpeQRLoKY6dmAdavxdqv0DV8ERlS0Acw/8CvoFdTYD3m
	 LkPwWQNHpakJTxqVMurGds5J1cc4AxJf85+BSLlUBWXvgNW56QRgaIsoZ4KDxtQy4O
	 G+JzE7Fn48mfg==
Date: Thu, 22 Oct 2026 19:05:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>
Subject: Re: [PATCH] cache: sifive_ccache: Enable all ways when no LIM is
 reserved
Message-ID: <20261022-chubby-quote-4d06564dc4ba@spud>
References: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>
 <20261021-negation-carol-e42b4ecf3726@spud>
 <BY5PR04MB70254A39FF5BC39716B23E5783652@BY5PR04MB7025.namprd04.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB70254A39FF5BC39716B23E5783652@BY5PR04MB7025.namprd04.prod.outlook.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3805855129026180850=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3805855129026180850==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4lkyleY9UN/A2RLt"
Content-Disposition: inline

--4lkyleY9UN/A2RLt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:20:47AM +0000, Pinkesh Vaghela wrote:
>=20
> Hi Conor,
> =20
> On Wed, Oct 21, 2026 at 10:43 PM +0530, Conor Dooley wrote:
> > On Wed, Oct 21, 2026 at 06:39:06PM +0530, Pinkesh Vaghela wrote:
> > > The composable cache resets with only way 0 enabled, while the
> > > remaining ways are available as Loosely Integrated Memory (LIM).
> > > Systems that do not reserve LIM therefore use only one cache way
> > > unless software increases WayEnable.
> >=20
> > This is not true in the general case, firmware may intercede to set the=
 ways as
> > it pleases.
> >=20
> > > When no memory-region property is present, DT describes no LIM
> > > reservation for the cache controller. Validate the reported way count,
> > > then enable all cache ways so Linux can use the full cache capacity.
> > >
> > > When memory-region is present, leave WayEnable unchanged because
> > > enabled ways cannot be returned to LIM until reset. This may leave
> > > more ways assigned to LIM than required, but avoids consuming reserved
> > LIM.
> > >
> > > Apply this policy to all compatibles handled by the driver. Firmware
> > > or
> >=20
> > I know this is going to cause problems for all the microchip boards, wh=
ich
> > maybe should have reserved LIM but never did because the LIM was never
> > put in the devicetree as memory in the first place.
> > They also don't suffer from the problem you mention because firmware se=
ts
> > the ways up.
> >=20
> > > DT configurations that require LIM must provide memory-region;
> > > otherwise, Linux will convert all disabled ways to cache.
> >=20
> > I don't like this behavioural change, it's never been mandatory to have=
 a
> > reserved memory region for the LIM. I'm only in favour of doing this on
> > devices where we know it is actually required to be done. The eic7700 I
> > assume is one such device.
> >=20
> > Cheers,
> > Conor.
>=20
> Thanks for pointing this out.
> =20
> I agree that firmware may have already configured the cache/LIM
> partition, so applying this behavior generally could overwrite that
> configuration.
> =20
> EIC7700 firmware does not enable the additional cache ways, leaving
> only way 0 enabled when no LIM is reserved.
> =20
> I will restrict the change to EIC7700 using a device-specific quirk
> while retaining the memory-region check. Would this approach be
> acceptable?

Seems reasonable to me, yes.

--4lkyleY9UN/A2RLt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpQXgAKCRB4tDGHoIJi
0ixCAP9/hAD9o5Vy6FG7ZT8n7KDT+Pe6cB1sfDmRyZHLpO6eWgEAzT+1nU4Q8eAG
mZvo5zxTiyh7mPUMpumY9iHMXCJM7g0=
=V8G9
-----END PGP SIGNATURE-----

--4lkyleY9UN/A2RLt--


--===============3805855129026180850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3805855129026180850==--

