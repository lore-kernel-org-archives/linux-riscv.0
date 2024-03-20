Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EBDC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 17:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8VLtuXXtRi/maAIk7kznTkq5Zgf5/fkJ7D8wQI/rRY=; b=1IRZ551rfli1DEib9QkM3OTJKc
	u8oLLjEH6xgG/jQdAn3MwS11D0byJwoaePAOnzCwMo3TELZrZAt0udQB60e+CGsC/rV9YmvnNffQM
	EfWe6s4xRDk0T9x7T2AgDvYhKd4hc2KTtTsoXF8ECVs5quol8dWr1L8t7Fru5xlsn/OQJNPgjqtyD
	a21qJqAlO5ILPIKLByDBPh4UKFDlnwMW22hFBXuHtsUTvd0YRwBWWBa5/yszI9Co99rVwUE9d/Kiy
	lmBWYEvjwGAGwnxatt/84E4vyVs4cE2nWAGqkpsGnEFuuGf+AVmM/78JLuAgSLDAbY772jvkEZ7J3
	2BYbI4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzuO-00000000WIK-3VS3;
	Wed, 20 Mar 2024 17:39:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzuL-00000000WGH-3RUo
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 17:39:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0A3CCE10E7;
	Wed, 20 Mar 2024 17:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0D2C43390;
	Wed, 20 Mar 2024 17:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710956359;
	bh=+I4HwwOXGb4OTVbce2LLwgvNTP55VKW3XPSef7uX2qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GC+QjOLgCWd2xCHOfgGMVLPcEchWO055AePCNCuub4yNELWCDEJ2LXQ3wPuRdpWbW
	 6zS68GkufurAmzHXJlPukCgGffKZAKhn+BvCVZPh1uGOc1x/3fGAaUBVf43pX1j12a
	 6PPBA0loQz+7M3ep5XFYftdWyRq5doQVVKGb7R71FC339a0qTOT9MOPScoxWDvAfk2
	 mILf4BeGvDnmqNZXxVxGIiGFRJgVPwP6t2c+jtrls1bi9cFsjEw4+GmojQkAcACnx9
	 fBXDs4BFv+7RtocNzFtYxn/akzVicQYhk6V0cEuODsLqzVhR+WkurDG9G1dCMjxzED
	 FOi9lFYlChCtA==
Date: Wed, 20 Mar 2024 17:39:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/7] riscv: Kconfig.socs: Split ARCH_CANAAN and
 SOC_CANAAN_K210
Message-ID: <20240320-ideology-pasty-d3aea07cc519@spud>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
 <tencent_6F35FEF31908DE6AEB385AE30AC658863C0A@qq.com>
 <CAJF2gTS1-VQP=gQBx=SoUWsdap153EGOObKVn+2L7=kbP2CqFg@mail.gmail.com>
 <20240306-scowling-mortify-9b427c80e8ab@wendy>
 <tencent_91E604E3B4D51DA37045625242A81B07F909@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_91E604E3B4D51DA37045625242A81B07F909@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_103922_784955_82D70FBD 
X-CRM114-Status: GOOD (  24.57  )
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
Content-Type: multipart/mixed; boundary="===============2169496156289627275=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2169496156289627275==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7hxDktwiGEbdrYmU"
Content-Disposition: inline


--7hxDktwiGEbdrYmU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 04:14:33PM +0800, Yangyu Chen wrote:
>=20
>=20
> > On Mar 6, 2024, at 16:01, Conor Dooley <conor.dooley@microchip.com> wro=
te:
> >=20
> > On Wed, Mar 06, 2024 at 07:38:52AM +0800, Guo Ren wrote:
> >=20
> >> On Wed, Mar 6, 2024 at 7:04=E2=80=AFAM Yangyu Chen <cyy@cyyself.name> =
wrote:
> >>>=20
> >>> Since we have Canaan Kendryte K230 with MMU now. The use of SOC_CANAAN
> >>> is no longer only referred to K210. Split them and add _K210 suffix
> >>> to the name for old SOC_CANAAN. And allows ARCH_CANAAN to be selected
> >>> for other Canaan SoCs.
> >>>=20
> >>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> >>> ---
> >>> arch/riscv/Kconfig.socs                        | 8 +++++---
> >>> arch/riscv/Makefile                            | 2 +-
> >>> arch/riscv/configs/nommu_k210_defconfig        | 3 ++-
> >>> arch/riscv/configs/nommu_k210_sdcard_defconfig | 3 ++-
> >>> drivers/clk/Kconfig                            | 4 ++--
> >>> drivers/pinctrl/Kconfig                        | 4 ++--
> >>> drivers/reset/Kconfig                          | 4 ++--
> >>> drivers/soc/Makefile                           | 2 +-
> >>> drivers/soc/canaan/Kconfig                     | 4 ++--
> >>> 9 files changed, 19 insertions(+), 15 deletions(-)
> >=20
> >> This patch cross so many subsystems, I am not sure about it. If I were
> >> you, I would keep SOC_CANAAN and just add SOC_CANAAN_K230.
> >=20
> > Right. That is why I didn't try to rename the symbol, and just left it
> > as SOC_CANAAN, but if the relevant people ack it, the chances of a
> > significant conflict are low.
> >=20
>=20
> Maybe I should split this patch into different subsystems for better
> review. I think at least drivers/soc/Makefile should changed to use
> ARCH_CANAAN. Because we need some SoC drivers for K230 in the future.
> And arch/riscv/Makefile should use SOC_CANAAN_K210 instead of
> ARCH_CANAAN.  Because we should avoid the M-Mode loader build for
> other Canaan SoCs except for K210.

It seems like what Damien requested is pretty much what's done here.
Can you resend this CCing the maintainers for clk pinctrl and reset?
If you leave a note under the --- line in this patch about wanting acks
to take this via riscv, I don't mind picking up this treewide patch if
the individual maintainers ack it. I don't think there's likely to be a
significant conflict caused by it going through one tree.

I got a k230 board (the canmv one) so I should be able to test this
myself before picking stuff up.

Cheers,
Conor.

--7hxDktwiGEbdrYmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfsfQgAKCRB4tDGHoIJi
0qhpAP0bH5dwSrdhtgZy8odymGeXP5Eu/mXODpURg5Zun0lG/AD9Fuz5Yc320STN
idBImdOU5uB7YmUXP6mjgPn82j0uvwY=
=j7D0
-----END PGP SIGNATURE-----

--7hxDktwiGEbdrYmU--


--===============2169496156289627275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2169496156289627275==--

