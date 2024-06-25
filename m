Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89242C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlV8eCGJ1l2cODnzjWp/gVDnpFkuKjh5FF8npg160ac=; b=BRk1Q5kyiNDlDfxwriTe6Yu9t9
	9qB1NoJzL72hL6vPgfW8mnOwuiWjf0WNn43jCKH+OBrA+uOWrVuvidRBIvJsxXTbICvV8MaJSaihw
	mO9xQT5EmB5s4D96bn2OniDWsTVkHUjSTaYhCs6JDRZo0rqf9NYZ9gkEYLije4RxPuWgSwhpHTspL
	oVvVZInRm7ESzMEUPkOpz4q1b9i+fNPK7OzSPPsjq6PkH7f2fm4O9jAZdHjLPIXjLfVOmYfFaZRPw
	UyebuEXB4cVBqpf9X0ESSE3mx5yqZ2JoLZyy2fl85d+9FepeuJ+80c60QnfsdzW8Ks4hu2DQFeCxr
	v+oqNZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7Vm-00000003G2R-1TP6;
	Tue, 25 Jun 2024 14:51:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7Vj-00000003G0x-1ZDm;
	Tue, 25 Jun 2024 14:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0654CE1906;
	Tue, 25 Jun 2024 14:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C64C32781;
	Tue, 25 Jun 2024 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327064;
	bh=h7/s1erSrTInKP/WfJXKAlirzQaaLfNgEqTkzmlNeWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4PxwaZptC/mrLUYem2vzCWclAWJx9yUlEjjlguMsEA9cwvaZ4yPel74R2ZxiLnvR
	 A2oNPJYNkBWtKFXwwhHJiaCYvXTF85t20gmIgjaqjwc1odeAUqS9bIF2/4hZKUwz3+
	 6qqo97tDKElp69yt/8DzNYaYXcvGfR9a4QHsztGl/X50GjCD/s+0y+miYPoM0eB+Xi
	 ev3nMUoY2hiJLqfosv4jiwJwBtFfZRh0wDz2YnKgLyxzrB7w0EEVm8/HHCOh+0QRa7
	 Uvdv5NSIsVY142FaeawS/1wDcH5JjVEmljs2c60LL5lHTt3YwP/RWL8WfIenQjuzS/
	 j64abmeLhVVmQ==
Date: Tue, 25 Jun 2024 15:50:59 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v7 01/16] dt-bindings: riscv: add Zimop ISA extension
 description
Message-ID: <20240625-blimp-richly-f5828cbfe6a6@spud>
References: <20240619113529.676940-1-cleger@rivosinc.com>
 <20240619113529.676940-2-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240619113529.676940-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_075107_610923_EE45CD9E 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Type: multipart/mixed; boundary="===============6306033438143712587=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6306033438143712587==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9PA0Wx6xMQTCxIcL"
Content-Disposition: inline


--9PA0Wx6xMQTCxIcL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 01:35:11PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for the Zimop (May-Be-Operations) ISA extension which
> was ratified in commit 58220614a5f of the riscv-isa-manual.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index cfed80ad5540..e214679ab6da 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -363,6 +363,11 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
> =20
> +        - const: zimop
> +          description:
> +            The standard Zimop extension version 1.0, as ratified in com=
mit
> +            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manua=
l.
> +
>          - const: ztso
>            description:
>              The standard Ztso extension for total store ordering, as rat=
ified
> --=20
> 2.45.2
>=20

--9PA0Wx6xMQTCxIcL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrZUwAKCRB4tDGHoIJi
0h+2AQD3yl1OivAnczjSlHzmMNfjOS/06MsBmq0xtbv8bTLpNAD/RzbgHtntHnej
NyEPsFHW7yXdXAU1j8rFsiMmhti6igo=
=/o9k
-----END PGP SIGNATURE-----

--9PA0Wx6xMQTCxIcL--


--===============6306033438143712587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6306033438143712587==--

