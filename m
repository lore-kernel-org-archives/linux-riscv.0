Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5C9C83F11
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnW0Jtto+pqmVF92w4iVM9iCsPcVkeEN42yea6UBUPM=; b=qQ6XPpXmzV80vTq6jzz9eMTE9a
	KcTRIBfsu7eW2FzS5BgV7kYwNExT1VzscLDVPy2b0cP7O6mVEarni28AjAOfAYEHDcENCQAAD+juC
	5aSu89fGZveeDSCwvJXbTDoS9Ach0Nji5hbw51oP6nTMvP0Qq37Vv2QuAYniROt7tGBziUd4QCxEJ
	nzIuKIRamPxf6msq4LhoiwhT8RMpkL/2yi3YZcu9XXhvSaGJcU5kHKBtC6/JXTJuyZdpjfFStlgGJ
	6caNReQnbYYmBfRL8BnSPWvO+erF4R/F3THWEXq9fDQZ9n371kjNShy8gOoavomCet34zwYdAumTf
	dS27ZVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZpb9-006cjr-0G;
	Sat, 26 Aug 2023 09:28:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZpb5-006cjR-31;
	Sat, 26 Aug 2023 09:28:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F76C60B07;
	Sat, 26 Aug 2023 09:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE7CC433C8;
	Sat, 26 Aug 2023 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693042126;
	bh=YxxISRt1nikCjFmpxDviziNud+rrOQ+XHWWA42FDTrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKJTrskegf5j6cRlOf+FyVjKHzoB2Hi9ULPscnuoPdq70iwfinPGT+8ipA3Qykxbc
	 dNu7EeqPpn6Sy0FL0htDoE6HSBssx1I2zGZ7ScZwfxXIh7257Rwicpgp7oZx9PTXKY
	 m11cOxvmI4BETAdWvpvWmwfL4EIgYjy9iy7MXbZ3P5WFYn2D+aZDjhC0ggElVGz5oE
	 xvzUW7BJwrQ2AxzRz1lhUey5nbFlOCEh9gjSDexy7osYDSP81Gq4uykvtuQpDC2c/g
	 nJf2F9nUwr07lwGWgCBzEvApkgDjcArUeVOCBsP9SBYgBKc8LAkxmtOcwnNtpLLUz3
	 8zy5fRGy46jTg==
Date: Sat, 26 Aug 2023 10:28:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Wei Fu <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add PMU event node
Message-ID: <20230826-reverse-unroll-a2e0b2365dc1@spud>
References: <IA1PR20MB495310F06009AA884D0612A1BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495310F06009AA884D0612A1BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_022848_062159_F3ED79DC 
X-CRM114-Status: GOOD (  17.06  )
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
Content-Type: multipart/mixed; boundary="===============1690935131582840720=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1690935131582840720==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0pBAAiuXuzC5EtR1"
Content-Disposition: inline


--0pBAAiuXuzC5EtR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 04:38:53PM +0800, Inochi Amaoto wrote:
> D1 has several pmu events supported by opensbi.
> These events can be used by perf for profiling.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Could you please include a link to some documentation as to where these
values came from? I know several people have had some trouble with
understanding the pmu DT stuff & having some documentation would make
this an in-tree end-to-end example.

Thanks,
Conor.

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..d9031ccdec89 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -72,5 +72,45 @@ plic: interrupt-controller@10000000 {
>  			#address-cells =3D <0>;
>  			#interrupt-cells =3D <2>;
>  		};
> +
> +		pmu {
> +			compatible =3D "riscv,pmu";
> +			riscv,event-to-mhpmcounters =3D
> +				<0x00003 0x00003 0x00000008>,
> +				<0x00004 0x00004 0x00000010>,
> +				<0x00005 0x00005 0x00000200>,
> +				<0x00006 0x00006 0x00000100>,
> +				<0x10000 0x10000 0x00004000>,
> +				<0x10001 0x10001 0x00008000>,
> +				<0x10002 0x10002 0x00010000>,
> +				<0x10003 0x10003 0x00020000>,
> +				<0x10019 0x10019 0x00000040>,
> +				<0x10021 0x10021 0x00000020>;
> +			riscv,event-to-mhpmevent =3D
> +				<0x00003 0x00000000 0x00000001>,
> +				<0x00004 0x00000000 0x00000002>,
> +				<0x00005 0x00000000 0x00000007>,
> +				<0x00006 0x00000000 0x00000006>,
> +				<0x0000a 0x00000000 0x0000000b>,
> +				<0x10000 0x00000000 0x0000000c>,
> +				<0x10001 0x00000000 0x0000000d>,
> +				<0x10002 0x00000000 0x0000000e>,
> +				<0x10003 0x00000000 0x0000000f>,
> +				<0x10019 0x00000000 0x00000004>,
> +				<0x10021 0x00000000 0x00000003>;
> +			riscv,raw-event-to-mhpmcounters =3D
> +				<0x00000000 0x00000001 0xffffffff 0xffffffff 0x00000008>,
> +				<0x00000000 0x00000002 0xffffffff 0xffffffff 0x00000010>,
> +				<0x00000000 0x00000003 0xffffffff 0xffffffff 0x00000020>,
> +				<0x00000000 0x00000004 0xffffffff 0xffffffff 0x00000040>,
> +				<0x00000000 0x00000005 0xffffffff 0xffffffff 0x00000080>,
> +				<0x00000000 0x00000006 0xffffffff 0xffffffff 0x00000100>,
> +				<0x00000000 0x00000007 0xffffffff 0xffffffff 0x00000200>,
> +				<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x00002000>,
> +				<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x00004000>,
> +				<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x00008000>,
> +				<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
> +				<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
> +		};
>  	};
>  };
> --=20
> 2.41.0
>=20

--0pBAAiuXuzC5EtR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOnFyAAKCRB4tDGHoIJi
0vUQAP4rn0a1GtuTy9uRAuCAabcGhEsSKGdJ5Mgd3WVmE+3/pAD/a612kqTRPb+p
IAQcu3jlvuZgUpxpEMUUMdDE5DZzzgY=
=3dSo
-----END PGP SIGNATURE-----

--0pBAAiuXuzC5EtR1--


--===============1690935131582840720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1690935131582840720==--

