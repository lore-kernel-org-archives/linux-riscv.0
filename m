Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3E2C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 16:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sTBsayGUi0/xiCZJsJzkhXhjiaHnbWgEJcBK39+Fgg=; b=xI7XGrfuPYgrbQ4IIqYpD3UAMA
	B1zTtZx6bx7TVt5qTDWdutOoyN0Bou1SIgsqFYJ1fAotkwVZPlqcJASDiK+xYdvmrLype1KO+Gfog
	BALO9tsSFVE2rwfw5p5vEIyF7PJGGTx1yu4VTRviLQbW2e1pj+EFz6y9hbws5ciw/v8wy4krwcLEc
	OL/XFWH6RckRPrWAGrN9c7vVi7v6tjq68eJ6/StxTMTKfr/alx8zOhKvxHQsU3vyvB3vENPbbE+Vj
	30gNJjPJ7xuXWuRDiPzwFpmV8zHDeMYkqHYrWhgmjY8RpQwyB1MuOcslsYIBK463LD+70CB2moHcl
	FHY1jEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnZm-0000000HOMq-1tqy;
	Thu, 13 Jun 2024 16:45:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnZj-0000000HOLb-0CO0
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 16:45:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C45B61BC5;
	Thu, 13 Jun 2024 16:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0CAC2BBFC;
	Thu, 13 Jun 2024 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297121;
	bh=hwKffuKZMs/Ij9bICRR6W8JYxxlaau/+meoC6lpjLnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpZnfvFCd8MIPz139LeBcjcgu8fs+N50DAtdNcqp8HH9aPuPZ4i04fDJjPzk8aDVQ
	 3+XXTcLdMF/l/I9/WTyVkVLUYdymMozrJCxtiUTxdw9Ll+PeA5EUp8tF2APUrZeeMY
	 A/znVSdEtKv6Pc4yVNxFGPu9GE8WkPPaFmpHZc8qCme+E++XwFeLUxQf7oK8o5/8wY
	 RDv5EfZ/pWQ4J4Z+y7niLkUsKVtYCyHRjJ3mErw7OBD98gasJacfRktMQw0yU6VDkx
	 GJgIjtmhfs0ICI2NuGVvF4BpxyfXb0C19QuwzspirBWohFPTjONfUbOAVTzEkIT+zN
	 6CvC32L8T8Dog==
Date: Thu, 13 Jun 2024 17:45:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, richardcochran@gmail.com,
	robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
	inochiama@outlook.com, samuel.holland@sifive.com
Subject: Re: [PATCH v16 0/5] riscv: sophgo: add clock support for sg2042
Message-ID: <20240613-partly-closure-b473efa8fbce@spud>
References: <cover.1717661798.git.unicorn_wang@outlook.com>
 <MA0P287MB2822B36985A6EC138C2A97CAFEC12@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB2822B36985A6EC138C2A97CAFEC12@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_094523_206725_E45F349B 
X-CRM114-Status: GOOD (  42.33  )
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
Content-Type: multipart/mixed; boundary="===============7531384595031759445=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7531384595031759445==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cpHK8yFQcna/Cjlc"
Content-Disposition: inline


--cpHK8yFQcna/Cjlc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 05:34:03PM +0800, Chen Wang wrote:
> ping ~~~

My suggestion is that you, as platform maintainer for sophgo, apply these
patches and send Stephen a pull request. That's usually the best way to
expedite patches for clock drivers.

Thanks,
Conor.

>=20
> On 2024/6/6 16:36, Chen Wang wrote:
> > From: Chen Wang <unicorn_wang@outlook.com>
> >=20
> > This series adds clock controller support for sophgo sg2042.
> >=20
> > Thanks,
> > Chen
> >=20
> > ---
> >=20
> > Changes in v16:
> >=20
> >    The patch series is based on v6.10-rc1.
> >=20
> >    Improved the dirvier code as per comments from Emil Renner Berthing.
> >    - Split driver source file into three and change from built-in to mo=
dule.
> >    - Directly use status/enable pll register, no need to store them.
> >    - Use FIELD_PREP/FIELD_GET to simplify the code.
> >    - Some misc code improvements, such as for macro and local variables.
> >=20
> > Changes in v15:
> >=20
> >    The patch series is based on v6.9-rc5. You can simply review or test=
 the
