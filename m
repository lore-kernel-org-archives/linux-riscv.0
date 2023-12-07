Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E78DC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLF+Q/yCC+fB1YCe3LefpVThOnUi22OV8LQbJNYD7a8=; b=A9KynBM1Cj4rltS+DRiolTA1XG
	0uQSnJ/SYTiiqlKAUWC0hGt70uo5jeuR5w3eJQ7JprNNNemBqj68cbZq9S1trKWAI2vGps8fkq1ID
	RfOsKHSCX1Qp7YAXooaUPxzRgOoimhu9x8KJEPYenHE9uctcyJHQlc3cfsGpp+fEnuHkf+L13qF9e
	7pgQ2TbT1J31xm/qCpH6WHP2clUS/R4YgP9W4xlOyvn8Z9uta4XQr04hrBxp+l3bE/2XZfMu1+2lw
	P7tJg8QutGJfM5uRmmDjLJXaAcz4AEtqDytGRHqC3FU9s4ufg6nNiG9lQMOpqx2iinTbGRGxPA3Le
	QW8W5XQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIDw-00DXo8-1K;
	Thu, 07 Dec 2023 17:31:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIDt-00DXnR-2z
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 17:31:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 47F99B82518;
	Thu,  7 Dec 2023 17:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA79C433C8;
	Thu,  7 Dec 2023 17:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701970299;
	bh=y5KQaG6xsO92nyU8jMBjwng72ljhMerO17hvLBT/01s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7ia9+f7X6k9/jV0mXmpBMYhlZE37AFCCRWGXDRntRLrVF+xVRoIuRw7reZjML+2w
	 twc0HzmZg+PNMQTU8QG893Z0VAq/ltDXDMYDwkRcqBvSZhuS5g7ePrOMuijKvrBkIJ
	 drbrnpbsWsIBYrt2VhHIo/Wpp3b/U4gprRE4EL0jzyW662+Rb4k+Gxdw26IogPqhSB
	 OkJN0K4b1FQjFITQCU+5CsxCWT00mHkDGPgC+LWYJ16k2H0ZFHDmT6B6vwdhMDKHC2
	 0E5E4wQxu3LzxP2MVLB4uWuUyGfmPRArMIB5TYoQFkujhqEO9Y4uC55W4A/xVpBRsy
	 VprPzntPwnHMw==
Date: Thu, 7 Dec 2023 17:31:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	qiujingbao.dlmu@gmail.com, dlan@gentoo.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/4] riscv: dts: sophgo: add clock generator for
 Sophgo CV1800 series SoC
Message-ID: <20231207-doze-spinster-0bfad3b1441a@spud>
References: <f9db367c-a96b-4789-9884-f2062499765a@linaro.org>
 <IA1PR20MB49531D4EFD4626834B5C604ABB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <375bb6e4-18dc-4f54-9a06-6f9f2ba0a0ec@linaro.org>
MIME-Version: 1.0
In-Reply-To: <375bb6e4-18dc-4f54-9a06-6f9f2ba0a0ec@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_093142_258770_552984B4 
X-CRM114-Status: GOOD (  22.80  )
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
Content-Type: multipart/mixed; boundary="===============0964349318913908320=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0964349318913908320==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lhuauHl59hGZdGju"
Content-Disposition: inline


--lhuauHl59hGZdGju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 01:52:16PM +0100, Krzysztof Kozlowski wrote:
> On 07/12/2023 10:42, Inochi Amaoto wrote:
> >>> +&clk {
> >>> +	compatible =3D "sophgo,cv1810-clk";
> >>> +};
> >>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot=
/dts/sophgo/cv18xx.dtsi
> >>> index 2d6f4a4b1e58..6ea1b2784db9 100644
> >>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >>> @@ -53,6 +53,12 @@ soc {
> >>>  		dma-noncoherent;
> >>>  		ranges;
> >>>
> >>> +		clk: clock-controller@3002000 {
> >>> +			reg =3D <0x03002000 0x1000>;
> >>> +			clocks =3D <&osc>;
> >>> +			#clock-cells =3D <1>;
> >>
> >> I don't find such layout readable and maintainable. I did some parts
> >> like this long, long time ago for one of my SoCs (Exynos54xx), but I
> >> find it over time unmaintainable approach. I strongly suggest to have
> >> compatible and other properties in one place, so cv1800 and cv1812, ev=
en
> >> if it duplicates the code.
> >>
> >=20
> > Hi Krzysztof:
> >=20
> > Thanks for your advice, but I have a question about this: when I should
> > use the DT override? The memory mapping of the CV1800 and CV1810 are
> > almost the same (the CV1810 have more peripheral and the future SG200X
> > have the same layout). IIRC, this is why conor suggested using DT overr=
ide
> > to make modification easier. But duplicating node seems to break thiS, =
so
> > I's pretty confused.
>=20
> Go with whatever your subarchitecture and architecture maintainers
> prefer, I just shared my opinion that I find such code difficult to read
> and maintain.
>=20
> Extending node with supplies, pinctrl or even clocks would be readable.
> But the compatible: no. The same applies when you need to delete
> property or subnode: not readable/maintainable IMHO.

There are apparently 3 or 4 of these SoCs that are basically identical,
which is why the approach was taken. I do agree that it looks somewhat
messy because I was looking for device-specific compatibles for these
SoCs.

--lhuauHl59hGZdGju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXIBdQAKCRB4tDGHoIJi
0gvbAP0aZRnwZeW/uj2D5AKml7K6VntejuP/ZKF3cb023p/PeQD+K7QPGKIR7elG
P9fe8O+9MjABjpbXTovEnCRCL6XdLwM=
=5VP/
-----END PGP SIGNATURE-----

--lhuauHl59hGZdGju--


--===============0964349318913908320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0964349318913908320==--

