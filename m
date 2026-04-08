Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD70FD5F87
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAfHVpUdIIQkUf//0crY+Zco44Y5zZbrcFgioHhR10E=; b=2qp0SQhJeB/4DV2OGJzmGUuq2R
	B9RPU0WkuHpu+cAszIQiOokq0N1LZkjYuIj5iKEBs1rSQLAjRD66evvH+ob/QMH0uZkwfetjdCI9L
	4zpIlb64nGjnpvBlTCA335ugQuP2YM+Zn6Vn0qv7TSr8rPHoPnyXGNC2dpXhb91Xnnf+MB1R+hjV3
	yptMm+Ou8SYrr1qkCQfDfi5KNeC+s8sigo62MnEfUsfgxaOaZLVcoj4nlo/Qkq9CaWAvGKTayYEkT
	/EAVkc4rl/tluNpY4Vu4oXSIX78EEHBPZgaWnvCfmdwD7OL9uJoVSaxkS2nn8YojEuOWwkR+Pw0lv
	u8j8tceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOay-00000008Xqy-3c2y;
	Wed, 08 Apr 2026 08:49:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOaw-00000008Xqe-0ZG7
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 08:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E1AA40676;
	Wed,  8 Apr 2026 08:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B320C19424;
	Wed,  8 Apr 2026 08:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775638145;
	bh=ek8QkVOEsVbLitr6MEFaOhhmZAi7RCruP3Dygqu3nBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIbBesZcGch3iyOQSQ7h0x5wra8eWAju5Chq/VbvbCUUY+HaLOzqcN7hbcYc3TTRF
	 iq4mEDxr3KA16xHzNlq3mJuEIcise5ucwiXCGoX1cOpGvTQ6fsFOtOcgGEDIcBkQVX
	 jkN6TeAyz/H8sNOAMGoG5qKRrvw5WTkYLAiYPqVfYBQHwgZ3tHuRTZfksoPP648fJ3
	 xQ+UklvAWjYWSeXCLEOwHg/VRoP5bSFMYmgEyxPUfXiQIzoKl4jkIFg0G+Scsynuhi
	 6KF4jtGqA+iETidwuAWju2zWmNd059qJT9RFRO9Ph9DpF4N4iLDvBFkW83NBlEXw7g
	 YxJcxSKQyYXQw==
Date: Wed, 8 Apr 2026 09:49:00 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?QWxlxaEgUGXEjW5paw==?= <ales.pecnik@skylabs.si>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: microchip: mpfs-ccc: fix out-of-bounds write
Message-ID: <20260408-patronage-photo-0fee66023c71@spud>
References: <20260408-mpfs-clk-oob-write-v1-1-8b3b387f2a6f@skylabs.si>
MIME-Version: 1.0
In-Reply-To: <20260408-mpfs-clk-oob-write-v1-1-8b3b387f2a6f@skylabs.si>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_014906_237395_6C8C39A5 
X-CRM114-Status: GOOD (  23.63  )
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
Content-Type: multipart/mixed; boundary="===============6557740137334239001=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6557740137334239001==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i5gPPqlIMz55tgrd"
Content-Disposition: inline


--i5gPPqlIMz55tgrd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 07:07:34AM +0200, Ale=C5=A1 Pe=C4=8Dnik wrote:
> Issue was allocated array size for clk_data.
> When clocks are being registered their index is taken from defines in
> dt-bindings. The last 2 clocks had their index outside of allocated range.
> Two defines (CLK_CCC_DLL0, CLK_CCC_DLL1) were not used and skipped over
> which was not taken into account when allocating the array.
>=20
> This patch is minimal change to resolve the issue.
>=20
> Issue was found using KASAN when debugging unrelated xdma driver issue.
> Consequently fixing this issue also resolved xdma driver issue.
>=20
> Related dmesg output:
> [    0.290703] BUG: KASAN: slab-out-of-bounds in mpfs_ccc_register_output=
s.constprop.0+0xd0/0x1fa
> [    0.290984] Write of size 8 at addr ffffffe7be6e3ca8 by task swapper/0=
/1
> [    0.291253] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.43-linux4mic=
rochip+fpga-2023.09 #1
> [    0.291482] Hardware name: Skylabs HPC (DT)
> [    0.291611] Call Trace:
> ...
> [    0.292999] [<ffffffff808508c8>] mpfs_ccc_register_outputs.constprop.0=
+0xd0/0x1fa
> [    0.293245] [<ffffffff80850b66>] mpfs_ccc_probe+0x174/0x30e
> [    0.293437] [<ffffffff808d4af2>] platform_probe+0x74/0xba
> ...
>=20
> Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock supp=
ort")
> Signed-off-by: Ale=C5=A1 Pe=C4=8Dnik <ales.pecnik@skylabs.si>

I think this should be already fixed in linux-next, in commit
2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds access
during output registration")

Regardless, thanks for your patch.

> ---
>  drivers/clk/microchip/clk-mpfs-ccc.c             | 3 +--
>  include/dt-bindings/clock/microchip,mpfs-clock.h | 2 ++
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip=
/clk-mpfs-ccc.c
> index 3a3ea2d142f8..71fbb6265ea4 100644
> --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> @@ -234,8 +234,7 @@ static int mpfs_ccc_probe(struct platform_device *pde=
v)
>  	unsigned int num_clks;
>  	int ret;
> =20
> -	num_clks =3D ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0ou=
t_clks) +
> -		   ARRAY_SIZE(mpfs_ccc_pll1out_clks);
> +	num_clks =3D CLK_CCC_NUM;
> =20
>  	clk_data =3D devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws=
, num_clks),
>  				GFP_KERNEL);
> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/d=
t-bindings/clock/microchip,mpfs-clock.h
> index b52f19a2b480..8d53f2b81a54 100644
> --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
> @@ -73,4 +73,6 @@
>  #define CLK_CCC_DLL1_OUT0	14
>  #define CLK_CCC_DLL1_OUT1	15
> =20
> +#define CLK_CCC_NUM		16
> +
>  #endif	/* _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_ */
>=20
> ---
> base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4
> change-id: 20260407-mpfs-clk-oob-write-a0cec9a5c224
>=20
> Best regards,
> -- =20
> Ale=C5=A1 Pe=C4=8Dnik <ales.pecnik@skylabs.si>
>=20

--i5gPPqlIMz55tgrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadYWfAAKCRB4tDGHoIJi
0gZfAP9gXwx3GIdyR1takM7BUXROC0W/zb5Wc1y6xvb7LI5FGQEAhDPn4T94kaVM
LJ/lyfnYZxRMj99GuFjN/bge/tzkCgc=
=7/jP
-----END PGP SIGNATURE-----

--i5gPPqlIMz55tgrd--


--===============6557740137334239001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6557740137334239001==--

