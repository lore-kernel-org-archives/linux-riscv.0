Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F15C2BBCA
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jun 2024 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaZBKjOflKe1MDOmwZcvOMP+FZL8VXfZHTVPah+vsEU=; b=2x+9Lxj31r5FQCAc5j1ZKwm3s5
	RIoHj4/f8BxclL6JxskJQQtp18ZjSg+k+HmAZ+irH47SczGBScuilIBbcyQ/CdXQq/ogbJ3xCZRDB
	ZlaIY4UQyeobDctxHaOxg/t9mHB5X6w4oV2ApESZm4GoiEALhFMWtA70HMd/QEgRFTQaqn/yZn+u8
	ZhcmflxnFjSKzR8lvVnfSWTm8coUHG+TcYGz3oWG6fkaasVKVd77MH8EaTpzgqwcsqCiHPuJGEjsF
	R0aoaMzcGHOzjVU36u4AYWOY7PS/8JrDoZNY8D0CLVVLb/TwecEuKuNmtCzl/6/jO7Er2Tde2fEhP
	BW5DumqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLODH-0000000EBzJ-04DA;
	Sun, 23 Jun 2024 14:29:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLOD9-0000000EBx1-1BcF;
	Sun, 23 Jun 2024 14:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EC0B5CE0ED3;
	Sun, 23 Jun 2024 14:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A24DC4AF09;
	Sun, 23 Jun 2024 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719152931;
	bh=Sulj6itbUy1+3flZsGKJFwDIPDo/5t5fG9SM8cDRLXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4LBuvU2L8KFoo9rqzupRNRGujfrxnLr4CjlR4b7fHmg49dDe5pg0ynnt8uDzSQaD
	 84ybbtcn6R7eCva+jUY4s32uA+l1412H5s2PG4BokSAmlD8vgVdT4mNe2JD55rKlOO
	 2I9ILbaIlmssDlHdBMQmX00o+1O3usgpfVyLK0cF0UHCUGQy22xUW+l+TGVLIJTYY6
	 1vwJ/JiiQqb1D+qedznhfSKHC9wSgW+RAaLPoAVjFPscmaLjkRaHAO2HCnqZEn62k2
	 I5VMCAT7tq+gewbvy8KaxVZY4vdx0bElZ91E1iJZj5uuuqTYvm0UgCnbFpole4qQIG
	 TC8a8iB9aoqsw==
Date: Sun, 23 Jun 2024 15:28:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: sram: sunxi-sram: Add regulators child
Message-ID: <20240623-whoops-campsite-f395e64aa054@spud>
References: <20240622150731.1105901-1-wens@kernel.org>
 <20240622150731.1105901-2-wens@kernel.org>
 <171907415897.1042829.2907756455868106157.robh@kernel.org>
 <CAGb2v66MptRCWnSyJ6B1g=E9rHh0MUac1kPw56rTO6So9_Qqow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v66MptRCWnSyJ6B1g=E9rHh0MUac1kPw56rTO6So9_Qqow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_072855_721603_7C7A713B 
X-CRM114-Status: GOOD (  19.39  )
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
Content-Type: multipart/mixed; boundary="===============0099952236361584655=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0099952236361584655==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PYdSiDCKQjnV17er"
Content-Disposition: inline


--PYdSiDCKQjnV17er
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 12:46:53AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Sun, Jun 23, 2024 at 12:36=E2=80=AFAM Rob Herring (Arm) <robh@kernel.o=
rg> wrote:
> >
> >
> > On Sat, 22 Jun 2024 23:07:29 +0800, Chen-Yu Tsai wrote:
> > > From: Samuel Holland <samuel@sholland.org>
> > >
> > > Some sunxi SoCs have in-package regulators controlled by a register in
> > > the system control MMIO block. Allow a child node for this regulator
> > > device in addition to SRAM child nodes.
> > >
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > > ---
> > >  .../allwinner,sun4i-a10-system-control.yaml   | 28 +++++++++++++++++=
++
> > >  1 file changed, 28 insertions(+)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/sram/allwinner,sun4i-a10-system-control.example.dtb: syscon@3000000: regul=
ators@3000150: False schema does not allow {'compatible': ['allwinner,sun20=
i-d1-system-ldos'], 'reg': [[50331984, 4]], 'ldoa': {'regulator-min-microvo=
lt': [[1800000]], 'regulator-max-microvolt': [[1800000]]}, 'ldob': {'regula=
tor-name': ['vcc-dram'], 'regulator-min-microvolt': [[1500000]], 'regulator=
-max-microvolt': [[1500000]]}}
> >         from schema $id: http://devicetree.org/schemas/sram/allwinner,s=
un4i-a10-system-control.yaml#
> > Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-contr=
ol.example.dtb: /example-1/syscon@3000000/regulators@3000150: failed to mat=
ch any schema with compatible: ['allwinner,sun20i-d1-system-ldos']
>=20
> I'm not seeing this error locally. The binding in question for
> 'allwinner,sun20i-d1-system-ldos' was merged in v6.10-rc1 in commit
> 622bab188484 ("regulator: dt-bindings: Add Allwinner D1 system LDOs").

I only tried on top of linux-next from a few days ago, but it didn't
reproduce for me there. I think you're okay.

--PYdSiDCKQjnV17er
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZngxHgAKCRB4tDGHoIJi
0sQfAQD96o8owCYguj4oHa7KmlpJsdqfVpD8THbceykVdkgOCQEAvFs1R5+NCrZj
g40NpcmkL+upFSNv5M1M1F/4aKz+kw0=
=9opE
-----END PGP SIGNATURE-----

--PYdSiDCKQjnV17er--


--===============0099952236361584655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0099952236361584655==--

