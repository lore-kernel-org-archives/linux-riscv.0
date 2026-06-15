Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A391CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwf/Rg+tVeDvA/YtchOI36AIgOvS0vaX2opHwC/BcQw=; b=4H8QvC6Ov6VXfYSP0gbS2NfVwJ
	CHuP0Um1IFFG+ZRy1ZvdFbg1mgWx178a7bWsSlBVW3qKiX1+Sz9Nb+U38FPH6s+IO9no4O+B/sJIg
	OAktTr8niCfWVnL7PWo4SRGFBtWH2BJtYkSCdFngWRg+fe7GCgjxu0LkUIAtfoLwyeKIWvf0MY1lS
	TsmAUgdIiHDv81rWq4ZBHhWCvBBzeK53k4jdBjq8pozB+hvlPXdwr/DV/MYl26sFaq1SrJpHN6NM5
	8XHZ23YuxibFZxq0bj6iMsGyMPSI10NrO3M8cxXMLI5eZPmENvw57qRb2n+nTaE7OCz0XCeae93vh
	qJGTWyvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAD9-0000000EZtp-1hzD;
	Mon, 15 Jun 2026 16:30:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAD7-0000000EZti-30Y3
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 16:30:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC175601E4;
	Mon, 15 Jun 2026 16:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F9F1F000E9;
	Mon, 15 Jun 2026 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541052;
	bh=hZSOvkR/9xRjUoYEm9Vszi7Sj0kgXvwwgT2+fMbNQyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ROKTnVLFeXsBapapjUro9pjic2Tj2kkU18SpEPVaWAjSJGAsOwXLkzC1OFuW0v7sy
	 3oBuvGfvDn6opJ69YnslYE2EcLpfLuAVUC5M0+SzwoLdU6dRvbA7VpZU47uzZKfmgC
	 PtG86yNzfAbDBj4mEtJhZeds1nOYKp7CgMwR7UfMh8iL9HE6zQYOR92jGZXwsPuKKM
	 qjoofxlltcctj0eiGiBb+poMUvoQLNmpfTif0ck6HzICdqWo2vGvUUyo8tczw6axbV
	 FXFnKxJiPeleRd21dDAt2becl6VHILtzmfgb4lKTK2W14n+xdsgQ0nM64QME1yYMYM
	 oqs2kZ39zhIAA==
Date: Mon, 15 Jun 2026 17:30:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH 2/7] riscv: dts: eswin: add clock generator for EIC7700
 SoC
Message-ID: <20260615-overshot-pellet-5e527a14133e@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-3-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20260615122016.1110206-3-pinkesh.vaghela@einfochips.com>
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
Content-Type: multipart/mixed; boundary="===============2972949730385964286=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2972949730385964286==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nSYe+Q7ynD6q88tQ"
Content-Disposition: inline


--nSYe+Q7ynD6q88tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:50:11PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> Add clock generator node for EIC7700 SoC.
> HiFive Premier P550 boards have 24MHz crystal oscillator to provide
> the input clock.
>=20
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../boot/dts/eswin/eic7700-hifive-premier-p550.dts  |  5 +++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi              | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 131ed1fc6b2e..1fb92f0e7c55 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -20,6 +20,11 @@ chosen {
>  	};
>  };
> =20
> +&xtal {
> +	clock-frequency =3D <24000000>;
> +	clock-output-names =3D "xtal24m";
> +};
> +
>  &uart0 {
>  	status =3D "okay";
>  };
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index 430a210f01e6..a7ebb1115958 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -4,6 +4,7 @@
>   */
> =20
>  /dts-v1/;
> +#include <dt-bindings/clock/eswin,eic7700-clock.h>
>  #include <dt-bindings/reset/eswin,eic7700-reset.h>
> =20
>  / {
> @@ -203,6 +204,11 @@ pmu {
>  				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
>  	};
> =20
> +	xtal: oscillator {

Sashiko feedback here on making this clk-<hz> or clk-<something> should
be implemented.

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +	};
> +
>  	soc {
>  		compatible =3D "simple-bus";
>  		ranges;
> @@ -343,6 +349,13 @@ gpioD: gpio-port@3 {
>  			};
>  		};
> =20
> +		clk: clock-controller@51828000 {
> +			compatible =3D "eswin,eic7700-clock";
> +			reg =3D <0x0 0x51828000 0x0 0x300>;
> +			clocks =3D <&xtal>;
> +			#clock-cells =3D <1>;
> +		};
> +
>  		reset: reset-controller@51828300 {
>  			compatible =3D "eswin,eic7700-reset";
>  			reg =3D <0x0 0x51828300 0x0 0x200>;
> --=20
> 2.34.1
>=20

--nSYe+Q7ynD6q88tQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAotwAKCRB4tDGHoIJi
0utAAP9a+aQfGKwmJYttBtoX6OX0l+ih2J+zVfH+wCYttEb/ZgEAqCT+qNqzadiA
dnWyn1pwqRHtuSrnFR5Da/eKRcXOggE=
=TsHk
-----END PGP SIGNATURE-----

--nSYe+Q7ynD6q88tQ--


--===============2972949730385964286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2972949730385964286==--

