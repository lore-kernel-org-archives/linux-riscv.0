Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D0AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGZj4pkrxp+z0/PRaLEpBaFzMq0aLgMcx1g+BBB/0rg=; b=1sJPPDd2kx2KrCFMkWx1dbCOy4
	6egXBaKF8vTbScMh8+dcam+T6N+/Yvsb43fyVricV5X/tMq1FzkHEh0kWN6rWyr+8b0IZm+rxTNvs
	AcEXiQwhRmezstcgqzu05sq3KAVZncvGr+SYSOy+D1xYb7yENQQAFBAj0hbDrx17XP011cYTMrvE4
	E1w9l04BMZP/NZGlorrhQl5TZb3cyc/8rZOfP9S0Z/ArkO8gtHn14iLg5Q2qR4v6sCrXiYl+i+XFK
	R++8Kl+7rcthTUajaLU4Yx/txX8om2lH1dWwdetAQw0jZTo7EotUdjFW0Q9cF3u+6HsR025j9HG9m
	4SRrMCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rABeK-0054nX-0L;
	Mon, 04 Dec 2023 16:18:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rABeG-0054ms-2j
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 16:18:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 82068B80D67;
	Mon,  4 Dec 2023 16:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973F5C433C7;
	Mon,  4 Dec 2023 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701706698;
	bh=yDzvwMVlTobByjnSGQyneCW0HtTxC52ddIxe9fPN3os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVhD/UgOk1VH4nMhaGXfD+m1K9OZ5rYZIk/4Fnx8Zai+cX+Z64vYDI4IF5wcKSh/D
	 5a+Y6PJmU/ZdqYtRoPiBgMb9JGDHucFAw8CE/0gZNt52NJGeYnd95Lh6VnJKhtdAZJ
	 lp3EQhooN/WZKn1+TJwikNDjcNKnmzp/fRF8LaWg+NLHtlUuvyKifnu4c0jlT26m2M
	 UI2tylugntqs7ftIW2ItBr4i+4wBX+gDSGIBn47eDW934px7h8FI2GvF0wPpfJmZmP
	 tvpLOjlMidIQuvbUEo5Kb+TkLZbFwGcoXZpGM4wLutiougqtkIeilJAb1wAI3hO46B
	 yHYQ81+c+mZyg==
Date: Mon, 4 Dec 2023 16:18:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Message-ID: <20231204-germproof-venue-6874ad902323@spud>
References: <IA1PR20MB4953C912FC58C0D248976564BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49531ED1BCC00D6B265C2D10BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49531ED1BCC00D6B265C2D10BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_081821_155453_28F4BF43 
X-CRM114-Status: GOOD (  16.38  )
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
Content-Type: multipart/mixed; boundary="===============7680482047395459601=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7680482047395459601==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r7TrBvfH2EyTxEDe"
Content-Disposition: inline


--r7TrBvfH2EyTxEDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 05:51:08PM +0800, Inochi Amaoto wrote:
> The timer registers of aclint don't follow the clint layout and can
> be mapped on any different offset. As sg2042 uses separated timer
> and mswi for its clint, it should follow the aclint spec and have
> separated registers.
>=20
> The previous patch introduced a new type of T-HEAD aclint timer which
> has clint timer layout. Although it has the clint timer layout, it
> should follow the aclint spec and uses the separated mtime and mtimecmp
> regs. So a ABI change is needed to make the timer fit the aclint spec.
>=20
> To make T-HEAD aclint timer more closer to the aclint spec, use
> regs-names to represent the mtimecmp register, which can avoid hack
> for unsupport mtime register of T-HEAD aclint timer.
>=20
> Also, as T-HEAD aclint only supports mtimecmp, it is unnecessary to
> implement the whole aclint spec. To make this binding T-HEAD specific,
> only add reg-name for existed register. For details, see the discussion
> in the last link.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT timer")
> Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005693.h=
tml
> Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
> Link: https://lore.kernel.org/all/IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@=
IA1PR20MB4953.namprd20.prod.outlook.com/

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Although, I figure it is going to be me that ends up taking it.

Cheers,
Conor.

--r7TrBvfH2EyTxEDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW37xQAKCRB4tDGHoIJi
0k7+AQCD3i9MlUls5AeaNYbwXSKbbrJ8nrMswlOtYuKpALuxgwD/c5t5zE8FQyWQ
gFvWp6AcxMmNv+4b61lJDPWZ+Mrm+Qc=
=VXzQ
-----END PGP SIGNATURE-----

--r7TrBvfH2EyTxEDe--


--===============7680482047395459601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7680482047395459601==--

