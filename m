Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D268C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqlKK8g2tcPtDaNPBiIdKLMuA4e4VPsZhcIt97r62kc=; b=zt68GiyEmTMvotx/UIsmlf6YjN
	06SW/yoOTFID5fm8WEmseBPsLpfMYga/QSYnwR3+QpYKLKVEUN4GF1C9GAHdYD3J4Pm+uj6CrGdBP
	4T1xl0Jbh6k7OoHo+Ki60/yQy/CoRBJxolqbMi5BsEmaBOyji3m/gKQ/jjf3iBDW4ViAQOdvL8BOb
	Vu8T85BWsrRvkVyR+NqBlA0MO8hAU7zXODqsTn5R6huPeAk+Cby+V0kOHUYcNmzULVb90/a5fx7ZD
	SeRfz7dqL1gttPsjl2SlhA9iGi39Wz5F4rHK+6s8B8bb4v2WbG5Ah6NUtHBOBzpNMxH97ibF2ae8D
	JqKnmcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Z3Z-002uwC-0N;
	Fri, 26 May 2023 15:08:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Z3W-002uvG-01
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 15:08:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59AB560ED3;
	Fri, 26 May 2023 15:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5050EC433A4;
	Fri, 26 May 2023 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685113717;
	bh=jw06Bd9UnyKSbXh6qpPKPh6ve8zeePuDuifL3U5qGWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHZS/sgsqiCWxXuG+5tVlkySwRcBkVCppB+F9SO4qTwxFzzjyyFTmvlbiqz4s5a/v
	 dlBTNtwkrfVQaVi/k5/ZdvkHn51HqiW38by25WA7hx3MLTdW2lL+KlZsYjxmcXTAUj
	 gR75We/w7iAdfw0qXFV2wM+PMB1io6hVLGMkx18bQavV+DIJus06YZAF+QCcxpQtRY
	 1MbZwP9rttL297GwqwCdaQKOiETjFAD4HUej0/aiq+0elKNTXCuzi7PI84c6oDSEQ+
	 58/VF+4LwXVaXxVNLRwfkHLM2yfJmiAdSr+kOaVZkbsXi0m8UlKbFAkK2jVhk7ztKx
	 L2sE6WnK4xVwQ==
Date: Fri, 26 May 2023 16:08:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: conor.dooley@microchip.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, thomas@t-8ch.de,
	w@1wt.eu
Subject: Re: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Message-ID: <20230526-humongous-manifesto-3c44973f0df1@spud>
References: <20230526-clover-litter-1f41398cd820@wendy>
 <20230526133825.198100-1-falcon@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230526133825.198100-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_080838_139867_6C2DFBDF 
X-CRM114-Status: GOOD (  26.64  )
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
Content-Type: multipart/mixed; boundary="===============7278550900141192621=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7278550900141192621==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WayLhPoiZx5ZZrQj"
Content-Disposition: inline


--WayLhPoiZx5ZZrQj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 09:38:25PM +0800, Zhangjin Wu wrote:
> Hi, Conor.
>=20
> >=20
> > On Fri, May 26, 2023 at 06:25:18PM +0800, Zhangjin Wu wrote:
> >=20
> > > > On 2023-05-25 01:52:29+0800, Zhangjin Wu wrote:
> > > > > riscv qemu has a builtin bios (opensbi), but it may not match the=
 latest
> > > > > kernel and some old versions may hang during boot, let's allow us=
er pass
> > > > > a newer version to qemu via the -bios option.
> > > >
> > > > Nitpick:
> > > >
> > > > This seems very specific and hopefully only necessary temporarily.
> > > >
> > >
> > > RISC-V is such a new ISA and the Spec (especially the SBI) changes ve=
ry
> > > frequently ;-)
> >=20
> > Huh. Could you please expand on which versions of QEMU will hang while
> > booting an upstream or stable kernel? Which kernels would be good to
> > know too.
> >=20
>=20
> As the cover letter listed (in the Environment section), the softwares we
> used are:

Not super interested in those ones since they work ;)

> The kernel version is the one this patchset based on (Willy's nolibc
> repo), it is v6.4-rc1.
>=20
> qemu v4.2.1 is the one systematically installed (/usr/bin) from the
> qemu-system-misc package and used to test this patchset in my Ubuntu
> 20.04 based test docker image.

Okay, in the context of RISC-V, that is pretty ancient ;)

> Just installed a v7.0.0 qemu from ppa:canonical-server/server-backports,
> there is no default opensbi, and re-checked, there is one prebuilt
> opensbi for rv64, but still no prebuilt opensbi for rv32.

Ah, I see.

> The hang issue I mentioned may be using one of my older prebuilt version =
of
> opensbi, I can not find which one it exactly is, so, please ignore that i=
nfo,
> will update that description too.

Okay. If you do manage to reproduce it, LMK! I was/am just worried we
have some regressions because you should be able to keep booting with
those older opensbi versions, modulo some Kconfig changes - although if
it is something like qemu 4.2.1 specific I don't think I care all that
much about dinosaurs ;)

> Btw, something not about this patch: qemu v8.0.0 seems not boot non-mmu
> v6.3, both sides have issues, not dig into it carefully, so, not report
> it yet.

Cool. Feel free to CC me on whatever you discover. nommu gets little
enough testing in mainline, and even less in stable kernels. That reminds
me, I do need to add 32-bit nommu to the patchwork automation for
linux-riscv.

Thanks,
Conor.

--WayLhPoiZx5ZZrQj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHDLcAAKCRB4tDGHoIJi
0nCqAQCCgCmTkKTJmk/35FqltqEtnqj2/KKHc1XPAIfhmy4/DAD/dMTwgLHXhm2b
t9fvm/hCLjoKAjt1pgKF97u2CcEfowU=
=iJ17
-----END PGP SIGNATURE-----

--WayLhPoiZx5ZZrQj--


--===============7278550900141192621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7278550900141192621==--

