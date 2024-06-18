Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4B4C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lvEFZL+wAzfbT9WVxA9FgdCEz85MhxjDEo+rTLRbIw=; b=OYawJs4oiywmysG9rczZ4To5oZ
	kQBXmNcKD6d+Ll8RlzYq9VXEQfQhfSquo9vnCtyOiYrdqcF9mpaZSNyAmtFwg+FLyODee1HGVKkls
	32P97q7tIqSmDVkVJiAV6XUFXfNJ3G8g/FscSiJppYHRDyx6GnfU9VKLxTDkHYU4ThLD2tF0vdxZT
	gi9uT8klenKr4IsiD8t+FgXy9Bv1RihtwoTf+qrYIHNBxRSLxX61iGB4EVocX1YaMedyBDPaBELFi
	vsGkePvdMreRstjreCmWOCyWFZ0/Pfurd4NuifTObqsDzW4MJi56d9jfcqBsZjbxVYSp6XMSVbTvU
	br8HZ8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJb1v-0000000Ffkr-0uHO;
	Tue, 18 Jun 2024 15:45:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJb1s-0000000FfjH-33c3
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 15:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0FFFBCE1A6C;
	Tue, 18 Jun 2024 15:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5B5C3277B;
	Tue, 18 Jun 2024 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718725550;
	bh=+Y3MShge4JrwWG3G/w1pr+rtYWkctyGlLWVNc3mtZi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGwXCwDakCJUruIfaIRhWshWGOnHV4qtpxMWon23cqUzaY8jEJuOA22gi8jFYI4rI
	 ObhcFL5W/oPp5BKpvkSQPbSeJMaBSQDY4paLalSjjq9uuAvFugW98vG76DViAdYOSn
	 MiTD7Ss5k696SALuI3kWSaJZa8iKyQFD54CkoT8nXfEeKa7N3G5eJ5jPIA4zc6BerC
	 LF4UWypbUDJlKcLRe/EfmYH8NwbDEFkzR1hPB5T8igeCesOTYF0lEisHK+nLyQaZAS
	 +qpVUGhnja4cYUWJ40SLHYLDaDLZSlmqkL93FSbpszLkGnOBTz2aGnRg1ivglLIfDK
	 e0+BBcV7FGS4w==
Date: Tue, 18 Jun 2024 16:45:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/9] dt-bindings: riscv: Add SpacemiT X60 compatibles
Message-ID: <20240618-vendor-debtor-c88a8a555a4c@spud>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_947689E304AE5A4C7A48682311DF8920B106@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_947689E304AE5A4C7A48682311DF8920B106@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_084552_968139_0A5786B1 
X-CRM114-Status: GOOD (  13.41  )
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
Content-Type: multipart/mixed; boundary="===============6210772578240084482=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6210772578240084482==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EeJQNOojAFcHf82l"
Content-Disposition: inline


--EeJQNOojAFcHf82l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 01:20:47AM +0800, Yangyu Chen wrote:
> The X60 is RISC-V CPU cores from SpacemiT and currently used in their K1
> SoC.
>=20
> Link: https://www.spacemit.com/en/spacemit-x60-core/
>=20

nit: Delete the blank line

> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b..5ad9cb410335 100644
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
> --=20
> 2.45.1
>=20

--EeJQNOojAFcHf82l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnGrqQAKCRB4tDGHoIJi
0iAJAQC7qcXuTq4ZwTJonJzf+JN6yAvGpeql2DX+RXgpHhAH2gEAySlx6N7CvLqG
WLunJhEKHouFBjgCCw11FxvuAKBU4AI=
=OF3D
-----END PGP SIGNATURE-----

--EeJQNOojAFcHf82l--


--===============6210772578240084482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6210772578240084482==--

