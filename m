Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D010C2BA1B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suxEKj83d1JRkS8MyGrO006zxnMHfGdl/zsfeS5ugRI=; b=Yi4gFO6Eld2X9XJR29TUdnwqLE
	CyKp5NcLIeErbVIZireArAPbNs/+6pObGXTG6AAgIopS4Snkk1GdAs3KEfHmaUiB1L03w95nPseuJ
	Vpwyj6Nd2zkAxtKdftVBWn9oJgGhdjnI0YyHuOpgWjLLT3Jril1CyAM4FXBkb/b5i+I9FqmN0VHIW
	3TYXWZJXnvOxVqDVvHEsE9GNOxaRRS0QpmmjCLxb4ynHMLWfQh3QyR7khQZ2tY9LEsgn0M+Dpr/Eo
	0QvmtMY8pfl78V6eUKtulfN89ea0Ya6cjp0NzahQzEnXnFdAHTCVm5Wbm7J4RnaIcbv5rVLfg4y/D
	63ElveFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Rs-00000006dvA-33MD;
	Tue, 11 Mar 2025 18:35:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts48Q-00000006auZ-1bLz
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 18:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75640A46101;
	Tue, 11 Mar 2025 18:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE63C4CEEA;
	Tue, 11 Mar 2025 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716921;
	bh=QVKm1/ggon8nkDEmT9UXPEAL4izORGEQ9UkuDXgyZBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzRvAZeLYZVBx5UHTI50AopOoUuWTwRnPh40r49hYd3anLJbxT97umDFmTfLSwpJl
	 z9OFRE+yaqy7PaYaB7F25BNW7paU2yfkT3/rDiZqdYoAxdj2I6mOaaUJOsE9Nymh18
	 dwIGAWXKtBjq7DR1TDwUqZ5rVpcsVES/NwZqEU/FwB0rES1P8okJc4IzW0FwEft/7R
	 EFgd0bIWOWIALBRzyE6RsT3IhCp1VJtfOJEkxyY35GDqfCPTel/2W5cQbJ8b7sTNRL
	 z5mMrMqlmp/G4ZQ0QRWonBJS9HfYviL6ySabRP+/yg64WrtTytiDXczfCzXVY02E0s
	 M1fr1T0AL4xsw==
Date: Tue, 11 Mar 2025 18:15:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: vendor-prefixes: add eswin
Message-ID: <20250311-reproduce-smoked-b6a6025985d6@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-4-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20250311073432.4068512-4-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111522_544959_9FDA9E6E 
X-CRM114-Status: GOOD (  13.63  )
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
Content-Type: multipart/mixed; boundary="===============3005140945090310766=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3005140945090310766==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dPdjNx0Q/ARv4t6y"
Content-Disposition: inline


--dPdjNx0Q/ARv4t6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 01:04:25PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> Add new vendor string to dt bindings.
> This new vendor string is used by
> - ESWIN EIC770X SoC
> - HiFive Premier P550 board which uses EIC7700 SoC.
>=20
> Link: https://www.eswin.com/en/
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 5079ca6ce1d1..07ff140e67dc 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -490,6 +490,8 @@ patternProperties:
>      description: Espressif Systems Co. Ltd.
>    "^est,.*":
>      description: ESTeem Wireless Modems
> +  "^eswin,.*":
> +    description: Beijing ESWIN Technology Group Co. Ltd.
>    "^ettus,.*":
>      description: NI Ettus Research
>    "^eukrea,.*":
> --=20
> 2.25.1
>=20

--dPdjNx0Q/ARv4t6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9B9sQAKCRB4tDGHoIJi
0pZoAP9+XoAhB5X/zHXubQ1FiTw4muY9Itw2e6V5S/HY/Q3fwwEAllR8f3pNGCJ1
8Qaas6YgZerepyiwoergLbDFV1ASUws=
=7vdG
-----END PGP SIGNATURE-----

--dPdjNx0Q/ARv4t6y--


--===============3005140945090310766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3005140945090310766==--