> >    patches at the link [16].
> >=20
> >    Improved the dirvier code as per 3rd review comments from Stephen Bo=
yd.
> >    - Converted all parents described by strings to use clk_parent_data =
or
> >      clk_hw directly.
> >    - Just use struct clk_init_data::parent_hws when only have a clk_hw.
> >    - Removed extra cleanup when use devm.
> >    - Some misc code improvements.
> >=20
> > Changes in v14:
> >=20
> >    The patch series is based on v6.9-rc1. You can simply review or test=
 the
> >    patches at the link [15].
> >=20
> >    Improved the dirvier code as per 2nd review comments from Stephen Bo=
yd.
> >    - Inline the header file into source file.
> >    - Use devm_xxx functions for pll/div/gate registeration.
> >    - Use clk_parent_data for mux clocks initialization.
> >    - Use u32 for registers readl/writel.
> >    - Use devm_platform_ioremap_resource instead of devm_of_iomap.
> >    - Cleanup some dead code and add definitions for some magic numbers.
> >    - Add include files missed.
> >    - Use kernel-doc to improve comments for some structure and function=
s.
> >    - Other misc code cleanup work as per input from reviewers.
> >=20
> > Changes in v13:
> >=20
> >    The patch series is based on v6.9-rc1. You can simply review or test=
 the
> >    patches at the link [14].
> >=20
> >    Just added a minor fix for clk driver which was missed in v12.
> >=20
> > Changes in v12:
> >=20
> >    The patch series is based on v6.9-rc1. You can simply review or test=
 the
> >    patches at the link [13].
> >=20
> >    Improved the dirvier code as per review comments from Stephen Boyd.
> >    - Remove default y for CLK_SOPHGO_SG2042.
> >    - Optimize sg2042_pll_get_postdiv_1_2, move postdiv1_2 to the functi=
on.
> >      scope and add more explaniation.
> >    - Optimize sg2042_get_pll_ctl_setting.
> >    - Switch to platform driver.
> >    - Use clk_hw for initialization of struct clks.
> >    - Don't use ignore_unused when using critical.
> >    - Other code cleanup as per input form the reviewers.
> >=20
> > Changes in v11:
> >=20
> >    The patch series is based on v6.8-rc5. You can simply review or test=
 the
> >    patches at the link [12].
> >=20
> >    Quick fixed some dt_binding_check errors reported by Rob.
> >=20
> > Changes in v10:
> >=20
> >    The patch series is based on v6.8-rc4. You can simply review or test=
 the
> >    patches at the link [11].
> >=20
> >    Add input clocks for rpgate & clkgen.
> >=20
> > Changes in v9:
> >    The patch series is based on v6.8-rc2. You can simply review or test=
 the
> >    patches at the link [10].
> >=20
> >    From this version, drop the system-controller node due to there is n=
o actual
> >    device corresponding to it in IC design. SYS_CTRL is just a register=
s segment
> >    defined on TRM for misc functions. Now three clock-controllers are d=
efined for
> >    SG2042, the control registers of the three clock-controllers are sca=
ttered in
> >    different memory address spaces:
> >    - the first one is for pll clocks;
> >    - the second one is for gate clocks for RP subsystem;
> >    - the third one is for div/mux, and gate clocks working for other su=
bsystem
> >      than RP subsystem.
> >=20
> > Changes in v8:
> >    The patch series is based on v6.7. You can simply review or test the
> >    patches at the link [9].
> >    In this version, the main change is to split one clock provider into=
 two.
