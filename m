Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA5AC5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvmbpYz3dCNmmZsZpmHysFQJ4/eAe40WxMcZdFfMBJQ=; b=4jFX8Ax/vUmklX9t3d8Fnm7Q4Z
	A4tF4znM3f2J7hfUqjGvfT0elGVrvB/bT+7JAjAKS89SEcbBadAzjCtaIaJVSlHkTos5asv3H1jsW
	OCAjUEQERtnfJ32QLLoXBJ19YSzUnZfIyqCvEUI0+JyKxxMA8DwVmk4EdE9MKh7xm1/hAUQYM8tbS
	JL3L44qDxTwoeqjHiS1tfWI4zSFs4JlLWoMkRhqlXkMpay8v7JozCGzSvWLLRw0IRQwg81rcqbZFy
	BzFUn/e0YkkE/KnHJvrgGHMpW+UTJO9OtW5MKivGWkbW1eDbYqqWtsqeFFMAiSYVBrJURDhA2WzCQ
	hy130OVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJb6K-00000009GAS-2Q85;
	Mon, 26 May 2025 16:55:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJb6H-00000009G9z-3g8Y
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 16:54:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22BF9449A9;
	Mon, 26 May 2025 16:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E162C4CEE7;
	Mon, 26 May 2025 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748278494;
	bh=lBm90pZvZ+UoOxLMSy6TVhe9roiPZ8LaELnS6zZuHww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnWclTp+ovOobfxziqbCaFoppus1w1swSUgBUAGMwnV6zUv+jhpbZze9RZH129Y7m
	 +rBgYCFh056fteBEXupwrfYHPmVKIwTAYQnOwK5y6hnZv0ZRSTeIzSWS16YZZN1nRD
	 5iPfE4dnVudevPF2feoFUNvFzjtA0G40OVTAqvHmlF+byXTvkTDcvh0CT866a5alox
	 spVzf+e4rJ+X2YbRj5V3YgW4yIa5YVvjaATkcfUlK4xetO+MfgLuLsR2K5PMxoxdg7
	 ESZsUBa0qkD5X2Kz5kVVZB7pb922zVoOaNxm3xY9O6HaSqC+SS3xazMbqaPYlIopme
	 ixzInJUpR3JgQ==
Date: Mon, 26 May 2025 18:54:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr, heikki.krogerus@linux.intel.com, 
	elder@riscstar.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
Message-ID: <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-5-guodong@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250429085048.1310409-5-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_095457_937929_E31C4624 
X-CRM114-Status: GOOD (  10.66  )
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
Content-Type: multipart/mixed; boundary="===============7114131921197358430=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7114131921197358430==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="og4jf76cno5lbodv"
Content-Disposition: inline


--og4jf76cno5lbodv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
MIME-Version: 1.0

On Tue, Apr 29, 2025 at 04:50:46PM +0800, Guodong Xu wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index 283663647a86..195eb8874f3c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -20,4 +20,11 @@ uart0-2-pins {
>  			drive-strength = <32>;
>  		};
>  	};
> +	pwm14_1_cfg: pwm14-1-cfg {
> +		pwm14-1-pins {
> +			pinmux = <K1_PADCONF(44, 4)>;
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};

There is a newline expected before the pwm14-1-cfg node, isn't there?

Best regards
Uwe

--og4jf76cno5lbodv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg0nNgACgkQj4D7WH0S
/k4F9Af/Zpy8tXv2q3vdClmG4OFmDlQUd6y7BYw45X1lE4OtNCQADFVZsyy6WU6l
Xtwwi1fftGGiPz+7BWuZWzSlRKLDryGktzeQI/GYoO/4mRDESCNCG+qI8hGjmVAC
kX2TmSxV6PQUSszOdWBGUYI3YiK3Wy4T4LcMM0JuAIhehj1zwBNL5YFvmlmgf9r/
zq7fUmV0h0+TiLERutwSOfZUUmEp6Z3LPS2pDKSoGbF0JYE+mOHJtYaa70jH/QHX
C3RaQgQZ+ENrMf5DGs33pB/QulhfAm/aUUIXLycp+mm8rYnVu1t7GiTRLSfwmp+U
35w4lolFUSrs1hzShLHpE4spKswutQ==
=Bsm/
-----END PGP SIGNATURE-----

--og4jf76cno5lbodv--


--===============7114131921197358430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7114131921197358430==--

