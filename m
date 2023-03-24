Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9E3C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 19:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bvy1odFlEW9ISwKqgSZmI6DFOQqSccE0FQlS2pHi9w=; b=ScvjLcXG0p9orp9BNE+QksvvLe
	MUotHtp05haOWUletOQioBKma5kocEA1K9+XvmMnYuA1eGbDNoajFXj7KHEm2M+h9nwMWEMSyrixj
	qf2ZK/C5QOvVsWQStkAhtGmFWJ+oyjypMEpDfTyjvgs6zrfhqJjRdeH9gq59Sqz0CQNcjuvAQ1FDG
	enW0bnTkPJ2PNGcNYPt2K18HVE8Uz3NB0mC07UcYFYz24Y2rtYT/1JHF8ghHRDy6BCtxd+wTiVr6K
	OKvfd+g/IkJVdk2J3ztrJOCbNx9/swpTVf3NtK78yt3MfRtvxudsfBbmaNYuKbkuUTJS4gW8AUXS2
	AA3FB/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfmjP-005Nmz-0B;
	Fri, 24 Mar 2023 19:05:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfmjL-005NmU-3A
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 19:05:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92CA162C56;
	Fri, 24 Mar 2023 19:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10FEC433EF;
	Fri, 24 Mar 2023 19:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679684739;
	bh=McKaNQzEbk0xTIOMEdajlR1Z4xozs8VyLrhP53addwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knZIVMw5PE0f38FQxhO/H2qZ9SlfUvGpoYT6je9qZqDcGO566VsxxbqdUSmFV+IoM
	 +W02Vis+mamyc/jIhA4q9/ubjwWA8TVwJncHgz7F9RFRnTFweg1w8CWah1ORB0iHPQ
	 MiScVR2neGJUkdQWVN47fAgdGNc2qEBAOykq1AAiQQEtA3RD3nZZC27cDV6+F+5i3I
	 N3MTA5M+vuuXp7kmUnYmM4ZCE71xmNG7Hlz1q6YSelCF8prqW8rVHaiaO79mYnF2Yc
	 OJCvL0vNEEMbfbsNSxaWSMkQkP6V3REab2Mv6d2jXCWOGq3iMJ4DvqRsYb5e+hFQAw
	 Y+kSa1yx8GoPw==
Date: Fri, 24 Mar 2023 19:05:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: starfive: jh7110: Correct the properties
 of S7 core
Message-ID: <225945e3-2610-4fec-8ee5-5893d26641b4@spud>
References: <20230324064651.84670-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230324064651.84670-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_120540_115877_93DB9830 
X-CRM114-Status: GOOD (  17.52  )
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
Content-Type: multipart/mixed; boundary="===============9191844124601818370=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9191844124601818370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WqfTepoKbm4XihPt"
Content-Disposition: inline


--WqfTepoKbm4XihPt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 02:46:51PM +0800, Hal Feng wrote:
> The S7 core has no L1 data cache and MMU, so delete some
> related properties.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>=20
> Hi, Conor,
>=20
> This is a correction for the S7 entry.

Again going off the latest version of the u74-mc core complex, this
looks to be correct, thanks.
I need to go read the Emil email from earier today, but I've
provisionally gone and put this on the riscv-jh7100_initial_dts branch
with a Fixes: tag.

Thanks,
Conor.

> This patch depends on patch [1].
>=20
> [1] https://lore.kernel.org/all/20230320103750.60295-20-hal.feng@starfive=
tech.com/
>=20
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index d484ecdf93f7..4c5fdb905da8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -20,21 +20,12 @@ cpus {
>  		S7_0: cpu@0 {
>  			compatible =3D "sifive,s7", "riscv";
>  			reg =3D <0>;
> -			d-cache-block-size =3D <64>;
> -			d-cache-sets =3D <64>;
> -			d-cache-size =3D <8192>;
> -			d-tlb-sets =3D <1>;
> -			d-tlb-size =3D <40>;
>  			device_type =3D "cpu";
>  			i-cache-block-size =3D <64>;
>  			i-cache-sets =3D <64>;
>  			i-cache-size =3D <16384>;
> -			i-tlb-sets =3D <1>;
> -			i-tlb-size =3D <40>;
> -			mmu-type =3D "riscv,sv39";
>  			next-level-cache =3D <&ccache>;
>  			riscv,isa =3D "rv64imac_zba_zbb";
> -			tlb-split;
>  			status =3D "disabled";
> =20
>  			cpu0_intc: interrupt-controller {
> --=20
> 2.38.1
>=20

--WqfTepoKbm4XihPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZB30fgAKCRB4tDGHoIJi
0m0jAQDgN9auzDIiU9HW1TSUC9HzDRYLzr+VbgtP30QtgUTeaQEA/UXn5IKUTjFn
P2TdB0HAjMnHLaEvUPI8++IcsnQWdAs=
=x47n
-----END PGP SIGNATURE-----

--WqfTepoKbm4XihPt--


--===============9191844124601818370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9191844124601818370==--

