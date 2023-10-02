Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93423E784AC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 12:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVBCJgbJ744m4q70+98PlBr86bwMDzDCaeLiLaGdQQY=; b=GadNA1Xeih/pAnqnVVxxvMo1gH
	a5wYsMrIhOPpG+hK8AO+oehOVJOhBLC1hR8xyeQV2HcMvgeK2EDK/SFMT6jxH4D2Vuk6EhzySxxec
	nNOsbSQgVnJtGMejlEHU2d5ymaA/kNsijgE5r3z9byUU8iGjJptdegerFeO3B/Jaa6+9sOMp0c1R+
	fd7toumPvch1outmrWOdmxQ4ORRJkLuDHLN3ZoMj2hz+oMLRHj/3N8r8Ib+2M07Y5pu6Yyp1e7peW
	tWlGR85bp+ULHDVYGeb2IMr73d2XXn6pa/i7LXZ6ujAW9CLpRhMk+5DcdgJB68RO/O8xAyBH0uLGH
	mSTAqk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkz-00Cg9e-2N;
	Mon, 02 Oct 2023 12:10:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkw-00Cg7A-33
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 12:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9A375B80E9B;
	Mon,  2 Oct 2023 12:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C4CC433C8;
	Mon,  2 Oct 2023 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696248633;
	bh=/LiX+txB3BRVZ32LePlO17W8hckAYNHaz2iEFDZjuJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAweR1RS3PeKDXyktGjd2NkmON/1Kn3Nrb5nYRpUPGrQSb9IwMWKAqQmwzzpAJB/U
	 hD8OOJ2YodtGDarNe5b3Qld83DSkJExcN95cczDJYwKXoo09zJ6lUyCVUfptsd3wOe
	 4eYVtPEHcTOvjMzzKoSWb1f5/+ERRpbMl+7atb3+qQZNsjGtKGV0AVtkIuXJkFHkKx
	 in5wo28KrQq5ERGacqK+eTnX8cDiqv2bqi7aPrROE725I5uQPVaH9ZFbS+LC1XZMgB
	 G3v2Rf2RycbO0Fjg1XtI1/+ZWk3z8b/C2imDTmHXb71kep0PI/yHM+SmnENUlkEagK
	 rDNZal4d4rnyg==
Date: Mon, 2 Oct 2023 13:10:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
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
Subject: Re: [PATCH 0/5] Add Milk-V Duo board support
Message-ID: <20231002-traps-prize-d5b5c0f2152d@spud>
References: <20230930123937.1551-1-jszhang@kernel.org>
 <MA0P287MB0332292A882CC400750788A8FEC7A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB0332292A882CC400750788A8FEC7A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_051035_254647_C81A7AB2 
X-CRM114-Status: GOOD (  15.24  )
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
Content-Type: multipart/mixed; boundary="===============2679092239366289168=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2679092239366289168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KFvRWj/kJia4o6i6"
Content-Disposition: inline


--KFvRWj/kJia4o6i6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 10:18:23PM +0800, Chen Wang wrote:
>=20
> =E5=9C=A8 2023/9/30 20:39, Jisheng Zhang =E5=86=99=E9=81=93:
> > Milk-V Duo[1] board is an embedded development platform based on the
> > CV1800B[2] chip. Add minimal device tree files for the development boar=
d.
> > Currently, now it's supported to boot to a basic shell.
> >=20
> > NOTE: this series is based on the SG2042 upstream series for the vendor
> > prefix and ARCH_SOPHGO option.
> Missing reference to [3].

Should be fine without it :)

> >=20
> > Link: https://milkv.io/duo [1]
> > Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]
> > Link: https://lore.kernel.org/linux-riscv/cover.1695804418.git.unicornx=
w@gmail.com/ [3]
> >=20
> > Jisheng Zhang (5):
> >    dt-bindings: interrupt-controller: Add SOPHGO CV1800B plic
> >    dt-bindings: timer: Add SOPHGO CV1800B clint
> >    dt-bindings: riscv: Add Milk-V Duo board compatibles
> >    riscv: dts: sophgo: add initial CV1800B SoC device tree
> >    riscv: dts: sophgo: add Milk-V Duo board device tree
> >=20
> >   .../sifive,plic-1.0.0.yaml                    |   1 +
> >   .../devicetree/bindings/riscv/sophgo.yaml     |   4 +
> >   .../bindings/timer/sifive,clint.yaml          |   1 +
> >   arch/riscv/boot/dts/sophgo/Makefile           |   2 +-
> >   .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  38 ++++++
> >   arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 117 ++++++++++++++++++
> >   6 files changed, 162 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >=20

--KFvRWj/kJia4o6i6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRqzMwAKCRB4tDGHoIJi
0hc/AQCrKLVIiXVABYoKX34nKht5Ha7F+ubUYXyuiEDISviTYAEAlU1seAj6AN3c
L36nj/svH9vlWR5tzkoocIkUeQ3BgAo=
=7CjF
-----END PGP SIGNATURE-----

--KFvRWj/kJia4o6i6--


--===============2679092239366289168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2679092239366289168==--

