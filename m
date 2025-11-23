Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AD8CFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 20:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bVNGq2QnfEr474jNgFDEMF/TmnTVKB9yg/5rcLhmOw=; b=SbG4VA3r+Ag33sWNjm3tFRw+l6
	Vxp/PoS8sNSxoi/5ybdfh0IAvH0VL0xIE/AIiZ7xnCS/K7DyrjFAnWrYdsmHS5ljKBpUTzoAgcJMc
	Nil6UrLeOcffykk+yeyyQ4Pcm5szaGY1duyvvAFhtfrsO+eyLLSjxlSZUQU5EmqZnu3AGGmuPMUpg
	/KkVtmzhig6VdRiDIc3dQ7QZMQm/WYgW555XZ4hWYc5PuVJQDRCH6PfSymQGJAnsFOz1ExxhbjJbd
	3h6qyNQClrnWJaD9dpkaTjUEUmAZpXcGWyQL0mUaIZvX72r3DZlXUZqNyYjppMQ/fmwEXL9ZUYN9n
	GVo0biKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGFC-0000000AfCQ-1Z0A;
	Sun, 23 Nov 2025 19:59:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGF9-0000000AfC2-0Y5E
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 19:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0514643EF1;
	Sun, 23 Nov 2025 19:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18997C113D0;
	Sun, 23 Nov 2025 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763927968;
	bh=GJK53TlNh8xNdgN9WhrW7dvsQfjB36zVyeQXCL2LFpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3OdQn6ej5dMa62teodhto/CWno0u9xuMtRxAxBtqCloNx8xLGWIXoHewZ2xN9zZy
	 p2vfDGd/Gqns0xKNfYMah77GoYo4kKvEs1zOVEIskh9sK1713l2+8++ljEp+lONq9c
	 9+bjRywdslRbIMrtH+sTmyW/Ua+uDr80SPaM9aubR4XWKvxp70+IGhmlq+PXgh3kLs
	 eUJMFM9CHqcyX8R4Qb4Mj6NFJd2IHMcwJccI3FPiGy0wXlUnHyaIYyS4Y4OBoo3bnN
	 Y2X8maV16dpojzvtRnZbWpvUYWENcj1RUWKKMsgGubIam0lBPXaiMAteaSSA2hnJ0t
	 SHEKVHp36AvPw==
Date: Sun, 23 Nov 2025 19:59:25 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com
Subject: Re: [PATCH] riscv: dts: sifive: unmatched: Add PWM controlled fans
Message-ID: <20251123-prolonged-setup-3ad9496a7b3d@spud>
References: <20251122.131940.192031134976081316.rene@exactco.de>
 <20251123-widow-prowler-9cedafa7bf3d@spud>
 <20251123.201652.423330903509523481.rene@exactco.de>
MIME-Version: 1.0
In-Reply-To: <20251123.201652.423330903509523481.rene@exactco.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_115931_193958_370F5359 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Type: multipart/mixed; boundary="===============4431583029055202473=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4431583029055202473==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kZUu5Rvd3hxf6bVw"
Content-Disposition: inline


--kZUu5Rvd3hxf6bVw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 08:16:52PM +0100, Ren=E9 Rebe wrote:
> Hi,
>=20
> On Sun, 23 Nov 2025 19:00:21 +0000, Conor Dooley <conor@kernel.org> wrote:
>=20
> > > ---
> > > Tested on SiFive HiFive Unmatched A00 running T2/Linux.
> >=20
> > Was this generated on top of a tree that includes 7dbc4432ea6b ("pwm:
> > sifive: Fix PWM algorithm and clarify inverted compare behavior")?
> > That'd be 6.17-rc1 or later.
>=20
> Yes, linus' 6.18-rc... tip

Cool, I'll pick this up then.

>=20
> > If not, the polarity of the pwms will need to be switched because the
> > original driver author intentionally got it wrong and so 6.17-rc1 and
> > later have the correct polarity...
>=20
> Indeed, I wondered about this and just inverted it yesterday to
> upstream.  I had this pwm fans patched for a year already and likewise
> inverted them before.

I don't recall the exact details, but I looked into it when the first
version of the fix appeared. The submitter effectively decided, in
response to review feedback about the pwm duty selection algorithm being
incorrect in their code, to invert it, presumably because that was easier
than actually implementing the feedback. Hilariously, they claim "this isn't
a bug in the driver code" when someone commented on this back in 2019:
https://lore.kernel.org/linux-pwm/CAJ2_jOG2M03aLBgUOgGjWH9CUxq2aTG97eSX70=
=3DUaSbGCMMF_g@mail.gmail.com/

--kZUu5Rvd3hxf6bVw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSNnnQAKCRB4tDGHoIJi
0rIgAQDJVakUb9or6lXk5RMIVjNewQ1As2S4SdIgIGivwBW4LgEA8zk87+PPouQs
lGXaecQycOjgWyAEcKPsontpzAAnZgA=
=hiE3
-----END PGP SIGNATURE-----

--kZUu5Rvd3hxf6bVw--


--===============4431583029055202473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4431583029055202473==--

