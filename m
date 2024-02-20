Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B342C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 19:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5SrhI7VeWnRaP62pcnPvxI/Tg7MjQAnYIy7XwEVrGY=; b=RwzdYCMii2PMD/f1p2YgVpHhdC
	g4+15Koa3wFpROoCzK2UXc/tw0MM8uI6hiAB3s0P/C0jZlvRQQxRBRjx7xkxFzqEf5yh6Kdqd/LyH
	ZKulhUHx3Vyq+kpikhLdtth5SAs1fM3rCqWI3AFj0qflhAIq2reu1sNbN/PGa1IOOcfjj9fhLvXzx
	IWActqlb826nSW2UiVwOEagQ4aTzbfDtXw66yFMoP4GWLg6WaCgRte8NVHJ6UCihGdvWWHpEKjJbA
	2YBhSMWPj/Ix5zZh1EKU5TgsBJ6xn6sI1cj6AcwxJky4bBBPbCBq81zTuqZffZ4VO+QREkGOfSsLX
	4W//WP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcVVx-0000000Fu0W-2ryD;
	Tue, 20 Feb 2024 19:10:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcVVu-0000000Ftz1-3YOv
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 19:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E2D6CE1B16;
	Tue, 20 Feb 2024 19:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A23C433C7;
	Tue, 20 Feb 2024 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708456243;
	bh=EFe3zrWR0LWM1ZcyrsqjHTnnESZFaVS5VCYSop5F4Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STAoQTDOpl9BLSR1MZMUXajWDDxXaE72uD0vlU/+O/v1Jm3Y+5jz2QdLWDNQmovnI
	 Rz0JrLOjKJrUw6ux+KxWzOTkp9MrOqj2VhuUEt6TQdMvb6InRbptZWHzKrOS/KKNzk
	 bg/qJ2s1qSexFpZCJFUZno3h0TrwnU9mawV6a6IeuKtYiWsT0ntYGbdg3MiSvRVE76
	 OwMWaGbbXkiAPmlwdNngC9AF1mR5YAeHiaTJeLXBfDw4Wo005H26gTXIn7K2R1lylG
	 A0z5HqW9BUXFVKcRwXLkqe2T5MMoQDj0CIVJgNVLlGzWqdtiW/PfTs+W/1GhTUBy62
	 hXXLnqPVa8zGg==
Date: Tue, 20 Feb 2024 19:10:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alex Soo <yuklin.soo@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v2 1/6] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Message-ID: <20240220-bottling-reverence-e0ee08f48ccc@spud>
References: <20240220064246.467216-1-yuklin.soo@starfivetech.com>
 <20240220064246.467216-2-yuklin.soo@starfivetech.com>
 <1a11cee2-2ef1-4ce0-8cc1-63c6cc97863f@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1a11cee2-2ef1-4ce0-8cc1-63c6cc97863f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_111047_085002_FB841C33 
X-CRM114-Status: GOOD (  12.81  )
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
Content-Type: multipart/mixed; boundary="===============0921865147125098839=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0921865147125098839==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tADB2NrbVw9jbyhp"
Content-Disposition: inline


--tADB2NrbVw9jbyhp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 09:11:43AM +0100, Krzysztof Kozlowski wrote:
> On 20/02/2024 07:42, Alex Soo wrote:
> > Add documentation and header file for JH8100 pinctrl driver.
> >=20
> > Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> > ---
>=20
>=20
> RFC? Why isn't this patch ready for review?

The TL;DR is that Emil and I didn't want to apply the dts patches to
support a platform that hadn't actually been taped out yet.=20
For an SoC in that state, at least the bindings for, clock and pinctrl
could be subject to changes before tapeou. I think putting RFC on those
patches is a good idea, but of course the rationale should be mentioned.

Cheers,
Conor.

--tADB2NrbVw9jbyhp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdT5LQAKCRB4tDGHoIJi
0q4/AP9aepRkgGMwUZFmvYfa5PLBEmZ95b0tJEUr42AOOQptlQEAvcfTGWd32hy5
EqoPPciZYk30PuQQ68mEvIHOaYAqnwE=
=gvQL
-----END PGP SIGNATURE-----

--tADB2NrbVw9jbyhp--


--===============0921865147125098839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0921865147125098839==--

