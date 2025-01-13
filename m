Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77C4C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHcUZxGLBieBZAZTEqijqYhwXtUDkWtv4Bo9DsM8okg=; b=eUPQ/lZIfjG05euvx3RB/YOxnx
	rCVvi0RsOZuv79pnocJtoq5MMOXrcoR4ApwtXaFggXgkfYVohW31t0ZRoCO43WXl+gpJQvV8J7+r/
	QzPgnzAMkgpjIRwkWikvU8t/Hd0gu5xYLMmN/6zDCzat11ISoYRMB24GuDbSI3z0cxEI2NhhZ/cUD
	WH/yxhOZJ6zPydy0rMfQXp4WGw/+P8MHad01PultXjAlHirf0C/Yl5RCaV/vmL/n7Z3wyakDvIiOz
	hk6HmSmSnW4S6ecKAJW70DJyh6L1X/1R2eu3tWdOQQuRN1fnD1N1jr0FF6uO1H1UtT97M1zvSAQ5W
	bLPyTQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPPS-00000006FyI-3CV6;
	Mon, 13 Jan 2025 18:43:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPLK-00000006Eo4-1EKn
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 18:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4070DA412F3;
	Mon, 13 Jan 2025 18:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268C0C4CED6;
	Mon, 13 Jan 2025 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793557;
	bh=e2CPP3XX+Bryks06yf8fYg9ngNX0POmtYeUUcH1/HJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zrfs/cja94Ny/H+E1sicu5WBEr//fH9pD/6Hs94ROwthbH7iYjc70qS121A2xfY1Q
	 bcTVAClJg6aFApMTR/xRpASKzkl13zvNy+oz1yRlrfXdz42pqMo7F9cqQEymqRXka1
	 gATXFI+9xWi6I34q00oulVLCUgu1kuBRvDRAIcIKZLZbgCh8gUclqe0nffQLDtXGay
	 5XtkcCYCND7vFFeb8a1q4K5SEo1H53ebPF+vHFZybShmrRK5jKlu6vPEeAD+jyNRjH
	 wPIirakF58C850a7dt7Vf/r3gugni8yqD5YaN/a83PbKkEbRxgw+Y2Wed9belU6yIX
	 f0EphqGlb6JeQ==
Date: Mon, 13 Jan 2025 18:39:13 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/3] riscv: dts: starfive: jh7110: add timer node
Message-ID: <20250113-monotone-maybe-97ae1d171710@spud>
References: <20250102204137.423081-1-e@freeshell.de>
 <20250102204137.423081-2-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250102204137.423081-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_103918_394389_0D419B53 
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
Content-Type: multipart/mixed; boundary="===============4375486590141749393=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4375486590141749393==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H8QqAvTFaB2o+AKz"
Content-Disposition: inline


--H8QqAvTFaB2o+AKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2025 at 12:41:21PM -0800, E Shattow wrote:
> no idea if this does anything useful; not needed for boot
>=20
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 0d8339357bad..0bc922b3ae8a 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -344,6 +344,15 @@ tdm_ext: tdm-ext-clock {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	timer {
> +		compatible =3D "riscv, timer";

compatible has an extra space, so won't do anything!

> +		interrupts-extended =3D <&cpu0_intc 5>,
> +				      <&cpu1_intc 5>,
> +				      <&cpu2_intc 5>,
> +				      <&cpu3_intc 5>,
> +				      <&cpu4_intc 5>;
> +	};
> +
>  	soc {
>  		compatible =3D "simple-bus";
>  		interrupt-parent =3D <&plic>;
> --=20
> 2.45.2
>=20

--H8QqAvTFaB2o+AKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4Vd0QAKCRB4tDGHoIJi
0lFfAPwKvlpRSsuUksAeN1omnF3lvoXF+Zmmo+mWZLdvVoOF0wEAl60wVBz4v/Ax
EodKnoFdiCpJcqeskpmCwpPzgYLrcQA=
=S54G
-----END PGP SIGNATURE-----

--H8QqAvTFaB2o+AKz--


--===============4375486590141749393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4375486590141749393==--

