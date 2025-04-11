Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D174EC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHmZmyEFUiqTjTcJbcFSnYe51tok+MndAwpiF7GVp2c=; b=Jq7L726rDzPbVG5Sdb5g/8WRc2
	5rvGKapOEfJh8rertBWxiOtqqWzXVMZuy2TSPO77cQfFp7/hVJUagXvp1Zhbx3TsjFFE8KELLBISg
	ZMPYtndJ5fRInHT0amYa4sxeAoy4j/hpbg5tBMRX5Ab0AXd+TzhexTKne2yaM3AhM+AEZAdbG7419
	WuWK+ANueJ7jNs8lOgifAlE58v1PsZ4KQuyanlq9GvtLorrbv0WxSKF9oqgf+sU16tWQmi7D/hzWW
	VVO7dh8T+KGLfKDEClR9pozVMrLmYUlEVHDlPIerrrz7+kKVdnATTn5Q8fJR+M8AGG5RoRBFzGsRS
	5Q+2zP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HUS-0000000EOyU-1Sf5;
	Fri, 11 Apr 2025 16:44:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HUQ-0000000EOxk-0zJi
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 16:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A91A68470;
	Fri, 11 Apr 2025 16:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E6CC4CEE2;
	Fri, 11 Apr 2025 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744389865;
	bh=vdiIksur5hafltgBRqqsPovLfkEhiO450uZl4pz97yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tffkgj6Nb1m5i9EfqYQQ4obKfEilG0rIFW8F2x+NXn1o2EhQul4SIfYCGfoiaeDLU
	 kyqs9TiibfjQczE7BQCcVqQTDhfjDYS9yunXlrGX/HIIBvYlwu/Ggu0jQQifXntRp6
	 1ArPTDq8AO5eKV99YxS0R/emaMB0+dyeNBuOJO/lP7FRAYEBz3We5pidhZPeGMJn0U
	 0MSHEdi5X2A1X3bH6mHsgsoK+3F1CNSGug7w8RBJRiAwQfcsIpAe2NonCCMasUvlim
	 hagNPpjdcWPVCOxJPCh39JroOI5WYwSjctuAqGQm8EvKGVLSNFutMADH0qsJU9G613
	 ZdQ5EM8CGvVzA==
Date: Fri, 11 Apr 2025 17:44:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org,
	p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com,
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de,
	hal.feng@starfivetech.com, unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr, elder@riscstar.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
Message-ID: <20250411-confider-spinster-35f23040d188@spud>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250411131423.3802611-2-guodong@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============1946071870409939066=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1946071870409939066==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JUAwALBWrI3B2Yuo"
Content-Disposition: inline


--JUAwALBWrI3B2Yuo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 09:14:15PM +0800, Guodong Xu wrote:
> Add an optional resets property for the Marvell PWM PXA binding.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b=
/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> index 9ee1946dc2e1..9640d4b627c2 100644
> --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> @@ -31,6 +31,9 @@ properties:
>    clocks:
>      maxItems: 1
> =20
> +  resets:
> +    maxItems: 1

Do any of the currently supported devices use a reset? If not, then add
this in tandem with the new compatible and only allow it there please.

> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.43.0
>=20

--JUAwALBWrI3B2Yuo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/lG4gAKCRB4tDGHoIJi
0tuJAQDXEtdWF2DQG6RWVHGrAVhfKiqaNW9k5WmrGO0XaKsN6QEAkVieGe1PP/zi
8ad/GJqyFMjAv/MSo0ty84ZjbpPoiwE=
=2MBi
-----END PGP SIGNATURE-----

--JUAwALBWrI3B2Yuo--


--===============1946071870409939066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1946071870409939066==--

