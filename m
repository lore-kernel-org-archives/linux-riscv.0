Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D7C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAiVavfHsiqs3Wx1WaNS+qtFUOPHocSxONfv+oG1GJI=; b=Zb4UxV3Y7LiXYf8Lcq4nY8nAyQ
	bGgjCCMG5/oP2r+ZwQVgH8XtuJs4GR0NbnpJOrqRUwRMGXjeYFL+3VB66BzHNFiB0pY6OBNT3Pp9S
	K/PqUwMfJcuTXlMS2rjDh6fLbalrfqg1v2yqgCdDvEba/COAPGRIkNPw8JuDoFeu4G960Njdh1KAF
	/+3Kf2sd2Jq2Cs848ypOc55+Vz1vb67a0KRE/UEkxNq+q5SyiC9D2xzUdR7AZadAMUF360UNkPYPj
	EnsI9TLD008+K0e4MkfKMOJ/JxlFzfL2cuYL8WCqyWmYHl73QffNMiuG5sbJJU/7G5UsGW0u/CKy4
	S/wYAxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFfgU-00Ca9f-5H; Wed, 11 Jan 2023 18:18:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFfgR-00Ca8u-Mm
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 18:18:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2B8A2B81C9B;
	Wed, 11 Jan 2023 18:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268DDC433EF;
	Wed, 11 Jan 2023 18:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673461120;
	bh=Ft6ts49/fdxZzt/+lIGE0K5qPyLC/HSErr1aisZrG78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmPyapBajBJmsUZ/i0FdFZcz5bzc13Um8acMKnukZjL0n+l9flQk20HAYozaMvC0q
	 eCj2+Da18yD40Hx4KC9AVLra2V9syHAQ9l4LrDDB8DmgnajtZq04bOY9SxrHIpvU2y
	 EIBFvTnWCyP2tImK+8/Sdh5UuJBtElqyCF8iXPRd8EQp6HOuppJ7KjwnEOT0TaJ25H
	 h34ZGNCu1+NvvMJWz/ZSW5rWI+vVh3frDv3xgSWV9+PKhV7sdbE0qzxQfvN/BWfkIX
	 zok8Z18lxUNdkgV1PACztsRVX1fBl4rQwWKdeFeuyo1TbxVDBJi6mlpIUrkW438w2F
	 hFnV/Iz2Ttb2w==
Date: Wed, 11 Jan 2023 18:18:35 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 02/11] PCI: microchip: Remove cast warning for
 devm_add_action_or_reset() arg
Message-ID: <Y779e4gfZW5P5gDP@spud>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
 <20230111125323.1911373-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230111125323.1911373-3-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_101844_056280_4DC87649 
X-CRM114-Status: GOOD (  21.13  )
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
Content-Type: multipart/mixed; boundary="===============6800277721382738637=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6800277721382738637==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3ul3IBHmWNX2j1kt"
Content-Disposition: inline


--3ul3IBHmWNX2j1kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Daire,

On Wed, Jan 11, 2023 at 12:53:14PM +0000, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> The kernel test robot reported that the ugly cast from
> void(*)(struct clk *) to void (*)(void *) converts to incompatible
> function type.  This commit adopts the common convention of creating a
> trivial stub function that takes a void * and passes it to the
> underlying function that expects the more specific type.
>=20
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip PolarFire PCIe contro=
ller driver")

Reported-by: kernel test robot <lkp@intel.com>

> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/c=
ontroller/pcie-microchip-host.c
> index 5c89caaab8c9..5efd480e42fa 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -848,6 +848,13 @@ static const struct irq_domain_ops event_domain_ops =
=3D {
>  	.map =3D mc_pcie_event_map,
>  };
> =20
> +static inline void mc_pcie_chip_off_action(void *data)
> +{
> +	struct clk *clk =3D data;
> +
> +	clk_disable_unprepare(clk);
> +}
> +
>  static inline struct clk *mc_pcie_init_clk(struct device *dev, const cha=
r *id)
>  {
>  	struct clk *clk;
> @@ -863,8 +870,7 @@ static inline struct clk *mc_pcie_init_clk(struct dev=
ice *dev, const char *id)
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> -	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
> -				 clk);
> +	devm_add_action_or_reset(dev, mc_pcie_chip_off_action, clk);

Certainly looks a lot nicer this way, so 2 for the price of 1 I think.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> =20
>  	return clk;
>  }


--3ul3IBHmWNX2j1kt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY779ewAKCRB4tDGHoIJi
0g87AQCzYmsXqLFuq7CSIqE4rNjc0xNU0VmLAlH+Se9kAa/SeAEAgxgokT1hVUtr
DSyU7fifErOQxZrXgkYnSguhZVGMvQQ=
=GEx/
-----END PGP SIGNATURE-----

--3ul3IBHmWNX2j1kt--


--===============6800277721382738637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6800277721382738637==--

