Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC27C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtEUwWi+GX2aG+Hu1C7Ru7LcgNob/cuwmcqqajcIlfk=; b=GpSCqWA7SYlh/MRo/x7in/TR8c
	9BplVHxhmMzCsNlYxedhD6AlmTfHuKJ1o9gBVUMytLc6tZtbrLsA4EmMyPLfV7mwX6aSu9Ntvd3Yl
	DM7zYDIqGoeYRp71a8Sz6PvZXNAMZzAEgeoUC2OYBTlGlH9pgrQGhBLEJZMlZiYIll92kbEZN2bCr
	cyoeG+4edXIUI9EnADvYOzoXjnYmwMUfQdSzUtuq0zn+6jQHareYkNAL/fXGmz/BD0bbwjOpnmoWx
	Mz8tDCaXHEvno4o8/mOodo7ChDDFw5Mk8lfS+eCIXge9lAK0ONFwJ2HcYURnFys2iZBRVG4cLq6xo
	d2hQ6p9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvlpp-00GhqC-0A;
	Sun, 07 May 2023 21:22:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvlpm-00Ghpq-37
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 21:22:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81F7461D0D;
	Sun,  7 May 2023 21:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD96C433D2;
	Sun,  7 May 2023 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683494541;
	bh=n+A3dtb3nK000xa3YMeU3TXFFoE4yQ+c+JORr+T4xv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RI7cpln+tUfrANGxsALxEIQrh6US0fDULpVuTvw5L+xfcN4oLwDRckm0C5C2jtyib
	 ms9guuJ5LWLMov6ih1V6f6HtrcF3rF3EBedJ0BgjMhIKGeYf7V6/HnyYRIiETTwV9w
	 oNIdwsyThITdsqsgKYudSlVuFBT1lE+gf/nDjduT0Ylb3ZBFjD9aH0n0qbDJ5RIsFa
	 Sg05k9/cXW+ew+A/jwvOBjkZrdsjMl8LevLyOEUW5T53WHyeIjvSuHzQGyvztsPWoN
	 NnHEmIJ+nb9qe1voJU9+liuaye1MOzAoikt8LFsf++q1ge49DUKHUeu9OA7CZ7OV+G
	 lzAzI//0XzlNw==
Date: Sun, 7 May 2023 22:22:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 2/5] riscv: Add the T-HEAD SoC family Kconfig option
Message-ID: <20230507-sleeve-tacky-21e817e31fb2@spud>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230507182304.2934-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_142223_054711_EEC1A7D8 
X-CRM114-Status: GOOD (  18.61  )
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
Content-Type: multipart/mixed; boundary="===============2717271927342576717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2717271927342576717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jrkrBkm/YeYz2rXP"
Content-Disposition: inline


--jrkrBkm/YeYz2rXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 02:23:01AM +0800, Jisheng Zhang wrote:
> The first SoC in the T-HEAD series is light(a.k.a th1520), containing
> quad T-HEAD C910 cores.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig.socs | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1cf69f958f10..ce10a38dff37 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -41,6 +41,12 @@ config ARCH_SUNXI
>  	  This enables support for Allwinner sun20i platform hardware,
>  	  including boards based on the D1 and D1s SoCs.
> =20
> +config ARCH_THEAD

Could you please add a defconfig patch, adding this option, so that we
build support for this platform by default?

Thanks,
Conor.

> +	bool "T-HEAD RISC-V SoCs"
> +	select ERRATA_THEAD
> +	help
> +	  This enables support for the RISC-V based T-HEAD SoCs.
> +
>  config ARCH_VIRT
>  	def_bool SOC_VIRT
> =20
> --=20
> 2.40.0
>=20

--jrkrBkm/YeYz2rXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFgWiAAKCRB4tDGHoIJi
0iYyAP4njvOYRRa08I4r7u+EAHBTYOvxzZg42jjwm4oahDttLwD9GbTZVsJ8sb5H
fxAAXzP8UwaotzseIur9awULm87JPQE=
=oUoi
-----END PGP SIGNATURE-----

--jrkrBkm/YeYz2rXP--


--===============2717271927342576717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2717271927342576717==--

