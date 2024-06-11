Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B529C27C65
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 16:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQvueNN14vRxRlUlpgHEJE4K8v1f4dALcBBEjzjuzp4=; b=RgDsvZfSIBNfl/IkQ5fj0TkN3d
	o4v+KGJFY5tA9Iw2CxKhYNfhJs07Lo0WLybGmQi/+FCs71gfEXxR5nWfN5M5cZ16+sJcilosLQqu+
	ZsZdUMB/Npr4mNVnagZqfVrV6SKVGV+IyeySr4K8q0HMrRrxeEkWokAKhyx+ug/Zebza5Zi+Ko2eX
	o4mAS278ranNzRWngw8dvvJarGMzsVvZFYE/1glh8vk1xYGBEnk22Tvlm+WJ4+epE6AOYmmY5tIte
	YlIG/K2MNGiSkVtDtDMzHRMIh9127+upgYN5Cqx0vF46+FcvUE2mt4N0R2Jlb+b+blNMbKNIW8yW/
	plp3oPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH4HE-00000009UJe-3R6t;
	Tue, 11 Jun 2024 16:23:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH4HB-00000009UI3-01nE
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 16:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83898CE1C5C;
	Tue, 11 Jun 2024 16:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55621C2BD10;
	Tue, 11 Jun 2024 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718122988;
	bh=yEpTP94eDr5A3s9VgS5dBduy8ufIp19ilct/d2eDhsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAd5OW5HPNWu95j/Nh5a6vrZrlRAA4jImqvTUch1p5+DD8kOrtJHaHonbYOXoyqJG
	 uat5emaBVryTRAqWHV9CDqTjgodJqo/gD+PL0AkQxTj8W1w8ZJsw7lvmTyElXICI/3
	 MUlGVHy4YbkxHsU3TGNmQIEoIJttsxnk+P11wRUnGfqGno0g/44uzWMKflQRXudg2q
	 A3H5P/GJSbNd/Ufj6BMgB4PlunQXccK0tzOz0BHVg46KQJJUQc89AQZty/tDjE1M/s
	 qaXfei4mU3+FCTZeLBhbCwDIHdNCrg9r3YomMosOoK7a38ogkOx8GFqLGabTy51w2z
	 r/WyyfsOBBXwQ==
Date: Tue, 11 Jun 2024 17:23:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: kernel@esmil.dk, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, jszhang@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: Set EMMC vqmmc maximum voltage to
 3.3V on JH7110 boards
Message-ID: <20240611-entourage-churn-8b69966848fc@spud>
References: <TY3P286MB2611936BD43C24D34B442E6D98C72@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <TY3P286MB2611936BD43C24D34B442E6D98C72@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_092313_269633_82E19EBE 
X-CRM114-Status: GOOD (  18.66  )
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
Content-Type: multipart/mixed; boundary="===============0340467288461855329=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0340467288461855329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5qjNIfeTE8upxu8l"
Content-Disposition: inline


--5qjNIfeTE8upxu8l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 10:56:41PM +0800, Shengyu Qu wrote:
> Currently, for JH7110 boards with EMMC slot, vqmmc voltage for EMMC is
> fixed to 1.8V, while the spec needs it to be 3.3V on low speed mode and
> should support switching to 1.8V when using higher speed mode. Since
> there are no other peripherals using the same voltage source of EMMC's
> vqmmc(ALDO4) on every board currently supported by mainline kernel,
> regulator-max-microvolt of ALDO4 should be set to 3.3V.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
> Fixes: ac9a37e2d6b6 ("riscv: dts: starfive: introduce a common board dtsi=
 for jh7110 based boards")

I don't think this fixes tag is correct, it just moved in that commit.
It has been there since commit 7dafcfa79cc9 ("riscv: dts: starfive: enable
DCDC1&ALDO4 node in axp15060").

Thanks,
Conor.

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 37b4c294ffcc..c7a549ec7452 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -244,7 +244,7 @@ emmc_vdd: aldo4 {
>  				regulator-boot-on;
>  				regulator-always-on;
>  				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
>  				regulator-name =3D "emmc_vdd";
>  			};
>  		};
> --=20
> 2.34.1
>=20

--5qjNIfeTE8upxu8l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmh56AAKCRB4tDGHoIJi
0r8qAP4x+AYwI1YvlFyfOl2OTqSjrgW71fGQWfNwAfKUONuP3gEAxPVa2gMI5JtD
zE/H/i7djgXlxQmv+nrgtuqcARn3Cww=
=mz3Z
-----END PGP SIGNATURE-----

--5qjNIfeTE8upxu8l--


--===============0340467288461855329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0340467288461855329==--

