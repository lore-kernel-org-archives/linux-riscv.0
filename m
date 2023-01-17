Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF014C63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 13:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOF04fu3AR/olC03vgjEgONzejCmW/X0OIGbnaYRp4c=; b=up5Z8m+QqT/M3TqDds5cZSUsSD
	abOnukMo4TtQo1JQvc3NyRQYb6pZ0p1BJ3M1PckAYSPvswSo/14Fq1hCkxheFDmY77lOY0aYf6iyP
	5afD4AvFMZw/qfAWKxOd/5m+gCgvNaBS7Gs0oXEHkdPYtF6nlkzG+z/kT0u0McsgSHBUEGB6lUlbA
	l/kHmrjGys09FWhDAm0Xz2g7rTP6R2l6f9Aw8OYwxd3Hi7PnaEAN1RQRbiYZ68nNWVbgl8AFXAP8M
	nRc3TiCxhGU5nl2HZdgjIiKv/a3cwaEp6QscJ543Pj64XUM5ZqThXVchpkA1cJ5tvGa660/ftt2TV
	NMujMNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHmU1-00EVie-MS; Tue, 17 Jan 2023 13:58:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHmTx-00EVgI-5n
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 13:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673963913; x=1705499913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jw4AntDJemNhljb1WSfot7V9dm7JFvqtbWvMl/JmLC4=;
  b=Upp2OaxyItmBg1dx/DYpFU/I2RJ8iMQSiRWeZoFS34EXHMMNIfzPAbVm
   /jlRgJVjGNRrE3lcP7tn3Vg1sgvPYtWLDEeHP8DftLOGLpAsK71k6MRv2
   yQh0m+sXYFsHE3DtJ2gr/+QYx30EyPUQfGezHE8+MXAiPPu12TAqDJMfL
   Yi816ikDV9EoM7qNaJndZ6qs7UqudKMzdGewxhpOntKq6uA/XAa6VPWIS
   3o+w5swFtuaGocWxSxOiJFslyM4QXDhrxyxcdCfJCKJjgP0RjvPpxHTmu
   0qgmBFNZr6CaRMaZszj0W9i9HVzqYE3w7p+dSe14UljyLxbAqRWSdWwMg
   w==;
X-IronPort-AV: E=Sophos;i="5.97,224,1669100400"; 
   d="asc'?scan'208";a="132725744"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2023 06:58:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 06:58:12 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 17 Jan 2023 06:58:10 -0700
Date: Tue, 17 Jan 2023 13:57:48 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Nylon Chen <nylon.chen@sifive.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<nylon7717@gmail.com>, <zong.li@sifive.com>, <greentime.hu@sifive.com>,
	<vincent.chen@sifive.com>
Subject: Re: [PATCH 1/2] riscv: dts: sifive unmatched: Remove PWM controlled
 LED's active-low properties
Message-ID: <Y8apXMzlDYhuLOqV@wendy>
References: <20230113083115.2590-1-nylon.chen@sifive.com>
 <20230113083115.2590-2-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230113083115.2590-2-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_055833_309384_A3518B41 
X-CRM114-Status: GOOD (  13.42  )
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
Content-Type: multipart/mixed; boundary="===============7333849777449643526=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7333849777449643526==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sCY470tgzGEL1xs2"
Content-Disposition: inline

--sCY470tgzGEL1xs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Nylon,

On Fri, Jan 13, 2023 at 04:31:14PM +0800, Nylon Chen wrote:
> This removes the active-low properties of the PWM-controlled LEDs in
> the HiFive Unmatched device tree.

Does unleashed also have the same issue?
It has the same compatible at the very least.

Thanks,
Conor.

>=20
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 07387f9c135c..11f08a545ee6 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -52,7 +52,6 @@ led-controller-1 {
> =20
>  		led-d12 {
>  			pwms =3D <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d12";
> @@ -69,19 +68,16 @@ multi-led {
> =20
>  			led-red {
>  				pwms =3D <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
>  				color =3D <LED_COLOR_ID_RED>;
>  			};
> =20
>  			led-green {
>  				pwms =3D <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
>  				color =3D <LED_COLOR_ID_GREEN>;
>  			};
> =20
>  			led-blue {
>  				pwms =3D <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
>  				color =3D <LED_COLOR_ID_BLUE>;
>  			};
>  		};
> --=20
> 2.36.1
>=20

--sCY470tgzGEL1xs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8apWwAKCRB4tDGHoIJi
0oUZAP0e0gBBGBiwm+MQJEOj24ncWAh9IauZg6zX7i9eBH9TjQD/Tt9PH6/uULNn
WSahkdpB8z8jOujvbc02ciHmsSMLqQU=
=b3Gd
-----END PGP SIGNATURE-----

--sCY470tgzGEL1xs2--


--===============7333849777449643526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7333849777449643526==--

