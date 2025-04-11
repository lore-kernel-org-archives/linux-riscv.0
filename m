Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8503C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBLXPjZRAXkoG+3lWX7TWy2HLmXxZKfsujeYH/ggPo8=; b=Ox2LSt82MPv1ZnNEHA711hk/Jb
	GbB3quYTgYDMKYsRt6cU7zF87gZLvvOCsStUtbAyqK75ZDYsn/4y1DWTDdPnTY7xbHGzRT+vpiWwo
	ZQuWMFJHRa3dyqn4hB/v/U5dNLvwrSw/csmTm42T7m556lqOHjrWQw39RiWJEsFOjSmaaCRwZgANM
	65V5oFG0UoaYBwmS0gNUBWzUUcsQOEX9tQ4eBtFIkBqWC+b6PRc++KLitjKH/bxoAj7QYfVZ69xeV
	u02DNgFxf+Znl6N4vLw/06r7hfVXJAzIEb9kN0DY+KnMdVivDl1sInE5VJI959gqi8VsAZhExQoyG
	LkL2oaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HTD-0000000EOkF-32KP;
	Fri, 11 Apr 2025 16:43:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HTB-0000000EOjk-0mQN
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 16:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53341A4AC1B;
	Fri, 11 Apr 2025 16:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F30C4CEE2;
	Fri, 11 Apr 2025 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744389787;
	bh=tR3UHpCXzeA9///t/Dn2xzAjjM6Zw64YyTco64txTrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDjrLT0gTM9ncpI1oDN0t7XKA+vnlO4rKWcXymKi7KptWCUHj7CnlK+tvKnHsymDt
	 QSK0KqJdw4SN5qSuSk3OlQ4QaDabTwjf7G9jVmUdsu378eMRc7mKH0N8JhxRjgjUNU
	 uBFTUn0rvGd1efZAwApI8XqmH3zj0C4Do/sD1Vbh5QWFZhbs1CPeK6K97G8zq3YRac
	 GMm2mQP8Fhei5thHit7fEXcBf/8ulfaY4aX3uwM/tr5rLpg+TO4IwCZYm7hqN6VhdC
	 a6ju+/c6cHfYF4ewuw5JF+CSRFa22mrr/RCgC4uEERQfulgCI286FXb0e8/3ACZ86Q
	 8VtNYJUp2zUlg==
Date: Fri, 11 Apr 2025 17:43:00 +0100
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
Subject: Re: [PATCH 3/9] dt-bindings: pwm: marvell,pxa: add support to
 spacemit K1
Message-ID: <20250411-spoiler-dispatch-8f709700a996@spud>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-4-guodong@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250411131423.3802611-4-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_094309_287148_6ACB471D 
X-CRM114-Status: GOOD (  14.90  )
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
Content-Type: multipart/mixed; boundary="===============4866019165559072717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4866019165559072717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LUVx89P2ckqnLgNF"
Content-Disposition: inline


--LUVx89P2ckqnLgNF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 09:14:17PM +0800, Guodong Xu wrote:
> Add "spacemit,k1-pwm" as a compatible string to support the PWM
> controller on the SpacemiT K1 platform.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b=
/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> index 9640d4b627c2..1e3cabf6a89a 100644
> --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> @@ -19,6 +19,7 @@ properties:
>        - marvell,pxa270-pwm
>        - marvell,pxa168-pwm
>        - marvell,pxa910-pwm
> +      - spacemit,k1-pwm

The driver doesn't appear to handle this differently to existing
compatibles, why is a fallback not used?

> =20
>    reg:
>      # Length should be 0x10
> --=20
> 2.43.0
>=20

--LUVx89P2ckqnLgNF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/lGlAAKCRB4tDGHoIJi
0rpnAP9M2iA7vkmJyuuQgjwKcFc40rTRbCJ3nRdKJhlWdCEsgAD/TlkE0t6j/G2z
QjLG3R/QWpuj0Zj2vbNRzmF1FzCpQA0=
=ulBE
-----END PGP SIGNATURE-----

--LUVx89P2ckqnLgNF--


--===============4866019165559072717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4866019165559072717==--

