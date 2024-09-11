Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4F2EE57CF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awzDW1F6p+Yv8GWGsrDrhcvVf47cyoJooaGeRShHYB8=; b=a/qdLp9KWV6WQXqBs5xJLsyzc5
	M3r2s7aSOLwAEOMtjit38ypkB6rOvDZlbW5zCW+SpXCmkwbTu9lUh9YRwqh/S2ZzjSRdFlagm36iI
	+x/6MCbadNLjiCwUqxnsMBRY1/F+EhxwrDUOFWgWV56QSf0EqaKnDSEkAghfT8Z3csk0xZcy5hJsR
	ZY+JgF5di7Vch7mvHSNb6ePFot36BU7mHzPH7uZ7l5T+QmdkSepbHShuN3oxmaxEGETN+TlQ7PZrK
	6jjJ/of6+pqVgcpQwJqylzv/Ij+Xhib8xmkOOptNdUSZwhvbp+omp9uIVP4Q7B5Re051Mf9YHVy9f
	zjBESlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soSkN-0000000AilV-3n0U;
	Wed, 11 Sep 2024 19:11:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soSkK-0000000Aiku-3pN6
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 19:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 839BF5C0764;
	Wed, 11 Sep 2024 19:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7BAC4CEC7;
	Wed, 11 Sep 2024 19:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726081879;
	bh=diP0SXIxkHbJydqL49v6X2gZprT1jmoY++ECoNAZWlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kwcgpc0/qVgRRBE0PDMC/mlecA+6Xpy+Z1z/GMj3zWR3csjY/LVSE1suhLCSR1zTN
	 GNkSYvlPcXAZKaEcPepVmNVUDeCmglmOt4R+jSER55GRvuJ8q8Rh+FR5qGzMys/D5R
	 YbQvSlnrVrCAHMUVXakxn0hB4B8m9ysc+VPvORX04lxfZ0hZJTKLYTCqUZfgf5jbrB
	 I0fdCSQUIKavfN79+QPPEQmYM0E6OEkSNi2N2Ix/IRns55+iHll7Ns9qSlaHXpHBbQ
	 QAiEkTZLDgip7u+M46vKirAh1zeD8OnVLElP0zgYv+ZecgaSV72ijYPXDxVinkUmDr
	 LKaV8ykBIeKyw==
Date: Wed, 11 Sep 2024 20:11:15 +0100
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
Message-ID: <20240911-perfectly-buddhist-0c79aed7bb98@spud>
References: <IA1PR20MB495374DB8C4208575AAC9675BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240909-prowler-renewal-0592d820ccca@spud>
 <IA1PR20MB4953A0D6A2B73D03BF162671BB992@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240910-bust-mulled-e45f6f6ef29d@spud>
 <IA1PR20MB495316205F5AC588867FA8E1BB9A2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495316205F5AC588867FA8E1BB9A2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_121121_062697_F1D89B7A 
X-CRM114-Status: GOOD (  29.01  )
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
Content-Type: multipart/mixed; boundary="===============0832291971070126617=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0832291971070126617==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ffr1Bt9qHGZE+eZ/"
Content-Disposition: inline


--ffr1Bt9qHGZE+eZ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 06:25:49AM +0800, Inochi Amaoto wrote:
> On Tue, Sep 10, 2024 at 05:13:43PM GMT, Conor Dooley wrote:
> > On Tue, Sep 10, 2024 at 06:24:34AM +0800, Inochi Amaoto wrote:
> > > On Mon, Sep 09, 2024 at 03:41:10PM GMT, Conor Dooley wrote:
> > > > On Sat, Aug 31, 2024 at 06:38:40AM +0800, Inochi Amaoto wrote:
> > > > > Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> > > > > This patch series aims to replace the previous patch from Jisheng=
 [1].
> > > > > Since the pinctrl of cv1800 has nested mux and its pin defininati=
on
> > > > > is discrete, it is not suitable to use "pinctrl-single" to cover =
the
> > > > > pinctrl device.
> > > > >=20
> > > > > This patch require another patch [2] that provides standard attri=
bute
> > > > > "input-schmitt-microvolt"
> > > > >=20
> > > > > The v4 version is from [3]
> > > >=20
> > > > Which version of this ended up in linux-next? I see a link to v4 in
> > > > what's been applied, but this v5 was sent before that code was
> > > > committed.
> > > >=20
> > > > Either way, what's been applied and what's here produce warnings:
> > > > cv1812h.dtsi:19.28-24.5: Warning (simple_bus_reg): /soc/pinctrl@300=
8000: simple-bus unit address format error, expected "3001000"
> > > > cv1800b.dtsi:18.28-23.5: Warning (simple_bus_reg): /soc/pinctrl@300=
8000: simple-bus unit address format error, expected "3001000"
> > > >=20
> > > > It's just a copy-paste error I would imagine, but please send a fix.
> > >=20
> > > Yes, it is like some copy-paste error, I will fix it.
> >=20
> > I'd rather you had sent some follow-up patches, than rebase your tree at
> > this point in the cycle. I assume you hadn't yet sent that stuff in a PR
> > to Arnd?
> >=20
> Yes, the pinctrl dts needs binding header, which is taken by Linus.
> So we hadn't sent them. This is why I sent a new version to fix this.

Oh, I'm surprised that you didn't get a shared branch from him for that
to be honest.

--ffr1Bt9qHGZE+eZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHrUgAKCRB4tDGHoIJi
0s3xAP9ysBxOhYOGk3X0TcHnR9KorTtMFJdJOSbJAt+T6+oguwEArUUlgwxXzKR4
+g2VB215ZOfEiVyNDrbLaj9srEI0AAo=
=yRNe
-----END PGP SIGNATURE-----

--ffr1Bt9qHGZE+eZ/--


--===============0832291971070126617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0832291971070126617==--

