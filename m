Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34BEC30659
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDGdK0WYw9ECCJjyZ94sFi7s+/5QIoOb5UmmM6L1wpM=; b=x37vTAhp350vsLxq09/8paQMPa
	A9VxmBIUiNmSRozDlKBWqJZhpEQ+0xkvmzdTansXDlLynsvq7mbzwR9I2HltPpVFT3zZnvCSaGjtK
	2noYAIy0PrPSyIbK9u4Y1F6wIDhYcLTMLoRbhlQms7JyTYd/aipFVu5zOXaMjG+DnzgJ8pvYTe3te
	ON9iIk8T2ALXrrbzdXZq0JA3Fk7wT2VmmkrzBfQW0iWnpiWCpIZ/EVb8dfRsn9VWnOAXIl3xP5UFx
	oHBBhPIoGtnWsTocw9PiRiTbbXJBHuElHUU6S7zma8JQtiTpk2NVB2SQtb+DAT0+n4EcpVmVOGBQ8
	o1I+fbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGHV-00000003GmR-0c3c;
	Mon, 01 Jul 2024 12:37:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG3Z-000000039V5-1Nnd
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B657CE1320;
	Mon,  1 Jul 2024 12:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8B1C116B1;
	Mon,  1 Jul 2024 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719836569;
	bh=NMxG4tkqcMPOEcnyGSPtxcQ8JKKz8GSwXxFVukYNc70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MF7lBwBHIyhk572bNPS85tUsjWtRRktMXAWoO8pDI932hLRJ1wphYSv3BejgECVuL
	 4dK108/5DYMFOAcHgvmvlB3mf8VR4a9TuIutzXrdmdwoRZxL/9cb1ecwz1P5hq13oE
	 GvdClh7m7OdqWAU+EyGOlPQBbiErN/uGPaTfBKUSXnvMeeaglMqLX+p675aA9D9gLF
	 ds1cVqIgkxutDiYQ9CXL8egc6kia6nxSPdCFWH4z4gjqgVagjG8q9DG7UfTh0zO6Ee
	 7/gZbmz7Kd/Js7FaWx8Hby08LvwDgeYgZiI23z1s6MrWcEIdPDWrbxEBrdHMuC7Ji6
	 9Ea6vN+38XCCA==
Date: Mon, 1 Jul 2024 13:22:43 +0100
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
Subject: Re: [PATCH v2 04/10] dt-bindings: timer: Add SpacemiT K1 CLINT
Message-ID: <20240701-exorcism-ending-ecd6bdb43471@spud>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-4-cc06c7555f07@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240627-k1-01-basic-dt-v2-4-cc06c7555f07@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052253_669999_C42F42B6 
X-CRM114-Status: GOOD (  13.49  )
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
Content-Type: multipart/mixed; boundary="===============3973289537387521601=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3973289537387521601==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dEuMgQ4pMEmSiiFw"
Content-Disposition: inline


--dEuMgQ4pMEmSiiFw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 03:31:18PM +0000, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
>=20
> Add compatible string for SpacemiT K1 CLINT.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index fced6f2d8ecbb..c2e68587a806a 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -31,6 +31,7 @@ properties:
>            - enum:
>                - canaan,k210-clint       # Canaan Kendryte K210
>                - sifive,fu540-c000-clint # SiFive FU540
> +              - spacemit,k1-clint       # SpacemiT K1
>                - starfive,jh7100-clint   # StarFive JH7100
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
>=20
> --=20
> 2.45.2
>=20

--dEuMgQ4pMEmSiiFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKfkwAKCRB4tDGHoIJi
0phzAQDTLo6+jXi4YLUzBn0ptxxjhdcNHVYChZPWicWGuQkp2wEAy7QmsRHrTdFu
1PNGRZ5q9g+u2uDx6XwJiao34suivQA=
=8fg0
-----END PGP SIGNATURE-----

--dEuMgQ4pMEmSiiFw--


--===============3973289537387521601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3973289537387521601==--

