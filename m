Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2855DC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO70TNzfdyGsDwxbwtfXYJQRsn5BwcWvmGX6Z+Ryk9o=; b=PMziHjXSfRFDpl3O64G9McPGX6
	ckGdOcmo0KoahNLCP5VvSW8+Wulti+qUnQvIxwv1LN+WnnzJsd8rszmGRK/lwGRoLvBr1GihjQh7U
	1au74rtiOil20waAbjSzLRwZtAHFhdNPN6Dc+sf+UFPC/UDQrOgY2d1qf3QRf+YWmgHWt+vuyHACZ
	hae0uWQE6c09ufItm9VRGAmhV4iInv6ydy/FHjg2JkBcAkS2z23KyBTrt4xifwvJiHexsWXKt5Jva
	5vGHM93pOAnkRCEn4UFeqzAvf3hUel2hvCLVx5Ptif9YIhNuFihJmVdy9XRzmRb6jLPk/lBjRJiX7
	5ilXwEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjUm-00DzrF-2y;
	Thu, 18 May 2023 19:41:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjUk-00Dzqg-0L
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 19:41:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CAF961CE6;
	Thu, 18 May 2023 19:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA29C4339B;
	Thu, 18 May 2023 19:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684438861;
	bh=NU4ywM5dgREugZ4a6r1tYhbRQe1nLEkwPJTVqUYXj/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiCdma3aE+CRL4/sUg38BiIizkEcRYHkYSx7QEPEIBxdt46LA7c3jUtVfj0XNoP8Q
	 q+0UplFyHN1f0goz+tWro61SCeclDHr4id3TH4yvkWCKM++RgovSeVMPuAD61pkiuE
	 KqD5pua1oo9K/WB1U7x/huAT6A37MSq4IEg+yRwYC6UWzcTKY5Ilwke90MXgtaHF6A
	 nGQxOEp9UP9YaGn6VfmcZ2UiL2DKf3+9xmWGrpwLoiZunoXn5v3CaPrCb5RqJibcuq
	 +lFC8LHUkZiscq0DonbwMutQNQ+lluvmj6HrdVLSg+j8W1xOjb+YdOUsf3yDVIOHbO
	 oiOsBN8uzIbXg==
Date: Thu, 18 May 2023 20:40:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 3/9] dt-bindings: riscv: Add T-HEAD TH1520 board
 compatibles
Message-ID: <20230518-estate-scoff-c009f19aad5a@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_124102_215033_DD8BE8A7 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============6826304400654974754=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6826304400654974754==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lwMnHdNs4FO0hshN"
Content-Disposition: inline


--lwMnHdNs4FO0hshN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 02:45:35AM +0800, Jisheng Zhang wrote:
> Several SoMs and boards are available that feature the T-HEAD TH1520
> SoC. Document the compatible strings.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/riscv/thead.yaml      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/thead.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documen=
tation/devicetree/bindings/riscv/thead.yaml
> new file mode 100644
> index 000000000000..e62f6821372e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/thead.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD SoC-based boards
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description:
> +  T-HEAD SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Sipeed Lichee Pi 4A board for the Sipeed Lichee Mod=
ule 4A
> +        items:
> +          - enum:
> +              - sipeed,lichee-pi-4a
> +          - const: sipeed,lichee-module-4a
> +          - const: thead,th1520

Same here re: other SoMs I guess. Probably more interest in creating
them here though!

I heard on the grapevine that the boards people have now are perhaps not
the same as the design that they're going to ship in the main production
run?
Do you know if there is a more detailed part number for the boards, just
in case there are some software-visible changes?

Thanks,
Conor.

--lwMnHdNs4FO0hshN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZ/RwAKCRB4tDGHoIJi
0jGSAQCY4kaOgHOoG9aRVof11tWusYqNws27HUKIe/mAvPbWQQD/eQDHmytrrfJ2
CpIn9rLovTl/X8C4YidVVzmRuLVQuw0=
=jiga
-----END PGP SIGNATURE-----

--lwMnHdNs4FO0hshN--


--===============6826304400654974754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6826304400654974754==--

