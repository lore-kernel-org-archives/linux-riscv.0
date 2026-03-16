Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CD7F506E0
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1cp3FsLNUdtiYK/WC7nHjJV8uVz4UT95iusZ8HXKCs=; b=yZWCO+OoalSpTvv5lSv98qdjCn
	I9QxZ6uwoHUd3PuoqazLkvU7PKK5MoTXm98zL8fNR1XFwYRmCvzd/jmT2O4JOWJZU5vQK4RlufmOI
	SrNXifOhv5XRPWHfxlxOyie8DvVrPJOwD+hiAFyyBmGczwFdNlnpagKyGZi1vR/PburEQcZOXSws6
	aVweTprPB6PKiuI6BkiZGD3GTEhvKVhtlzt8aDg+/KegO+stXdrOd5t8g84uXffMuCHeyiEdGiq83
	HqTekOpRLQatJh0YoVknEMvRVwVFXe7L8Uo81qKLsvUV3MdFNzJVOkv4yAQ6DQkFYcTnvLb7WA9wo
	XSn0ap2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w296K-00000004CWx-3fgT;
	Mon, 16 Mar 2026 14:39:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w296J-00000004CWX-21EK
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:39:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 798C6600AD;
	Mon, 16 Mar 2026 14:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BA8C19421;
	Mon, 16 Mar 2026 14:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671962;
	bh=+mvv7r3Vkd9Ef/iLR0Zs1FGWEywTSdXOK8C9f6GXNSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7q4TnA1YJVeSMZKWRHqWJntFiKHntjL3mVZo3SuqW51s1AChvtvBT8nYvvcvAAjI
	 fsj6r2vqsrheQ4r9PBsMqL01RphqK2bpmYyydtgdCa8PZq1QSXjC6JzSNnHxVye2Dz
	 6fwkPL1BaE8hOnstgJ7mP7Y07bZ+XgcrVH3hjQXSzAvd5tp2y/ahYfl2ARZ5xen7yt
	 Ppex/MfYnJd05CkYPuk3JeP4VCYwErCK2IkRG+GT6S3Er9mANKkb0bHeplh1VEuSdm
	 0+t5/Yzi3dmDi1b4ADLGdb3m+fmRs0XBzoGzo35esXKRW6jGxErseGSdpNnEQs3dMH
	 zU7gUYfZyKubg==
Date: Mon, 16 Mar 2026 14:39:16 +0000
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
Message-ID: <20260316-powdery-unbundle-b1166d13f53b@spud>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
 <20260316-ultrarisc-pcie-v1-1-ef2946ede698@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260316-ultrarisc-pcie-v1-1-ef2946ede698@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============5349559281655064554=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5349559281655064554==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="77NVXxmwy8lu9z90"
Content-Disposition: inline


--77NVXxmwy8lu9z90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 03:06:57PM +0800, Jia Wang wrote:
> The first SoC in the UltraRISC series is UR-DP1000, containing octa
> UltraRISC C100 cores.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  arch/riscv/Kconfig.socs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index d621b85dd63b..f49d3ccaacde 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -84,6 +84,16 @@ config ARCH_THEAD
>  	help
>  	  This enables support for the RISC-V based T-HEAD SoCs.
> =20
> +config ARCH_ULTRARISC
> +	bool "UltraRISC RISC-V SoCs"
> +	depends on MMU && !XIP_KERNEL

Why do you depend on "MMU && !XIP_KERNEL"?

> +	help
> +	 This enables support for UltraRISC SoC platform hardware,
> +	 including boards based on the UR-DP1000.
> +	 UR-DP1000 is an 8-core 64-bit RISC-V SoC that supports
> +	 the RV64GCBHX ISA. It supports Hardware Virtualization
> +	 and RISC-V RV64 ISA H(v1.0) Extension.
> +
>  config ARCH_VIRT
>  	bool "QEMU Virt Machine"
>  	select POWER_RESET
>=20
> --=20
> 2.34.1
>=20

--77NVXxmwy8lu9z90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabgWFAAKCRB4tDGHoIJi
0kfCAQC+/WgX8p/XaK/3hhi3OD3wO0xX5tzs8Ld0kia5edHwsgD/aJNp0dlufRCQ
PfW5xC/axFIwCGfzQ4P9VfKIqzzeyg8=
=b552
-----END PGP SIGNATURE-----

--77NVXxmwy8lu9z90--


--===============5349559281655064554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5349559281655064554==--

