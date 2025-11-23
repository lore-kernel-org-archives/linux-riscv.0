Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C415CFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyIREzi42umQNu4GLEWV+yjNEzzs98gz4s22GqelLqM=; b=gQPZoRlLTg1SlrlrsaMwZQzH3A
	CGTbBdTLa9J0lOga2wwgdYhl8axZzTWWKjTphg045TKD6BwWkDqZO195ENVVbWepwkBGLkoTbyqkJ
	dHuOwtMrV7TNI9PMs2Dg0XEcSICBdzfA41OC3kpDZDPjl7mVCffMlJGhxxuLxQdnqfg17jbW+thXn
	2VUcTsnpbxycTxw+4GJnMvsyEnZt8RaP1gG7J9UocOJFhyN43uh2AQaF8Edn30spCnoi81YQtA5I6
	S3bTIRXp7U8V2c8Sh9oZfjgQDayKtbLWbqgZgPSd1/K8wxjJ1lLBlA0zlaPKSCmraFVy6/7COIs/I
	O0WSCQyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFK0-0000000AdGc-1Hox;
	Sun, 23 Nov 2025 19:00:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFJy-0000000AdGU-11Y9
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 19:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29F90600C3;
	Sun, 23 Nov 2025 19:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0904DC116B1;
	Sun, 23 Nov 2025 19:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763924424;
	bh=9m7Xe3YPvGvx/YhDpSl02W5vZl4cE6QTfFAbyeafE7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0Ky+/hKTXIjKO2Wset/lmvbjZy9W50U0T+PluPCEPfnnO+ukDmp/EUwk2/XmUk6p
	 9iz7ICONgXb8gXKUjBiC+Ee5DJTRkRboyNP8NasQ0dQOu9ODExBBZq0esq1+ipymA5
	 QVRv4vCZxDFKtbD5cOQ3vjsST4M117pe99R61IpZU0fp3uqOtozz06Hzw/0M/myLTo
	 rs4hdrhGDI/JydHIMrS/xd7sw33PYmf0SnUVXRa6ZkDtmudTiEpx58Hs5Nm58D47LK
	 ZGFMaUVya/e26IT5nO4BWRBwybg4wvyf58t3LiTTV45tnJEEwn7JVHDlXjd+Ey3TuR
	 E/NaOP86HhBgg==
Date: Sun, 23 Nov 2025 19:00:21 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH] riscv: dts: sifive: unmatched: Add PWM controlled fans
Message-ID: <20251123-widow-prowler-9cedafa7bf3d@spud>
References: <20251122.131940.192031134976081316.rene@exactco.de>
MIME-Version: 1.0
In-Reply-To: <20251122.131940.192031134976081316.rene@exactco.de>
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
Content-Type: multipart/mixed; boundary="===============1819869796477681183=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1819869796477681183==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IcDOS+BH1JPHWAV+"
Content-Disposition: inline


--IcDOS+BH1JPHWAV+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sat, Nov 22, 2025 at 01:19:40PM +0100, Ren=C3=A9 Rebe wrote:
> This adds the two PWM-controlled fans of the HiFive Unmatched board to
> the device tree.
>=20
> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
> ---
> Tested on SiFive HiFive Unmatched A00 running T2/Linux.

Was this generated on top of a tree that includes 7dbc4432ea6b ("pwm:
sifive: Fix PWM algorithm and clarify inverted compare behavior")?
That'd be 6.17-rc1 or later.

If not, the polarity of the pwms will need to be switched because the
original driver author intentionally got it wrong and so 6.17-rc1 and
later have the correct polarity...

> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 03ce2cee4e97..850fa1d25be7 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -47,6 +47,16 @@ gpio-poweroff {
>  		gpios =3D <&gpio 2 GPIO_ACTIVE_LOW>;
>  	};
> =20
> +	fan1 {
> +		compatible =3D "pwm-fan";
> +		pwms =3D <&pwm1 2 7812500 0>;
> +	};
> +
> +	fan2 {
> +		compatible =3D "pwm-fan";
> +		pwms =3D <&pwm1 3 7812500 0>;
> +	};
> +
>  	led-controller-1 {
>  		compatible =3D "pwm-leds";
> =20
> --=20
> 2.46.0
>=20
>=20
> --=20
> Ren=C3=A9 Rebe, ExactCODE GmbH, Berlin, Germany
> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 https://patreo=
n.com/renerebe
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--IcDOS+BH1JPHWAV+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSNZxQAKCRB4tDGHoIJi
0lPXAP9ssgOqSmlSLBzk57U90yDWV5k7UUm+cvu4btBeyrYguQEAgUXBYIH1MECC
ldUPNYGI2wGs2itLtcjSZux8wskvHAQ=
=RBI9
-----END PGP SIGNATURE-----

--IcDOS+BH1JPHWAV+--


--===============1819869796477681183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1819869796477681183==--

