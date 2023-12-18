Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FEBC46CCD
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2a0pBGd2RABGSl1qObrsfGcbexiwwX13HtGpSdfPMg=; b=zAA2uWZi463Ac3BNcpYo8CWTpF
	3pOl3PdzcxQW57v62mPOmY+L8s58zbBM2FyX3Gy2U6JbQPzKIrg/io/+GQBzZsaIf01UfVSu/YObU
	Uv6MFQxMB1cZe1qf+fq2c9JcSMzCocCPFF7YxiHr+5wyK6lu8lWt1xsnAH2Bmkhu8fffy/PcZsO6L
	FoflsbIpYT63H5k+WUBs3w2+/MBX/xqA/ZNIgbzmAnlzzCHDUZ9RTgxc+k9DFf3H2eZ3r77IFcOI8
	GCOYkItE1vXWYysjVKsGYap1ZZP/d3ZOMOnQkQ9GUjyWAJzO7i+3MHSLKpgDcFQtuwLek5nJ9A6vL
	aBKWrSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFF1w-00B6ws-21;
	Mon, 18 Dec 2023 14:55:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFF1t-00B6w0-1V;
	Mon, 18 Dec 2023 14:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A83EF61032;
	Mon, 18 Dec 2023 14:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE83C433C7;
	Mon, 18 Dec 2023 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702911336;
	bh=UURxzOfkRIDHP70cvgvabsbuX8qYqf3ZrFU1zvZQ5io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYV+TcCaadw6lq0zV3I5VHGhBYyeOsb4W6fJsF0FwmPXqaiQzo8ETfsFVoKdG4H4r
	 4FxLC1NHykn9egLbaV01V2uQZcAvzM0WIYhxwDQ5arilC1ErwjP/WF2vq0ZRYWaehl
	 LkIOcVKNF1VQdHzGVBK/2QWWZslD4MZm5EkzVl7DxdOoU0wKrvU+4DYHBjtfMIhtzN
	 gppALRstSpSl8dzJr3HIgkD108tzNVXYOPehYAbaSDYSjp2WFgRiYVcRWIBCW5zn1S
	 eP4+ZQrGmDErsaMBDg6XsT/00sDb7l9+5VoMkJapgS9Than61l+X3VkW096rY1PFRZ
	 eYCZ3s4lFYlbA==
Date: Mon, 18 Dec 2023 14:55:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/5] cpufreq: sun50i: Add D1 support
Message-ID: <20231218-blabber-slapstick-ab7ae45af019@spud>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218110543.64044-4-fusibrandon13@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231218110543.64044-4-fusibrandon13@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_065537_547215_57270281 
X-CRM114-Status: GOOD (  16.65  )
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
Content-Type: multipart/mixed; boundary="===============3804695051027251571=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3804695051027251571==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Y/+A79iTqO1pQeH"
Content-Disposition: inline


--4Y/+A79iTqO1pQeH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 12:05:41PM +0100, Brandon Cheo Fusi wrote:
> Add support for D1 based devices to the Allwinner H6 cpufreq
> driver
>=20
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun=
50i-cpufreq-nvmem.c
> index 32a9c88f8..ccf83780f 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver =
=3D {
> =20
>  static const struct of_device_id sun50i_cpufreq_match_list[] =3D {
>  	{ .compatible =3D "allwinner,sun50i-h6" },
> +	{ .compatible =3D "allwinner,sun20i-d1" },

I thought the feedback in v2 was to drop this change, since the
devicetree has the sun50i-h6 as a fallback compatible?

--4Y/+A79iTqO1pQeH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYBdYgAKCRB4tDGHoIJi
0tB6AP91iVWjmaYX10I36D86nBIbqoU4U/4Umgf27YchmH4OsQD/ZV/idPgamnZq
+RnYLmusNu1HEX5o2wVaNtYGhLIC3gs=
=W0H8
-----END PGP SIGNATURE-----

--4Y/+A79iTqO1pQeH--


--===============3804695051027251571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3804695051027251571==--

