Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320F0C369A2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 05:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zREuNCzy8VBi6F9Wi02mQcH3J8meJAtdX4klQc7T9C0=; b=VjmFUVaropd/JqE5FKpnIyuYUx
	05Xhb3fbZmjnZhmctthDANj3yAhnsXvphdLB3Flr6XvryZ/1F62k4Lxl59nlNFlrgaHyHmpuCrU7V
	eGLNoNiu6gzelmmBDupiz0jtbu7sT1SaSAIxTOIPPl7OO1C2fJTNPVMr0+CosU6lpDGS+VFOkPTan
	jN2vGJbztYmwUmO/8OEqBe7e52otGhKdN2pjaP3lF5z5yOC4GNnwXFGZDH0O3JY/P5OIiRJKZW0/G
	iBsIiC5zYeAHzNLr7NlG4vzZiVY3sRoZJ+S8FnNDsu8K9VDn7OWZcQnxwSrZTJ70Cy3xEoYlpZSRr
	hrqM5TUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Cpg-00000000kTS-3FiJ;
	Mon, 14 Apr 2025 05:58:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Cpf-00000000kTH-23xc
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 05:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B82460007;
	Mon, 14 Apr 2025 05:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F422C4CEE2;
	Mon, 14 Apr 2025 05:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744610290;
	bh=dSAe/V3pdbTWgzxSG+hkc2cBmCm2XsfRx7mmsO8TE6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPqEGceBXKFqy/A7O9EyIcKSWNTbQsWN4o2hrpcITT2XCA9S4n+1BveHX4p/dCbaI
	 eJY93y8SV3KV4+xcI6I+Anrh+zvTW86amac4rqnlAEe9J07+r4izKcCxBXlBMrwjNn
	 C+X9wIo8anw973b8fX14L/rt2FhfCkwRI/hilH+h1Qm/Ax65JeokC5pcHi3OpCKkxh
	 TcUXGt88etZEKhZWZslNIU5w+aWSrYgZd9Cfl1FfiuH5uEpbKD2gNM7DMg+JnQT4/V
	 08DrGR3b7gAn6MVEI2hsynjHFuPQCsz2NydY1HX2nPp2gqJZO+q+CanDooA7yjHca5
	 0kIGCKDLkTDbQ==
Date: Mon, 14 Apr 2025 07:58:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support
 for BPI-F3
Message-ID: <5lfnxricxm2k3fuf6nfvjd6cbkmsjkx7inoi52uy5uwwvld7sq@abn4i62tdics>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250411131423.3802611-8-guodong@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============8647114929003893410=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8647114929003893410==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i5dhgaf5vtkosusu"
Content-Disposition: inline


--i5dhgaf5vtkosusu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support
 for BPI-F3
MIME-Version: 1.0

Hello,

On Fri, Apr 11, 2025 at 09:14:21PM +0800, Guodong Xu wrote:
> +&pwm14 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm14_1_cfg>;
> +	status = "disabled";
> +};

I wonder if the pinctrl properties can better be added to the SoC's
.dtsi file. (Only applies if this is a canonical choice, i.e. there is
no other possible output configuration.)

Best regards
Uwe

--i5dhgaf5vtkosusu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf8o+wACgkQj4D7WH0S
/k54NQf/XNpxz5lJlk/TwLJlajf1AX025zknqO/ixUHqueqlXnbKK/OibTGeNoaX
krZaG9anMBPV6mgaiMCs44DAwcY/w8Tpb+EDikpzpPHY1+HYGNoMyKSM8z5Sjv8F
WJHeqiOm7woGJeixt4iLU5YhDq1eBclttJdOR6/790y0cHzrNoEJiBDzFbge4QtN
tjLEzOZjhVLTTqVXswOKi2fGa3AslElnxL+wnDQip9Utu/dXXU4ZKCeLwhx1b3pb
n3mVy5/h4R0WtG+7Xn4/HNgpPyQn6elS3aezcgupymNZaUzmlpg9SmRoxrHr0RHW
To/FljppSG7iMKjjiCnwjB20ZTuaww==
=9urF
-----END PGP SIGNATURE-----

--i5dhgaf5vtkosusu--


--===============8647114929003893410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8647114929003893410==--