> >    Strictly follow the hardware instructions, in the memoymap, the cont=
rol
> >    registers of some clocks are defined in the SYS_CTRL segment, and the
> >    control registers of other clocks are defined in the CLOCK segment.
> >    Therefore, the new design defines two clock controllers, one as a ch=
ild
> >    node of the system control and the other as an independent clock con=
troller
> >    node.
> >=20
> >    This modification involves a major modification to the binding files=
, so
> >    the reviewed-by tags has been deleted.
> >=20
> > Changes in v7:
> >    The patch series is based on v6.7. You can simply review or test the
> >    patches at the link [8].
> >    - fixed initval issue.
> >    - fixed pll clk crash issue.
> >    - fixed warning reported by <lkp@intel.com>
> >    - code optimization as per review comments.
> >    - code cleanup and style improvements as per review comments and che=
ckpatch
> >      with "--strict"
> >=20
> > Changes in v6:
> >    The patch series is based on v6.7-rc1. You can simply review or test=
 the
> >    patches at the link [7].
> >    - fixed some warnings/errors reported by kernel test robot <lkp@inte=
l.com>.
> >=20
> > Changes in v5:
> >    The patch series is based on v6.7-rc1. You can simply review or test=
 the
> >    patches at the link [6].
> >    - dt-bindings: improved yaml, such as:
> >      - add vendor prefix for system-ctrl property for clock generator.
> >      - Add explanation for system-ctrl property.
> >    - move sophgo,sg2042-clkgen.yaml to directly under clock folder.
> >    - fixed bugs for driver Makefile/Kconfig
> >    - continue cleaning-up debug print for driver code.
> >=20
> > Changes in v4:
> >    The patch series is based on v6.7-rc1. You can simply review or test=
 the
> >    patches at the link [5].
> >    - dt-bindings: fixed a dt_binding_check error.
> >=20
> > Changes in v3:
> >    The patch series is based on v6.7-rc1. You can simply review or test=
 the
> >    patches at the link [3].
> >    - DTS: don't use syscon but define sg2042 specific system control no=
de. More
> >      background info can read [4].
> >    - Updating minor issues in dt-bindings as per input from reviews.
> >=20
> > Changes in v2:
> >    The patch series is based on v6.7-rc1. You can simply review or test=
 the
> >    patches at the link [2].
> >    - Squashed the patch adding clock definitions with the patch adding =
the
> >      binding for the clock controller.
> >    - Updating dt-binding for syscon, remove oneOf for property compatib=
le;
> >      define clock controller as child of syscon.
> >    - DTS changes: merge sg2042-clock.dtsi into sg2042.dtsi; move clock-=
frequency
> >      property of osc to board devicethree due to the oscillator is outs=
ide the
> >      SoC.
> >    - Fixed some bugs in driver code during testing, including removing =
warnings
> >      for rv32_defconfig.
> >    - Updated MAINTAINERS info.
> >=20
> > Changes in v1:
> >    The patch series is based on v6.7-rc1. You can simply review or test=
 the
