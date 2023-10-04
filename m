Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855F6E7B5E5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hB88HOojYhJq6fRB1wmD1X+tht69kwqSfzszZo20BSQ=; b=ptmLtW+6/3fsbBUeb9mnHx8l9w
	all49ccR/xc/srvYEBrSsShNa1UNhK0UWfbzWgg4sgF06MBcBpAM1oK3ewR3RcTYNgJDpSECR8/WL
	iLrE2URR67Wrbrl+0DTyxR2SBvX3ovSKPY3wpynHMtIxYdZdCZrrBfYvK3nxXwKZMiMQ9zA3dV+Nv
	0kS7/BxujIgx3EZyxdqpvjBG6vyAfEfh76emIT0/SJIHzkRMPaE3QDeuzaO+nzloAcTQ3yK+bnuce
	Q7BxeWVYnaQ/i3fdaoHkiO7HxS86Q0Yn+iXAmKyOb3PWFMKaY36ak7D2GW9fRTWiWZ/TTMejBG9vU
	HbSuHB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyuk-00HD2k-2u;
	Wed, 04 Oct 2023 10:15:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxxE-00H0fs-2T
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 09:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B87DEB81D72;
	Wed,  4 Oct 2023 09:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72259C433C8;
	Wed,  4 Oct 2023 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696410842;
	bh=I3rYMvIf1yUhwIUhj4haJHoCCJeIHZ/4+nUAtJSqCwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qblW5PF6iKaPu4EmaMW7svIY6XFDdJYCqwKfbHgKUn6UeeVOJT9SzYlGpnuTA/7+Q
	 GEAPVTYd/Cg/tzlT47L8wzc4rRN2VnKBRyiLDzjxHjd96FSwPfxUf+AnJAwSaRmQ5h
	 g6sQ4+9maMPGxan8QG278OiX8OaIz6jOU4tw5iauwZGa6PUa9cpR6PJX5Th83l9BKU
	 QQ7sr1a8pnq/8KrO/fv5dHHcFgu/3K+zyUb5Bfju5brp2z6fF85FCsBLRTTIZuVV9A
	 2OWthjUMhBK2TXOg1H0eSupPxtJe7NR1TbetpxpHCkUdRoiMuxKrxQro9N/i5MPJT5
	 blEaBOfgQBtVA==
Date: Wed, 4 Oct 2023 10:13:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
Message-ID: <20231004-caregiver-deserve-71849c94dcfb@spud>
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-5-jszhang@kernel.org>
 <MA0P287MB033277186E21A09127407452FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <37021ef8-55e2-4116-8201-2ab7df9e0fc1@linaro.org>
MIME-Version: 1.0
In-Reply-To: <37021ef8-55e2-4116-8201-2ab7df9e0fc1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_021405_118971_A8723B79 
X-CRM114-Status: GOOD (  22.69  )
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
Content-Type: multipart/mixed; boundary="===============3691156575183884912=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3691156575183884912==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="66OQDBUK+rriTk/K"
Content-Disposition: inline


--66OQDBUK+rriTk/K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 09:57:33AM +0200, Krzysztof Kozlowski wrote:
> On 04/10/2023 09:23, Chen Wang wrote:
> >=20
> > =E5=9C=A8 2023/9/30 20:39, Jisheng Zhang =E5=86=99=E9=81=93:
> >> Add initial device tree for the CV1800B RISC-V SoC by SOPHGO.
> >>
> >> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >> ---
> >>   arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 117 ++++++++++++++++++++++=
++
> >>   1 file changed, 117 insertions(+)
> >>   create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >=20
> > Hi, Jisheng, as far as I know, sg2042 and cv180x are now tracked by=20
> > different people and even in sophgo, they are two independent=20
> > projects(sg2042 is target for HPC and cv180x is target for embeded=20
> > device). To facilitate future management and review, I recommend=20
> > registering the maintainer information in two entries in MAINTAINERS.=
=20
> > The example is as follows:
> >=20
> > ```
> >=20
> > SOPHGO CV180X DEVICETREES
> > M:=C2=A0 Jisheng Zhang <jszhang@kernel.org>
> > F:=C2=A0 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> > F:=C2=A0 arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >=20
> > SOPHGO SG2042 DEVICETREES
> > M:=C2=A0 Chao Wei <chao.wei@sophgo.com>
> > M:=C2=A0 Chen Wang <unicornxw@gmail.com>
> > S:=C2=A0 Maintained
> > F:=C2=A0 arch/riscv/boot/dts/sophgo/Makefile
> > F:=C2=A0 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > F:=C2=A0 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> > F:=C2=A0 arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > F:=C2=A0 Documentation/devicetree/bindings/riscv/sophgo.yaml
> > ```
> >=20
> > For Makefile and sophgo.yaml such common files, just keep in sg2042=20
> > entry should be fine.
> >=20
> > @Conor, what do you think?
>=20
> We do no have usually per-board maintainer entries (with few
> exceptions). I strongly prefer this one instead:
>=20
> https://lore.kernel.org/all/829b122da52482707b783dc3d93d3ff0179cb0ca.came=
l@perches.com/

I don't like the suggestion here for a different reason! While I'm fine
with having some per-board SoC maintainers, esp. since the cv1800 stuff
is very different to the sg2042, I want to see someone step up to apply
the patches for the whole arch/riscv/boot/dts/sophgo/ directory once more
comfortable with the process, not reduce the entry to cover just the 64
core SoC.

Thanks,
Conor.

--66OQDBUK+rriTk/K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZR0s1AAKCRB4tDGHoIJi
0pFWAQC2S8NStFU1aqWXOgFsaLD+fuUqSrLo19BriwGjhzQBLwEA4yklbNzUEuka
cPQh/dVGLRADBdz0AYcCDK/AuYgTWgc=
=Xy+m
-----END PGP SIGNATURE-----

--66OQDBUK+rriTk/K--


--===============3691156575183884912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3691156575183884912==--

