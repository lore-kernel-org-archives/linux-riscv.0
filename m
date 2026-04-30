Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49715CD13DA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 18:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YL17+RwtGKAiTdJd4+ttmi0jlT1ox2gS/7mAv4XK96k=; b=oaJGoo04ZF/UgIUqLp4O+Fy/W7
	vdfxt3lZTLuYD8rgOpXdSloMGT2u/fHtpEQ9txeLw+P2z6HGk5+q80Nhrqrq8otycJxYzZP2DSlXb
	zPzZdlDpce6fWHadsTzzkCLCkyy9Mcr1rhLkmdEQ3IANVydNCv1uv5HGFqm1mJZKv42RrcC5a7XPP
	opTTmQL83+lupn6aNrjaLDrTioDjcP0X6VhkDBjPYUSIuAwyLdn03YlP8/9xbndwi1rJYCDFH85eD
	kWVa4+uKcdsNrPr+kYJeoNU7p89cTd7z+CtWgi/XfQgyRD9lWOxNVLUrYLF+FWlhx+auy+tYqPpXY
	3a+DVY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWXo-00000005qo2-0BiO;
	Thu, 30 Apr 2026 18:55:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWXm-00000005qnW-3YX0
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 18:55:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9081C60180;
	Thu, 30 Apr 2026 18:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA858C2BCB3;
	Thu, 30 Apr 2026 18:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777575325;
	bh=lWE9HkFpXw9rtE0Jo05d+/92L9aR9NU3+uP7biB7kcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSdYbXN686KVP7jsq/GKLBRNM8X4srR9OWumOvVV1zxNc7J8KENy7WTw1x1A3yO23
	 iStgzBIpGM0Gnaw/tmJWkdb7xHTfQSShZIEn0I8CiuCLM01kqk6xrHgiwbx2119Cbl
	 Caj+/XrDYXlwvzu/yX4Up2KojwD/1gnLpeA85kCjgBwwjLIl85qQx5r8o0qdyxcTUs
	 FxMj2gOnKUTRkTzz15MXhWP0lsrhE5/ZzJCzCXfDPyHCWlHkOyXqC4/fuevWQexU2d
	 IPVfnJukukpc6C3GWHISN7BhC0+8+iBuQ9kjkDeQsK1gj6MtGYytgK7xiK4GjE9s3L
	 dPWrCGJkqYQDg==
Date: Thu, 30 Apr 2026 19:55:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock
 IDs
Message-ID: <20260430-plug-bolt-8ff9137717fa@spud>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============0771778322057090827=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0771778322057090827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZyWW5ut6GEwR4kZa"
Content-Disposition: inline


--ZyWW5ut6GEwR4kZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 10:30:26AM +0000, Yixun Lan wrote:
> Add clock IDs of PCIe DBI (Data Bus Interface) clock.
>=20
> Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock support")

Why is this a fix? As-is, this looks like you're abusing the Fixes tag
so that this gets backported alongside things that are a fix that depend
on it.

> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  include/dt-bindings/clock/spacemit,k3-clocks.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/spacemit,k3-clocks.h b/include/dt-=
bindings/clock/spacemit,k3-clocks.h
> index b22336f3ae40..dfae52547cda 100644
> --- a/include/dt-bindings/clock/spacemit,k3-clocks.h
> +++ b/include/dt-bindings/clock/spacemit,k3-clocks.h
> @@ -380,6 +380,11 @@
>  #define CLK_APMU_ISIM_VCLK1      86
>  #define CLK_APMU_ISIM_VCLK2      87
>  #define CLK_APMU_ISIM_VCLK3      88
> +#define CLK_APMU_PCIE_PORTA_DBI  89
> +#define CLK_APMU_PCIE_PORTB_DBI  90
> +#define CLK_APMU_PCIE_PORTC_DBI  91
> +#define CLK_APMU_PCIE_PORTD_DBI  92
> +#define CLK_APMU_PCIE_PORTE_DBI  93
> =20
>  /* DCIU clocks */
>  #define CLK_DCIU_HDMA            0
>=20
> --=20
> 2.53.0
>=20

--ZyWW5ut6GEwR4kZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafOlmAAKCRB4tDGHoIJi
0n1rAQCxrTCw7Jgkx0a5N4zQWIUC4Gs8go2JtYFp2UB241sx0gD+NuCdQwdKHF6L
RzmcK+MGhvdUc6DScyb0unK+KofNrwY=
=3o1x
-----END PGP SIGNATURE-----

--ZyWW5ut6GEwR4kZa--


--===============0771778322057090827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0771778322057090827==--

