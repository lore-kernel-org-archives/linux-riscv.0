Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37566D15D82
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+q3q4G8MKcecLLUdS+oNgoiT9/J5uphBlokI9KAzHw=; b=g4AtERsyRMMqKZyQaIcEBXvbu2
	MjU1nz5k5/KQtgsZE/Eb7OxvnQBLHfIdTka2rT3Qw6y7aicxpNvfbEy4v7M2pUWKc4cpeWOr9NTNX
	iRYfh6OZA3RrmVdo/zU4KqpjvvWholge+fhYwTGNmxXQl04nG959A4VfrAIc8o18TO7TEEMyXtKoV
	9jA+yKkDtvShUwsucKIwzgcuxiP/Omsx/5/sPm2O/jVt18yFjsdQiQ1mKNJnZUiL0tE8d4jVZehZY
	0Xznq2TkGTwj98ujH0/r7OI+lkdnNAxRdRIfU0XKAjlYFmHBCRCbeUgBGH1pY34m871p6o1rEOdCo
	9YnggRAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rFg-00000007BJc-3Fza;
	Mon, 21 Oct 2024 12:11:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rFS-00000007BGQ-1yZB
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 12:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E9015C5988;
	Mon, 21 Oct 2024 12:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBF0C4CEC3;
	Mon, 21 Oct 2024 12:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729512657;
	bh=wI2COY0sgnb3AcZsuJwcmJ7QtHSQix2hOpVbezvb57I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLRy0UKkgYzfx4ixS8Yme76364PkYK418L4pbZHahJH/vnawAKS0PzPRh317ovaxX
	 xL2x9d26HDfooouaeGLUCscg+8irbizuNmo66iD1BIMuewtH81CEUrLIjWkZ6YJ88d
	 n3WkF7HsBQXd+8kNChdqZ4uP4Aghb7ujX6onw5uwycsIvF5ZYRLdd3SKR9MMCZv4XZ
	 BcjiUDWizxBeM32rGwX8tpKqG+klHsCQFYFtvW0gFE4853fc1d3A/t3nFgIJrHLya8
	 2dZ13OWGLFZRiAOsRvQA+04vX8VUu58aSBDm9Q49QYNJUR+4TVHsqDfrZX+iIjqL4g
	 UBG1crBORz8kQ==
Date: Mon, 21 Oct 2024 13:10:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo
 SG2044 uarts
Message-ID: <20241021-outlying-washday-8f171dedc703@spud>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241021072606.585878-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_051058_578493_DF7E160B 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Type: multipart/mixed; boundary="===============2237106718735161722=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2237106718735161722==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l5KL92mOVjkHqDBj"
Content-Disposition: inline


--l5KL92mOVjkHqDBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 03:26:05PM +0800, Inochi Amaoto wrote:
> The UART of SG2044 is modified version of the standard Synopsys
> DesignWare UART. The UART on SG2044 relys on the internal divisor
> and can not set right clock rate for the common bitrates.
>=20
> Add compatibles string for the Sophgo SG2044 uarts.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.ya=
ml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 4cdb0dcaccf3..6963f89a1848 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -58,6 +58,10 @@ properties:
>                - brcm,bcm11351-dw-apb-uart
>                - brcm,bcm21664-dw-apb-uart
>            - const: snps,dw-apb-uart
> +      - items:
> +          - enum:
> +              - sophgo,sg2044-uart
> +          - const: snps,dw-apb-uart

Why does each vendor have an items entry of its own? Seems like needless
clutter of the file IMO, except for the renesas bit.


Cheers,
Conor.

--l5KL92mOVjkHqDBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxZEywAKCRB4tDGHoIJi
0tcSAP9Cg0qOqBlYu4GM4FXNjZvQgfXWi5L9u7SJpQum8USXVgEAtJ5xlHYm9l/w
MiHYei67Y3U+RmvBGpDDkiNm9VwiuQ0=
=YTSF
-----END PGP SIGNATURE-----

--l5KL92mOVjkHqDBj--


--===============2237106718735161722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2237106718735161722==--

