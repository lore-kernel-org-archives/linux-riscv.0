Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEBFC04A94
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ISOIcvV4Pgt+hfyywPaAXmPg6GPQRIYHN1YxGUYANk=; b=OSFz3qQE/nJTPyveydbUZZVUzn
	xXIEX4fhtAjBBmSCti6URomu9/4bq2qROGMErHn0UrMj0roe6eNwiKV0CqFRA0mhVebhfrcJ3oQaR
	WTLe+jdYgXc2bw30mhicZRFBLWjL8mDOHYLLC+Nv/3LZqxtqvKFJl3IpCGcEfkCC+PM3yee2BqWQN
	em3BKE78s5pUPiKZ7Hqk1dgUQQg6+U7sP1u60fxSb2/W+EOp8LTonrAk8mEKDFprKKJhg7j5z3NBs
	dCtP08TWz6AVOZFhyYK9EdGAr/TYRvv1RiWpwCxOObvyK1AIu9jMRCbDzLQyI28KGxHRlIorzJ/Sr
	Up1gpqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWE2-00BGyF-1S;
	Fri, 11 Aug 2023 17:47:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWDz-00BGxf-29
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 17:47:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C9C36591F;
	Fri, 11 Aug 2023 17:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC28C433C7;
	Fri, 11 Aug 2023 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691776018;
	bh=4LhsxggR4DWdzIJ8SEP6TtdTORcSpYx2QpOWDA0Evg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyXlfEGj7M8tG1HTeNYnovhsUXgxF5XyfBzHZJLx8DdZKrh13DXZmdli5TwiQbxBM
	 U/tJAalvLY5dcMbdyUrWowMQ3dbqR/WDpI+LqXO2wUD7QpJZnPKvKiaywN+KKmX1nj
	 qjNKyKDNzXXkKAFZWppZ9M7HNqnYDTicluGT3YNupuwPOA3F9ly7ICWjpm+6BDfZfa
	 m+7L5YgOuXLSaqGoI3oIP0n+ZOtiJitQK3Vm/iNaU/V0h/p27nj6mW7tMz5JF7kO3o
	 CB7v3erNuQh6KKoEx3Nj0fm0KvIYijXP2wklnVGcuBXeI3cZNOx6yQaNR2geOtO2/v
	 UX6+wQBkcvTTA==
Date: Fri, 11 Aug 2023 18:46:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <20230811-bucket-fog-7d04c1ac227c@spud>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <ZNZyNjjekd2SW/mn@x1>
MIME-Version: 1.0
In-Reply-To: <ZNZyNjjekd2SW/mn@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_104659_809344_4106F46D 
X-CRM114-Status: GOOD (  26.77  )
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
Content-Type: multipart/mixed; boundary="===============5126757954805124964=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5126757954805124964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CxXu613LXMe5kC+W"
Content-Disposition: inline


--CxXu613LXMe5kC+W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 10:39:02AM -0700, Drew Fustini wrote:
> On Sun, Jun 18, 2023 at 12:15:21AM +0800, Jisheng Zhang wrote:
> > Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> > module which is powered by T-HEAD's TH1520 SoC. Add minimal device
> > tree files for the core module and the development board.
> >=20
> > Support basic uart/gpio/dmac drivers, so supports booting to a basic
> > shell.
> >=20
> > NOTE: the thead cpu reset dt-binding and DT node are removed in v3. This
> > makes secondary CPUs unable to be online. However, minimal th1520
> > support is better than nothing. And the community has been working on
> > and will work on the cpu reset dt-binding, for example, Conor, Guo and
> > Jessica are discussing about it, I have seen valuable comments and
> > inputs from them. I believe we can add back cpu reset in next
> > development window.
>=20
> I'm interested in starting the secondary cpus on mainline. It seems that
> that "thead,reset-sample" is already implemented in upstream OpenSBI in
> lib/utils/reset/fdt_reset_thead.c and the issue is getting the
> dt-binding accepted. Is that correct?

There was nothing in the original series (AFAIR) that actually uses the
properties. Including it in the Linux DTS just makes life easier, since
the dts could also be used in OpenSBI?

> It looks like you've tried to restart the discussion on the DT list [1]
> so I hope that the DT maintainers will give their perspective.

I'm not sure what there is to say. I already gave feedback about it
which has been ignored.

--CxXu613LXMe5kC+W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNZ0DQAKCRB4tDGHoIJi
0ulpAQD+MhyrwIMZu/OHV7kmlJ8+cHk6ntWVt/wF02p8DWTHXwD/ZIRNDQPRWB+A
bqkAwKwfa3oPmtvhr01lQVk/iLOhTwQ=
=cDLk
-----END PGP SIGNATURE-----

--CxXu613LXMe5kC+W--


--===============5126757954805124964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5126757954805124964==--

