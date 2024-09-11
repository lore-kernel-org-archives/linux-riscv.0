Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA4EE57DC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 22:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38xGzSpwrB9suf7P7H20Q5S3/ZLbhSy2oR+eWNr/hus=; b=RxyjB7mRu0d3LC5r4jrpQaZ+FN
	rmv/vCQEeFEREVHls1WynQV5CpmF+ve6TQvZubAsWzwpDfqw/vFtakGtk3NNtMUQMtSmuXG2TKaur
	xVyr7PL5q1nMVnbymwtNHT2ZGLrQzMugm6UrR6KQKu8umBlGUh1ZLFb1bmJNZSaNMg0hxaHvGP8gM
	rWQQk2ddB/jrNFKEvyPOmm25qoWsDVn++FSnsNIsxdesobntCPi74s9ZPpJD803nH16jmKBPuGn0w
	VyZvDISJcoiY7yUG3i1tlERqzmXTXDKL5KS2zssH+X2DyokJeMFNmiOfcexxXRKjbbjs3yYXoMezo
	pcHFmUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soWBd-0000000BGye-2hMN;
	Wed, 11 Sep 2024 22:51:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soWBa-0000000BGyH-2KRE
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 22:51:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39D855C0775;
	Wed, 11 Sep 2024 22:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D179DC4CEC0;
	Wed, 11 Sep 2024 22:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726095101;
	bh=HfUUqX6K3r+8VuUvm7rHqhhuSxEAqolXoqoXtRDEsxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wg82qdu163JRMoLt1yRO20gTZmg1rLm/Cl+XJC161ygHfxGVkJvinNredb7L7gwRz
	 qKsHOtLJOD6d8NE6uJGhV4jvo2bSS/p1Syj5RrzyYWGV/dC0EvzzHu+4Dmxwi20lI2
	 CwmEl3Ui/7/r0WZtSuyphNld1izlzmT4UBfEp7KIxeReUey1BA5pvxjNg/CrkwRA0e
	 /ZUHkUDllzMbkt9wgn9hNOw2KiaHxyCO+8PHdsSsstHCGmo6+JMM/ex51SxENqi6m0
	 olbmQfbvGOkguP1uO4WMxRHVr2UVo8jwmVlFr7MVqk7TE5a/pp5o41SPJDRXzCmC51
	 vLEc0xWfKCdLg==
Date: Wed, 11 Sep 2024 23:51:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] riscv: sophgo: Add pinctrl support for CV1800
 series SoC
Message-ID: <20240911-amniotic-reluctant-81eae9e66138@spud>
References: <IA1PR20MB495374DB8C4208575AAC9675BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240909-prowler-renewal-0592d820ccca@spud>
 <IA1PR20MB4953A0D6A2B73D03BF162671BB992@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240910-bust-mulled-e45f6f6ef29d@spud>
 <IA1PR20MB495316205F5AC588867FA8E1BB9A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240911-perfectly-buddhist-0c79aed7bb98@spud>
 <IA1PR20MB49538A046810421A8F24E346BB9B2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49538A046810421A8F24E346BB9B2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_155142_750356_04BFC342 
X-CRM114-Status: GOOD (  37.66  )
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
Content-Type: multipart/mixed; boundary="===============1959441556422225202=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1959441556422225202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qgvyslhUt5KCrDse"
Content-Disposition: inline


--qgvyslhUt5KCrDse
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 06:43:31AM +0800, Inochi Amaoto wrote:
> On Wed, Sep 11, 2024 at 08:11:15PM GMT, Conor Dooley wrote:
> > On Wed, Sep 11, 2024 at 06:25:49AM +0800, Inochi Amaoto wrote:
> > > On Tue, Sep 10, 2024 at 05:13:43PM GMT, Conor Dooley wrote:
> > > > On Tue, Sep 10, 2024 at 06:24:34AM +0800, Inochi Amaoto wrote:
> > > > > On Mon, Sep 09, 2024 at 03:41:10PM GMT, Conor Dooley wrote:
> > > > > > On Sat, Aug 31, 2024 at 06:38:40AM +0800, Inochi Amaoto wrote:
> > > > > > > Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> > > > > > > This patch series aims to replace the previous patch from Jis=
heng [1].
> > > > > > > Since the pinctrl of cv1800 has nested mux and its pin defini=
nation
> > > > > > > is discrete, it is not suitable to use "pinctrl-single" to co=
ver the
> > > > > > > pinctrl device.
> > > > > > >=20
> > > > > > > This patch require another patch [2] that provides standard a=
ttribute
> > > > > > > "input-schmitt-microvolt"
> > > > > > >=20
> > > > > > > The v4 version is from [3]
> > > > > >=20
> > > > > > Which version of this ended up in linux-next? I see a link to v=
4 in
> > > > > > what's been applied, but this v5 was sent before that code was
> > > > > > committed.
> > > > > >=20
> > > > > > Either way, what's been applied and what's here produce warning=
s:
> > > > > > cv1812h.dtsi:19.28-24.5: Warning (simple_bus_reg): /soc/pinctrl=
@3008000: simple-bus unit address format error, expected "3001000"
> > > > > > cv1800b.dtsi:18.28-23.5: Warning (simple_bus_reg): /soc/pinctrl=
@3008000: simple-bus unit address format error, expected "3001000"
> > > > > >=20
> > > > > > It's just a copy-paste error I would imagine, but please send a=
 fix.
> > > > >=20
> > > > > Yes, it is like some copy-paste error, I will fix it.
> > > >=20
> > > > I'd rather you had sent some follow-up patches, than rebase your tr=
ee at
> > > > this point in the cycle. I assume you hadn't yet sent that stuff in=
 a PR
> > > > to Arnd?
> > > >=20
> > > Yes, the pinctrl dts needs binding header, which is taken by Linus.
> > > So we hadn't sent them. This is why I sent a new version to fix this.
> >=20
> > Oh, I'm surprised that you didn't get a shared branch from him for that
> > to be honest.
>=20
> He did provide a shared branch, but I am not sure the right way to use=20
> it. He said it is used for SoC tree to pull it. So I think it is just=20
> used as dependency. Is it OK to just mention it in the PR and add the=20
> pinctrl dts? Or need some other git tags to tell the dependency?

It's a bit late now to be adding stuff for 6.12, but for next time what
you do is git pull the tag he gave you here
https://lore.kernel.org/all/CACRpkdZ5zAgQyo9y_nO8M0Z6b8zqbkg5H_3ceEJN6z6mHL=
4TOQ@mail.gmail.com/
into your for-next branch and then apply the dts patches to your tree
after that.

And then you make sure to write a commit message for the resulting
merge commit that explains why it was pulled.



--qgvyslhUt5KCrDse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuIe+AAKCRB4tDGHoIJi
0sWQAP9zJHUNnQx6XAhTUPqtYR8QkVnQXE1ZUWadj7m+bMedeQEAnt4gabRrmwBq
5NL00G/BsHrvbhY6qYKpkCEeOsp5yAE=
=8N+1
-----END PGP SIGNATURE-----

--qgvyslhUt5KCrDse--


--===============1959441556422225202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1959441556422225202==--

