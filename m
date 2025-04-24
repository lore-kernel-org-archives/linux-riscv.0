Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F724C369D8
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHbgDtbZj38PB+nmphea5PXEbEql61QwBWjqd30iTlY=; b=UeDeExtIf/KLL9UpFJHvpvKMgf
	CT3NdPt4wygrKulJtInBK4rbIFG9oXV9Y+LPXa2Af/VPdzRVApeQJFrskyjLyl7ROa9QGZMPGrd5S
	YpRiTQ39zKHCoEf0FBUDzeyo+UEPDJwVv6XuyYD9EqCjZ+jOG67D6r6FkZ1WfMuInhI9rV43+oa01
	iBrFFKj+ntNYgD+BPAwwmS1ABadwyJrNZ/I4EsXDRIe953SwJkdM4K27za3N3iq7D4fB2B1vgSk6P
	TZkMKqYVqWxZ/RIUoMbKfR9XALuw3sBzRV5P5VLOmdoOhm3EPMLmwduswtXvsH7uFBfShZckUS84F
	vOMw1SkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7smj-0000000DTxu-0Tkm;
	Thu, 24 Apr 2025 09:22:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rnI-0000000DJ6q-00gN
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 08:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CDBB68454;
	Thu, 24 Apr 2025 08:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43241C4CEEA;
	Thu, 24 Apr 2025 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745482730;
	bh=luBO6reS1AIHdLD0ocQc2V2sYxCZNmU96oc6vvsTJUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTBJb7/sOtgibfbZQZRPmB3NDzGuw8WXFuKDiYfD9jo9Tfl1ZSBHPmhHPrqPDbTsi
	 PqHif8L8cHGYTe8i0k8oHy+9uqiBj85SewJiQ4iGUtwfYZjyZd1tNMsd4bN3MDeI7e
	 /SLvoq1G4PZmF38YakZaiBvQ9p1SJePpeM0w30Kqbr+NCJoYj+0/E9wlUbYt37+qNU
	 A3Q3oyisKdK3emcymdrL5r4xLHUSYwn0bOWZDKBHJi1kJVfkos9N8MlFNPNRGtv+xK
	 HsjFxwezNty60QqB1PXzwj43UxVrbtToJYEG5xxN47QII5bt2SyzZx44/6CeXdgBQM
	 3ZSjc2+P4yDXA==
Date: Thu, 24 Apr 2025 10:18:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
Message-ID: <kftfye2zn2ogyvuv7diuyrv5qkp43csbpkcqfcms2xp5lsuubm@z2kocdzkb7qk>
References: <20250420070251.378950-1-guodong@riscstar.com>
 <20250420070251.378950-4-guodong@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250420070251.378950-4-guodong@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============1285335817438281022=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1285335817438281022==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rfmkfp7kn4uz32vk"
Content-Disposition: inline


--rfmkfp7kn4uz32vk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
MIME-Version: 1.0

Hello,

On Sun, Apr 20, 2025 at 03:02:48PM +0800, Guodong Xu wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c0cc4b99c935..e7dba623e877 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -556,5 +556,185 @@ sec_uart1: serial@f0612000 {
>  			reg-io-width = <4>;
>  			status = "reserved"; /* for TEE usage */
>  		};
> +
> +		pwm0: pwm@d401a000 {
> +			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
> +			reg = <0x0 0xd401a000 0x0 0x10>;
> +			#pwm-cells = <1>;

I want to make all pwms use #pwm-cells = <3> in the long run. Can you
please use that for the new binding? (Of course this needs adaption in
the binding doc, the code should already be prepared for that.)

> +			clocks = <&syscon_apbc CLK_PWM0>;
> +			resets = <&syscon_apbc RESET_PWM0>;
> +			status = "disabled";
> +		};

The error that the build bot reports happens (I think) because CLK_PWM0
isn't known.

Best regards
Uwe

--rfmkfp7kn4uz32vk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgJ8+QACgkQj4D7WH0S
/k6SQQf9F+et5yXHz1s66Oocx6PAunCNSR5NsrxqTGCCJsG7A5Xj5ihj4O5WEUCh
g1KnQp9haUQ+FUcC6sjHIcs3Mh2V31LduY6wsvyw9etzsVoFtQx6NwojEH+fLNOC
15oZnNgyhsYlrRS7uY0DHuhPikTq2DezMV5I+3LwvFkcwzTcn6d7D0WOR3PP35OV
gVJM6w9bTiftCEH7lmCm//w26e2WI1csVZINIcYDe7PY5rnEkuvOcXeqyy+5YNnO
yjjmRrqptnX7/M5Yk3oekuPEJ/hTPAhIjKlsC8E7QIy5iTWmj6IFzC2Zy5mDAgrn
ii3bv4Z4tHAYiVyefKztz66LwfcOWg==
=PFuz
-----END PGP SIGNATURE-----

--rfmkfp7kn4uz32vk--


--===============1285335817438281022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1285335817438281022==--

