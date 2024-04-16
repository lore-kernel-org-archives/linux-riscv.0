Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02931C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWsEJQiUw6FD6lG5oJh1TL9LVYW4erLCZ4+E0JiD4UY=; b=cPfk4LFxWLa+SAm4QQEA1oLslt
	pECbxUKkW4jrSacX7Ww4Pe52wjGXrk08Dt+mmiFqeCdQOwgkQKTLTUreEl3/xOlRc6cVrSX1ncBGU
	GJF8HjcYQJyg9jSZeA0UbW0eONiwnTMUgxKpJze/xNSBFqcu1M8ZKyDgmacPr4pgYhrlEvsqMPmlT
	deGx/djTgbl6V3Qc3k+LvRMLPUP7R+8lB36qvpYrGBzPgYBTCBhsmWAKG8gdqzkHsaXrzd9Am/zbR
	o80JPX79T8iJILz/CL7hADDjyPALbxSbCGZ+/3+Waa/5AILH/Bv8DjdtWwAzg8z4QefAr5QzREqPf
	44PZk0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkjY-0000000ClIu-1nt5;
	Tue, 16 Apr 2024 15:28:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkjU-0000000ClHF-1EeC;
	Tue, 16 Apr 2024 15:28:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F3AA61239;
	Tue, 16 Apr 2024 15:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83258C113CE;
	Tue, 16 Apr 2024 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713281307;
	bh=e7THuib2jYpaypD6WlnQShylaP5wyEwmwYV9EkglRW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8bfNMUL+taETD8GpRDIgp7waHn4KT2C0/Kfgtm9sGK/Gqw7B6CcjydgFup6Fj5v2
	 eR0pZDwrzFCddOdkfli8TQaaKFa70tVQDghGZ4vXXNYa4yAAip2/LA2mqsO4AV68lH
	 wQr0DxWi+8/LSo+0D0iJIgWsjf19bJy6CZoj7q3txJCiUM3pABkx+2DhJaGTINzzns
	 +zuAC8sgnx00CD2p1HwDD1f/Unxyk9WgkMGDt2J1ay45kyw+CAQO+FOIQTuB0EdwhF
	 wB4FFtR0UFva4a5nZGa2NsSpQPBJBRwjgCYlT4GLG3LO36C1lvwaYZBiHOFq1qC01M
	 w+cDoQYVy7gLw==
Date: Tue, 16 Apr 2024 16:28:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <20240416-scorer-easeful-4dae3c18465d@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-4-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-4-c7d68c603268@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_082828_455599_2C9F055F 
X-CRM114-Status: GOOD (  16.97  )
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
Content-Type: multipart/mixed; boundary="===============4165243145859796404=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4165243145859796404==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6+SPECBpGFwY+8mB"
Content-Disposition: inline


--6+SPECBpGFwY+8mB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 09:12:01PM -0700, Charlie Jenkins wrote:
> The D1/D1s SoCs support xtheadvector which should be included in the
> devicetree. Also include vendorid for the cpu.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..4788bb50afa2 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadvector";


> +			riscv,vendorid =3D <0x00000000 0x0000005b7>;

Isn't this effectively useless given there's only one CPU here?
We also already know the vendor of the hart, because the compatible says
it is a "thead,c906" so this doesn't provide any new information.

>  			#cooling-cells =3D <2>;
> =20
>  			cpu0_intc: interrupt-controller {
>=20
> --=20
> 2.44.0
>=20

--6+SPECBpGFwY+8mB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh6ZEwAKCRB4tDGHoIJi
0v4RAQDrqlZrOVNmVT2qJWHlaUy5oV83I9CLCGUxlH9aAGur6QEAoFXtsX7XrWNf
i2shqmRRdXJ1R1aeL6/dha7DMntUqAg=
=6P7j
-----END PGP SIGNATURE-----

--6+SPECBpGFwY+8mB--


--===============4165243145859796404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4165243145859796404==--

