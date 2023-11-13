Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30072C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25iyHHVbUMSkQyxcfQaAQPGLuDEs5EuNX9nw/KyOPhA=; b=AMjI8XFmwhB09HR0lFBAqRKTii
	BIaRUFIr25uvaXE314+eDmGbLd4qT8zLeGi+1T4QEdoOZXZVVZw2wYOrwM0agstITy+LYVbCOi5mI
	XDNQ+UK/A5yTYTWeQxdEggb7hPt+fx3JSVbng0LewA4/HZlvhzlzjjMmoshWomZWmLf3R1MT7TSs1
	vqvUOnQ+qEERIJs9dETeC7V25G9VrJQR0EdwnnKrKFcor8OqGrAOuJpfnbc808evxt1G9EHSjGo5b
	UeDw7nPA25UHI5x7XHbMarDRt7HYmXJAr22wBuqnVyfKxo1dYXcq98N7eXbaRHC7IYn6iyyXzXEOo
	G9ht6EKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wm3-00E1nj-0g;
	Mon, 13 Nov 2023 13:14:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wm1-00E1n5-0x
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1394DCE138D;
	Mon, 13 Nov 2023 13:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2109CC433C8;
	Mon, 13 Nov 2023 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699881278;
	bh=EtMfTCKsUg7ufBalhxFNF8jrs+peRdy0cY2hZzRhWmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nS7ZNMw0hmdXGtW9w0SMYVBq4p59yvF5bYxvk/T84uxjzZf4zpFYR2Ozd7OH2gTCz
	 u2AqN6RpKU4MZp/AkMYYpbeRp3zMOpry8A4u+d/t4zz47VuOUn+TtpUhPVsdG81X0E
	 L0m7EAeVjdkCdzGXaXqPsWSNOGYOb51/E8G/YyTHFtEz7ujWpSSqWXjL0ZUqyq+ecN
	 a9H9EGuWSJw+5DItCmAI5N7bJP5e9hRB0euEJfdiw6PM7LPeGUrL/FVrJc0Ls1U8m9
	 CaqJQhoCyQIo5oI++GMPhggi9LWuB0tP0YzouBFu1To6wLb+VtEj89fAX48qkQdQAT
	 uCMFAS8aTnMyw==
Date: Mon, 13 Nov 2023 13:14:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: remove address-cells from CV1800B
 intc node
Message-ID: <20231113-portable-garnet-8a04dbb71b51@squawk>
References: <IA1PR20MB49532613F5B4BD9753A1BB4DBBB3A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49532613F5B4BD9753A1BB4DBBB3A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_051441_523987_ADF491E3 
X-CRM114-Status: GOOD (  18.00  )
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
Content-Type: multipart/mixed; boundary="===============2920103764798430644=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2920103764798430644==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HnJ3G1ILUKIB0LMn"
Content-Disposition: inline


--HnJ3G1ILUKIB0LMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 05:26:15PM +0800, Inochi Amaoto wrote:
> A recent submission from Rob has added additionalProperties: false
> to the interrupt-controller child node of RISC-V cpus. But CV1800B does
> not follow this change and still uses #address-cells in its interrupt
> controller. As it has no child nodes, #address-cells is not needed and
> can be removed.
>=20
> Fixes: c3dffa879cca ("riscv: dts: sophgo: add initial CV1800B SoC device =
tree")
> Link: https://patchwork.kernel.org/project/linux-riscv/patch/202309152019=
46.4184468-1-robh@kernel.org/

This is a dupe of a patch I already applied, but have not yet sent a PR
for:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Driscv-dt-for-next&id=3Db99df62818919b84e970eea5aec60b0dbc57da18

Cheers,
Conor.

>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dt=
s/sophgo/cv1800b.dtsi
> index df40e87ee063..aec6401a467b 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -34,7 +34,6 @@ cpu0: cpu@0 {
>  			cpu0_intc: interrupt-controller {
>  				compatible =3D "riscv,cpu-intc";
>  				interrupt-controller;
> -				#address-cells =3D <0>;
>  				#interrupt-cells =3D <1>;
>  			};
>  		};
> --
> 2.42.1
>=20

--HnJ3G1ILUKIB0LMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVIhNwAKCRB4tDGHoIJi
0rkAAQCDRGINzffMT6MvCnhOlveVMvDNHnDgSN+m8Wjdp5iJ6gD/Zh+u83XnVzPH
evBzqZTo5OoPvBJr4cZdAXjyS7KMPgY=
=Kphh
-----END PGP SIGNATURE-----

--HnJ3G1ILUKIB0LMn--


--===============2920103764798430644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2920103764798430644==--

