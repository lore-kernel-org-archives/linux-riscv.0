Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4023C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5lP00pNBfygz5rJhzYCR+3369ZozxqJJLhYWCRsJMs=; b=dj3DCSWffeA7qPMoJk/bDt2zmq
	WO5nI+HFINQL0KeqjJcQZDT5LNK+hfxKRijb/rj56qJcyJ7EYksooZfUS37j6uNQCl3seY6bl5dij
	91MSvCdthRJcxciDk/4UKchHFakwJzpnD90W3HbwI/Lf7T49k7Qjyc8FKjy7s3aNL3Cs7t1DFRC2b
	7VYcyegd+J3Uek3b3+1RQMgn4Zqgnn/6BuvcRXx1KWObyqg9/VZXh5ZZyzNHduVQDAkKfgiUPTWYM
	/0cqJmAm6IjPTyUFIL7caC1rX21LvmYsbgp8S534rbA6F+2vJ8qipgbxwa6IrvZVspDU+nvG/RaOM
	hwFyPWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiEi-0000000Gy0N-21in;
	Mon, 25 Mar 2024 11:11:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiEI-0000000GxnM-1pmv
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 11:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18EBD60F18;
	Mon, 25 Mar 2024 11:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3897CC433F1;
	Mon, 25 Mar 2024 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711365060;
	bh=nM8sx42xDx95HRJ1wPccausmC0pYy6OVh8wnJGrVyxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXek09c6cW+G+x6iB1Jv6w5GUQmW9OLkvmUdoL+mdCU1yXcp6oJfVVuTBUC3Q/Cyk
	 NX3khylkoegm4UxLO1a0/ubyu6hdMd3PDa2CfU6mEA6W8YvYR2h2XJjTTef1YDIHYc
	 mj7rziUUjF9kvF6abIm7GB1Lkb2WOZcIWmrns4EPMTsA3YoWh8H3yKDJzFLRQ+F2fJ
	 O4/4Vo2/eaChhs1clAYhDWr1XbaTG0p6zqKNeO9LefMbklD84RICylMiSLMkmnU+CI
	 C9l6dyDXhurJtzLvruf9J7nlugslgxzuiSkKw2UtQdbuwZ6hPXXVhDMvw0RAyfJQ5A
	 8tKoT0ncUKN/g==
Date: Mon, 25 Mar 2024 11:10:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/11] riscv: Kconfig.socs: Split ARCH_CANAAN and
 SOC_CANAAN_K210
Message-ID: <20240325-slept-collie-9cdb65f2a94c@spud>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_F208A26B5338C6E14AC6648730368AF0FD0A@qq.com>
 <e255a964-27bf-4eb9-8e9a-4f60d1ccd12b@moroto.mountain>
MIME-Version: 1.0
In-Reply-To: <e255a964-27bf-4eb9-8e9a-4f60d1ccd12b@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_041103_273447_4016DC08 
X-CRM114-Status: GOOD (  29.93  )
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
Content-Type: multipart/mixed; boundary="===============5392369837294894601=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5392369837294894601==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wGBS4mUdIPIRsN3V"
Content-Disposition: inline


--wGBS4mUdIPIRsN3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 01:52:42PM +0300, Dan Carpenter wrote:
> On Sat, Mar 23, 2024 at 08:12:17PM +0800, Yangyu Chen wrote:
> > Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> > SoCs is already on the mailing list [2,3,4], we remove the use of
> > SOC_CANAAN and use ARCH_CANAAN for SoCs vendored by Canaan instead from
> > now on. And allows ARCH_CANAAN to be selected for other Canaan SoCs.
> >=20
> > Then, since we have Canaan Kendryte K230 with MMU now, the use of
> > SOC_CANAAN is no longer only referred to K210. Thus, we introduce a new
> > symbol SOC_CANAAN_K210 for any conditional code or driver selection
> > specific to the K210, so users will not try to build some K210-specific
> > things when MMU is enabled and see it fails to boot on K210.
> >=20
> > [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@k=
ernel.org/
> > [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7e=
d0a@spud/
> > [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c4=
6bb29@spud/
> > [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb86=
55a4d@spud/
> >=20
> > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > ---
> >  arch/riscv/Kconfig.socs                        | 8 +++++---
> >  arch/riscv/Makefile                            | 2 +-
> >  arch/riscv/configs/nommu_k210_defconfig        | 3 ++-
> >  arch/riscv/configs/nommu_k210_sdcard_defconfig | 3 ++-
> >  4 files changed, 10 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 623de5f8a208..5710aee456ac 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -72,11 +72,13 @@ config SOC_VIRT
> >  	  This enables support for QEMU Virt Machine.
> > =20
> >  config ARCH_CANAAN
> > -	def_bool SOC_CANAAN
> > +	bool "Canaan Kendryte SoC"
> > +	help
> > +	  This enables support for Canaan Kendryte SoC platform hardware.
> > =20
> > -config SOC_CANAAN
> > +config SOC_CANAAN_K210
>=20
> This breaks git bisect, right?  There are references to SOC_CANAAN that
> are get updated later in the patch series.  You can't delete SOC_CANAAN
> and leave the other references dangling.

Right. I thought that I had said to resend the patch from v5 and solicit
acks to take it via the soc tree [1]. Splitting it out like this means you
have to introduce a symbol that shadows the original one and then switch
only once all references have been removed. If this series went into 6.10,
which it should, the switch would be in 6.11. I think the chances of a
meaningful conflict are low with the treewide swap so it should be safe
to do.


1 - https://lore.kernel.org/all/20240320-ideology-pasty-d3aea07cc519@spud/

--wGBS4mUdIPIRsN3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgFbvwAKCRB4tDGHoIJi
0uSwAP95G4FiQlISuzAR9Fwa0rZx0NdUZQm9zCWUnZVjAvWBpwD/TRvaSY/ZlNhe
Uuf98Lvqw1twNosFPzpGll8glXobsQ4=
=Ztlu
-----END PGP SIGNATURE-----

--wGBS4mUdIPIRsN3V--


--===============5392369837294894601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5392369837294894601==--