> >    patches at the link [1].
> >=20
> > Link: https://lore.kernel.org/linux-riscv/cover.1699879741.git.unicorn_=
wang@outlook.com/ [1]
> > Link: https://lore.kernel.org/linux-riscv/cover.1701044106.git.unicorn_=
wang@outlook.com/ [2]
> > Link: https://lore.kernel.org/linux-riscv/cover.1701691923.git.unicorn_=
wang@outlook.com/ [3]
> > Link: https://lore.kernel.org/linux-riscv/MA0P287MB03329AE180378E1A2E03=
4374FE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/ [4]
> > Link: https://lore.kernel.org/linux-riscv/cover.1701734442.git.unicorn_=
wang@outlook.com/ [5]
> > Link: https://lore.kernel.org/linux-riscv/cover.1701938395.git.unicorn_=
wang@outlook.com/ [6]
> > Link: https://lore.kernel.org/linux-riscv/cover.1701997033.git.unicorn_=
wang@outlook.com/ [7]
> > Link: https://lore.kernel.org/linux-riscv/cover.1704694903.git.unicorn_=
wang@outlook.com/ [8]
> > Link: https://lore.kernel.org/linux-riscv/cover.1705388518.git.unicorn_=
wang@outlook.com/ [9]
> > Link: https://lore.kernel.org/linux-riscv/cover.1706854074.git.unicorn_=
wang@outlook.com/ [10]
> > Link: https://lore.kernel.org/linux-riscv/cover.1708223519.git.unicorn_=
wang@outlook.com/ [11]
> > Link: https://lore.kernel.org/linux-riscv/cover.1708397315.git.unicorn_=
wang@outlook.com/ [12]
> > Link: https://lore.kernel.org/linux-riscv/cover.1711527932.git.unicorn_=
wang@outlook.com/ [13]
> > Link: https://lore.kernel.org/linux-riscv/cover.1711692169.git.unicorn_=
wang@outlook.com/ [14]
> > Link: https://lore.kernel.org/linux-riscv/cover.1713164546.git.unicorn_=
wang@outlook.com/ [15]
> > Link: https://lore.kernel.org/linux-riscv/cover.1714101547.git.unicorn_=
wang@outlook.com/ [16]
> >=20
> > ---
> >=20
> > Chen Wang (5):
> >    dt-bindings: clock: sophgo: add pll clocks for SG2042
> >    dt-bindings: clock: sophgo: add RP gate clocks for SG2042
> >    dt-bindings: clock: sophgo: add clkgen for SG2042
> >    clk: sophgo: Add SG2042 clock driver
> >    riscv: dts: add clock generator for Sophgo SG2042 SoC
> >=20
> >   .../bindings/clock/sophgo,sg2042-clkgen.yaml  |   61 +
> >   .../bindings/clock/sophgo,sg2042-pll.yaml     |   53 +
> >   .../bindings/clock/sophgo,sg2042-rpgate.yaml  |   49 +
> >   .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   12 +
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   55 +-
> >   drivers/clk/sophgo/Kconfig                    |   28 +
> >   drivers/clk/sophgo/Makefile                   |    4 +
> >   drivers/clk/sophgo/clk-sg2042-clkgen.c        | 1152 +++++++++++++++++
> >   drivers/clk/sophgo/clk-sg2042-pll.c           |  570 ++++++++
> >   drivers/clk/sophgo/clk-sg2042-rpgate.c        |  291 +++++
> >   drivers/clk/sophgo/clk-sg2042.h               |   18 +
> >   .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  111 ++
> >   include/dt-bindings/clock/sophgo,sg2042-pll.h |   14 +
> >   .../dt-bindings/clock/sophgo,sg2042-rpgate.h  |   58 +
> >   14 files changed, 2475 insertions(+), 1 deletion(-)
> >   create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2=
042-clkgen.yaml
> >   create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2=
042-pll.yaml
> >   create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2=
042-rpgate.yaml
> >   create mode 100644 drivers/clk/sophgo/clk-sg2042-clkgen.c
> >   create mode 100644 drivers/clk/sophgo/clk-sg2042-pll.c
> >   create mode 100644 drivers/clk/sophgo/clk-sg2042-rpgate.c
> >   create mode 100644 drivers/clk/sophgo/clk-sg2042.h
> >   create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
> >   create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h
> >   create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h
> >=20
> >=20
> > base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

--cpHK8yFQcna/Cjlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsiGwAKCRB4tDGHoIJi
0qT4AQDxSYac0TJAC/IDFVVLDk2pRCEKfzOAu9B7OGqr3uthYAD+INXJDL5HKsbS
lCEXnF6A89LnZMGllHbi/IWS9wz7fgE=
=9kiK
-----END PGP SIGNATURE-----

--cpHK8yFQcna/Cjlc--


--===============7531384595031759445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7531384595031759445==--

