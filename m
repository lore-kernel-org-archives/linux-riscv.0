Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDD6105F7A8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QtNnMcnl4Hz/LI6lE+xN5EYmfU/xOQ5NEVcv+0+TzM=; b=sX3pzj/ExvsesmJ5Dd7zFZIYou
	G/GS0mbQic8dCUpyBC5C6rDPqX2wsJNfwZOfYZ6rL3qgmc/suVcAvSdOXJJdegsuIvjduzuHUpzl4
	AK7n0kkrpt6DVPslroS9P1geYWmer2lATLuNP5LzrJRf38/cXHFmf4CxwLFe4pU2OJBia5vEuNthl
	icLoDdIf29yKScbXMZ1L91IKB1YiCM37C9ScHBfojFbRfx2lYybExRiDk+v4bJnKTIaz8cEfBNHik
	8tms7+uRsO7w5/nd1Wq7AKZww1KWSaqOHDhkDzF8NL/YMdg+IgrQd/2fyJ8YWv5ATW3vo6iVJRKJn
	3aPVX6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12sZ-00000000JoJ-0Kp6;
	Fri, 13 Mar 2026 13:48:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12sY-00000000Jo9-17Bk
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B37960142;
	Fri, 13 Mar 2026 13:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FE7C2BC86;
	Fri, 13 Mar 2026 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409717;
	bh=G6WRpwOtPnyKpUDWneQADPk1oA0mXzw03EQnI7rs77I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgH13Yni03rZyMrnpBZ012qtNHkwlscJVuc7GlRxjed3EDVnCTSpNfpQyCfiRharJ
	 UTX6ohC/5e2Ou1OrnNxZ8D6PQ+vUdHj8zKPdJGzRgTl02GkVu1yN1P1VDTbH4cXale
	 X4a2XbwYgvt1BBfnnhsYK3NIq3hTHn/z4XR9HdpbRTIlrZzgGo2MiyV/z2kkfPFKWg
	 8YHoOc5qjv7q8xDiCtdYrAYcjF1HVo9R6N/rgDg2h7gSzTa+TF+FexN7Jvy3a9pk36
	 SFPjAD54QNN/BpOau4a88Re91+8S7iXRd7shLbHGdWp10lbNU7VDDABmmbIfnyPrnN
	 8FyE6OI7+V8eg==
Date: Fri, 13 Mar 2026 13:48:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 5/6] riscv: dts: starfive: jh7110: activate XPbmtUC
Message-ID: <20260313-overstep-viscosity-23f4f23e1871@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-6-ganboing@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260313084407.29669-6-ganboing@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2507862566715937852=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2507862566715937852==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7HJKH+Mr7wyhx1L"
Content-Disposition: inline


--f7HJKH+Mr7wyhx1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 01:44:06AM -0700, Bo Gan wrote:
> Set riscv,xpbmt-uncache-bit to 32 to match SoC memory map:
>=20
>            [0x0,   0x40000000) Low MMIO
>     [0x40000000, 0x2_40000000) Cached Mem
>   [0x4_40000000, 0x6_40000000) Uncached Mem UC+
>   [0x9_00000000, 0x9_d0000000) High MMIO
>=20
> Signed-off-by: Bo Gan <ganboing@gmail.com>


What I want know is how this whole setup interacts with the existing
support that we have for these devices?
Samuel's patchetset removed from the devicetree all of the nodes related
to having two mappings of the same memory, and modified the existing
erratum to only be required for older devicetrees.
You've not removed them, only added a new property. The non-coherent
peripherals on jh7110 already work prior to this patchset, is there not
going to be funky behaviour with both of these things operating in
parallel?

> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 6e56e9d20bb06..6dfeb31538fba 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -14,6 +14,7 @@ / {
>  	compatible =3D "starfive,jh7110";
>  	#address-cells =3D <2>;
>  	#size-cells =3D <2>;
> +	riscv,xpbmt-uncache-bit =3D <32>;
> =20
>  	cpus: cpus {
>  		#address-cells =3D <1>;
> --=20
> 2.34.1
>=20

--f7HJKH+Mr7wyhx1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabQVsAAKCRB4tDGHoIJi
0s+JAP4o+Xa60uILKN1E1S1hKkxrV8V7FNR/yznlJZFzu0RMLwEAuijZ+e0gIbs2
7fOmiYbd5jDoeKSDoriHa6qat93f+A8=
=GhaP
-----END PGP SIGNATURE-----

--f7HJKH+Mr7wyhx1L--


--===============2507862566715937852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2507862566715937852==--

