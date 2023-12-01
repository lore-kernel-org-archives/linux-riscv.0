Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668F7C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 00:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvVvoQBY5MBJSoh2dKePqcF2cBOO/cI5pS+divadLy4=; b=EijVOCHwUo9fO7kHr14yx1bWIK
	09pjXnLNBhMsYv0o/B8KSYzVwktUO+YAVD91mWXhpdVeOOl9zCD3JZbhRb37nFNmel3xLDhGJOlNm
	U59tBDxzFhpKLEWykmIf3Mr32jwj+alHqLRdR9hXrKOWEieEdwY1aFpauAQjC6+febgcMllkBfM4V
	UnLx8CxIqzDaNPSgEON+eLoHYYw5DqlKDVHMnqmC6it7YXncdU+y1kjcaIZKuA16IwN4HSGdrr82K
	3AmP7IzUs5z8NPcI5pPd4QmVFjZv75Q215rGrD9hkza79HMmbsHP5gLYZTOWWN8IFtmVYxJPKTRU1
	AF5w+twg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8raq-00CHN3-2U;
	Fri, 01 Dec 2023 00:41:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ran-00CHLp-0j
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 00:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD64762034;
	Fri,  1 Dec 2023 00:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0692BC433C8;
	Fri,  1 Dec 2023 00:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701391274;
	bh=xyNXG6SSw/FX+HmvZLvMHfne8MiBvBU5k2qUErywYyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euVkBSUhyDkac4CuPscrYU3WCYyr12e7uI7wedIrK6RwcBi0Bjh0087oE++tAsadB
	 RgWnbEBFV/sp93kZs5ULLGR7JCmaaZNSW6Ifl+nw1+VrCvC3Vl/rUiLyLOiUH+HIIi
	 djXuO+F3Rofz+qqXJDAewx/xMuSfFEtnJjzZCkbIPQfaSs79VLSSberldUhILVQkW2
	 HdzWBpkty2jZkFMb+1MiRwdz5O+LrrOEqanRQ3BYkWXa0Bw8dYb/fiI8Gn3ePkkMq+
	 7NMcZWCyHzVCypYcAxpVCQqWZed41tMOFwj0F6pdm4VeZ9Vr3h89U/sdYYl+zIpZUz
	 ZXw8HIgi+nMvA==
Date: Fri, 1 Dec 2023 00:41:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/7] Add Huashan Pi board support
Message-ID: <20231201-nullify-overhand-9fb99d0752ad@spud>
References: <20231130-radiator-cut-167bcaaa2cd6@spud>
 <IA1PR20MB4953275B5B7BB241916A937BBB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953275B5B7BB241916A937BBB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_164117_349700_4F114A6F 
X-CRM114-Status: GOOD (  17.34  )
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
Content-Type: multipart/mixed; boundary="===============3643019844682141817=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3643019844682141817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Oa6rKUcHt4IMj/fE"
Content-Disposition: inline


--Oa6rKUcHt4IMj/fE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 07:21:29AM +0800, Inochi Amaoto wrote:
> >
> >On Thu, 19 Oct 2023 07:18:00 +0800, Inochi Amaoto wrote:
> >> Huashan Pi board is an embedded development platform based on the
> >> CV1812H chip. Add minimal device tree files for this board.
> >> Currently, it can boot to a basic shell.
> >>
> >> NOTE: this series is based on the Jisheng's Milk-V Duo patch.
> >>
> >> Link: https://en.sophgo.com/product/introduce/huashan.html
> >> Link: https://en.sophgo.com/product/introduce/cv181xH.html
> >> Link: https://lore.kernel.org/linux-riscv/20231006121449.721-1-jszhang=
@kernel.org/
> >>
> >> [...]
> >
> >Applied to riscv-dt-for-next, thanks! LMK if something looks not as
> >expected.
> >
> >[1/7] dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
> >      https://git.kernel.org/conor/c/21a34e63afcc
> >[2/7] dt-bindings: timer: Add SOPHGO CV1812H clint
> >      https://git.kernel.org/conor/c/06ea2a1968a9
> >[3/7] dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
> >      https://git.kernel.org/conor/c/d7b92027834e
> >[4/7] riscv: dts: sophgo: Separate compatible specific for CV1800B soc
> >      https://git.kernel.org/conor/c/5b5dce3951b2
> >[5/7] riscv: dts: sophgo: cv18xx: Add gpio devices
> >      https://git.kernel.org/conor/c/dd791b45c866
> >[6/7] riscv: dts: sophgo: add initial CV1812H SoC device tree
> >      https://git.kernel.org/conor/c/681ec684a741
> >[7/7] riscv: dts: sophgo: add Huashan Pi board device tree
> >      https://git.kernel.org/conor/c/2c36b0cfb408
> >
> >Thanks,
> >Conor.
> >
>=20
> Hi Conor,
>=20
> Thanks for the confirmation. But I suggest to revert these patches.
> Several days ago, Sophgo informed me that CV1810 series will be
> renamed. And the Huashan Pi will switch to the chip with new name.
> To avoid unnecessary conflict, please drop these patch and I will
> prepare a new patch once the renamed chip is launched.

This is a board that exists, that you (and possibly others) have, right?


--Oa6rKUcHt4IMj/fE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWkrpAAKCRB4tDGHoIJi
0hX6AP9OHp3TzIaapwlMHyhqln64NTsByJQi4Ni2lrdwgE9f1wEAk8lHeZH8ux+P
5BlutmsXivBzaXVvkood0Zk8vTY2OwY=
=lcfp
-----END PGP SIGNATURE-----

--Oa6rKUcHt4IMj/fE--


--===============3643019844682141817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3643019844682141817==--

