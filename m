Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C08C369DC
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVsi5jkghjQY2zDpKnbn6IboOwhX08EwoeVWEMJ5va8=; b=uACtGodrPd4m89syKwEpVY0kXM
	5WXhATN4sF2Xo5ib3ZEiV9pfc9IkyhhXmQlG8nVYonhW21J0n84E/2h0F9X0LkMOp5nli94tz7STK
	yPFK+7r6kot7XVxTe6PxQCmdgsFHVyXz3m/Vvs19+oWFZiPUwPcLHSbj6EzF3eQcjlAhBvc1yMzX6
	bkui9INEoPcyeB6mIvmYMtIbjIbrLZaQHMv18LBcou8IP509tiULEF3sr/v+Q4xia10NiYqYop6Ht
	eYjtwjrVpo0fs3HMrmlfloBrgybByOufg6AMkbN7Nf94oYS3m7LkPFNb8vN43KrNaTpZ3ZDHn/C8z
	Pu3XpljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rnk-000000070D0-4BuW;
	Mon, 28 Apr 2025 16:57:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rli-00000006zrl-22g0
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 16:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDDE06116F;
	Mon, 28 Apr 2025 16:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7453C4CEE4;
	Mon, 28 Apr 2025 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859345;
	bh=rdzo+bpXDJs0ypWV1LWmkb04e+4rQxP1v+N7g7Jw86Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkVkT3YcpNZPQH1CXcgtvOqB7kfmqTmHQKSJmJBtdyFDJXTSQ+9O6i30thaWFY6ua
	 TIGFIFM0yRZ7j6mpXNy60R4qddQFo41FFxN2E/MgEomDSslXRhqDXOHc6HYX77ihPn
	 xMYOOV7UDGIjVdxqZt61hPkIvA/vyk1c5dq/D5pbY/KbfoUjFOoikmzj0ctcmpLViv
	 vVEB+bG26jeFRxtKwHHuuRpNrz0xsa8ITsSqFOsypxM//yw2bcefZEmWz0zcuW2SiY
	 z1E39u/C9IJ88mArbHTwlpPOyxr+S5PPjiRDn6Llfis6bpM7epmqdkCFi12J1xQO69
	 Y704H6whlT4Nw==
Date: Mon, 28 Apr 2025 17:55:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yuntao Dai <d1581209858@live.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
 SoC
Message-ID: <20250428-water-sermon-eefdfa511f8d@spud>
References: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
 <20250428-cv18xx-mbox-v3-2-ed18dfd836d1@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250428-cv18xx-mbox-v3-2-ed18dfd836d1@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============5234812085652207781=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5234812085652207781==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xA+yzJlbbZrKnJ4A"
Content-Disposition: inline


--xA+yzJlbbZrKnJ4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 08:39:45PM +0800, Junhui Liu wrote:
> From: Yuntao Dai <d1581209858@live.com>
>=20
> Add mailbox node for Sophgo CV18XX series SoC.
>=20
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts=
/sophgo/cv18xx.dtsi
> index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4=
176fc95c2c8be52 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -55,6 +55,13 @@ soc {
>  		dma-noncoherent;
>  		ranges;
> =20
> +		mailbox: mailbox@1900000 {
> +			compatible =3D "sophgo,cv1800b-mailbox";
> +			reg =3D <0x01900000 0x1000>;
> +			interrupts =3D <101 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells =3D <2>;
> +		};

No user added here, is there another series in the works that adds a
user of the mailbox?

> +
>  		clk: clock-controller@3002000 {
>  			reg =3D <0x03002000 0x1000>;
>  			clocks =3D <&osc>;
>=20
> --=20
> 2.49.0
>=20

--xA+yzJlbbZrKnJ4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaA+zDAAKCRB4tDGHoIJi
0jKSAPoDM25pLrGWkg9bkq2pYg0aNYGJ2RznmDX5+prlXe7rCAD/ULesrOMr+1Fd
IAlLCzjsDtLy0SL/qyrXAINikYX6sgM=
=ZurY
-----END PGP SIGNATURE-----

--xA+yzJlbbZrKnJ4A--


--===============5234812085652207781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5234812085652207781==--

