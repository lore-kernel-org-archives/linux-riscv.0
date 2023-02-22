Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831C9C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDGnuuy2kSpYbL3o+5Ab51TLamOoVb9orhsnfbijmfY=; b=G0p7wjo1P4/9BV1WgHKm2Z19FT
	trj6F0FmIPd3uFVSn3KhGNLOzIoqnNzKpxG5SFDWoJPG8C69+CDkDTG4PbCVm53GbNAtWfYyf7a6p
	a+HmylYpUevYbbf2orWKg64y2NnMAyx9p3V68Dzxcnt4ytY1ymtUBXg/EvFN8wHykQsbwb5K2qX0B
	vF3GEYrAY4s4+7V8J6RNsYPyxkBo158uFkejPNXURpSPo6G32vXdF9dDhOXxAnVAdD+LPz2hekfxW
	a3krHkR9vWs60atXxhlMPWogUf9mdqc1WDi8ORzOlrYfwODdDGSwV61la/ZeD+dKiB9DAfwjc2Wam
	NcQZ9srQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUr9d-00CtCE-Ai; Wed, 22 Feb 2023 15:35:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUr9a-00CtBH-Vd
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:35:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AE356148E;
	Wed, 22 Feb 2023 15:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BC5C433EF;
	Wed, 22 Feb 2023 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677080134;
	bh=AwWvcH21C3Q4gB6IIx+55LDrOJuKSF/IV3rf5tqbHDM=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=AYjEaqjW7Fpbd1ALLwwfwYQzf3RJnA/4LrXRF1nhrJ4YjHdDmdgXx7iFaUsnAhu5U
	 2W8GTLO7ZJ6/teMyHE3RLPXIzOD/5Hvqlse0hzOKp7jNLJnPUeUXi25VQXholvmIhq
	 MH7nG2LGNBBehzfb+CLyn15LOMtuvUAHohJ4eWBHjhK6DMEB2AYeyXP9TQX4WBIQN7
	 gWdGgHeIRgGv66bjRdwNQriLqQIZc5Cuh6zWwUtEhqxiVYhTwashtnGdfBQgbZIQkb
	 2htxRbIjW88UAkLyMkl/Hgex1FiovHkWOeQkGp/qPjDAGS8ZBY+YDZ3xApPoImoh/4
	 A7P8/kejb3AoQ==
Date: Wed, 22 Feb 2023 15:35:27 +0000
From: Conor Dooley <conor@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	sboyd@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	ben.dooks@sifive.com, daniel.lezcano@linaro.org, tglx@linutronix.de,
	maz@kernel.org, emil.renner.berthing@canonical.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/19] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <Y/Y2P2HErwuD5/IX@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <167707802193.24438.5407460288169239541.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
In-Reply-To: <167707802193.24438.5407460288169239541.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_073535_116465_347815A9 
X-CRM114-Status: GOOD (  18.45  )
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
Content-Type: multipart/mixed; boundary="===============6078464044588186830=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6078464044588186830==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Je+uXJmQdQT6/rM6"
Content-Disposition: inline


--Je+uXJmQdQT6/rM6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 03:00:21PM +0000, patchwork-bot+linux-riscv@kernel.=
org wrote:
> Hello:
>=20
> This series was applied to riscv/linux.git (for-next)
> by Palmer Dabbelt <palmer@rivosinc.com>:
>=20
> On Tue, 21 Feb 2023 10:46:26 +0800 you wrote:
> > This patch series adds basic clock, reset & DT support for StarFive
> > JH7110 SoC. Patch 17 depends on series [1] which provides pinctrl
> > dt-bindings. Patch 19 depends on series [2] which provides dt-bindings
> > of VisionFive 2 board and JH7110 SoC.
> >=20
> > You can simply review or test the patches at the link [3].
> >=20
> > [...]
>=20
> Here is the summary with links:
>   - [v4,01/19] clk: starfive: Factor out common JH7100 and JH7110 code
>     (no matching commit)
>   - [v4,02/19] clk: starfive: Rename clk-starfive-jh7100.h to clk-starfiv=
e-jh71x0.h
>     https://git.kernel.org/riscv/c/f3af3b0039fe

This pwbot email is wrong, this commit is actually:
Merge patch series "riscv: improve link and support ARCH_WANT_LD_ORPHAN_WAR=
N"

>   - [v4,03/19] clk: starfive: Rename "jh7100" to "jh71x0" for the common =
code
>     (no matching commit)
>   - [v4,04/19] reset: Create subdirectory for StarFive drivers
>     (no matching commit)
>   - [v4,05/19] reset: starfive: Factor out common JH71X0 reset code
>     (no matching commit)
>   - [v4,06/19] reset: starfive: Extract the common JH71X0 reset code
>     (no matching commit)
>   - [v4,07/19] reset: starfive: Rename "jh7100" to "jh71x0" for the commo=
n code
>     (no matching commit)
>   - [v4,08/19] reset: starfive: jh71x0: Use 32bit I/O on 32bit registers
>     (no matching commit)
>   - [v4,09/19] dt-bindings: clock: Add StarFive JH7110 system clock and r=
eset generator
>     (no matching commit)
>   - [v4,10/19] dt-bindings: clock: Add StarFive JH7110 always-on clock an=
d reset generator
>     (no matching commit)
>   - [v4,11/19] clk: starfive: Add StarFive JH7110 system clock driver
>     (no matching commit)
>   - [v4,12/19] clk: starfive: Add StarFive JH7110 always-on clock driver
>     (no matching commit)
>   - [v4,13/19] reset: starfive: Add StarFive JH7110 reset driver
>     (no matching commit)
>   - [v4,14/19] dt-bindings: timer: Add StarFive JH7110 clint
>     (no matching commit)
>   - [v4,15/19] dt-bindings: interrupt-controller: Add StarFive JH7110 plic
>     (no matching commit)
>   - [v4,16/19] dt-bindings: riscv: Add SiFive S7 compatible
>     (no matching commit)
>   - [v4,17/19] riscv: dts: starfive: Add initial StarFive JH7110 device t=
ree
>     (no matching commit)
>   - [v4,18/19] riscv: dts: starfive: Add StarFive JH7110 pin function def=
initions
>     (no matching commit)
>   - [v4,19/19] riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 boa=
rd device tree
>     (no matching commit)
>=20
> You are awesome, thank you!
> --=20
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>=20
>=20

--Je+uXJmQdQT6/rM6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/Y2PwAKCRB4tDGHoIJi
0gZvAP9TS8cTqxz2X2lTeUcdGsP57u1Dz7WvhRdxj3ZntPeF6AD+NW1xWyUQ3eUO
dq1/3zp3OJBIzMWAFm+FilUtibP4uwc=
=Y8Hf
-----END PGP SIGNATURE-----

--Je+uXJmQdQT6/rM6--


--===============6078464044588186830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6078464044588186830==--

