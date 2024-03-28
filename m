Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782EFCD1283
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CmYA9/B7BvbC5ZodEqZ5Hf0vIfi8vc8B796tZX3fmE=; b=cVp3/AikbngUunvZYqI3eS+nUa
	uBLUJim1rfsEipMg4479/QNt74T5RfdYTjLzqnPtrSxB9xDAgsrKpEj7cZfdYR+2C4nuccYFrpVmJ
	3IgRsHIgjUFBNwlyUe1Zwg/E5zyGj1wGJVcdZ1LJPF1mpeQPtrTqxjeLZpfGjJWZAPn3Xv2vVp8Mw
	RtZkhid/nrRM9JLanupS4wEMIU2TdemAuLwTOynMuDl2uM9V3J7ImGPma+acA6nlb9MDU+CYetTG6
	k5MKzyTJc1O5LVWDzUjFLGUyCdW7wraBW0Zf0VsIBmmtmVKlXYfXdE6SqHFyw08rM9hVLrGLqCduz
	r32FqHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptZd-0000000EywR-3KcJ;
	Thu, 28 Mar 2024 17:29:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptZa-0000000Eyv8-3EmJ
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 17:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17B96617AE;
	Thu, 28 Mar 2024 17:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD47CC433C7;
	Thu, 28 Mar 2024 17:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711646992;
	bh=2yjXG1cxcOLRAQQFD2MmlXzfBTpxi8yuDIP1YvTVo1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P23qjp0jZGrt5nB7AvifCFT26FEKuPDGE1gQPhQ9VG7LDmaJZZubXdTjGL3d8g+0z
	 1/W5PgJOr5RtSDp9S0Pu+iADL8NZ7oMTIcXQ3W3Qh1AgvSYUQ70+EY6mkS8x3SvhjG
	 oVWyZOzRj5V4S4vWvNWu44YjcJYHsnyhoTiNNCLO4CbfBVBuZSm3qX89V48RF8tlwh
	 aOVWX1QukpiYy3BfhRkyfdwg5PSTwCuDO7E7JXsSs81XUWzTMSsoQTyqhywubf1IFc
	 C55lYbOzdO/GjNDAwX8FqZXrtTa0rOwIKDv0LNPTOjEoLW/1CBN3rP494bU1R5RsqM
	 OO7eUgnD4v3gQ==
Date: Thu, 28 Mar 2024 17:29:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Damien Le Moal <dlemoal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] riscv: Kconfig.socs: Deprecate SOC_CANAAN and use
 SOC_CANAAN_K210 for K210
Message-ID: <20240328-daytime-hankie-41a57ad9fbce@spud>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_102954_915925_488ED5F3 
X-CRM114-Status: GOOD (  27.97  )
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
Content-Type: multipart/mixed; boundary="===============6813980846005152907=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6813980846005152907==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rTpquQ6Zk9VYNr0B"
Content-Disposition: inline


--rTpquQ6Zk9VYNr0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yangyu,

And Linus/Stephen/Philipp I guess!

On Fri, Mar 29, 2024 at 01:03:22AM +0800, Yangyu Chen wrote:
> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already in the mailing list [2,3,4], so we deprecate the use of
> SOC_CANAAN and use ARCH_CANAAN for SoCs vendored by Canaan instead from n=
ow
> on.
>=20
> However, the K210 SoC is so special for NoMMU and built for loader.bin, if
> we share the ARCH_CANAAN symbol directly for K210 and other new SoCs which
> has MMU and no need for loader, it will confuse some users who may try to
> boot MMU Kernel on K210, but it will fail. Thus, this patch set renamed t=
he
> original use of SOC_CANAAN to SOC_CANAAN_K210 for K210 SoC, as Damien
> suggested from the list [5]. Then, it made some adaptations for soc, clk,
> pinctrl, and reset drivers.
>=20
> Note: This patch set is used to prepare for Canaan K230 Support, which is
> on the mailing list [6]. The next revision for the K230 support patch will
> be based on this patch set.

Please, if you don't completely understand what I tell you to do, ask me
to clarify. Asking for more information on what to do is not a problem,
it saves effort for everyone if you ask rather than submit another
version. This patchset has the same sort of problem as was pointed
out on the v5 and v6 of the k230 support.
All patches in this series must go through the same tree, if they don't
then the relevant drivers will not compile in the subsystem trees. As
the new symbol will not be defined there. This is why I said that you
should solicit acks from the subsystem maintainers to take this all via
the soc tree - but you do have to explicitly ask for them! I suggested
doing it under the --- line in each patch, as often maintainers ignore
the parts of a series that do not involve them (I know I do this with
dt-bindings *all* the time).

The only way this works without taking everything via one tree is if we
introduce ARCH_CANAAN for 6.10-rc1, switch every driver subsystem over in
6.11-rc1 and then delete the Kconfig symbol after 6.11-rc1. Although I
also waited with my SOC_FOO symbol removals because I wanted the
ARCH_FOO symbols to propagate into .configs, I followed the process
above so that things could be taken into subsystem trees without
preventing building the drivers.

I'm perfectly happy to take the whole series via the soc tree, but I need
acks on the clk, pinctrl and reset patches before I can do that.

Thanks,
Conor.

> [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@ker=
nel.org/
> [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0=
a@spud/
> [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46b=
b29@spud/
> [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655=
a4d@spud/
> [5] https://lore.kernel.org/linux-riscv/2b0511af-1b5b-4c90-a673-c9113bb58=
142@kernel.org/
> [6] https://lore.kernel.org/linux-riscv/tencent_F76EB8D731C521C18D5D7C4F8=
229DAA58E08@qq.com/
>=20
> Yangyu Chen (5):
>   riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
>   soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
>   clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>   pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>   reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>=20
>  arch/riscv/Kconfig.socs                        | 10 ++++++++--
>  arch/riscv/Makefile                            |  2 +-
>  arch/riscv/configs/nommu_k210_defconfig        |  3 ++-
>  arch/riscv/configs/nommu_k210_sdcard_defconfig |  3 ++-
>  drivers/clk/Kconfig                            |  4 ++--
>  drivers/pinctrl/Kconfig                        |  4 ++--
>  drivers/reset/Kconfig                          |  4 ++--
>  drivers/soc/Makefile                           |  2 +-
>  drivers/soc/canaan/Kconfig                     |  4 ++--
>  9 files changed, 22 insertions(+), 14 deletions(-)
>=20
> --=20
> 2.43.0
>=20

--rTpquQ6Zk9VYNr0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgWpCwAKCRB4tDGHoIJi
0vSiAP46u8BBoQ4Q2gEfklZZQYfm0Iqp6XLECwPL/erieG3qeAD/Z/ajVOOOn2gC
HdoMbj86rCTOUylDh4k+rOt91693IAM=
=b+GD
-----END PGP SIGNATURE-----

--rTpquQ6Zk9VYNr0B--


--===============6813980846005152907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6813980846005152907==--

