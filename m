Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343D3C07E97
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSCB0NCJ3xT9NObPI8n1J2xjHfFznDep7u6XB1orJ94=; b=cKWmA5yZmLsNzO9K462z5+9FvH
	F5UKwxSb5FnTyiUyb8sJgNSIPf9Y3MtJnI2xJlBq4wr1RjrWpq7wqi9rGbGEDieetaRqFF1cG+vI2
	1nSePjmxHbqoo2L4FtZxEiFEiBZSabwyL7vkCurmEpqZr7/tmUYLT3ngrwU4FWTvRPJp7cKki7qgc
	8bBF1x+c98Hl0//5NgSyu08IOW1YDl1V0lHx4A8pcXaOXWMLWbmaZP7bVc0OagS9CtRxw66xEi9D8
	wTZSwgm+f5fQcVarzK234SWziXk68Bj3eZtoBOH3Nch7MJNxKJM1funVHOrsgysGFtFm0+qZUlcNq
	/y5DHKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r95ir-00E4xw-1Y;
	Fri, 01 Dec 2023 15:46:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r95io-00E4x3-1T
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 15:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 478B8CE22FD;
	Fri,  1 Dec 2023 15:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212B9C433C9;
	Fri,  1 Dec 2023 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701445584;
	bh=0a5xvA+EE/HD2de4oTACqSgMGZmPpL1HYg7E91OIbjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpkGqEahS7E0OW2nucL/ztL6qJKWQx0MxMxLmZAdDDfZ89ofp2IjPwIA5I6aGAPjV
	 CjesnHpkG/h8E6KJ9BsmnDCk2q+sxtS6cbKYUor+MIJ59zFh7Clb/cotQ+EjuNsZ2s
	 PocD6TcHSUChgpIJa4Cu9/P1bvYm44vaRaRGMKkTvBTAABQ7NxL4RtxitFOhs5Shta
	 6+eSxDgts1UMKBkdy1Rxrgxo0yeqUqt353LJPLcvck4fzM6UjHiYqm2LZlZcmXztxB
	 mWLmQ6vfKy4eRBPu60CDjcIZn33jvcfmHFToypG8qpcBqEQjqxY1rH04mudpa/UWDE
	 L6ITLblOSO8ZA==
Date: Fri, 1 Dec 2023 15:46:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	michal.simek@amd.com, michael.zhu@starfivetech.com,
	drew@beagleboard.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com
Subject: Re: [PATCH v3 5/6] dt-bindings: serial: cdns: Add new compatible
 string for StarFive JH8100 UART
Message-ID: <20231201-retrace-unruffled-b755da60912e@spud>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-6-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231201121410.95298-6-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_074630_724288_A41E47F4 
X-CRM114-Status: GOOD (  11.98  )
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
Content-Type: multipart/mixed; boundary="===============8825385503116846404=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8825385503116846404==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b6G910+EpcX16ELw"
Content-Disposition: inline


--b6G910+EpcX16ELw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 08:14:09PM +0800, Sia Jee Heng wrote:
> Add new compatible string for UART in the StarFive JH8100 SoC.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/serial/cdns,uart.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Do=
cumentation/devicetree/bindings/serial/cdns,uart.yaml
> index e35ad1109efc..07732ae60007 100644
> --- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> @@ -12,6 +12,9 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: starfive,jh8100-uart
> +          - const: cdns,uart-r1p8
>        - description: UART controller for Zynq-7xxx SoC
>          items:
>            - const: xlnx,xuartps
> --=20
> 2.34.1
>=20

--b6G910+EpcX16ELw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWn/yQAKCRB4tDGHoIJi
0k/0AQDtPnPwSdRJ029ZXgtTtqL+qNU1ejsQjcuMF0cVd85EHAEAxwLKjgVy43m6
Uy3JksLeRxTyyf4uxKhbKdlCsPTjTQw=
=8FHo
-----END PGP SIGNATURE-----

--b6G910+EpcX16ELw--


--===============8825385503116846404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8825385503116846404==--

