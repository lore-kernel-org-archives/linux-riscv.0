Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C68CF9C5B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgzpkTpAVLki+jKSoA66+OCBn6A4J+j5Ee/aBPKY+sY=; b=TQv7S1rrhhRQgKd+2GabjwcMtL
	ZKbH2aLU+AG6N8hyU3DGQT+a8iRm9rEuWlgK8L6mDuOpdyvhRz43D3eKDdp4ZpYNm34rYl9VDtVNz
	HXNGjVhvzUMpt8UySw7+agwqhrTt2nGtVAmMd8dfFHCI8byTlYN9rAUzNERcnGL1niOekuY+3k6h7
	dFbIg5za3QUaKYKo8ZMWpic08PCEctXJkwj2btQnlK2FD+xYvhZC4b+lJMJdzFOc1fJEIYx45M8us
	4+nCqK/QbPacHN8/1YW04XxYgHgFPets6YPMWOa9+nGVEB5UGLXc6Wht3Pnfw55JHAEVESqAe7Rtd
	BpIzaqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfiS-0000000GspZ-28Qt;
	Mon, 23 Sep 2024 09:50:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfiQ-0000000Gsou-0OCA
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 09:50:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8317F5C5704;
	Mon, 23 Sep 2024 09:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A69C4CEC4;
	Mon, 23 Sep 2024 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727085045;
	bh=RVZepU3jl/AFxhzY6Kxw7RJAUKOyq5pDiMbVlpt9Rn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d07UV7Np7CVkx5/TuNva0slRNOWAsvjgA066kTFy1Gg8ZcABcuLq0LW5gNQtkbmZ3
	 iOM7n6MpasyxmZd0bXstdqXAkLtLFL6RFpO8vmghZGumZi7fAwGDuLPCDgwZ9gH2Y6
	 1wOXho/IX1SJCK28mVkluCbycgUarNr3d970wrNcugtxEr35P3ffH9lWpa5nOX1/tZ
	 zktLOhR6795+PeF7Jd0uHyhCgCBOvmr2rq5ixkTUJhPmqBftY0BzZr+nxUiRe02NT+
	 wzhk/BcC3JWCbMIBQmQNY7CE0wJCghWmBPIk6EEUv858W58DSZcBQby9ik33cz4p5e
	 n3Ze+VEmtjCoQ==
Date: Mon, 23 Sep 2024 10:50:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Ze Huang <18771902331@163.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
Message-ID: <20240923-gyration-enzyme-16cd3fc6d091@spud>
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064706.318793-2-18771902331@163.com>
 <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
 <33e64928-0939-434a-9e6c-5f1af57992b2@163.com>
MIME-Version: 1.0
In-Reply-To: <33e64928-0939-434a-9e6c-5f1af57992b2@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_025046_284626_64CDD00A 
X-CRM114-Status: GOOD (  20.13  )
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
Content-Type: multipart/mixed; boundary="===============5035731378181859967=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5035731378181859967==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CmBWEc4/3R/NwG79"
Content-Disposition: inline


--CmBWEc4/3R/NwG79
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 04:39:29PM +0800, Ze Huang wrote:
> On 9/16/24 11:52 PM, Krzysztof Kozlowski wrote:
> > On 16/09/2024 08:47, Ze Huang wrote:
> > > Add pinctrl device, containing default config for uart, pwm, iis, iic=
 and
> > > mmc.
> > >=20
> > > Signed-off-by: Ze Huang <18771902331@163.com>
> > > ---
> > >   arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 316 ++++++++++++++++=
+++
> > >   arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
> > >   arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
> > >   3 files changed, 336 insertions(+)
> > >   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
> > >   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
> > >=20
> > > diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/risc=
v/boot/dts/canaan/k230-pinctrl.dtsi
> > > new file mode 100644
> > > index 000000000000..0737f50d2868
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
> > > @@ -0,0 +1,316 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +/*
> > > + * Copyright (C) 2024 Ze Huang <18771902331@163.com>
> > > + */
> > > +#include "k230-pinctrl.h"
> > > +
> > > +/ {
> > > +	soc {
> > > +		pinctrl: pinctrl@91105000 {
> > That's odd style - defining SoC nodes outside of SoC DTSI. Are you sure
> > that's preferred coding style in RISC-V or Canaan?
>=20
> Pinctrl-related nodes were separated the for ease of maintenance, but the
> convention in Canaan is to place them in the board-level DTS file. Would =
it
> be better to stay consistent with their approach?

Yeah, please put them in the board-level file.

Thanks,
Conor.

--CmBWEc4/3R/NwG79
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvE58AAKCRB4tDGHoIJi
0rN7AP94xYnBjgnCL0HWYtJqG7QaraWE9l1znWbvWzh/ekL7WgD9GNQPMaJ/DEzZ
CCaqHrgIYx/vp7wm7IIp3pnEjwAcYA0=
=/Ald
-----END PGP SIGNATURE-----

--CmBWEc4/3R/NwG79--


--===============5035731378181859967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5035731378181859967==--

