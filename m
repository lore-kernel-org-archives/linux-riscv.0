Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8159CD65539
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5jHewA2T0F0twa89xGH11Rns/8PK/ySqgb4TkpvAiY=; b=rutJdWSJmvZl6fj9zjUr+Q9q0W
	5Kt/bP0Kahr6NybxlUDwvYoNchjscbaBezxF6NU5K7+zXM9E9FCO1nlLJ8MczozU7ImYXBYA+l97f
	4prWUe2pgylPn3aqkWmVKNc7qwJYWVKSyBl7fv8cxetEuF1pwzWbgAJqIWSTGs4Y5FJ1ZNMyTs+I8
	cg5Vx7ArXrKEbK2GvPx2ScNaQiaKmhg5CnQ5uobTH4XtEucVnMo05YdDVnPVdUH90vfgyi/zJ49bo
	BNNAmOq7rA97F/gi144US4YvztTx9Sr+ldJ0a99zGmlZXtZ2BFZZdnO5461LYidkivWfMXzPzL+7R
	xiTqPOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzn8-0000000BMdo-3GP2;
	Tue, 26 Nov 2024 17:56:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzn6-0000000BMdS-38Z7
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 17:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B655F5C5CB5;
	Tue, 26 Nov 2024 17:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93DBC4CED2;
	Tue, 26 Nov 2024 17:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732643759;
	bh=yoe2aMfpN0ZQwA0Nsmhpzu/IECyL8ebWI8rzUr9nDcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGpCcL44tIaBfqJ9h8Z6sSrq9vHUy4aknC6G7Yo/7UA9UmZIDIDMX/8kSL4GCCuo6
	 QV5fzIM7GEq4Ta01ZJzxgDNeG0SFr1FDaCrvwzGS2acld1bmJYq67cwvE6sYlXPloa
	 21h8NgWZvFUYQD6RyqnVUxqPLACQdFPNO78BzwBxBVo2nw4279WZVO1Ybt9IkJf/Wl
	 dqPqmO30OHeDEypdbWQ0lJ7KTj+iATvqEI8I9bSa9Scqwz16j338xUMegFUdS6ERpI
	 hc4lpSrUv8SguVxbCQl0N5ffOqsXIAq0FRMICd4SPqQMd58cNxqElEZ7slI/xfeqcz
	 Hx+j55aj3Ml6g==
Date: Tue, 26 Nov 2024 17:55:55 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] riscv: dts: starfive: jh7110-milkv-mars: enable
 usb0 host function
Message-ID: <20241126-overlying-estranged-97adaac4d1aa@spud>
References: <20241126075740.17419-1-e@freeshell.de>
 <20241126075740.17419-2-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20241126075740.17419-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_095600_825123_4A7D14E7 
X-CRM114-Status: GOOD (  14.20  )
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
Content-Type: multipart/mixed; boundary="===============4058597599625585214=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4058597599625585214==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z5dDKqBsszanwcNU"
Content-Disposition: inline


--Z5dDKqBsszanwcNU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil,

On Mon, Nov 25, 2024 at 11:57:25PM -0800, E Shattow wrote:
> Milk-V Mars set JH7110 on-chip USB host mode and vbus pin assignment
>=20
> Signed-off-by: E Shattow <e@freeshell.de>

Could you look at this please?

Thanks,
Conor.

> ---
>  .../boot/dts/starfive/jh7110-milkv-mars.dts    | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/ri=
scv/boot/dts/starfive/jh7110-milkv-mars.dts
> index 0d248b671d4b..3bd62ab78523 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> @@ -53,7 +53,23 @@ &spi0 {
>  	status =3D "okay";
>  };
> =20
> +&sysgpio {
> +	usb0_pins: usb0-0 {
> +		vbus-pins {
> +			pinmux =3D <GPIOMUX(25, GPOUT_SYS_USB_DRIVE_VBUS,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-disable;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
> +	};
> +};
> +
>  &usb0 {
> -	dr_mode =3D "peripheral";
> +	dr_mode =3D "host";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usb0_pins>;
>  	status =3D "okay";
>  };
> --=20
> 2.45.2
>=20

--Z5dDKqBsszanwcNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0YLqwAKCRB4tDGHoIJi
0sjcAP0XHuNi8u8P9di83xPPA/z8nh20Ql4kpuMWbj0CYh8ibgD+No+pVtoiDPwV
dh4QqWI+PJHY/AoivxsquLxdzqhPYgg=
=Tsrh
-----END PGP SIGNATURE-----

--Z5dDKqBsszanwcNU--


--===============4058597599625585214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4058597599625585214==--

