Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46847C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wERydOeUGtVuXk9RH1m7IM1Ri6Chc5l6wNPAtLXLNeg=; b=PAGrbNMCzoBZy4M/2nOV/YhdtQ
	JeGPLTcUrlyXFYL8e37W94GHW3lo5yTuAaQ+Q4Cws2n5Y2JqWP6o2Il9ThVfTMOIux87zckSRbQ2P
	HnkMeQ6N5qX0Funq/k2Slpy4oi9v6BIUlxrIkiSJLQR/9+zkySjClITduQMBEeXOzjHJYpBYNWP1/
	y+r8LgHNQzKWHApTrIkPO7f2cnexEENk4gANC6IR+TAMsFBZzBu+LPYdnahGEhr2Hrzze1LBaFJXq
	kot0+MB8//Qk6FBZAej9IJVoOke9X+hZJ4ox6eCHsWvn/UWivvKvtAdUr5jB3GVXA6JkAtX/1ky1y
	Am+Ad8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY7M-006vhT-9C; Fri, 10 Feb 2023 18:27:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY7I-006vex-GV
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 18:27:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB4BA61E52;
	Fri, 10 Feb 2023 18:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE21C433D2;
	Fri, 10 Feb 2023 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676053643;
	bh=ru75vqtNeMxKc3i0lMcAyuNObS+r1MZ5Asn18pE6VEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bExP0i1cFK40vvmYCrycuDh+WjwLa2A90peLfb3/ogMKDO9XuDfBTD23KWz18nVCD
	 4ra0gPY9RpVaWrlu/gA/nChu0wb5Nz3+RMd4FilqdWClPRewfwSF5W7gcB3P16hS2U
	 IyGquHfsILS/4gcZy1b8zOClq9qFtOjO6xuKxMJz9QVjLteyYlqJBF7JWts0+ZqVEG
	 pGIXXumGOtroOGUaoHyY3bls6d2tqwEIfjbJ7e/dCiUEvnj7ETP8DB59lMtOVj57Yl
	 lis0TvIUErSK0dqmpvsqcGQuMhXIAG+tmloT4zNwE7IEiECp0ZH+637gCX5jT9W4r9
	 888/xEl2XM2Fw==
Date: Fri, 10 Feb 2023 18:27:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: mcgrof@kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 8/8] kbuild, PCI: microchip: comment out MODULE_LICENSE
 in non-modules
Message-ID: <Y+aMh5e9bWaTphiZ@spud>
References: <20230210164749.368998-1-nick.alcock@oracle.com>
 <20230210164749.368998-9-nick.alcock@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230210164749.368998-9-nick.alcock@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_102724_645343_B8FE9E2C 
X-CRM114-Status: GOOD (  21.81  )
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
Content-Type: multipart/mixed; boundary="===============3228800122567744282=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3228800122567744282==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UQcsHPcpF5ooaooy"
Content-Disposition: inline


--UQcsHPcpF5ooaooy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Nick,

FYI $subject seems wrong, this is a PCI patch AFAICT.

On Fri, Feb 10, 2023 at 04:47:49PM +0000, Nick Alcock wrote:
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>=20
> So comment out all uses of MODULE_LICENSE that are not in real modules

This patch should not been needed, there's an existing patch to make
this a module:
https://lore.kernel.org/linux-riscv/20230111125323.1911373-4-daire.mcnamara=
@microchip.com/

> (the license declaration is left in as documentation).

I don't really get this one though, why leave it there as
"documentation" when the file has an SPDX entry anyway?

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org

One for the future:
How about also CCing those listed in MAINTAINERS for the file you're
changing?

Cheers,
Conor.

> ---
>  drivers/pci/controller/pcie-microchip-host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/c=
ontroller/pcie-microchip-host.c
> index 0ebf7015e9af..08c0b778ce67 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -1135,6 +1135,6 @@ static struct platform_driver mc_pcie_driver =3D {
>  };
> =20
>  builtin_platform_driver(mc_pcie_driver);
> -MODULE_LICENSE("GPL");
> +/* MODULE_LICENSE("GPL"); */
>  MODULE_DESCRIPTION("Microchip PCIe host controller driver");
>  MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
> --=20
> 2.39.1.268.g9de2f9a303
>=20

--UQcsHPcpF5ooaooy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+aMhwAKCRB4tDGHoIJi
0p75AQCjE3hKHpySZYQwvXOT9WAba8RscTwFwxbmiRhPyoihiAEAl4cR0LIJEcNm
hYM+BjoPrEpdFZ6y/x/hnI/5ADnkkgY=
=6q4t
-----END PGP SIGNATURE-----

--UQcsHPcpF5ooaooy--


--===============3228800122567744282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3228800122567744282==--

