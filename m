Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B305C6FA99
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Mar 2023 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P85bXtP4yuvDHGJQtjYsRUOAJvrPUUI4POzFL28NUWU=; b=pveTgKerU/tRBEm+8khwbxmLmB
	WqV85urbTPz9kv2lmoY3APjB+Gbf4h9Lxm9lMPPATaZQgVOesGZ9yXfsBv0H2NtfUxJDzHYAsuC75
	pmw6GFLEbYGNsLA44CGMH9TI10eQ+uQjK2eQDkyZCJ72gsA1E8RIiiIL/LhkqxprCtxS7AKnBOuo+
	QJNHpolNYDsWI6IDX0K2OUsdSxNsUjWy56uj53l7rzRNLkezItQtJqk3sVO68M6VQKkEIt1n1i9Kp
	GDRmnrjGu/APFD+agEssrAOOsjga68aPeGL6TiD4AwypAWshfHC4BUDmjhCVEi0089lIMvvyz71RW
	LnSQBMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbMFZ-002cpb-Ex; Sun, 12 Mar 2023 14:00:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbMFU-002cnG-6H
	for linux-riscv@lists.infradead.org; Sun, 12 Mar 2023 14:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AAD88B802C8;
	Sun, 12 Mar 2023 14:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0531C433D2;
	Sun, 12 Mar 2023 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678629629;
	bh=wFICklcUPI9u10LmkC+Q32v0zLcHQBj1RUk9RVPheC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNSZvUlBwhDTbciaIRdrh2VcNDuAQhU39vfJX9Ds7rbIQaFekNjLpxEg8zoYYTv9V
	 J7MDgE6GkXe4hJk7yBJ3vqJvpg8A/4y+xj++a4cacYWb/p2hG1XLt9wA8h+BotdIbQ
	 XNx44pIH7SbR/3KnkheH/OvxtbYra9MtZhCsSDm9e2e8ebEIgCi2NKvldBXCP7hBs6
	 16BEm1V9gAYIocE0J6VG6NfVCLTJvNY0TlZlKYVY/h5qK5gPmuD9ubLaJL39HMEZL1
	 8cfNxAknrbH4TrFL3SjuDeR7vKWiVXBJG1LqVEIioM/DFY3OwhjTgY4zrULJfuY49u
	 TupX2N/e8u/JQ==
Date: Sun, 12 Mar 2023 14:00:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/21] clk: starfive: Rename clk-starfive-jh7100.h to
 clk-starfive-jh71x0.h
Message-ID: <c7e5a23a-16f9-4e30-adc7-a422abeb50ef@spud>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-4-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230311090733.56918-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_070032_740041_50874246 
X-CRM114-Status: GOOD (  12.30  )
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
Content-Type: multipart/mixed; boundary="===============2388885803237969667=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2388885803237969667==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5IeCIlJW+LRtrZaq"
Content-Disposition: inline


--5IeCIlJW+LRtrZaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 05:07:15PM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Rename clk-starfive-jh7100.h to clk-starfive-jh71x0.h for making
> the code to be common.
>=20
> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clk/starfive/{clk-starfive-jh7100.h =3D> clk-starfive-jh71x0.h} | 0

So this patch has broken the build :(
https://patchwork.kernel.org/project/linux-riscv/patch/20230311090733.56918=
-4-hal.feng@starfivetech.com/

I would imagine it is because you can't rename the header without also
changing the users of the header.

Cheers,
Conor.

--5IeCIlJW+LRtrZaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZA3a9wAKCRB4tDGHoIJi
0gBGAQCqn9Dop3s+ZM1ku4OZOOw18V5mmdfyZ6fqN4sUWFtnVQD8D7anScl1VOZH
DBmBF/QCBa4RJq2bZCOK4qh28+oj/wQ=
=VFFQ
-----END PGP SIGNATURE-----

--5IeCIlJW+LRtrZaq--


--===============2388885803237969667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2388885803237969667==--

