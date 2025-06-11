Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAC8C71141
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc4q0ztvWVPKO+dVT7aDrDF0rhGQP+XrdTcK15/xN9I=; b=OXVQtThnDFKS1GSGVgjVd3PHHL
	ZVoEirFKvtYJ7zhPLNmp8BtOOZR8hF1xWm+LQQp3uSkrrN3guDQaf5k1a3k9bxlvWwITR8z0rtUSe
	KGUv24usDfjqrbFdrnuyRLmP+4KU04zLQXeTx7PuAzWjwNKWVzMXpVNOiJmDbcnfTb/i1ftp16pE6
	qhqZz+qLYBPVcGWQdXoUiHWICE8W69+sZvhDYMxOGJgq52zJ4nUuo5jh4t9dDtFTmgFF422u7sAjF
	85nnQs4SnC5A3heqh1aDvXA5KmCiGq+7YxzYo1LRxKSj1lTPB6dzFh778Qpf3QXwW/gR2CjcZ6wz9
	Cx79/JsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYe-0000000B4cM-15NI;
	Wed, 11 Jun 2025 19:56:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO8R-0000000AaRN-2awt
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 16:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10CC5629C0;
	Wed, 11 Jun 2025 16:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB16C4CEE3;
	Wed, 11 Jun 2025 16:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658626;
	bh=9WqLpEYfcD+QLhrUn74iN5+OPqJiISIfCkK29TLRZ30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kX5Y9v6LeSQKvbq/icf0BM3kfSjmvsyIMQP70Aoi/9VJhJbOd4SDlZS2QKLewojyG
	 v5iqUmNVZ73E3bLWCixjjRu+NAr6koYPohiyOtQDKtZ9HsfEVrjzChstwLoOZ78oal
	 491bZ1r4gZUAu/IjUFce5XJQRr355ldkYWuToNy5AfxtvRoZsazQ2Rt0uc7MxcKMeB
	 f6xmSnkRmDMsdOWRV8M0fAp2+4z4EjW4GnmWqQl3yfJ6P5nWXaDz7zJjd5gN2opytC
	 pTOjxHjipSzP/YalsKXihfpHX55JdmcP1VpqObt5tJKVXMkQKPznQNaRtA3lF36sDR
	 TGLYad0a3xWTg==
Date: Wed, 11 Jun 2025 17:16:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 08/23] dt-bindings: clock: Add RPMI clock service
 controller bindings
Message-ID: <20250611-sprint-playable-07774a23f027@spud>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-9-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20250611062238.636753-9-apatel@ventanamicro.com>
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1719553976242036628=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1719553976242036628==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BfZ5oRqjm3LAqNK8"
Content-Disposition: inline


--BfZ5oRqjm3LAqNK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:52:23AM +0530, Anup Patel wrote:
> Add device tree bindings for the RPMI clock service group based
> controller for the supervisor software.
>=20
> The RPMI clock service group is defined by the RISC-V platform
> management interface (RPMI) specification.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

On v4 I said the tag I provided was for all binding patches.
Is there a reason, other than using b4 to grab tags, or not noticing,
for why you only added it here?

--BfZ5oRqjm3LAqNK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEmr+wAKCRB4tDGHoIJi
0kujAQDLET9FZ9Gc8aN2OlODGIIifyLalFZ9jfQUhim5Kazv1gEApYD2AXEXq+/U
2d795Qo7pM/xNs/jCWwACDW+0un1SgI=
=4cmR
-----END PGP SIGNATURE-----

--BfZ5oRqjm3LAqNK8--


--===============1719553976242036628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1719553976242036628==--

