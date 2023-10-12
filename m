Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5296CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBCA14VkWQtxHkluSVu82g1Cz5/qGqKNq7gwm7EBXBQ=; b=tPLpZDOBcpkkDYbYUaBLek3nEZ
	43xKE8DQHa2ctn59CVU10oJJnW1xPsowQO+S35DvMZWhdnZRuWbd57LTN3s5bG1/byEtDj7SPK7/W
	WP2W/9K1LOpDuO6aaIty0wjKTnvdxB8dRc4eB8VvWX1pI8KTWr8ZJ18RK/Ycirki45VSjFD7EpfGO
	7V7txQ/NyOEzsJ36LnacPDcWop8LkqrFGRccj6YD3bnIHDgtdMyd5l/qmNLVQB6ax+4gihQ5tX5V2
	4MvWp2lDHOu3apnhx9IUSxQFhT1+a02NrqyaU6A0qp1lXptdzi8YJpDG3rxY6y6HWykD4QRAGMncJ
	fgXzqh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqw69-0017Xw-2S;
	Thu, 12 Oct 2023 13:51:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqw65-0017Vs-1b
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F2F1FB8247B;
	Thu, 12 Oct 2023 13:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55F4C433C7;
	Thu, 12 Oct 2023 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697118687;
	bh=plfB4PpF0b7k0vrWaK38E9O7BeyLgBdbO+/vtChT7ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHSQvG6OoRICdYlNvQGCjgpI4P30dxpdBYMOzIAeVWXYBr7qU0mgIW+z5n4PC/adv
	 4LVLCTYqvwlXRwmBEgsYhj+LhiAnNYZ9ZHfXZZ0Rp3LczAHN5V8KLbEqsLF0KSoqVL
	 44t35/F3gHFjt6fyJGcOGlxy26d182rXzTJqb5T8pl1cDApJYNOTo3O3ccLxiGXKTa
	 4clH9QERS87ECum+mez3A8Yh2LV1HTsrwO4UWen/IesbQVqFswDPWc+YV07oWGmImD
	 /X8jYu8vALTfixz8EkVzX7CkAoZ5gXgLrDH2eiqIwivoZ3I5NIpXsMftv84OX99umn
	 tM+dKni0WvTMQ==
Date: Thu, 12 Oct 2023 14:51:22 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v1 13/13] dt-bindings: riscv: add Zvfh[min] ISA extension
 description
Message-ID: <20231012-persuader-trombone-ea184e2c996c@spud>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-14-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231011111438.909552-14-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_065129_828201_AF4F7E77 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Type: multipart/mixed; boundary="===============6239255706584292122=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6239255706584292122==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q1HKiMXXfc9zP6aG"
Content-Disposition: inline


--q1HKiMXXfc9zP6aG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 01:14:38PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for Zvfh[min] ISA extension[1] which can now be
> reported through hwprobe for userspace usage.
>=20
> [1] https://drive.google.com/file/d/1_Yt60HGAf1r1hx7JnsIptw0sqkBd9BQ8/view

And once more, the same.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 70c2b0351357..ae7db420ab92 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -277,6 +277,18 @@ properties:
>              instructions, as ratified in commit 56ed795 ("Update
>              riscv-crypto-spec-vector.adoc") of riscv-crypto.
> =20
> +        - const: zvfh
> +          description:
> +            The standard Zvfh extension for vectored half-precision
> +            floating-point instructions, as ratified in commit e2ccd05
> +            ("Remove draft warnings from Zvfh[min]") of riscv-v-spec.
> +
> +        - const: zvfhmin
> +          description:
> +            The standard Zvfhmin extension for vectored minimal half-pre=
cision
> +            floating-point instructions, as ratified in commit e2ccd05
> +            ("Remove draft warnings from Zvfh[min]") of riscv-v-spec.
> +
>          - const: zvkb
>            description:
>              The standard Zvkb extension for vector cryptography bit-mani=
pulation
> --=20
> 2.42.0
>=20

--q1HKiMXXfc9zP6aG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSf52gAKCRB4tDGHoIJi
0mXXAP43q831cMUYHEY7AgTTsOLdDdb5y1qIiBeSmb/No72uMQD/RN79QBvdM4vk
D77qY5QM22vPcXkhV13vkJ9bkp5bdAQ=
=83WE
-----END PGP SIGNATURE-----

--q1HKiMXXfc9zP6aG--


--===============6239255706584292122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6239255706584292122==--

