Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8842C001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tlygd6Z9f81qjEn8ZcdQRyZtYX2pMvRjbiylmihjPtc=; b=ysTXBMgHqNwXKTzHmJtVKG2Urq
	WzqUKrBM33LNj6RSHG7zu1bwAK4JiErkpze5DHr8tGuyOVczsQ5GOC+uQA0yGikQ7qNDfcgyICnHN
	NGwPg1coBrGCn7x0VkaiNdD1dWR9PteP5nzXeg4NUf7qygsERDiwghyZnUZ1Nx3lIUnyd4v8slCcY
	IzR9ACUwkyyvL1xkjvsbhPfi3C3BQ7b6091WvtrIIVELqY+8FnIt74QfpKMA9nwBrVh6qKGkmFVrY
	El/Je86Ckdci3KUjgcnJ31fGR3x/AZntwq+VGrSCBomSRzbDBxT6cZls916Z8NQAX6oUSv1/jY5jK
	iZlJ00Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTGwu-001s1Z-13;
	Tue, 08 Aug 2023 07:16:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTGwq-001s1A-2K
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 07:16:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38A7E6240E;
	Tue,  8 Aug 2023 07:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A53C433C8;
	Tue,  8 Aug 2023 07:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691478967;
	bh=wdK+9Ne6kOu2jOFRxaqlATBoNfqfJEYBNTQphi91d8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/HgSJtxGYJVUcS/NCQW7wu2/YRoM145DE9eBE6P0ctDW2ynLtSvQei/8yLucACpJ
	 a4oJrgpShuJDrXtrP3e5CAvkL2FBsejr2rRpsYRUrpw/EPMvU8vLl6bP3mhH/QAhVl
	 IYmd/kIsh9mukmgzxbq8AzTXWVGI7we8rUYWfOXTNJMSt0bXs2A6l0m/rIxq+mBqbv
	 LYrEzK2g4ErCiE4x1YA8bH4Wu2yEus+qJ07a7CmZLk1cfh9cko10MAJEs1fksKj+tl
	 ewVn0siow0JthA8OsOCzhJhPlCkQt6goShO8dozdYfZB9HO0tML+dS3utnIKr88Slk
	 cH3xlMt/ixkaQ==
Date: Tue, 8 Aug 2023 08:16:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: starfive - Add crypto and DMA node for
 JH7110
Message-ID: <20230808-cilantro-fondue-21485b78e83e@spud>
References: <20230808061150.81491-1-jiajie.ho@starfivetech.com>
 <20230808061150.81491-2-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230808061150.81491-2-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_001608_844219_B528F083 
X-CRM114-Status: GOOD (  15.96  )
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
Content-Type: multipart/mixed; boundary="===============1806153587096293123=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1806153587096293123==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HJ5okk+lpfymq+RC"
Content-Disposition: inline


--HJ5okk+lpfymq+RC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 02:11:49PM +0800, Jia Jie Ho wrote:
> Add hardware crypto module and dedicated dma controller node to StarFive
> JH7110 SoC.
>=20
> Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index a608433200e8..47cd12ccc988 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -821,6 +821,34 @@ watchdog@13070000 {
>  				 <&syscrg JH7110_SYSRST_WDT_CORE>;
>  		};
> =20
> +		crypto: crypto@16000000 {
> +			compatible =3D "starfive,jh7110-crypto";
> +			reg =3D <0x0 0x16000000 0x0 0x4000>;
> +			clocks =3D <&stgcrg JH7110_STGCLK_SEC_AHB>,
> +				 <&stgcrg JH7110_STGCLK_SEC_MISC_AHB>;
> +			clock-names =3D "hclk", "ahb";
> +			interrupts =3D <28>;
> +			resets =3D <&stgcrg JH7110_STGRST_SEC_AHB>;
> +			dmas =3D <&sdma 1 2>, <&sdma 0 2>;
> +			dma-names =3D "tx", "rx";
> +		};
> +
> +		sdma: dma@16008000 {
> +			compatible =3D "arm,pl080", "arm,primecell";
> +			arm,primecell-periphid =3D <0x00041080>;
> +			reg =3D <0x0 0x16008000 0x0 0x4000>;
> +			interrupts =3D <29>;
> +			clocks =3D <&stgcrg JH7110_STGCLK_SEC_AHB>,
> +				 <&stgcrg JH7110_STGCLK_SEC_MISC_AHB>;
> +			clock-names =3D "hclk", "apb_pclk";
> +			resets =3D <&stgcrg JH7110_STGRST_SEC_AHB>;
> +			lli-bus-interface-ahb1;
> +			mem-bus-interface-ahb1;
> +			memcpy-burst-size =3D <256>;
> +			memcpy-bus-width =3D <32>;
> +			#dma-cells =3D <2>;
> +		};
> +

Against linux-next, I get these warnings:
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: dma@16=
008000: $nodename:0: 'dma@16008000' does not match '^dma-controller(@.*)?$'
        from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: dma@16=
008000: clocks: [[26, 15], [26, 16]] is too long
        from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: dma@16=
008000: clock-names: ['hclk', 'apb_pclk'] is too long
        from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: dma@16=
008000: Unevaluated properties are not allowed ('#dma-cells' was unexpected)
        from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: dma@16=
008000: $nodename:0: 'dma@16008000' does not match '^dma-controller(@.*)?$'
        from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: dma@16=
008000: clocks: [[26, 15], [26, 16]] is too long
        from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: dma@16=
008000: clock-names: ['hclk', 'apb_pclk'] is too long
        from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: dma@16=
008000: Unevaluated properties are not allowed ('#dma-cells' was unexpected)
        from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#

Please fix these & submit a tested v2.

Thanks,
Conor.

--HJ5okk+lpfymq+RC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNHrsgAKCRB4tDGHoIJi
0kb0AQD1jry9R75FXkJ1CDgC0bpJTZccbpjm1HUzMkOrE8ljrAD+Mkm6QG7kb9cH
hqiQIX0FireyLJg6k/eabmle3kriJwg=
=/ifW
-----END PGP SIGNATURE-----

--HJ5okk+lpfymq+RC--


--===============1806153587096293123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1806153587096293123==--

