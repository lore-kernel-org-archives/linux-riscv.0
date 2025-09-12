Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FF0CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK1z95ynuvsxAAgSZtWNpO/cvW38WWzl6/8G4ED/RiI=; b=XfzKHuk/kHuNwMWW+1pwZa25yi
	Zqn5ZmmWgEdROyhJS23vS/kJSDvueUal3DgD1j8LLS8+ALPrMaSUXf+YMqE1niAybDFZAbVL/BKbh
	c6m1NnNbqTutWY80Sw6DTHB+RVr9RXE3ZLfq/3pJVgCqeSL3l7O3z/9obUQYQ/j0cS0qDIZ65QmgU
	9iPyr8m3FxU3Pk2BP9YIa64VVP9mpAtoOmjD2mH7ZJ5SrL0p1ZlGuWMwXnVaYlKuuCWrhyf0CbPol
	9RkX5ifZWFHPSDfwMDogpG414URAd+Lkjan2GyvDDoUb31HKbwNIP3wp31hkHWZ0eQcU5VdIzdfYi
	L53C4BLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux83I-0000000AsLe-41Y3;
	Fri, 12 Sep 2025 17:59:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux83G-0000000AsKs-2DKT
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 17:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8778940239;
	Fri, 12 Sep 2025 17:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951C1C4CEF1;
	Fri, 12 Sep 2025 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757699953;
	bh=NAZECHrYbl8mxswXcbpWQ0UVEYqlvkhivcyRhkS4tyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge59Wiowz9H3gLLSBo+dahVii80E4/vECJFWZRQtbtJuN3j362S/DYM+Ud0xxogdZ
	 ioX3k4fSM4b4azMmh0t5h3FGFQqSfZoa4lN5bokDbvlL0c0ZBU1fLzG+iQ30SasfjF
	 SFvYpABBc/aam/TRXxq9hTzO9kDkHnFSDWf5Ydq9mU8yJLsmIUo0XxwOjouN8p6XYh
	 3dfjmZhHG1iECE2MxRKFaHwu1n86HehG1gQ3GRSYoZEW+ZMrHclf04H7w9F67fX97P
	 lNJNZYd2A5ugopVoAcoT2QzVg/XQOU+xa7Y0TG8U8sPnxJAwc28nQIUHjsLYBTYIVO
	 7VILswe79csvw==
Date: Fri, 12 Sep 2025 18:59:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 3/3] riscv: dts: thead: add zfh for th1520
Message-ID: <20250912-verdict-croon-81ac20e5b621@spud>
References: <20250911184528.1512543-1-rabenda.cn@gmail.com>
 <20250911184528.1512543-4-rabenda.cn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250911184528.1512543-4-rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_105914_606336_C85DB3BC 
X-CRM114-Status: GOOD (  15.32  )
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
Content-Type: multipart/mixed; boundary="===============3143623879626328832=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3143623879626328832==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5pIc3q2NffjnH9i"
Content-Disposition: inline


--b5pIc3q2NffjnH9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 02:45:28AM +0800, Han Gao wrote:
> th1520 support Zfh ISA extension [1].
>=20
> Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1737721=
869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%E6%89%8B%E=
5%86%8C%28xrvm%29_20250124.pdf [1]

Could you please cite the section that this is detailed in?

>=20
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index 7f07688aa964..2075bb969c2f 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -26,7 +26,7 @@ c910_0: cpu@0 {
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
>  					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>  					       "xtheadvector";
>  			thead,vlenb =3D <16>;
>  			reg =3D <0>;
> @@ -53,7 +53,7 @@ c910_1: cpu@1 {
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
>  					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>  					       "xtheadvector";
>  			thead,vlenb =3D <16>;
>  			reg =3D <1>;
> @@ -80,7 +80,7 @@ c910_2: cpu@2 {
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
>  					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>  					       "xtheadvector";
>  			thead,vlenb =3D <16>;
>  			reg =3D <2>;
> @@ -107,7 +107,7 @@ c910_3: cpu@3 {
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
>  					       "ziccrse", "zicntr", "zicsr",
> -					       "zifencei", "zihpm",
> +					       "zifencei", "zihpm", "zfh",
>  					       "xtheadvector";
>  			thead,vlenb =3D <16>;
>  			reg =3D <3>;
> --=20
> 2.47.3
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--b5pIc3q2NffjnH9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMRfbAAKCRB4tDGHoIJi
0gr1AQDn94lY15gXhvjAqX086W8aphAAVGa73ZrLqmyznyWS9QD/a6zFwVSlSV+C
TDWMts0ppc63CwGlT0Ixd1N2hyU89AI=
=Vc25
-----END PGP SIGNATURE-----

--b5pIc3q2NffjnH9i--


--===============3143623879626328832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3143623879626328832==--

