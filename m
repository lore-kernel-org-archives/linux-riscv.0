Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F25CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 15:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kLMlK05lyZix9cdYf+4K7VEfSE+YwuHpSBL+udyQr4=; b=Slc+mHbbCAp/CoNZYsiYAU4rXa
	xU3N8w0g8jddq7JpA7198hjqkDLkhmQ4iu0kHi0WYCscn7Lmh3UHY1OX+GxYqCIZlRNpgKjr7d7ix
	eYe2TuT/2YScU22utOntW8poZMm6oALFOUWNfc9LJhL8H/S/MpQcjX9ZkPoZc3zUOSj5W0F7Hc4bO
	EkyVhRjXOUbUU/iDX88N0B1MqykoNTQKjYiSDO+6Bt2TcrQtTd6WzO5I+ir0FiqiH+CcQ45dQD6Rb
	8UG3mWPVccQV35+aqOHDDzz4ajmCeKc0PLEOvkvLT7ifPaThRfIPLsfOhTfb4WuC1wQemSupGt7qH
	2CuKD2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QKd-00000005HsE-1T1G;
	Thu, 16 Oct 2025 15:55:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QKa-00000005Hqi-3URO
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 15:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49F43433CB;
	Thu, 16 Oct 2025 15:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591F9C4CEF1;
	Thu, 16 Oct 2025 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760630156;
	bh=5KcUDlbTdbW74JQlF/gkUuoB3c5EjVuwmuWrmgQ0ytU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUZIYMRy0SdlGPD8eIDi6ANT8yz3yB4ImLoUfBNc8S/JhPg8AVgq7LEYDvFNnvcar
	 2n3pFYlN82FiFsA1K7vZrxfgkqQkpiM8ngwAeSd0iWq1+hthKbQJ7KNYjg00ApGAev
	 hjV6WehY7BU2ZSfbfjL2050V+Rm+L7YRZCcXPoTJm5evWzNVcljqNS0dy9+tvcXkcT
	 ayf7ga3kJpExwa0BOPzc2JWIHo/E3bZcu27OJkuFSq8XEYHJ3Ht055ylJ5Zkx3v8ri
	 D/Woo0Seug91QwtLKCjqqXXIWS0myLVxkuzOYegVA6xTwzElnSGg6ccn7OThArLjdb
	 j0E9zBomPIO+w==
Date: Thu, 16 Oct 2025 16:55:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/7] dt-bindings: riscv: Add StarFive JH7110S SoC and
 VisionFive 2 Lite board
Message-ID: <20251016-scoundrel-engraved-8f0a8272db03@spud>
References: <20251016080054.12484-1-hal.feng@starfivetech.com>
 <20251016080054.12484-4-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20251016080054.12484-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085557_205360_5008EABF 
X-CRM114-Status: GOOD (  17.70  )
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
Content-Type: multipart/mixed; boundary="===============6252000772972258300=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6252000772972258300==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yh82z3H7Pyc/9lAn"
Content-Disposition: inline


--yh82z3H7Pyc/9lAn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 04:00:50PM +0800, Hal Feng wrote:
> Add device tree bindings for the StarFive JH7110S SoC
> and the VisionFive 2 Lite board equipped with it.
>=20
> JH7110S SoC is an industrial SoC which can run at -40~85 degrees centigra=
de
> and up to 1.25GHz. Its CPU cores and peripherals are the same as
> those of the JH7110 SoC.
>=20
> VisionFive 2 Lite boards have SD card version (default) and eMMC version,
> which are called "VisionFive 2 Lite" and "VisionFive 2 Lite eMMC"
> respectively.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Since this is content for my tree,
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Docu=
mentation/devicetree/bindings/riscv/starfive.yaml
> index 04510341a71e..797d9956b949 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -35,6 +35,12 @@ properties:
>                - starfive,visionfive-2-v1.3b
>            - const: starfive,jh7110
> =20
> +      - items:
> +          - enum:
> +              - starfive,visionfive-2-lite
> +              - starfive,visionfive-2-lite-emmc
> +          - const: starfive,jh7110s
> +
>  additionalProperties: true
> =20
>  ...
> --=20
> 2.43.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--yh82z3H7Pyc/9lAn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEVhwAKCRB4tDGHoIJi
0oexAQCif99aQHh/UjKJM4nxMrfp4HQJgyK5Hmr+jdvlb8QgdwEAyL1ewW3FsBVG
/RaB4LLH1Z+qUeksf39lUtWVd7oooAw=
=LQeZ
-----END PGP SIGNATURE-----

--yh82z3H7Pyc/9lAn--


--===============6252000772972258300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6252000772972258300==--

