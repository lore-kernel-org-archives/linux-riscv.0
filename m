Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B33C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Dec 2022 18:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzA1IMPd6ZSKLZexJojgBqO8hWiZkXoCz1SO1ziAb48=; b=ewVyYVoqpE0h8xwhTcfFmHANL/
	zA3zCkbpcGAqaxRD5vv2YadKXwWrv4Ztns8CZZAtMOqrPYi1VtF3G8LSwLRGMbAl+DKwQF/E6OnEf
	KTW8Z5I7m1KrzMMaRWadfepn/8H+HlcAQ4Bwj5oy0FS/Aq6TxU1NpMIy9Hfcv36kb9G7FPwE8Cf0d
	igmwrr4LRt9mCAWGl0PYW3mzGLxr6su3z5eiS1AhVRPH1n9IwBfEIEH+p9x7HcDIHRiwsAFH2kkMe
	MPJA/7Q/RMmJRceTWSsBlIXifTaAHKhSRIhbMa6Iamxk3FVVwqjFqSK1Aff0qDqrC5b3A1HDUp3/4
	a/HZrreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9sOq-006OlQ-HO; Mon, 26 Dec 2022 18:40:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9sOm-006Ojh-Bp
	for linux-riscv@lists.infradead.org; Mon, 26 Dec 2022 18:40:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3033AB80D3F;
	Mon, 26 Dec 2022 18:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B454C433F0;
	Mon, 26 Dec 2022 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672080027;
	bh=YnhTz0N/9z4lnBpOz9osBa58RvZveykuYfB9Y8IttLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cY7tdWKcVLtTJxMjuHaBk6ifT6KIzIlrBjHJHj4f11POzP5DMHz3ECijD6D++4PPu
	 DBy4PUVL6niENHS6sE5Lu9VlFOV3GGOWEAhYQUCef4e+MwRCCUhIzVSKbNchUcY63P
	 aD/ozLKZpmRvJsFdr9CqoQCGo6CXLUUXvr6tmVN2v5ZyKc7cCbsEnU+P1i6Oym6JqD
	 mM+AJ8DFXNw1r2p+XXN1yDHo4+wsAf9otwmZ7PfRczezFZZrq1zoVm3Ngu5qAYYfh6
	 4M7UXyOVCPOqYSh1UZBK82c7+5+4DyjiUGBn61vlbc5+rsVxxY5qW/mbSafz6EjeCo
	 hg3sToLw7wGsg==
Date: Mon, 26 Dec 2022 18:40:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v11 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <Y6nql5IUhFnHv9sr@spud>
References: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
 <20221216062109.865573-2-panqinglin2020@iscas.ac.cn>
 <Y6Dc4XNQmKtTsXom@spud>
 <20221226152213.crknhcpysonhq63c@orel>
MIME-Version: 1.0
In-Reply-To: <20221226152213.crknhcpysonhq63c@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_104033_729962_80A92569 
X-CRM114-Status: GOOD (  31.73  )
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
Content-Type: multipart/mixed; boundary="===============6852025047593352746=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6852025047593352746==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xv72dIFIUfB6OwBj"
Content-Disposition: inline


--Xv72dIFIUfB6OwBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 26, 2022 at 05:01:29PM +0100, Andrew Jones wrote:
> On Mon, Dec 19, 2022 at 09:51:29PM +0000, Conor Dooley wrote:
> > On Fri, Dec 16, 2022 at 02:21:07PM +0800, panqinglin2020@iscas.ac.cn wr=
ote:
> > > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > >=20
> > > Add one alternative to enable/disable svnapot support, enable this st=
atic
> > > key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT com=
pile
> > > option is set. It will influence the behavior of has_svnapot. All code
> > > dependent on svnapot should make sure that has_svnapot return true fi=
rstly.
> > >=20
> > > Modify PTE definition for Svnapot, and creates some functions in pgta=
ble.h
> > > to mark a PTE as napot and check if it is a Svnapot PTE. Until now, o=
nly
> > > 64KB napot size is supported in spec, so some macros has only 64KB ve=
rsion.
> > >=20
> > > Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > >=20
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index e1a9fa47f012..25c230e3bf61 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -397,6 +397,25 @@ config RISCV_ISA_C
> > > =20
> > >  	  If you don't know what to do here, say Y.
> > > =20
> > > +config RISCV_ISA_SVNAPOT
> > > +	bool "SVNAPOT extension support"
> > > +	depends on 64BIT && MMU
> > > +	select RISCV_ALTERNATIVE
> > > +	default y
> > > +	help
> > > +	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at b=
oot
> > > +	  time and enable its usage.
> > > +
> > > +	  The SVNAPOT extension is used to mark contiguous PTEs as a range
> > > +	  of contiguous virtual-to-physical translations for a naturally
> > > +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB p=
age
> > > +	  size. When HUGETLBFS is also selected this option unconditionally
> > > +	  allocates some memory for each NAPOT page size supported by the k=
ernel.
> > > +	  When optimizing for low memory consumption and for platforms with=
out
> >=20
> > nit: Does this make more sense as "When optimising for low memory
> > consumption on platforms without the SVNAPOT extension"...?
> > Or does disabling Svnapot save memory on Svnapot capable systems too?
>=20
> Depends on how we define "save". Disabling RISCV_ISA_SVNAPOT on HUGETLBFS
> enabled systems will reduce memory consumption whether the svnapot
> extension is present or not. When the extension is present, the memory
> consumed may serve a purpose, whereas, on systems without svnapot, the
> memory consumed cannot serve a purpose.

Right, thanks for the explanation. I'm sorry to be a bore here, but should
it be reworded then to "When optimising for low memory consumption on
platforms without SVNAPOT, or if HUGETLBFS is enabled, say N here"?

I don't really care either way to be perfectly honest, so as I said in
my other reply "don't bother resubmitting unless someone else asks for
meaningful changes" ;)

Conor.


--Xv72dIFIUfB6OwBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6nqkwAKCRB4tDGHoIJi
0qJiAPsFIr6lRpsisPiODX33l/ZG+QDJBYIcyEy7YcWhviTMXQD/aE5kwHiJkenj
9H7/XqvZ20I22r3eNQ8XcUuizV8pxAA=
=gsw+
-----END PGP SIGNATURE-----

--Xv72dIFIUfB6OwBj--


--===============6852025047593352746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6852025047593352746==--

