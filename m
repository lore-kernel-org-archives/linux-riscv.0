Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C198C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHTJbLCzquIY2mMncOGIGnRQ0xnSOWhfw0FOA0WwmFM=; b=t42DHGEFvhGlN6DBnAZ39OEdO0
	AYqeK58Tn1kujzPOndqzDQc3JqStk0x+4SRxws++7JGYq11U0wepwLIIKEkDf8YZyIeav8KUDv75h
	EziUGXV4pDunDEfOwVHBNcW9n89wZUd8Iqb4tILNSXQXXV+ZUMiWKG5oAQiF+jkN9mj7xGXhVHzTr
	LApIki7haSOxjDHzgoUkCw0uprqePccsNU/k083xk8arY/TuejluyEwFBYIAN5TeE+qh5LsVKP5NF
	GIA87NxhlfoLEGDGy99NsyV3HrYwMDEUZwRMYk2E52yokB+rq56v9ydrQqIjGyUfRkoAeC5Drwhi4
	Uc26G+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vHk-00GIo6-05;
	Tue, 14 Nov 2023 15:25:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vHh-00GInB-24
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 15:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD3FE61326;
	Tue, 14 Nov 2023 15:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147BDC433CA;
	Tue, 14 Nov 2023 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699975500;
	bh=sKD7iy2x5fxE5EB6+uDvGE1JpLP9GBw3UM1c1ZpmCNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wlbc/7VuXxX/EU9n5788dxNTIRfUrjA+UhwKUDvGpqMC4TwXYQdhqIFszxCNYQqMo
	 vZRZ7J9tRw+WUFRwDMfJx92KLlFeyXfWXIaXWgZaMbjaHuziYldPTL8LqkI7cnbPdY
	 NeLoI0S/xaXw+vI0S0GwNM7y3ucrwYkrhEFaSg+ixGQMNu9/OZXFFh7vlvFewUFEqy
	 4VC/MJOZdNh5wkBeCKnTXcyO2JT9P719X22JnT28/Lq2ehJVYigS/qJsCtP4hFrups
	 OdQrzeM+t0gBMCLu9WTssmG+ZecB2j+OySm45GQgKsT+3VAd5L6YgXNkh9BF9UzKqG
	 xLiraGDUS667Q==
Date: Tue, 14 Nov 2023 15:24:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: separate sg2042 mtime and
 mtimecmp to fit aclint format
Message-ID: <20231114-skedaddle-precinct-66c8897227bb@squawk>
References: <MA0P287MB03326E8AF2EA63CE8CF108CBFEB2A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB49531C1FCBAB0E19CAFE19DFBBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49531C1FCBAB0E19CAFE19DFBBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_072501_769131_4AF14DBB 
X-CRM114-Status: GOOD (  23.56  )
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
Content-Type: multipart/mixed; boundary="===============0877374534668659336=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0877374534668659336==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TRf8O7Nes3xxvHJQ"
Content-Disposition: inline


--TRf8O7Nes3xxvHJQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 09:47:19AM +0800, Inochi Amaoto wrote:
> >On 2023/11/14 8:45, Inochi Amaoto wrote:
> >> Change the timer layout in the dtb to fit the format that needed by
> >> the SBI.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> Fixes: 967a94a92aaa ("riscv: dts: add initial Sophgo SG2042 SoC device=
 tree")
> >> ---
> >>   arch/riscv/boot/dts/sophgo/sg2042.dtsi | 80 +++++++++++++++---------=
--
> >>   1 file changed, 48 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/=
dts/sophgo/sg2042.dtsi
> >> index 93256540d078..0b5d93b5c783 100644
> >> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> >> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> >> @@ -93,144 +93,160 @@ clint_mswi: interrupt-controller@7094000000 {
> >>                             <&cpu63_intc 3>;
> >>           };
> >>
> >> -        clint_mtimer0: timer@70ac000000 {
> >> +        clint_mtimer0: timer@70ac004000 {
> >
> >The address of timer register is changed,  and I guess it is another cha=
nge not directly related to the topic of this patch.
> >
> >Can you please add some comments in the commit message?
> >
>=20
> As it needs to follow aclint format, the timer offset is applied to
> identify the actual timer. So there is a change.
>=20
> >>               compatible =3D "sophgo,sg2042-aclint-mtimer", "thead,c90=
0-aclint-mtimer";
> >> -            reg =3D <0x00000070 0xac000000 0x00000000 0x00007ff8>;
> >> +            reg =3D <0x00000070 0xac004000 0x00000000 0x00000000>,
> >Why the length of first item is zero? Can you please add some clarificat=
ion in commit message?
>=20
> I uses length zero to address that the mtimer is not supported, so the
> SBI can know there is no mtimer in the timer.

No, that's unacceptably hacky. If there is only one of the two registers
present, then you need to provide only one of them, not spoof the
presence of two. I suppose that means you need to add reg-names to the
binding & get your registers by name in the SBI implementation, not by
index.

--TRf8O7Nes3xxvHJQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVORRQAKCRB4tDGHoIJi
0hpKAPdj8VR56fGGhyJiFMfWFoZW5wbBqRoZOyFXCdk9rySaAP9bMYcOCBEXXicO
UjA0qR0K/9zqgTJOjAG4LxdbNASkBg==
=ToAp
-----END PGP SIGNATURE-----

--TRf8O7Nes3xxvHJQ--


--===============0877374534668659336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0877374534668659336==--

