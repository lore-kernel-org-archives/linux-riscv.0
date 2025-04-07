Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0014AC36018
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4wWQ3+vqV6ocEPPOSeA5Sc1t0e0tTccCxZ7cbNgM+g=; b=YLYPaXxh2J3AWkMUjY8pH8PHMe
	eDOlQb+kORhQtRSkaOUjRZENL2Yp68vob709euBZzyubObbcSRhBkYN0ekfu8w5kR3hSpSyUcRcs1
	94Qn7fBUhgMQnyycCgxRBt3xHx95JeF/33ORY+X8xqJN5LBU2/xl8R8ABcgkyOiQBrJTxI2u0F3UC
	VATUajUVojUUNYd7y1g5t5BJVuUm2Je8/iFW9EuWN00JuM0PKwPn08j/5DxhSiPsHv5uMNyxqrrx0
	PhZY6SPCo/j0oc1wt+VZpVRwCVqUCQGooX9wmLFhwCapw8CSaLy1812FM568EDAA3ydi1kpPupdL6
	bJMCmcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1V-00000001VGs-1UTA;
	Mon, 07 Apr 2025 18:16:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1okL-000000011ES-064K
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 15:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A197743440;
	Mon,  7 Apr 2025 15:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89AAC4CEE9;
	Mon,  7 Apr 2025 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744041047;
	bh=HOVDM5euQFPEYRsSiD6INj8UKBND48N799jToiiUcwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xe5YDho20tt0siJerFzpmq9NDCAWHIYtVGUro+LhqodieEuMdX1pzUrpO+VGSpNOq
	 vdkCmy6gSbV1u6JVxZzIBd/IMiO8VXy/kkLE9hdndv16ribWcRslGQvqz5SK1Po17Y
	 393sKyBd68Uy7PNdkAfil3fYnhm1ipP67KyqsrZc0KryQ5IbSz30kcVHVn+svRpveX
	 x9iRGix2zt2ssYZuEo1SQ56H7fTRcmyfab/94gClr6VDZ6lQTM6v0UeWORPDMGsUeH
	 Pru+qlgwBH5BYsS+JLfEp2YLGcYygCaOnl0FQ8vLyiU2GbSmEMYzmdASdyauQjw8zl
	 euhgED/iB1JQQ==
Date: Mon, 7 Apr 2025 16:50:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <drew@pdp7.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	ulf.hansson@linaro.org, m.szyprowski@samsung.com,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 5/5] riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
Message-ID: <20250407-synergy-staff-b1cec90ffe72@spud>
References: <20250311171900.1549916-1-m.wilczynski@samsung.com>
 <CGME20250311172035eucas1p104dcbae706bec735194a1dc4a30db969@eucas1p1.samsung.com>
 <20250311171900.1549916-6-m.wilczynski@samsung.com>
 <Z/ArFVx6l5Urh9KV@x1>
MIME-Version: 1.0
In-Reply-To: <Z/ArFVx6l5Urh9KV@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_085049_079321_3305227E 
X-CRM114-Status: GOOD (  20.79  )
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
Content-Type: multipart/mixed; boundary="===============2414481321938318778=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2414481321938318778==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1GHzjvTYK5Cechhc"
Content-Disposition: inline


--1GHzjvTYK5Cechhc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2025 at 11:55:17AM -0700, Drew Fustini wrote:
> On Tue, Mar 11, 2025 at 06:19:00PM +0100, Michal Wilczynski wrote:
> > T-Head SoCs feature separate power domains (power islands) for major
> > components like the GPU, Audio, and NPU. To manage the power states of
> > these components effectively, the kernel requires generic power domain
> > support.
> >=20
> > This commit enables `CONFIG_PM_GENERIC_DOMAINS` for T-Head SoCs,
> > allowing the power domain driver for these components to be compiled and
> > integrated. This ensures proper power management and energy efficiency
> > on T-Head platforms.
> >=20
> > By selecting `PM_GENERIC_DOMAINS`, we provide the necessary framework
> > for the power domain drivers to function correctly on RISC-V
> > architecture with T-Head SoCs.
> >=20
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> >  arch/riscv/Kconfig.socs | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 1916cf7ba450..83833ded8908 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -53,6 +53,7 @@ config ARCH_THEAD
> >  	bool "T-HEAD RISC-V SoCs"
> >  	depends on MMU && !XIP_KERNEL
> >  	select ERRATA_THEAD
> > +	select PM_GENERIC_DOMAINS if PM
> >  	help
> >  	  This enables support for the RISC-V based T-HEAD SoCs.
> > =20
> > --=20
> > 2.34.1
> >=20
>=20
> Reviewed-by: Drew Fustini <drew@pdp7.com>
>=20
> Conor - would you be able to take this Kconfig.socs patch?

I can I suppose, sure.

--1GHzjvTYK5Cechhc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/P0UQAKCRB4tDGHoIJi
0iqrAP98LTJtRIOeY8UUUHZUC78KX8XxI12BXLyp4jgDxClmsgEA0QO0tJ0PHxnZ
yruNFvb0b0zbXqoxQUCkKLMZmgOsDQM=
=bAyp
-----END PGP SIGNATURE-----

--1GHzjvTYK5Cechhc--


--===============2414481321938318778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2414481321938318778==--

