Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA94C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 19:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9tJ92WmdPs6HRsZ6UMC3BRQCPtLto8thZzOPvHNtpk=; b=oubulvbHquhU6VLLyNoLb6bu1A
	HVLvcplQjTB7U4LWkuKGqaJftPZKCkQBkI0y6KfITh2Onc5kp7HSKbstaeTR24gWtb0dsFAjOYUK2
	fZs6g10R5reGQBFs0zIMefcHYtKj36xd8NZKiM3D80tc/2qYqoucN3ZVp0VWeBTU4LVDVCj51U/F5
	9CdFzrAqQgZG1QOl7xDFZg1C6XJHcbisPsGJbsaA1VDjjEkZMWvar9zJxVtIOxqvznjLt6iKlnb1C
	Tc04oq+/GACekWsC8hOxpg+gI4F09Ma5l+rM5uyJ1d1nc2Cfmvh5iv6QMCJpm75q+ECnD69OvmiN7
	hFiN87fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9j8-00000006fIn-05HA;
	Tue, 24 Jun 2025 19:54:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU643-00000006D2M-3LUv
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 16:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F30B960010;
	Tue, 24 Jun 2025 16:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05257C4CEE3;
	Tue, 24 Jun 2025 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750780802;
	bh=oAj6M5RJNPj9zPVNfLaIS7Hz87nTWDNolCrwMJkPsAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdctnZWYTC2OySmeHB0kk3tnxgJZhoD2Eszg4FdDvvp+inSJCTCGaDxjW5Lgqn03T
	 pCrEQrvJU7EuKdEChDca44k/Bi3meJzZNJ1HpC/L7VmFBlsc8bgdxqXyTHa3BX1LW5
	 pUdH9oU7w9n+Ipb7C0SZR+f3x91NOtFln7yoANDlOujkjcu/Kg3FPjylHH1BCpoeJh
	 /ks5EEIbWYW8Gbq0WgH/6rq6+r3SnqtUx/MOaR62bnRhpj97dE0f2ZwGn7WmHwLsln
	 ijKFARQzyMJ65Ttx9CarMFe0ZyAwVGIGYu+Xd3winavaZacvw087EBZbB8TswaPzMP
	 gpzs14eDgxrzQ==
Date: Tue, 24 Jun 2025 16:59:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: microchip: mpfs: Fix incorrect MSSPLL ID in error
 message
Message-ID: <20250624-monotype-disorder-aedee5ef7cfa@spud>
References: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============1798347063279828544=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1798347063279828544==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kYIau9vyQZzfZ+VS"
Content-Disposition: inline


--kYIau9vyQZzfZ+VS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:03:49AM -0700, Alok Tiwari wrote:
> The error message in mpfs_clk_register_mssplls() incorrectly
> printed a constant CLK_MSSPLL_INTERNAL instead of the actual
> PLL ID that failed to register.

Huh, that's weird. Did you actually encounter this happening, or is this
some sort of patch based on the output from a tool?
I ask because I don't see how this could ever actually report a
constant, when the array it loops over only has a single element.
Feels like we should just do something like the following (if we do
anything at all)

Cheers,
Conor.

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-m=
pfs.c
index c22632a7439c5..ed6d5e6ff98ec 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -148,22 +148,18 @@ static struct mpfs_msspll_hw_clock mpfs_msspll_clks[]=
 =3D {
 };
=20
 static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspl=
l_hw_clock *msspll_hws,
-				     unsigned int num_clks, struct mpfs_clock_data *data)
+				     struct mpfs_clock_data *data)
 {
-	unsigned int i;
+	struct mpfs_msspll_hw_clock *msspll_hw =3D &msspll_hws[0];
 	int ret;
=20
-	for (i =3D 0; i < num_clks; i++) {
-		struct mpfs_msspll_hw_clock *msspll_hw =3D &msspll_hws[i];
+	msspll_hw->base =3D data->msspll_base;
+	ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
+				     CLK_MSSPLL_INTERNAL);
=20
-		msspll_hw->base =3D data->msspll_base;
-		ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
-		if (ret)
-			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
-					     CLK_MSSPLL_INTERNAL);
-
-		data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
-	}
+	data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
=20
 	return 0;
 }
@@ -386,8 +382,7 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	clk_data->dev =3D dev;
 	dev_set_drvdata(dev, clk_data);
=20
-	ret =3D mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_=
msspll_clks),
-					clk_data);
+	ret =3D mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, clk_data);
 	if (ret)
 		return ret;
=20

>=20
> Update it to msspll_hw->id for accurate diagnostics
>=20
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/clk/microchip/clk-mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk=
-mpfs.c
> index c22632a7439c5..d12b7120f16ff 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -160,7 +160,7 @@ static int mpfs_clk_register_mssplls(struct device *d=
ev, struct mpfs_msspll_hw_c
>  		ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
> -					     CLK_MSSPLL_INTERNAL);
> +					     msspll_hw->id);
> =20
>  		data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
>  	}
> --=20
> 2.46.0
>=20

--kYIau9vyQZzfZ+VS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFrLfgAKCRB4tDGHoIJi
0vgFAP9GyzbHnazol+NlKh5je3tRgPsVvN7IpkQiog8B5K4D0QEA2xnruSiwTK/I
46n97dx2MdGT4uUpeQbsfTsUm0KjmwM=
=SyNN
-----END PGP SIGNATURE-----

--kYIau9vyQZzfZ+VS--


--===============1798347063279828544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1798347063279828544==--

