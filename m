Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFBFF43821
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9O67K30iXIPjKhFj9J64JeWx63MJ1jKO/88kFZat12w=; b=bLZ0SdgXzlQ4WILxsLH0Ys1ro7
	204dlTI7aia8UJ+zRZmPlVs9RpYhsOTuyWdwBVyZf1QyurTbAUBvNT2NS4McWjJ4GQ5tkEhqc6LkZ
	YxTgbSep393RLr8ndOOMavnRyXuoPt1LTz94/CuKyHVjTrcinGcMrZFgvcqK7hyIi37zU9wLKKSqJ
	MBE1WrAVy9kPh0ix9VjGu/P26BGFpQZePSkJMZZQjlh6DESOABBO5UPiBepaPxuow9m2pwM9gZNUW
	t4T8gnG+jLCVY0u1B/ApZfntSEA1L5M0KgdVFLMJfBA5IJYgKaokklL6cuYx9q2SBCpbvetKPZn82
	Og4l+Bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1EC-00000001Eha-02cW;
	Wed, 15 Apr 2026 14:28:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1E9-00000001EhF-1Gm9
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 14:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 240FC42D6B;
	Wed, 15 Apr 2026 14:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35EBC19424;
	Wed, 15 Apr 2026 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776263304;
	bh=KLZl5mWnQ/fLEg517Nj8h/rm6MAMa8dENX79Fq95dso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/YX+RVRFmDbZUEUouHLuZhFFOhEriVotbvOFw9wxSIAFOu1yin3oKr9hQA0Qc6pR
	 I+WFVtfV4rosaPXwqeX+Kw27EcgVj1wXrS3hkWJI6FDy6VzZ/VM4FeseN1YJUcOtKF
	 cIcgd6P3ftw6wMwBFE9Y5dT8LLZ8beEgm4Maazw7DT9d8U/b5MKbcLdDahzLWTvnq8
	 y/Ia9YUWY2hscVdDJP/lLNEJaYQz2XQGSMPfrI7GvlevKVswmJ/nF5Bl8wOzaYMnE3
	 3DB6G88J25UbvGy8+m0Peq0i8FqFF4fMf3+qxz5TJSxVacU/syZf5Hlb4HhAvCdLsO
	 GpYzCyeW8yc9A==
Date: Wed, 15 Apr 2026 15:28:18 +0100
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
Subject: Re: [PATCH v3 1/3] riscv: add UltraRISC SoC family Kconfig support
Message-ID: <20260415-craving-rubbing-bc8d389d19de@spud>
References: <20260415-ultrarisc-pcie-v3-0-73f06e972616@ultrarisc.com>
 <20260415-ultrarisc-pcie-v3-1-73f06e972616@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260415-ultrarisc-pcie-v3-1-73f06e972616@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_072825_384671_CE31792F 
X-CRM114-Status: GOOD (  15.52  )
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
Content-Type: multipart/mixed; boundary="===============3739132551671547765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3739132551671547765==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m8S0HS9rYZzLUqT+"
Content-Disposition: inline


--m8S0HS9rYZzLUqT+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 03:21:17PM +0800, Jia Wang wrote:
> The first SoC in the UltraRISC series is UR-DP1000, containing octa
> UltraRISC CP100 cores.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/Kconfig.socs | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index d621b85dd63b..0b4d06a7b4bf 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -84,6 +84,12 @@ config ARCH_THEAD
>  	help
>  	  This enables support for the RISC-V based T-HEAD SoCs.
> =20
> +config ARCH_ULTRARISC
> +	bool "UltraRISC RISC-V SoCs"
> +	help
> +	  This enables support for UltraRISC SoC platform hardware,
> +	  including boards based on the UR-DP1000.
> +
>  config ARCH_VIRT
>  	bool "QEMU Virt Machine"
>  	select POWER_RESET
>=20
> --=20
> 2.34.1
>=20

--m8S0HS9rYZzLUqT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+gggAKCRB4tDGHoIJi
0k5KAP9cH8g7du35W2DxfKVlGZGBX5/qlVgxSMv7M3SiUrg/7wEA4Wam3N4GLDGE
WWQIvTM0dOVnQcN5PygYLDSqx+9yGQk=
=gd+p
-----END PGP SIGNATURE-----

--m8S0HS9rYZzLUqT+--


--===============3739132551671547765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3739132551671547765==--

