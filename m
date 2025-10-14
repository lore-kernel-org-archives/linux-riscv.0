Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D142CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 21:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g47O2cL0QUMg770NAZ+mLXesk1QKyfqzGsnYjPen/7o=; b=wh0oLkHCSxr3qbflSX/OmvhGT7
	5Dq7TCZlC4pd22Iom3YkUqR2eztPQubkeJNEmX8ulTIPD2PO/bBz3WcSsOc8LaPeGr5iUGTU6+o8K
	mQKn7D/x2XdKMavbDYCgyYjUxKdqDMmYax628UUvbaNb0Sz8dJb3Ui2ZDPgVIGQwnps4akqj5EYD4
	CTkZTbDSOFiSFfrFTBGWvLAJ1If0aNfQt6UeqdajmGoGkDf5IyWEpfb+8w88EtGRE0RxE7CF61Wcl
	8yeQ3Nd0QolhzYkSXP8DDuW9mNb+YhB4JcYm6I0BEPY2qHUx4bq/bmE6K+yUrrar9wpsOOd/819cN
	McRkBoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mnW-0000000HTDR-1zDj;
	Tue, 14 Oct 2025 21:43:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mnU-0000000HTCQ-14fE
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 21:43:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11544435EB;
	Tue, 14 Oct 2025 21:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2523FC4CEE7;
	Tue, 14 Oct 2025 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760478186;
	bh=LRljLPxaEQbTwtDrQiCyNR63yfM2iVls8Na9Cwrj4uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmd80W/YRIcA4dQNGPY5FgKHmtjcXYldtMaf70v1N8zwqbvI9jR2MTDv58nrnu3Bv
	 yumduFDeZnKiRACxkP3iMCvBIwrGhbadzQAOvDL+VavMaQdjomOzeboANqOg6YvZB3
	 UCzmgbgza/wSuKMIML7yz8ci2h65hurCSA6vbkpVAkRonXeKzejp/8CmZ670mTUDGr
	 N1Zy20w7k1Pz7b+niSJfKKrrJR9CVqwXNRVAuklWDkpGvf9+YxInyoVcH+NYeo7fdX
	 G2yFzBxoxnUUMAvLhrYiQgY9FHpLtbNWo3/QR2eJnDsMbLC48XtGyf5C4Q3I0sK7Bb
	 PdqRpxSF9NTQQ==
Date: Tue, 14 Oct 2025 22:43:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Don't print details of CPUs disabled in DT
Message-ID: <20251014-voicing-zoology-7873581cc192@spud>
References: <20251014163009.182381-1-apatel@ventanamicro.com>
 <20251014-5305a0b88ee761d57e3f29bb@orel>
MIME-Version: 1.0
In-Reply-To: <20251014-5305a0b88ee761d57e3f29bb@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_144308_316861_FCE043C7 
X-CRM114-Status: GOOD (  23.82  )
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
Content-Type: multipart/mixed; boundary="===============6367292293991877726=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6367292293991877726==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KWNSzEgGgBuTmFqL"
Content-Disposition: inline


--KWNSzEgGgBuTmFqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 12:50:11PM -0500, Andrew Jones wrote:
> On Tue, Oct 14, 2025 at 10:00:09PM +0530, Anup Patel wrote:
> > Early boot stages may disable CPU DT nodes for unavailable
> > CPUs based on SKU, pinstraps, eFuse, etc. Currently, the
> > riscv_early_of_processor_hartid() prints details of a CPU
> > if it is disabled in DT which has no value and gives a
> > false impression to the users that there some issue with
> > the CPU.
> >=20
> > Fixes: e3d794d555cd ("riscv: treat cpu devicetree nodes without status =
as enabled")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index f6b13e9f5e6c..3dbc8cc557dd 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -62,10 +62,8 @@ int __init riscv_early_of_processor_hartid(struct de=
vice_node *node, unsigned lo
> >  		return -ENODEV;
> >  	}
> > =20
> > -	if (!of_device_is_available(node)) {
> > -		pr_info("CPU with hartid=3D%lu is not available\n", *hart);
> > +	if (!of_device_is_available(node))
> >  		return -ENODEV;
> > -	}
> > =20
> >  	if (of_property_read_string(node, "riscv,isa-base", &isa))
> >  		goto old_interface;
> > --=20
> > 2.43.0
> >
>=20
> Maybe we should keep the message as a pr_debug()?

I don't even know if that really has any value, there's plenty of places
in userspace to get access to what CPUs are enabled and having no CPUs
triggers a BUG().
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Otherwise,
>=20
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

--KWNSzEgGgBuTmFqL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO7D5gAKCRB4tDGHoIJi
0kHFAQDVxoesuzHdEbDDnzDbWdzCv+ITIcqRHGyNWkXnKoO6QAEA/Qa6YcmgxX/J
ZePPxLUzqlVZ+/tdFlC+ibydJ7VqbgQ=
=jt3k
-----END PGP SIGNATURE-----

--KWNSzEgGgBuTmFqL--


--===============6367292293991877726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6367292293991877726==--

