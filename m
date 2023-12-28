Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDB9C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qmebx+RUdOv2I3xnO6DfJzNU72ho/Mv6WuaMCEMuBrM=; b=zc8NWcDlkvKi3DU9Y4gx2knDMC
	xHHj0UL1Xkc4Mc5j+mvv23svB+EpD272nV8VF0IpBYRmzZ4P/WdufdP5YiP8REhwtFIPSV+9Gl8MN
	oVZRT3zYWkypxvrbnX5aGvqCfmg92sZ3vCdbwcfLVyO7Z4Q1rYWM7fE9v5KsknBxqH7H/bN5l2zMR
	isroOGJ0j3GTuBxENWj5C8+lUQA8Fr/n0fcowI9F1QA86cE9abW0e86V3vmY1bY63lZ7Xq6iV8ORO
	t6NayBA3R+mgz4ed/YSlw0bRLouNr7g8KMsq3UH8uLPsaBv6B0Rzyr7IWwsP2ZIqShJwNhHxxutGa
	StQmYEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIqYZ-00Gwvq-33;
	Thu, 28 Dec 2023 13:36:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIqYW-00GwvV-0z
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 13:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB803CE16C4;
	Thu, 28 Dec 2023 13:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3977C433C7;
	Thu, 28 Dec 2023 13:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703770567;
	bh=bFpxYHW+l52Yon/qnLqsK7by+x6JrUkDWpOTaKXGCuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPXC8vsA4C2uEmnk6veULjxQjJ5cBGEFMRtQM3NaK5BnN9GzktRORK+VB0UMuZWJA
	 ruk1McP+5Zjei1gfrZv7E0/cBH6M+C5+EYMv4jxP3NEiKkVWxAb7AyF0eTjZyPmS3L
	 YXh5PmNJV2CA7VFA14KitatLEhlJ7yTTel1v0ICnYPbcfFKtiQJIwthOwy1svDaLTo
	 L053ziUbt703sWy4MZbHl5ErQk6Vvun6VF9F1SJQMD91zIZTh4vfcLdoRuKbqTaLIE
	 XJ+WhHTL4Qa0M598ffFH7gIP1AeUMOUPy5MYbye3EpdHYbDJwzx/JI7Uyxs+xV+EPy
	 wNsA48b/r7BNA==
Date: Thu, 28 Dec 2023 13:36:02 +0000
From: Conor Dooley <conor@kernel.org>
To: AnnanLiu <annan.liu.xdu@outlook.com>
Cc: chao.wei@sophgo.com, unicorn_wang@outlook.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add timer dt node for CV1800
Message-ID: <20231228-distill-heave-ebda9ee53576@spud>
References: <DM6PR20MB23167E08FCA546D6C1899CB1AB9EA@DM6PR20MB2316.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR20MB23167E08FCA546D6C1899CB1AB9EA@DM6PR20MB2316.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_053612_707636_42064B5D 
X-CRM114-Status: GOOD (  16.04  )
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
Content-Type: multipart/mixed; boundary="===============2439633958799011408=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2439633958799011408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PedUr4prEc/4tkOE"
Content-Disposition: inline


--PedUr4prEc/4tkOE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 28, 2023 at 09:06:54PM +0800, AnnanLiu wrote:
> Add the timer device tree node to CV1800 SoC.

> This patch depends on the clk driver and reset driver.
> Clk driver link:
> https://lore.kernel.org/all/IA1PR20MB49539CDAD9A268CBF6CA184BBB9FA@IA1PR2=
0MB4953.namprd20.prod.outlook.com/
> Reset driver link:
> https://lore.kernel.org/all/20231113005503.2423-1-jszhang@kernel.org/

FYI, this stuff should be under the --- line.

If there's nothing else wrong with this commit, I can fix this while
applying.

Cheers,
Conor.

>=20
> Signed-off-by: AnnanLiu <annan.liu.xdu@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 72 +++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dt=
s/sophgo/cv1800b.dtsi
> index aec6401a467b..34a1647cc51b 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -113,6 +113,78 @@ plic: interrupt-controller@70000000 {
>  			riscv,ndev =3D <101>;
>  		};
> =20
> +		timer0: timer@030a0000 {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a0000 0x14>;
> +			interrupts =3D <79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER0>;
> +			status =3D "disabled";
> +		};
> +
> +		timer1: timer@030a0014 {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a0014 0x14>;
> +			interrupts =3D <80 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER1>;
> +			status =3D "disabled";
> +		};
> +
> +		timer2: timer@030a0028 {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a0028 0x14>;
> +			interrupts =3D <81 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER2>;
> +			status =3D "disabled";
> +		};
> +
> +		timer3: timer@030a003c {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a003c 0x14>;
> +			interrupts =3D <82 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER3>;
> +			status =3D "disabled";
> +		};
> +
> +		timer4: timer@030a0050 {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a0050 0x14>;
> +			interrupts =3D <83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER4>;
> +			status =3D "disabled";
> +		};
> +
> +		timer5: timer@30a0064 {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a0064 0x14>;
> +			interrupts =3D <84 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER5>;
> +			status =3D "disabled";
> +		};
> +
> +		timer6: timer@030a0078 {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a0078 0x14>;
> +			interrupts =3D <85 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER6>;
> +			status =3D "disabled";
> +		};
> +
> +		timer7: timer@030a008c {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a008c 0x14>;
> +			interrupts =3D <86 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER7>;
> +			status =3D "disabled";
> +		};
> +
>  		clint: timer@74000000 {
>  			compatible =3D "sophgo,cv1800b-clint", "thead,c900-clint";
>  			reg =3D <0x74000000 0x10000>;
> --=20
> 2.34.1
>=20

--PedUr4prEc/4tkOE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZY15vgAKCRB4tDGHoIJi
0mo0AQCGttIjbdlNdLMJ5uVxoE+C9lVMfy8EQmXeaQrdch+F9QEAzVg8Yq6JN7Qd
0qJbqKr0Sqd+51fwghslIbPvgoKSYgo=
=45y3
-----END PGP SIGNATURE-----

--PedUr4prEc/4tkOE--


--===============2439633958799011408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2439633958799011408==--

