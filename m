Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13137C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 00:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqNZSTNp7htUbswfKgsfCakmI5yaT+O197bbJ1LZRB0=; b=mxPSuV/hTkp6MtRzV4YwaTeWRP
	VZnbFfGxZoTg7KIkuMLg0hcr/y79Kqga/kZRvEL1+bcoM+1dwJNvect6oT6MExNzj1vznF7JfBjAU
	fxj809Zv38XjVnXElc12YvqIiGYQ8v+8CcxcC40Gsj2RWdmLOMH+MkBlBvWaBd+fOEaB+/yO0MEG5
	bXQGH7/a64e2+WzkjLPAwTsqlWTiVZ+LPqHH7aYRjowCql8/vKLhInQikm1gEhBCTjBa4WwNFplBd
	TZNwo2Zwxxw8JuqgnnR6pEI8FudgEPPc0BUpmH2sM5ADYwDoQzZM21oKQB9TtvruqV5wmTUeiWjKU
	DQAasPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqtH-004tgE-2a;
	Sat, 24 Jun 2023 00:12:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqtF-004tfk-1M
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 00:12:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 60CD661B3C;
	Sat, 24 Jun 2023 00:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68425C433C8;
	Sat, 24 Jun 2023 00:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687565550;
	bh=7xPBiOV590KyrvCfPrfg3HGfvOAZZIKRMPcI3/sL3KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQgayS+dAenzmv9UpmDOE40oRy2E5d3izLewRqlcANE4CiboFjJk4xu/aRnjARl8H
	 Zz+8n7xtKZTAUJAC9FN0Li1j69dnaILz1qVQjHOeHMl6iAAEOVkpyIG1mNLsmhQjSz
	 Ac8VbW9MltakkSL6y+n8vPKuNO/FUmvlUHLIscV5OXvAf6hJmzi/aV2nNLYPbBG4dk
	 y5oJtSGrW6TEWpkFiHmEY5DuRY2LR2sM7XuD6ZzSM+LFiMra72DLlvHSO8OLg0vsSl
	 8JnJ54XhWlVRD6Z91vucVKZSjfpgkNLuDIsFwtF5lXtadcWV8TAjETmP0WkPbIupLJ
	 RA+6jUEAF5EUw==
Date: Sat, 24 Jun 2023 01:12:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230624-mortally-parking-68f6bc1dd5ee@spud>
References: <20230623222353.3742384-1-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230623222353.3742384-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_171233_521450_4675B2EC 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8090476969132346922=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8090476969132346922==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gxx+ADrwk7P5WV3t"
Content-Disposition: inline


--Gxx+ADrwk7P5WV3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Evan,

On Fri, Jun 23, 2023 at 03:23:53PM -0700, Evan Green wrote:
> In /proc/cpuinfo, most of the information we show for each processor is
> specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> compatible, and the mmu size. But the ISA string gets filtered through a
> lowest common denominator mask, so that if one CPU is missing an ISA
> extension, no CPUs will show it.
>=20
> Now that we track the ISA extensions for each hart, let's report ISA
> extension info accurately per-hart in /proc/cpuinfo.

No, you can't do this as it breaks the assumptions of userspace that
this shows the set supported across all harts.
Sorry, but NAK.

Cheers,
Conor.

--Gxx+ADrwk7P5WV3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJY06gAKCRB4tDGHoIJi
0jKQAQD+d6MrxtGHBk7NIHGkyEg81xZjoOJGzYQbnAsNIs4PewD/SbbVzF51iu9y
/tV+pkvbs4VzLZw9XIcyPwfvVIda+Ao=
=fdGx
-----END PGP SIGNATURE-----

--Gxx+ADrwk7P5WV3t--


--===============8090476969132346922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8090476969132346922==--

