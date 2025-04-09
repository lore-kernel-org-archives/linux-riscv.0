Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE0FC369A6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 23:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXWRv82PamrF2j0Px2zODiZvutqnZR5pDXJwy25p86w=; b=Iy+ZC6YTkMEJ65S5A/z569TCgv
	yTDEaU3c0dBVp4gUN0pjREo+tLv8YQwqkvypm4PRfR0tlqnWzqcwcbB8tho/vbufNRxFT35Nrnl88
	OSCvFPP4BmiaE0lcvwHydv3xnH7Gq6DzCfxhqQBMp/DSrOU9YuvIF/fhaJdeiIEV1XxBr+5qvE0L5
	yFpphMpJPJWc89wfBy2IJ17hmnz3lVwVOcHmWU4qgryTEIVdSOPcY+02ewIlQDT++CRdwbe9XXXd8
	qzB2TLVuye+M+1ZLkfNnSTylRpz+reCZ5EU4+Ofab0PKYarhPXhlAaHFKis09lqcJq7ZVTeiZGgo+
	h371F2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ebN-00000008jxC-24gm;
	Wed, 09 Apr 2025 23:13:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cyl-00000008aaN-3Emu
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 21:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0536F5C0579;
	Wed,  9 Apr 2025 21:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF70C4CEE2;
	Wed,  9 Apr 2025 21:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744234142;
	bh=kow1nCnHwGqDGsc6kx25kg3tNataWlAxWwYy4kzu+nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILS6wmiW4KNuP5JE5I+64vndL1hQe4W5cL+3mRYNiIFJXyObzlAIU/dIqY8q7T79C
	 pxW8VgmLtJTPkIdLhQ1+ib/0GBg+8bujbQZlmYD5ZqgwkcgrrfQg9wQYMdMtoh3bwO
	 lcexc0MWRlo4f4DiCVcNlVw1qh5jJEasjbKXNHTLPqoIjVz/YiDc580SObVwF83wRp
	 Wmp5idLRsnK3PUu7TmVjkb4pgKFfTn1pgbdk4XLfQ3eIiwHTzQQx5ixXHMGHAkWvsJ
	 IbxtCERFpJrYrBsR5KGSGhgwBDex2SWrCftzK2LGS7gzz6hbLVkozFtuR0/bozVCp3
	 3M3G9FHMb1h6g==
Date: Wed, 9 Apr 2025 22:28:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v2 RESEND] riscv: dts: starfive: fml13v01: enable USB 3.0
 port
Message-ID: <20250409-pulsate-buccaneer-ae996b6ff98e@spud>
References: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
In-Reply-To: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_142903_868657_EC8C1932 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: multipart/mixed; boundary="===============4859779571209944670=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4859779571209944670==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ssygYa8RWRZNqOUH"
Content-Disposition: inline


--ssygYa8RWRZNqOUH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 10:09:58AM +0800, Sandie Cao wrote:
> Add usb_cdns3 and usb0_pins configuration to support super speed USB=20
> device on the FML13V01 board.
>=20
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Emil, can I grab this one?

> ---
>=20
> Changes in v2:
> - Remove space to pass checkpatch.pl.
> - Add usb0_pins and pass test on board.
>=20
>  .../jh7110-deepcomputing-fml13v01.dts         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.d=
ts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> index 8d9ce8b69a71..f2857d021d68 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -43,9 +43,28 @@ GPOEN_DISABLE,
>  			slew-rate =3D <0>;
>  		};
>  	};
> +
> +	usb0_pins: usb0-0 {
> +		vbus-pins {
> +			pinmux =3D <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
> +					       GPOEN_ENABLE,
> +					       GPI_NONE)>;
> +			bias-disable;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
> +	};
>  };
> =20
>  &usb0 {
>  	dr_mode =3D "host";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usb0_pins>;
>  	status =3D "okay";
>  };
> +
> +&usb_cdns3 {
> +	phys =3D <&usbphy0>, <&pciephy0>;
> +	phy-names =3D "cdns3,usb2-phy", "cdns3,usb3-phy";
> +};
>=20
> base-commit: 38818f7c9c179351334b1faffc4d40bd28cc9c72
> --=20
> 2.34.1

--ssygYa8RWRZNqOUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/bmlQAKCRB4tDGHoIJi
0iytAQCAj+mhwwzQXQIlbDlw6waVQEY9X9FMeCpD8NcU/uJKoAD/WfWT0WNPVjU3
t/4rjgXuGljrypJHRMQOxppAmnkeOgc=
=z5A+
-----END PGP SIGNATURE-----

--ssygYa8RWRZNqOUH--


--===============4859779571209944670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4859779571209944670==--

