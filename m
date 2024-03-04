Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055DBC5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eu+bfwDrHXyqljOIxSD9Xdi/2P7JWGdMnQB1o5+5jns=; b=FUpXtF/0z50n2q4GtzjoBrUtqH
	ZIMCSxVqs7vxbNrRNWf8NZciVUd3gpReEWKOLs4zs47sixoOHdRiGcwD8m5fBgyzlsbZkk47LCpj4
	ukO71pTyl/ZcBl9VGY4KEQTosbiItpcMgFjVj3G/bBlL0XjV+e/haTQIiibLqsnaf7FSSi3LiSWBN
	VV3ddfROvmFhrjQBik7La9xATv740jYV5lOjQpckY1RxdnTwmjbQEWyPsi8wynjZggBJd7q00nx45
	4H1qs4AyCTbmyxKQxmyrvBvS/G3xSe9rUZ2XzsaKtiQ52SYvgjpWceyWIHsGej7+QbrZUkEq0n2b9
	QSmVVsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5aT-00000008cUj-0ZoP;
	Mon, 04 Mar 2024 10:30:25 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Kr-00000008YTr-2NOu
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Mar 2024 10:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RJSHTAS026eHaV1QNQCmIUMIqEKz6C6nIPpDZDW3dhM=; b=nBIEjUxsG2rCl13VaUaDCZuZaC
	Ep/rLNwL1Xo7Q1JPK4InL0+QJdGrzYMcxbd6jR2hJhevEatSdcdhZppYhKlPar1mN7HURqKIm9zzp
	O7EMDnraUmRRy6YpUrdAse+dIV+4mKfM73a5bYDbX3pk0AUlnvK09aL912l16UU+SydV6xJv0Gy8c
	ScdJw/DC7I1km5XajWYdA+8shQdN5D7Z1Vc6D/zM36pYh5O48vG+Rw/v2SeyYprrDXuISj0CBYHJ1
	ddkmNXAbYpJEKlIW8PetHj0Xljq1Emx9e42I4tym6HvmgZ8FGvBEC21bfP8Go1r7wlxvkBErhatGL
	vt7Uhe2A==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5KN-00000004mzM-0UgZ
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 10:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709547227; x=1741083227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sJ4KOxVtmcc7XeECsdsqOlAheKAO0mDagIQEbtEy1/U=;
  b=Dz8M72Mp1dZJrPNRwcBFZS5RYOWILvY1A4x4jmI4SCwg8TYVQ7riSwZQ
   0WZmsPkuDk4sYh2YXlr7wuI+6R2fdME2C6edKNrdoyKKkehdq8EvOZGqj
   DGKQwPHL1ytpcOr3xjb384U4T/jaXArK8WC23U2EDCLRQNKbjzRjj+4l6
   kK3Zs2UKLQlt2kFZbW4Azfdr70naTd5Mj/GJGjh8DllvrO1ZJTkx12FcD
   QXyoZtD3MBsAyR3EpDuIZEFt4EJgZO+7imJu+B/NWcMjtIZPR51C2vCyV
   5lmiQ9feV85Rd93C/BhFNIEGles9lcsVLDPXNBv15V7GGmcXT6jNtAv97
   g==;
X-CSE-ConnectionGUID: Goj1IDGUTvCf0ooKZ5NpOg==
X-CSE-MsgGUID: NuxxthElRJ2+wV0lAx3k4g==
X-IronPort-AV: E=Sophos;i="6.06,203,1705388400"; 
   d="asc'?scan'208";a="247916573"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2024 03:13:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 03:12:58 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 03:12:56 -0700
Date: Mon, 4 Mar 2024 10:12:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: <linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: riscv: Add T-HEAD C908 compatible
Message-ID: <20240304-password-swerve-f82a682fb619@wendy>
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
 <tencent_BD3B8D107CA98249DA8D8EFDB862310A2108@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_BD3B8D107CA98249DA8D8EFDB862310A2108@qq.com>
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
Content-Type: multipart/mixed; boundary="===============3151145144072602984=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3151145144072602984==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ugvRUHfMu+512og8"
Content-Disposition: inline

--ugvRUHfMu+512og8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2024 at 09:26:23PM +0800, Yangyu Chen wrote:
> The thead,c908 is a RISC-V CPU core from T-HEAD Semiconductor which used
> in Canaan Kendryte K230 SoC.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 9d8670c00e3b..e853a7fcee8a 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -47,6 +47,7 @@ properties:
>                - sifive,u74
>                - sifive,u74-mc
>                - thead,c906
> +              - thead,c908
>                - thead,c910
>                - thead,c920
>            - const: riscv
> --=20
> 2.43.0
>=20

--ugvRUHfMu+512og8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeWefAAKCRB4tDGHoIJi
0lyxAQDRzUkuJwBkpYeAvRrCLhGNK9XYFWh7fKJrI7yo2WVD/QEAik6+0zb4XGGW
M8ScvQFXGFBwYs1ke00bhDaARkvIOgg=
=+dYI
-----END PGP SIGNATURE-----

--ugvRUHfMu+512og8--


--===============3151145144072602984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3151145144072602984==--

