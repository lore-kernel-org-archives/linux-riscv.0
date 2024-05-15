Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC17C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BscmPkLRED5Qw6hNYD1tAs6sq6kLN/2pvxwhlpbvqw=; b=qi9yMInvgvMxKVtYpVLewrWsrL
	hRy4b+ow+YXqG05f6nQ0pGgZNHCyJbaPe66e1ndWi/SO/Fpibb3xTciilQh0YAoiHrHMTnicDb/jE
	taQ82me81vlgomPRrZ/YDRxrzGR2cRHwLj7gvB5KbhgbVoUJobgXcJKiMh03mqcMLj72PJzPiy+vf
	X6hPpwAsfCZWCv5CObUrjJ+KhnJ82T4eJPX3H7C3mrUbRlRgnqbiR8XV66OzOQRs2E7YG2TS3x5Ix
	SgIXKadjapEsVK/nICK7DOTuKpMUuTjze9Js/tAxvytwFGIJJcQuB3MYI8hW9L1KT8EhSsNw4oIqo
	x12UtJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7FkS-00000001qFS-0Cwn;
	Wed, 15 May 2024 14:36:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7FkO-00000001qDB-2Fpe
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 14:36:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8647DCE16E0;
	Wed, 15 May 2024 14:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCA0C116B1;
	Wed, 15 May 2024 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715783797;
	bh=BK3Q1Eaz2vKy7Ifb0gMrmzfC3vR/99oauzNR4ISwhNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7D7ndLe/1tMGWg+zXC6mnAqwqDcUYM0rcjLNDQzfAYwZgpcO2SvG/G6rOcGTLJNV
	 hGxoDb8GYIpJY65l6aQGhvrGYoxCxyUle6Z/cotew2VxB7Q91EmK2GoQOrTNXDGeeb
	 HYib5mmxOXV+Ze9RvzY81b4pw7MDBKWsvfDaiaZU9vPoIocYL3t8Tz1IMk6C27wX6B
	 t8nM6WxV7ov0P4kMxe+D3tLW5usOjynfkmllzzUWr2VyH9y2cVhSFRMaPNYfWeKDJy
	 DiWkSKGATxJ0Zm3UKvMWMISSCpTJRQrkSRvH/u8hOBlC8wJhrkVBdo9X8YwmFTCTID
	 HjTywjrdAACYA==
Date: Wed, 15 May 2024 15:36:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments
 to function 'riscv_ipi_set_virq_range'
Message-ID: <20240515-zen-calculate-289cfb90cd65@spud>
References: <CA+G9fYtDtgb8zNGfDQPS2u_n_45rDiDgJR6ud3uuxkJBR0rUzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYtDtgb8zNGfDQPS2u_n_45rDiDgJR6ud3uuxkJBR0rUzA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_073648_943844_23A0BCF6 
X-CRM114-Status: GOOD (  11.46  )
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
Content-Type: multipart/mixed; boundary="===============0577230822225611375=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0577230822225611375==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VaxeQxGCx5+jYQuq"
Content-Disposition: inline


--VaxeQxGCx5+jYQuq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Palmer,
This is the issue I point out to you on the call earlier:

On Wed, May 15, 2024 at 04:18:58PM +0200, Naresh Kamboju wrote:
> The riscv builds failed on Linux next-20240515 tag due to following build
> warnings / errors with gcc-13 and clang toolchain.
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> Build Log:
> -----
> drivers/irqchip/irq-riscv-imsic-early.c: In function 'imsic_ipi_domain_in=
it':
> drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many
> arguments to function 'riscv_ipi_set_virq_range'
>    52 |         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/smp.h:119,
>                  from include/linux/lockdep.h:14,
>                  from include/linux/spinlock.h:63,
>                  from include/linux/sched.h:2142,
>                  from include/linux/ratelimit.h:6,
>                  from include/linux/dev_printk.h:16,
>                  from include/linux/device.h:15,
>                  from include/linux/node.h:18,
>                  from include/linux/cpu.h:17,
>                  from drivers/irqchip/irq-riscv-imsic-early.c:8:
> arch/riscv/include/asm/smp.h:52:6: note: declared here
>    52 | void riscv_ipi_set_virq_range(int virq, int nr);
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
> metadata:
>   git_describe: next-20240515
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_sha: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
>   git_short_log: 82d92a9a1b9e ("Add linux-next specific files for 2024051=
5")
>=20
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202405=
15/testrun/23894295/suite/build/test/gcc-13-lkftconfig/details/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2gUiKdxX7qM27ri=
tMJT5pRyZhyi/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202405=
15/testrun/23894295/suite/build/test/gcc-13-lkftconfig/history/
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org
>=20

--VaxeQxGCx5+jYQuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTIcQAKCRB4tDGHoIJi
0lfWAQDi33YIiyOgOhOs7pvyAObFXef0e9hfqNt1slgzGSvACwD/ZgicDRP+uuJa
J02ZHXAmHtcBVUat4F+6J8iGuN38gQw=
=zifD
-----END PGP SIGNATURE-----

--VaxeQxGCx5+jYQuq--


--===============0577230822225611375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0577230822225611375==--

