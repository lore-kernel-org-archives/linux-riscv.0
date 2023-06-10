Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71659C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i12aYw+v10xjzuPfJY+I2yLRMHTOd7ysT2sCx0Zkd08=; b=RAXNE3WD+7jwbHK9q473X/P5mg
	hpoTkBq7hZEQZ5URsiw1lzIS/9AaILmPISozH6vJh1exxhtLS5WTkW7t+vGlPdMBmQ6tkDXL7HXmw
	2p4GeY+T88scxmP4qqYg9ROBjswVTJI+LnN2Kzty7/YNAq/goL/EPA8gVOcstBVroHlp//fg11PVS
	4ISMDeAYRwSaMDwVdqoXOFJ4UhPAFf6BP519P2gJMGF2SkCB+byD9wHRBdbGU3/rNxAtwJof/aarS
	byC3rHALOnkskmrUlX6R5N1oFKByPqGMMk0N8781ov+4UvbYjXRI/7pXFsE96waFq53tfUA94NAw1
	6qx6sLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q80iU-00GTb6-0r;
	Sat, 10 Jun 2023 15:41:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q80iQ-00GTaJ-39
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 15:41:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FE2860DE6;
	Sat, 10 Jun 2023 15:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35220C433D2;
	Sat, 10 Jun 2023 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686411681;
	bh=6uyaujNQDJF61dpwxgeEr+l/0vMjSzCrIltBVri0m2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6UfCqbTsPq9cww1yKJXgdO4LS6+QahtoJCpqa52NZ+0VmIeDeUTRkz9UHvsWu/gp
	 x+8r7+I990/kp4ZjJ1aLOe+IGGrmOuSPsQIX5EonAyOGTB/dud8sYqG3Z/TYh0g3Hg
	 nVi3V9XldQ7p5QW97cGbKkZJB/kHbqW23YIC0edViTzogk6ss29laVuW15NPVKUW9s
	 Q+R+3OuKwRFT7I7leWPPWSApvz36Cw9vgcv60tSOneZqOA0CYUoDHLIR8vuWr+XZ3I
	 O01ExP4aKHa08tcuzYuifajH0s5GovNtfqVz4x0UEnjmjer2OZdATHzwIB1mAX3vah
	 AIAcIkb09eBQg==
Date: Sat, 10 Jun 2023 16:41:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Woody Zhang <woodylab@foxmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: reserve DTB before possible memblock allocation
Message-ID: <20230610-ability-mockup-f6aa71bad6a1@spud>
References: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
 <20230607-jogging-grudging-70dede86bc53@spud>
 <CAHVXubggydGfNu3OzcxWXREJbB+G9dmr9sFD7vXhVxbG-N58Pg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubggydGfNu3OzcxWXREJbB+G9dmr9sFD7vXhVxbG-N58Pg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_084123_094520_0CB5E84F 
X-CRM114-Status: GOOD (  28.38  )
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
Content-Type: multipart/mixed; boundary="===============4082844212846329864=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4082844212846329864==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="57IlWUOTjI1jlSeK"
Content-Disposition: inline


--57IlWUOTjI1jlSeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 09:49:44AM +0200, Alexandre Ghiti wrote:
> On Wed, Jun 7, 2023 at 8:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > +CC Alex, you should take a look at this patch.
> >
> > On Wed, Jun 07, 2023 at 09:35:19PM +0800, Woody Zhang wrote:
> > > It's possible that early_init_fdt_scan_reserved_mem() allocates memory
> > > from memblock for dynamic reserved memory in `/reserved-memory` node.
> > > Any fixed reservation must be done before that to avoid potential
> > > conflicts.
> > >
> > > Reserve the DTB in memblock just after early scanning it.
> >
> > The rationale makes sense to me, I am just wondering what compelling
> > reason there is to move it away from the memblock_reserve()s for the
> > initd and vmlinux? Moving it above early_init_fdt_scan_reserved_mem()
> > should be the sufficient minimum & would keep things together.

> Thanks Conor.
>=20
> So the patch looks good to me.
>=20
> But I find this fragile:
>=20
> - we do not check memblock_reserve() return value to make sure the
> reservation really happened (and quickly looking at the code, I'm not
> even sure it returns an error if the region was already allocated).
> - we have to make sure no memblock allocation happens before setup_bootme=
m().
> - we also have to check that no fixed memblock_reserve() happens after.
>=20
> The last 2 points may sound natural, but we'll have to take great care
> when adding some code around here. I'm working on an "early boot
> document" and I'll add something about that, but a runtime thing would
> be way better IMO.
>=20
> You can add:
>=20
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

btw Alex/Woody, what is the appropriate Fixes tag here?

Cheers,
Conor.

--57IlWUOTjI1jlSeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZISZnQAKCRB4tDGHoIJi
0jitAPsGETvv+Ge9i+UXddSumDMVVeXOHKBeG62OPGpGaIKpswEA6ADb2o38+VgM
owK9g/aeShlCxmEjpwj9hVDei/uaHAM=
=dJEZ
-----END PGP SIGNATURE-----

--57IlWUOTjI1jlSeK--


--===============4082844212846329864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4082844212846329864==--

