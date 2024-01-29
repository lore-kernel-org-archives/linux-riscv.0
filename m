Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97879C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1v89hiSAiTmVJ9R1XhSK5XjgnwoJgS+7jr9iaReg5g=; b=mFLW2FYzbMrPZWkwXkDSRQlPMU
	grpUIOzqVrIB9EjrGiFhcE8ROOKwYeW/4FLWeB28JGw2ifKhC7JwLxFDXjlLV/htw2Ig+CSgzd/Jr
	M0BGpMcEXhgIYZA0EPdu27GTh4FJpOvqe5akH4jWG1cIAQzQBDtjPVB2UxRXpVn6aPQmcD0xHIsPi
	9hcg8PtgQeLrHC7EvJWbqJlJVym/i7y1nB2vp1MdVCfB3dGq/vgi/OrVHdPhIVZGVBJmF5+lzdOuh
	VIk8z7sF4+kI0xtYHTV0FmrSeHi3HutwfbKtX3kY0/O/e6bH1vUc8l4jh7apUofX/UDZ6u9IysAcl
	s1wFy0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTk3-0000000DK9a-3S9j;
	Mon, 29 Jan 2024 15:40:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTk1-0000000DK8M-1gri
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80A37CE0FA6;
	Mon, 29 Jan 2024 15:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C35C433F1;
	Mon, 29 Jan 2024 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706542806;
	bh=S/WbJSjcNsxsM1bxIGAGLA6NqY3K/ht9T73+RySJp+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gi4yF32nXjnfqhkQSWcpjlBwC3WGLPuNC5/04kXSNajIV6f/mZCRKoLznztTQSSzg
	 ETpJgSPYsrnUk65F9a1C9g7qgWNF/3QhqvJ96MBTp1zjhopi73bp3HRDDPQTB+29nW
	 JDBdZi1eXt71WMkSV9HPpgGPgytlsUzgIIpjVENvJr2qGDaTiyvs0XaXhuKoxTNvNS
	 ev85SWovM7bH+qlVvgUwsu7xezJshQzZyWkwXfiqB6OAfUKIhZ0den+NZp9/rudpmf
	 ejm4tg/brzUOmafXZTuHa4SaY8hMbv5wZZ/dyk4IkoCmIeV2SOLLCNriX708hB2MBq
	 rF6bLtW6N/h1Q==
Date: Mon, 29 Jan 2024 15:40:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: cv18xx: Add spi devices
Message-ID: <20240129-equation-untaken-5892c9dbfe19@spud>
References: <20240129030115.GB1097489@ofsar>
 <IA1PR20MB49532962D49F119F355EC55ABB7E2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49532962D49F119F355EC55ABB7E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_074009_640157_70E9180A 
X-CRM114-Status: GOOD (  15.02  )
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
Content-Type: multipart/mixed; boundary="===============5486746997305795475=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5486746997305795475==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HjsU6dV8a1MXSl2a"
Content-Disposition: inline


--HjsU6dV8a1MXSl2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 11:47:18AM +0800, Inochi Amaoto wrote:
> >Hi Inochi Amaoto
> >
> >On 10:26 Mon 29 Jan     , Inochi Amaoto wrote:
> >> Add spi devices for the CV180x, CV181x and SG200x soc.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> ---
> >>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 44 ++++++++++++++++++++++++++
> >>  1 file changed, 44 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/=
dts/sophgo/cv18xx.dtsi
> >> index 7c88cbe8e91d..e66f9e9feb48 100644
> >> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >> @@ -176,6 +176,50 @@ uart3: serial@4170000 {
> >>  			status =3D "disabled";
> >>  		};
> >>
> >> +		spi0: spi@4180000 {
> >> +			compatible =3D "snps,dw-apb-ssi";
> >> +			reg =3D <0x04180000 0x10000>;
> >> +			interrupts =3D <54 IRQ_TYPE_LEVEL_HIGH>;
> >> +			clocks =3D <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
> >> +			clock-names =3D "ssi_clk", "pclk";
> >..
> >> +			#address-cells =3D <1>;
> >> +			#size-cells =3D <0>;
> >I'd suggest moving those two above 'interrupts' property
> >
> >there is an ongoing discussion here..

Not super important to point out, but this discussion isn't "ongoing",
it was merged into 6.8-rc1:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Cheers,
Conor.

> >https://lore.kernel.org/all/20231203174622.18402-1-krzysztof.kozlowski@l=
inaro.org/
> >
>=20
> Thanks for this info. I will take care of it.

--HjsU6dV8a1MXSl2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbfG0QAKCRB4tDGHoIJi
0uh/AP9tS/09PvuQHf275Eg3w7Kt/uYP4Vse2KC76XI/LWPxpQEA9CLH7XiXhA8T
HObam60nr8K07ePBQDQuL6+9hNw9hQU=
=6YN8
-----END PGP SIGNATURE-----

--HjsU6dV8a1MXSl2a--


--===============5486746997305795475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5486746997305795475==--

