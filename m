Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08FECA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UamvJgK/6cdwkj3m1baHjdSOycirVjyOmskZgW+K2/s=; b=ZWxOAPNeqIZhOJOQuFYncJFJ8B
	xIA88xsSIRwZSa+2b8zM1xV6iNKs2yTEwRLsMeSJ3yHPvTrpLyWKWYF775rGggzqs5ietsCV7oPTS
	DQ4OMpNx8bKt32VVjDR2vVpHLLFINE6LfSEVjfFLYHLAFYpz8EO6cmLpTsl4pZWY70a1m6AQ40bJZ
	PUIpXnsKEYKIWR7Nghtnd+lUf/nufb9gWX2iMA45CT69PyuaefnR/5KdNCRY6sNitHb0owOX4ompZ
	XPQJZ6vi8ZbJvhCiLtSW4TLSZ6pxduGw4iq7U1quj+/FFLHNKRzse9RqMBuFqFbl5rcBeI8PzTB8R
	0FQkpkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXPh-0000000AmfN-1oP1;
	Fri, 02 Oct 2026 07:10:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXPd-0000000AmeD-1toW
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 07:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790925039; x=1822461039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYD/sp+oTggw3GRcUvWM/79scp8d42HXpaCNucveWPk=;
  b=jmjP4T0A66Tn9RfoD8c1dKjhWBKxKYnr7TNMU6+yt6xIJGDgbvtd9ESP
   /dHI3OcWQWcJSg1TApY/50KIpDl8DEg+cgK3ovkNe9s0y1GhbzHoAGbYt
   fZ2SypT7gTCQDZGBKE9MgCAVhbnKy0X1NHzjMAvDWIFP29FFidlNW4Bma
   7GGnDzRFqUfPoEwmdUu3Foy9eJKmUw2fw06kd9g/so29T7FmHIUHIy//Q
   qUXBFjB8fu0Gy3BsH6omw4CHtFmQa2WLo6E0+92mLKpuA7kQuDp7cmwd5
   hCQ+CvE7TeBVaJoAvDn8ty2MbdYifGwmX9vQRlCoSv8/r5eDCAJmORjmt
   A==;
X-CSE-ConnectionGUID: y/3BfIYcTui6U+iUlaxtLw==
X-CSE-MsgGUID: v6Vcy4wpQ4ify09tT7cO+g==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="asc'?scan'208";a="64482213"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:10:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 2 Oct 2026 00:10:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 00:10:28 -0700
Date: Fri, 2 Oct 2026 08:09:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Brian Masney <bmasney@redhat.com>, Yixun Lan
	<dlan@kernel.org>, <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <20261002-manpower-croon-26d578f57143@wendy>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
 <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_001033_717554_04E94A78 
X-CRM114-Status: GOOD (  17.94  )
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
Content-Type: multipart/mixed; boundary="===============7909329222311930475=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7909329222311930475==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xust6oqi6mFgyPu/"
Content-Disposition: inline

--xust6oqi6mFgyPu/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 02:07:01PM +0800, Junhui Liu wrote:
> The external CAN and watchdog clock inputs are not routed on the MLKPAI
> FS01, the only board currently supported. Drop the two fixed-clock
> placeholders from the common dtsi, as fixed clocks require a valid
> clock-frequency property.
>=20
> Both clock muxes select their internal parent clocks after reset, so
> the CRU operates correctly without the external inputs. Keep only the
> required oscillator input to the CRU.
>=20
> A board using these external clocks should define them in its own
> board-level dts and override the clocks and clock-names properties of
> the CRU node.
>=20
> Reported-by: Yixun Lan <dlan@kernel.org>
> Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")

Uh, why is this in linux next?

Brian, please don't apply dts patches to the clock (or any other) driver
tree in the future.

Patch itself makes total sense,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
and because it's easier
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dt=
s/anlogic/dr1v90.dtsi
> index 574c6608aef0..fe85d01563ad 100644
> --- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> +++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> @@ -44,23 +44,11 @@ cpu0_intc: interrupt-controller {
>  	};
> =20
>  	clocks {
> -		can_ext: clock-ext-can {
> -			compatible =3D "fixed-clock";
> -			clock-output-names =3D "can_ext";
> -			#clock-cells =3D <0>;
> -		};
> -
>  		osc: clock-osc {
>  			compatible =3D "fixed-clock";
>  			clock-output-names =3D "osc";
>  			#clock-cells =3D <0>;
>  		};
> -
> -		wdt_ext: clock-ext-wdt {
> -			compatible =3D "fixed-clock";
> -			clock-output-names =3D "wdt_ext";
> -			#clock-cells =3D <0>;
> -		};
>  	};
> =20
>  	soc {
> @@ -128,8 +116,8 @@ uart1: serial@f8401000 {
>  		cru: clock-controller@f8801000 {
>  			compatible =3D "anlogic,dr1v90-cru";
>  			reg =3D <0x0 0xf8801000 0 0x400>;
> -			clocks =3D <&osc>, <&can_ext>, <&wdt_ext>;
> -			clock-names =3D "osc", "can_ext", "wdt_ext";
> +			clocks =3D <&osc>;
> +			clock-names =3D "osc";
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  		};
>=20
> --=20
> 2.55.0
>=20

--xust6oqi6mFgyPu/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar9YiQAKCRB4tDGHoIJi
0oYFAQDls2b/qD2GTKOyDuH0hk4ZOJVlEskC8FgpGOTaACQiTQEAtdGfIoLq0kWc
iMi9yihSNBI11RNrHV7DJPv0TYoBEQA=
=88Ss
-----END PGP SIGNATURE-----

--xust6oqi6mFgyPu/--


--===============7909329222311930475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7909329222311930475==--

