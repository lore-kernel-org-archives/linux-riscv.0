Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEE8FD8765
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uctjX5E2XCEH0Qbt9KlHt9P19LhRh3BYG04pprbf04=; b=haRAZ2+ng0JPyJUyvTYmpkyMRb
	ootG/3iF3wcGpjDF3PlvhGv2Zkh1qfK4bNDK1QwyRgJSYenpbQyIpSbs4Yotrndn2KeLE2so7ocig
	0GyJheRtjwigEB72AMK9FLY9avPj3pmMDzrqejJ20LxlxromBcJKpl60wBuvv+GFRB7xAef9KVo8n
	NiZMELuPYjCTp7zz5giLWGDOs8TelM4W94Y2hEssdAvZcDjy/t9/8V7lbJZdPpYUgnSuY2MPXrw99
	CBNhkM+3bIOxMANiKqQuTXsU3a7unyjvuuBRafsFkmZSBWLpvAjjOQdB0sexwvg+Q+jokJXYZhYhA
	7sneHAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2U4G-00000006MWR-2j4t;
	Tue, 17 Mar 2026 13:02:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2U4G-00000006MVd-0ySk
	for linux-riscv@bombadil.infradead.org;
	Tue, 17 Mar 2026 13:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nOLCYeBfG3tpOcsivBZ8BhE0S9FVFdVR38Xkr82NYmM=; b=eP8Gq7CgfNZG55WBFXO9uaBaKj
	EDONO475lzBPU2WgnYYRT8kUb2G4IoUb7jR4mJj3fwt7iURCrzj/0LJHMgKlKkwqTvgAeOxBpmS/L
	duzrSW5tnrztk7UT2oLS5WgukgANK7JemDQ/WeRf3zvgigO3JQJ6w11ap/hoZPAPHEiRGuJjPYUVc
	95EMQpVD5fRoaKgb7mK7k7bw1JyOJB/h3ito2TsSwhojzsQLlEj7RZXxps0IzxxD4Q3aXVpeZ8tAx
	qefPEHz5STtLDClvcr8JwXghgqg4gZK1X63ByNnOUwwBfoqjdDqOFuCi/hnGL+AwiRjO6N9ttm0kg
	T2SQMRMw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2U48-000000091Wu-3895
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 13:02:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AE0A438DF;
	Tue, 17 Mar 2026 13:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF432C4CEF7;
	Tue, 17 Mar 2026 13:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773752548;
	bh=1kjWo6lcePoSVB9RhThQ8BkYhXgZh+DY99yW5Ny2BnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qz+UZOgqs/blgC36znMmdAFW1p4kHpWqbxDMzOFXe4hsgJbRaoSlpWRboMaBp9a4N
	 Hh2TWTxbsBOuzM4rnRUXUakv+oGvXfa+iMKTDQ7h+D0Ak8I5D+Mx58jUH+KnEvtTzd
	 Mx07u1RngiEaA80DJPaRn1ZAO0iQNevK6DJPE2anpuylwOhPfpPBlFhSOLNqcIdPHb
	 UH26appZNdGHcyg9JR8GaazaJW+m4ff0HolYhQ79k+wR/QvD4Obp1MPNhFE369axVv
	 f4loloclWpi0MMKkCrtlfsMoZLv3EBFxdAHGfH0x7KfbIiVDY3ArU0LQ1TIKiVbsco
	 oaplZbbpwZOAA==
Date: Tue, 17 Mar 2026 13:02:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: add UltraRISC SoC family Kconfig support
Message-ID: <20260317-renewably-unroasted-45c63bd0c95e@spud>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
 <20260316-ultrarisc-pcie-v1-1-ef2946ede698@ultrarisc.com>
 <20260316-powdery-unbundle-b1166d13f53b@spud>
 <177372998464.49340.13796019002628537253.b4-reply@b4>
MIME-Version: 1.0
In-Reply-To: <177372998464.49340.13796019002628537253.b4-reply@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_130233_284322_34464AC2 
X-CRM114-Status: GOOD (  22.68  )
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
Content-Type: multipart/mixed; boundary="===============0903675857476256932=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0903675857476256932==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D0QXzGE76B8r3jSd"
Content-Disposition: inline


--D0QXzGE76B8r3jSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 02:46:24PM +0800, Jia Wang wrote:
> On 2026-03-16 14:39 +0000, Conor Dooley wrote:
> > On Mon, Mar 16, 2026 at 03:06:57PM +0800, Jia Wang wrote:
> > > The first SoC in the UltraRISC series is UR-DP1000, containing octa
> > > UltraRISC C100 cores.
> > >=20
> > > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > > ---
> > >  arch/riscv/Kconfig.socs | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index d621b85dd63b..f49d3ccaacde 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -84,6 +84,16 @@ config ARCH_THEAD
> > >  	help
> > >  	  This enables support for the RISC-V based T-HEAD SoCs.
> > > =20
> > > +config ARCH_ULTRARISC
> > > +	bool "UltraRISC RISC-V SoCs"
> > > +	depends on MMU && !XIP_KERNEL
> >=20
> > Why do you depend on "MMU && !XIP_KERNEL"?
> >
> Hi Conor,
>=20
> Thanks for the review.
>=20
> The dependency on "MMU" was added conservatively, but the DP1000 hardware
> does not strictly require MMU. I will remove this dependency in the
> next version of the patch.
>=20
> The "!XIP_KERNEL" dependency is retained because the platform does not
> support executing the kernel directly from storage, so the kernel
> must be loaded into RAM before execution.

I would imagine the reason these are here is because you copied this
=66rom one of the other entries. They have "depends on MMU && !XIP_KERNEL"
is because they have errata that require alternatives to resolve, and
alternatives require those conditions. IMO you should remove these entirely,
especially since XIP_KERNEL is about to be removed for riscv soon
anyway.

--D0QXzGE76B8r3jSd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCablQ3gAKCRB4tDGHoIJi
0rylAP43F4xOqQmtmYS1yFMdltHxtv/9WjhXaTADiOrt/2nFlQD+NpU6v3eVJQFF
hSeFs/3ZkQMeFIsVbIw3qrFDDmmzzgM=
=WHT6
-----END PGP SIGNATURE-----

--D0QXzGE76B8r3jSd--


--===============0903675857476256932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0903675857476256932==--

