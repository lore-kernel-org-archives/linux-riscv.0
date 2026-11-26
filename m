Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167BF606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zvF53Up+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jd4Irl6N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OETQieTNN9f4gw2XjLuwxAxlgMB4A5LT+tKhwT/+mfw=; b=zvF53Up+cgdk4KAjUKHgKvs717
	rYFpzd69O7UbPpXERTwu1UnPFFeMUsm9i0MNd9SZlY0x7U6hh2/sQtklUXISKDsEiEoe5UPqLuyk9
	cHLXlueK+RmZX6lJZnqMlJ07jVMncs90cvHB/d77NuhMkReWvINTeXfz6IF+SzvmKOhjwDHFgh2B5
	0IvIjtv+hi12tb/eH7zA2mjOu2elipgcXFpIuSzbVpL16GkJZ/H7SJRJ0D02paILAOxaUmEN1T8Kg
	nTZ9JAmVr1tJa5nJkFpOPIoXI2v/iyxZxaTyJLUkzDmE5AcFp9i6KqHVqcfumnNlK3R7coEDT1x1b
	RkbwXxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdlV-0000000E7Eo-2spc;
	Thu, 26 Nov 2026 18:00:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdlT-0000000E7Dz-2wre
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FD074420C;
	Thu, 26 Nov 2026 18:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14101F000C0;
	Thu, 26 Nov 2026 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795716010;
	bh=5mZYwwjR9BTTW24PV5T2QjIZNCAR6U+aLWboOrrOn58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jd4Irl6NjHTm5ga04mdXXy27iVW0/978dP+4cTYLUsR1KBehjRDgoKcICH7rScuDR
	 T72oUr6egLkU2Es7bhpgTbIrt9z6QDYe4g4WZTiqjuyfMRhFuTAHtjuUczSMZFRY/9
	 4QpbMmR8p9z/HF0GdAiqPuxiyUboeO1ktfS7LbFMee+ibJ4IRiKKu/yxnmqvbpS8i1
	 TAOdIyPAcB8+BOQlWvRAY1OWN9vO6na2y8geXARyP+XebXB8BgF++9cjFziRnqUdJZ
	 9UQv7QoHAMmsK4XipMC59VJGSrduRY7Hi8oFBlBfDieye9NovLRFzQavXfSQxexhgN
	 SNntZ0KQF4icw==
Date: Thu, 26 Nov 2026 18:00:05 +0000
From: Conor Dooley <conor@kernel.org>
To: "Marouene Boubakri (OSS)" <marouene.boubakri@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Message-ID: <20261126-sage-subscript-abb9ea294ca2@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
 <20261102-salsa-cartel-dd4f4b2a9639@spud>
 <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8277199914748613176=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8277199914748613176==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MpbRAbGZwGn7X0O5"
Content-Disposition: inline

--MpbRAbGZwGn7X0O5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 04:38:56PM +0000, Marouene Boubakri (OSS) wrote:
> Hi Conor,
>=20
> Thanks for the review, and for the acks on patches 1 to 4.
>=20
>=20
> NXP Confidential
> On Mon, Nov 02, 2026 at 07:30:41PM +0000, Conor Dooley wrote:
> > > +RISC-V OPENHW GROUP SoC SUPPORT
> > > +M: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> > > +L: linux-riscv@lists.infradead.org
> > > +S: Maintained
> > > +F: Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> > > +F: arch/riscv/boot/dts/openhwgroup/
> >
> > There's no git tree here, are you expecting me to apply the patches for
> > your platform?
>=20
> Yes, if that is okay with you. I don't have a tree for this: the platform
> is small and I expect very few patches. I will review and test whatever
> comes in for it. I can add your tree as T: in this entry, or list the
> directory under RISC-V MISC SOC SUPPORT instead, whichever you prefer.
> If the platform grows I am happy to set up a tree and send you pull
> requests instead.

Sure, I suppose I can. Keep this entry and add the dts dir to my misc
entry.

--MpbRAbGZwGn7X0O5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawhzoQAKCRB4tDGHoIJi
0s6kAP4gXmSFfhK0zfOCFBXSFG1/xn4r/TZJv18+DgrkOYf7LwEAqLrQ2A9IL3OG
SJ7Lomm/LvhzXbJ6vLkmKeV6VrShoAc=
=i6yE
-----END PGP SIGNATURE-----

--MpbRAbGZwGn7X0O5--


--===============8277199914748613176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8277199914748613176==--

