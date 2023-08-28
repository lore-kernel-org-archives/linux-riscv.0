Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4348AC71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 06:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2lgGxppklYBND7Ui+xbinNGvQ+m80xcYHj8wZYbvmY=; b=2fSE+3ykYf8Ht+Nrxd6IW/X8Ri
	D+BurRSpemMALLULG7FwugpnBuBNAVrYWiLA43No/pCHD1W2q2EYcqQQIb35QhqteGkHl99Kdtgq6
	wQKz0D8IQpJizmckf1jMV8B0MqZXKg2/d0/q2UKVyujTNClL+h06K+R1ZNgxOKxa1bAsxGlMdLxkz
	b3PBGK/lCKFJE6nlc8i7n6mv23Gk6nlu4zE2GjVk7F47O6NMJaR21YbvC89ep/sb0fmlGp6WutarE
	DbQ2SsqkXnjRFBoF2bRE4wDOZA0chF2KnRGZcLjMT6GjC0md3Qc8DncWehJkyZv9qd2oAGmknieOm
	05HvgeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVpA-008xPY-0E;
	Mon, 28 Aug 2023 06:34:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVp5-008xP3-1i;
	Mon, 28 Aug 2023 06:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693204443; x=1724740443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aCl90sVW5QNut/R0WQeqfLh8sCRLNOIav5lRzT5tZqI=;
  b=gHPX1JWYSDpQ3r9xRqlVXKmbgAMeOm2+q45AxigUzx+Y4Xom5lrc1GTt
   G32RE5g9DIV8hz1qJUc6FhGSUrqeKO8XXeRremWzCB3XN3zUNDJUOpj2G
   vDL8aQLbvDaimOXEWnvd6jTK9rnDqX8emuKi62F+lGfar1Ug4U6kkKkbE
   ktl5mdez96WHS0tzecQNGDO86KLIGK4hwRcKaNL9hY2A6r9fJUPQpcpWw
   3D5RPO2A0JbBqVP0gbarWufZlhhWkpPIeM4UPP4/7kokiPFQ7Qy885QFe
   4detvo7wUzZZUuZk1yX2LsBZuqqoUYL9IdoR39YtXZ4TvUwKrIuSVHNt3
   A==;
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="asc'?scan'208";a="168600219"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Aug 2023 23:33:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 27 Aug 2023 23:33:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Sun, 27 Aug 2023 23:33:46 -0700
Date: Mon, 28 Aug 2023 07:33:04 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Inochi Amaoto <inochiama@outlook.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Wei Fu
	<wefu@redhat.com>, Pei Chen <cp0613@linux.alibaba.com>, Wenhan Chen
	<chenwenhan.cwh@alibaba-inc.com>, Guo Ren <guoren@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] riscv: dts: allwinner: d1: Add PMU event node
Message-ID: <20230828-cupid-muck-130c4ef218f6@wendy>
References: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_233403_742278_FD41E871 
X-CRM114-Status: GOOD (  19.21  )
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
Content-Type: multipart/mixed; boundary="===============2713863832573322068=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2713863832573322068==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DSHXjya6oD0FU0CL"
Content-Disposition: inline

--DSHXjya6oD0FU0CL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 12:30:22PM +0800, Inochi Amaoto wrote:
> D1 has several pmu events supported by opensbi.
> These events can be used by perf for profiling.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> Link: https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/=
gen_rtl/pmu/rtl/aq_hpcp_top.v#L657
> ---
> changed from v3:
> 1. remove wrong event mapping of 0x0000a
> 2. add reference url of c906 events implementation (D1 only support events
> described in R1S0 user manual, but event mapping is the same)

Why'd you drop my ack? There's nothing here that'd invalidate it AFAICT.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> changed from v2:
> 1. move pmu node from /soc to / to avoid warnings when checking.
>=20
> The meaning of T-HEAD events can be found in this pending patch:
> https://lore.kernel.org/linux-perf-users/IA1PR20MB4953DD82D0116EC291C2177=
7BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com
>=20
> The patch above also provides a example that shows how to setup
> environment and use perf with T-HEAD events.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..53a984d78e3f 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -73,4 +73,43 @@ plic: interrupt-controller@10000000 {
>  			#interrupt-cells =3D <2>;
>  		};
>  	};
> +
> +	pmu {
> +		compatible =3D "riscv,pmu";
> +		riscv,event-to-mhpmcounters =3D
> +			<0x00003 0x00003 0x00000008>,
> +			<0x00004 0x00004 0x00000010>,
> +			<0x00005 0x00005 0x00000200>,
> +			<0x00006 0x00006 0x00000100>,
> +			<0x10000 0x10000 0x00004000>,
> +			<0x10001 0x10001 0x00008000>,
> +			<0x10002 0x10002 0x00010000>,
> +			<0x10003 0x10003 0x00020000>,
> +			<0x10019 0x10019 0x00000040>,
> +			<0x10021 0x10021 0x00000020>;
> +		riscv,event-to-mhpmevent =3D
> +			<0x00003 0x00000000 0x00000001>,
> +			<0x00004 0x00000000 0x00000002>,
> +			<0x00005 0x00000000 0x00000007>,
> +			<0x00006 0x00000000 0x00000006>,
> +			<0x10000 0x00000000 0x0000000c>,
> +			<0x10001 0x00000000 0x0000000d>,
> +			<0x10002 0x00000000 0x0000000e>,
> +			<0x10003 0x00000000 0x0000000f>,
> +			<0x10019 0x00000000 0x00000004>,
> +			<0x10021 0x00000000 0x00000003>;
> +		riscv,raw-event-to-mhpmcounters =3D
> +			<0x00000000 0x00000001 0xffffffff 0xffffffff 0x00000008>,
> +			<0x00000000 0x00000002 0xffffffff 0xffffffff 0x00000010>,
> +			<0x00000000 0x00000003 0xffffffff 0xffffffff 0x00000020>,
> +			<0x00000000 0x00000004 0xffffffff 0xffffffff 0x00000040>,
> +			<0x00000000 0x00000005 0xffffffff 0xffffffff 0x00000080>,
> +			<0x00000000 0x00000006 0xffffffff 0xffffffff 0x00000100>,
> +			<0x00000000 0x00000007 0xffffffff 0xffffffff 0x00000200>,
> +			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x00002000>,
> +			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x00004000>,
> +			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x00008000>,
> +			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
> +			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
> +	};
>  };
> --
> 2.42.0
>=20

--DSHXjya6oD0FU0CL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOw/nQAKCRB4tDGHoIJi
0lubAQDUXtFzd006E4QcDgB8++nyjK7XHOdcyJ8gxq6vr3ozeAEA4kcSKZeNq6ln
Eeq59+bZ7kF7PhKl1/BFMaJVgBv/Rwg=
=Vm8G
-----END PGP SIGNATURE-----

--DSHXjya6oD0FU0CL--


--===============2713863832573322068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2713863832573322068==--

