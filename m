Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75551EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAxmt3do9GBuD7R4tfGETmm7JIc9dIF1VsTSlvsdqO0=; b=ETYKTf6TC/2PS6fmEF/iRImeQE
	DERVDhUf6Mdctb+r4M334Ehz/PfuJDVWByfLS1lt2D76Pyna2kvI1XztLueNfCnQwR3MTw5hkQkHs
	NixNu1c9fIaUbL4nekGYw0lj29NugWsY9RGdSvWyH+rTz7Lnu3lUi/FK+ISol7LdTryYKkLJW8JPz
	UPQFINmo2Cy2Xtwtvq8cUT1yp3TS3jiVrJlA+hfnyvpWVD7aHx9CX27uh+OOG3bVh1CYGh84hsUvV
	0JehKllbx/SXjospy6+Xzk48+mGti3STdzii/M82pDmR/6xi0VGm56N7PnX7GeyTQT5rleTuLvzOf
	ktSCafgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj0e-00DpwI-1z;
	Tue, 04 Jul 2023 16:36:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj0b-00Dpvj-0B
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:36:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84D2A61297;
	Tue,  4 Jul 2023 16:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB81AC433C8;
	Tue,  4 Jul 2023 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688488568;
	bh=SpCc/weuyI1enRk2z+oPYTNzEGwpO7yEdehgY7f+AWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHuqBcTPhFwBuGWWekOGnA+R20jbK7lqaqwuyE7UQGbmEC3xmdVaH8gUy8+PSq2dW
	 MzJ/RgUxbPfHyW2YgQbSoMCEhuGlHSNZH0vh5y+/5Oa+J/5CNZwbsV963ZYqD0j+Ko
	 wVTpn7IPAtTb0/WswB3KvI15qMDfCVPCn56MhPfl++jKWOwm9GWBhc7TlvBmjuc7pT
	 w+0zP9tAOAtBA/dYRcPTyVifr91lh4DATbndhr5eqLXwP/51RdAEmj/68uv58EML+x
	 cnZOIMvBySTdyK3NOwehaCrIKogaGBVA753mu0SjtuinC4w0ds+hofBltK+MwYzBPJ
	 N1b6uSCjwfCug==
Date: Tue, 4 Jul 2023 17:36:03 +0100
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v4 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <20230704-gooey-lair-2bc45bbd163c@spud>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230704090453.83980-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_093609_160476_5FF4E1A0 
X-CRM114-Status: GOOD (  15.47  )
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
Content-Type: multipart/mixed; boundary="===============1866227073814862187=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1866227073814862187==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oezgEO9YoqNnv0Dg"
Content-Disposition: inline


--oezgEO9YoqNnv0Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey William,

On Tue, Jul 04, 2023 at 05:04:52PM +0800, William Qiu wrote:
> Add QSPI clock operation in device probe.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@i=
ntel.com/

These Reported-by tags don't seem correct, given they were reports about
this patch, not the reason for it - but did you actually check that you
fixed the errors that the patch produces?

This particular one seems to complain about a hunk that is still in the
patch & the CI running on the RISC-V patchwork is complaining about it.

Cheers,
Conor.

> @@ -1840,6 +1858,8 @@ static int cqspi_resume(struct device *dev)
>  	struct spi_master *master =3D dev_get_drvdata(dev);
> =20
>  	clk_prepare_enable(cqspi->clk);
> +	if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))
> +		clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
>  	cqspi_wait_idle(cqspi);
>  	cqspi_controller_init(cqspi);
> =20
> --=20
> 2.34.1
>=20

--oezgEO9YoqNnv0Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKRKcwAKCRB4tDGHoIJi
0pUKAP4wCw+hgpLoiMvepR3gmuLN/5ClOIQW3zICq88ap7eALgD/c9nTYk9tJZ8T
KdMpFaUJKzecsdmo6+5ZMbLvRRp2GwI=
=yjLt
-----END PGP SIGNATURE-----

--oezgEO9YoqNnv0Dg--


--===============1866227073814862187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1866227073814862187==--

