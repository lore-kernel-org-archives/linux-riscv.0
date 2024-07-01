Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC38C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33lqKx2kGTHQ/mKLGo/iiLIKyqNGuPplGrrMW9pxIrk=; b=XlC/kTWVJxRlfgMLOkgm1Fq6cO
	kzUQYJYcTT+TGXIQGvTkvTmXmGgdw99A25BKJG3SL1l3WyTy9dNwGDPrpoDwXHlD48DXNz2Fcx5Fa
	fg1wG+o0xSXlsxfwvZO5RZbrMQ0CHobznpn64F9jw7yMNbgqFG9Caa4ZQVLMw4NQhyXmzzfYUqNE+
	U/VpaVwpXCMI53q6dnbK1udy+WvtdR+pk+CpotDFUUCdf5dLHKeLyRYu+Z9tYAgzAb20eXLD06aeS
	9+v4a2E4TyyJ81g2XLKUC3RxWfhvldrBWlRPXSg4Sr8ASl6FXYo0qlUZI6wsmHMOZJLYT9Gd2jBes
	+9gmAKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGHj-00000003Gxn-2Ynp;
	Mon, 01 Jul 2024 12:37:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG5p-00000003AoD-11w6
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CF3E612A8;
	Mon,  1 Jul 2024 12:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D900C116B1;
	Mon,  1 Jul 2024 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719836712;
	bh=uokN+LJdC2agYZtYBp+On9i8Y82wyfHM+k2m2SnHmzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aw3qbpaNOKzKEX9V22J42eKeD9U+duvt0ZcmJLREv44nL7mgiCiai5VS5gMKfbhGf
	 8eADDaVgaaDebfN5zntfFD5tvh4Tz2ej+OyO1a+1cuAeEQI8VB9yETyR18HD29aKAf
	 6PSCpC5MK/Se4wgQCv6P/jk2jC9Tryh0aybbFxUspS3dw1DakEEV3Q9GlatJG6/e7d
	 VeWGz73fgNcVVxqC1mV+sEaWqpplpG0jCsgCDfu9EaALRHfpHx/ZoE2ZxBlKb0ehnC
	 vChlSi4KlSobeZSzS5y0IeKak/r+ccH+hnXryASQ3/UiNOWbU0cppcljYyO+k2PZcD
	 9EkJlTqpc6inw==
Date: Mon, 1 Jul 2024 13:25:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 02/10] dt-bindings: riscv: Add SpacemiT X60 compatibles
Message-ID: <20240701-line-congress-f838a8b6b1e7@spud>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-2-cc06c7555f07@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240627-k1-01-basic-dt-v2-2-cc06c7555f07@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052513_372767_29BAF211 
X-CRM114-Status: GOOD (  14.20  )
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
Content-Type: multipart/mixed; boundary="===============0020693555631543896=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0020693555631543896==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eU5rt2wxl2jPuf8p"
Content-Disposition: inline


--eU5rt2wxl2jPuf8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 03:31:16PM +0000, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
>=20
> The X60 is RISC-V CPU cores from SpacemiT and currently used in their K1
> SoC.
>=20
> Link: https://www.spacemit.com/en/spacemit-x60-core/
>=20

Same comment as v1 here :) With that addressed,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b5..5ad9cb4103356 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -46,6 +46,7 @@ properties:
>                - sifive,u7
>                - sifive,u74
>                - sifive,u74-mc
> +              - spacemit,x60
>                - thead,c906
>                - thead,c910
>                - thead,c920
>=20
> --=20
> 2.45.2
>=20

--eU5rt2wxl2jPuf8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKgIQAKCRB4tDGHoIJi
0t8pAQDtH2/PmqMu6iMWlqBobOPH26sE744GEAMmDDby/tabTAD/QqARpMzY6jQa
0Qi3mmRENPebG4X8D2w6sYdF8Fms3wU=
=rmPZ
-----END PGP SIGNATURE-----

--eU5rt2wxl2jPuf8p--


--===============0020693555631543896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0020693555631543896==--

