Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF187C001DB
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLfCDbPHzRjKMtFVHU0XcQMsnxepS7QSHvfbzMnnGqA=; b=OLiueIj4jWaEx0WGSADDtvlOaO
	vp74MdXNZbosAz+ME14vQromhD/K6fz2MN6EtKhYk/qfGIMNGc0fBKxEtZOga7Vrk3CeGojpFQczi
	mFJFNgHnGEG7W/PI7xvffVB4NN26q/rb4QDP6p63QzJWMDgh/XR1tAUg8Yoy9yJuT/kZiTS76+FHE
	/FLnDwvWr6LZ4BXPb25rlLgIZXvvVFcxHlrARRnvVbQhVW473Lml0ylHj0F8ExZTx5lFSqijZO6CZ
	aQkPKPXT/RX0QQ7Qp8wDVkMsURH25k+hrmwkDUzda7tyl2G3vqin2Y/zXmccFq/7hPao9bcjeD/7D
	kSn4h1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcOOf-001N08-1L;
	Sat, 02 Sep 2023 11:02:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcOOc-001Mzj-1A
	for linux-riscv@lists.infradead.org;
	Sat, 02 Sep 2023 11:02:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8DAE6B826E7;
	Sat,  2 Sep 2023 11:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C0FC433C7;
	Sat,  2 Sep 2023 11:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693652541;
	bh=nWRp3kNt0uCKDvR/efj7kKP5j/V5vGO+TJUPxq8elAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrjcyFPTU160rKO1Kt5+wuQbuw/7eRXtQtTi7/Swk7y6ewBq3wg0e0oStgpLsusQQ
	 zV/xmjisEPfLduUTVDQJ0W+n1JByouskEBEJDNX9dPdp1Poaizxr/P5KwUrTs2tiTa
	 f14Lgt4db+SU6JE3Z/m37wBPJX0H+Ni5UAV+ygFzNUVtpf5hpsb4OqrR2FoFGAC42R
	 5m5ATCxAsj54sobWtYs1nV7a/9p4smXKDq+absVI7AXIWxtcbA5LwKHYq1onnCybfS
	 g5rSLhmJoeWdhFkuwQhl9+NOXXSkno6+TUTcBeb6yM4uHsZBTdz+GKuwTiTSKG22xv
	 COIjyYMxH2Mzg==
Date: Sat, 2 Sep 2023 12:02:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: Kconfig.errata: Add dependency for RISCV_SBI in
 ERRATA_ANDES config
Message-ID: <20230902-plexiglas-cannot-e4ca8494ef95@spud>
References: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_040230_667500_97450987 
X-CRM114-Status: GOOD (  21.73  )
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
Content-Type: multipart/mixed; boundary="===============4379199829543785843=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4379199829543785843==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZRn/ZXZBHlvjdjg5"
Content-Disposition: inline


--ZRn/ZXZBHlvjdjg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 12:03:20PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Andes errata uses sbi_ecalll() which is only available if RISCV_SBI is
> enabled. So add an dependency for RISCV_SBI in ERRATA_ANDES config to
> avoid any build failures.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp@i=
ntel.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replied here earlier, but pressed the wrong key & it only went to the
list.
I think this patch probably also needs to grow a Fixes tag, for
commit f2863f30d1b0 ("riscv: errata: Add Andes alternative ports").

The 4 Kconfig patches ideally would've been in a series, since 3 of the
4 seem to be fixes & the 4th depends on one of the fixes being applied.

Thaks,
Conor.

> ---
>  arch/riscv/Kconfig.errata | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index bee5d838763b..566bcefeab50 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -2,7 +2,7 @@ menu "CPU errata selection"
> =20
>  config ERRATA_ANDES
>  	bool "Andes AX45MP errata"
> -	depends on RISCV_ALTERNATIVE
> +	depends on RISCV_ALTERNATIVE && RISCV_SBI
>  	help
>  	  All Andes errata Kconfig depend on this Kconfig. Disabling
>  	  this Kconfig will disable all Andes errata. Please say "Y"
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ZRn/ZXZBHlvjdjg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPMWOAAKCRB4tDGHoIJi
0taDAQCl8QFGGuuCZWZwjq0NAg/MOvQ1IE3aTOyReSkf3CSWmgEAhGTMm/mRzXsS
Y5+ZrqbMvP+CtswbvJi7NfMs8BhfPgw=
=KonS
-----END PGP SIGNATURE-----

--ZRn/ZXZBHlvjdjg5--


--===============4379199829543785843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4379199829543785843==--

