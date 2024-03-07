Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5338C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 18:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kR13tlNXxy/J9N5nSoxpfz/ay67c8rJBWviCAeMok8=; b=yA62nFFgGMEJq0mLLvQEaMsqwL
	R8B5WssXLaDPe/UF98zbpaNwxX5WCNEC5IS2Y5lW0Y90iPFUuD2KsXpAa2fCYXhrGQGHT+9o4PrV+
	6QYZig9fuKpgcR7MR/eEy+Ld613DWJwY/nNxGPq0tPvmJPaMeuaYQxK87oQ8bGIKDpFyOkqPNUh1T
	Yp6SThPm14PgOtl1ON1k3YrFTkmcaExCEzH+lYtUHQm8Vkg3M9veAYYPx3Qa4AOi3ovPW1HyBvBZF
	M9y+qK4A/Ug0T2wHQqAIEZlY2zhcpPg06IZOdepNgn1vP7FOCkxdSupq+KBedU6wIYn/UqgDapTa+
	n29frKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riI8N-00000005oPA-0yBc;
	Thu, 07 Mar 2024 18:06:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riI8J-00000005oO9-3Nsx
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 18:06:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E780461B69;
	Thu,  7 Mar 2024 18:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04474C433C7;
	Thu,  7 Mar 2024 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709834778;
	bh=/qMweurkufToMwoadZe649Pm1lLjarPn8VuQ/oC8ncI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6gknGiKUfVSiH36Wno+U/gRqlQxWa4hxGU7U9gID7kxMoztJxP20vaHs1m6jR177
	 bqMFRJCxHQMgCX5H+x7hyipP0S+W2H0W5bb0PQW9/COve6uqhpK9oETQGc2ZSjk0jT
	 O9Bfd7uuQaB0IGK6ILJc6EUPAgVacvPz4Ph2rDrmHClaCQZ3uBluNP40UgDvH117KO
	 UXvXfWKPgAQX8QA2R1RWi46nlhcSwkkMxvihCr5LjyuJmNKooRxTMHtDj80JvCywPs
	 Fv3q/S33/W7UHE5f9nIGG35UZ3fUIwVLXBTgViIy3njxz21pcdpJsHmG2F+4wWEHAA
	 mYZiAYeC4sQYw==
Date: Thu, 7 Mar 2024 18:06:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: ganboing@gmail.com, kernel@esmil.dk, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: starfive: Remove PMIC interrupt info for
 Visionfive 2 board
Message-ID: <20240307-underpaid-anyplace-9fe1241643d3@spud>
References: <TY3P286MB26116B828A34D614C09F4E8898202@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <TY3P286MB26116B828A34D614C09F4E8898202@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_100619_999197_47F002A1 
X-CRM114-Status: GOOD (  20.37  )
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
Content-Type: multipart/mixed; boundary="===============2594253166283325484=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2594253166283325484==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e3+Vcw8nCCVh8dqu"
Content-Disposition: inline


--e3+Vcw8nCCVh8dqu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 08:21:12PM +0800, Shengyu Qu wrote:
> Interrupt line number of the AXP15060 PMIC is not a necessary part of
> its device tree. And this would cause kernel to try to enable interrupt
> line 0, which is not expected. So delete this part from device tree.
>=20
> Cc: stable@vger.kernel.org
> Reported-by: Bo Gan <ganboing@gmail.com>
> Link: https://lore.kernel.org/all/c8b6e960-2459-130f-e4e4-7c9c2ebaa6d3@gm=
ail.com/
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>

Thanks for resending. Just to note that I already sent all 6.8 and 6.9
material, so since this is only something that manifests with that
"improved" version of OpenSBI I'm gonna pick this up after the merge
window.

Fixes: 2378341504de ("riscv: dts: starfive: Enable axp15060 pmic for cpufre=
q")

And hopefully I remember to re-write the commit message to mention that
the board doesn't actually connect the interrupt link to a GPIO etc, so
the original patch was invalid and a hack.

I should have rejected it and got the driver fixed at the time to allow
not having an interrupt, but clearly I didn't register that that zero
was a plic interrupt, not a GPIO.

Thanks,
Conor.

> ---
>  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 45b58b6f3df8..7783d464d529 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -238,7 +238,6 @@ &i2c5 {
>  	axp15060: pmic@36 {
>  		compatible =3D "x-powers,axp15060";
>  		reg =3D <0x36>;
> -		interrupts =3D <0>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <1>;
> =20
> --=20
> 2.39.2
>=20

--e3+Vcw8nCCVh8dqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeoCFQAKCRB4tDGHoIJi
0ps6AQD2oxPKg4y3LidQr++C4Vz9xtSEzczxjTPFfkTwQdm2fAD9GvuuDnBLY6Zh
NLzH0HrR9oVi/bBt+4DJIiPqHnKywQY=
=BFh/
-----END PGP SIGNATURE-----

--e3+Vcw8nCCVh8dqu--


--===============2594253166283325484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2594253166283325484==--

