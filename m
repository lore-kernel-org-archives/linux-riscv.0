Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D40EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIzEN1CONQkPfiOQZMn7cwibhDi6TvL95X1ozvVbfGo=; b=O1ykitBNaCbe34TIrryrC3V4Bm
	pRr72G7NKqI9CgIYryOwUt1epoO7UMYxVnK3MLUg4CjEIVeotlgGqPE9M9K9xMSq+/Pk7f241/4Pf
	o/JsOAJwgwh49Xoo6tljjGlJ4nCmLqcELtl+efaUaG0LZjHH7C98DeTmWN/tUeiF0IBGXuNOn3r9x
	ULu7ujklX56uT56E27EM9WQ7yPHV9+c5/MaI4L0Dg8mszCAoqM9XWOFBwMAxKXEqKd59C8lmKFlI2
	Fvp+rPACfdX9t5WHzLmUH3oXOvzRgU3kBWTYupGHpxROre29e1HyBpAqOJ7o/s41eCROU6cY3jbt3
	iHzRsFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0Mp-005DGR-0R;
	Mon, 24 Jul 2023 18:33:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0Mm-005DFa-1w
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 18:33:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 010A1613CA;
	Mon, 24 Jul 2023 18:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897FBC433C7;
	Mon, 24 Jul 2023 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690223587;
	bh=JISt563IUUY+dlMJ80xr16vHU+lFGUpNq78vQuVOfag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjq10d8+XoabGQtTtG2oCA4j2WwfKgAZFghShXdx4w9PQXhQ1UEgHxFkAHBwQ6GL/
	 RaKQ6pm3lG2p5S5vSJutTfnW9ArbRjFG2A8C7dtz6CeGh54TwOen7gOmrqnYwDaQfq
	 vM24g4+lol71HScoo7V+DrLAurkC7U+CCgrsMru77EAupulHnLwOseCsLkI2uvTTp6
	 2xExXTc4KaDx9kSQelpJpGTJeI24sL+E+7OJy59WTrSmgvnGjjdYgg2uyDsv/Q5adW
	 Pha6Qj1rSiz2w5zNM4h7nD6mUibTLliiAFX61LWc2rZV1hJuYmZLrEYhxjYkjmI4SY
	 jWZFmnajCycDQ==
Date: Mon, 24 Jul 2023 19:33:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: change TH1520 files to dual license
Message-ID: <20230724-launch-whole-39fb304bd72a@spud>
References: <20230724182129.843687-1-dfustini@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20230724182129.843687-1-dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_113308_681835_8D740BF5 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: multipart/mixed; boundary="===============3777134491301129000=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3777134491301129000==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cyzpousSpwWFGzKR"
Content-Disposition: inline


--cyzpousSpwWFGzKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 11:21:29AM -0700, Drew Fustini wrote:
> Modify the SPDX-License-Identifier for dual license of GPL-2.0 OR MIT.
>=20
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi | 2 +-
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts      | 2 +-
>  arch/riscv/boot/dts/thead/th1520.dtsi                  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> Jisheng Zhang and Guo Ren - I thought I would post this patch based on
> the discussion in the thread about the BeagleV Ahead patches.

Not like my R-b does much in this case, but thanks for doing this,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--cyzpousSpwWFGzKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL7D3gAKCRB4tDGHoIJi
0k+1AQCCyHL3tublu6LQEJGFuPY7/m9/V1C1oco0R598IUfouAD/T2YQ9LQ+fDW8
iFOzAKINAeYyRebDB1Bof6F25oOFcQE=
=NWyu
-----END PGP SIGNATURE-----

--cyzpousSpwWFGzKR--


--===============3777134491301129000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3777134491301129000==--

