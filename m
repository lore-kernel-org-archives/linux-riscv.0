Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D77C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDVWgi4SGoGzAohWLZu7MrvbpMT2BkYfUvmFUeZdnP8=; b=rkrAlh1XQihqI7kaf1RBk2H3XA
	GmZvM06Mlf5ue5FMjszInhiTdvN1qAITPRTdsqMDop/F4wEQEc8fpmlibhXjG4+PhZBIVRLwxA4n3
	8yL2IGOC1Tre/j1nTPNAsxFxcx8OR0wI42wsD86+f8on66DmKjGBQgBweDGlYbpYJoIiYg3JRrSUC
	AAjlRmY2zdYCOIJXVs3UFpU6aOA+UyKOUtpt9NHFAcUgbzlIziFC9+Ce+zoMlqOTygW8EOinrkvSu
	JklBFKw60HIieaEBeiLw6H2ERP+3hQf4wCbkxjOrFKdLGVQz8rcMGF7U/egmBx+1EmFsBP+p8VSer
	K0FGhSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvIeL-00Dhdg-2l;
	Sat, 06 May 2023 14:12:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvIeI-00DhcD-2q
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 14:12:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09DBD61978;
	Sat,  6 May 2023 14:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EE7C433EF;
	Sat,  6 May 2023 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683382353;
	bh=4jL+XeItzB/ydrH9FfFh3pIsRwNuNtdzO2o90HjqPYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsA7JbIFFjCrX4+f2T7pTF3d42L0sFqsoLchdMBPeP2wp1qYQ0yKe04sxmvXU+bQ0
	 SN89+dRX6nPJVjmsw5jJuSyeJbbUtXyvgj4FCTCEhLfXrcfiLBpMGjTay8oo77Re83
	 h8sZEDt2s1rI6D+YfOTo83PDz0M8/0IwLbDkC23SSYCEDmdzIjCs1+myC2qtboESm1
	 Av4+gbb0sPZ86+JXArzdB4maOW+4c2Wp0E/XWf90aiZVdAcVyPQxz1LNrBP7YkJHz0
	 CHSb9gEtEBBuBV63k/s0aUy/aurvEyVolWCHrsoj78wdlN5TwZKRcCKfpNh3e/8oSZ
	 e6zCZQtg2qLIA==
Date: Sat, 6 May 2023 15:12:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND v2 5/6] soc: starfive: Add JH7110 AON PMU support
Message-ID: <20230506-corned-blah-19265ead2d75@spud>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-6-changhuang.liang@starfivetech.com>
 <TY3P286MB2611D930A36FDC4EA431D77398739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <20230506-doorpost-cranberry-59a46968f15e@spud>
 <TY3P286MB2611B62D9408B6D136A8676498739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <TY3P286MB2611B62D9408B6D136A8676498739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_071234_981092_EA4ACDA7 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6445503220827481540=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6445503220827481540==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tAhLt/yCXCKqLS/O"
Content-Disposition: inline


--tAhLt/yCXCKqLS/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 10:07:39PM +0800, Shengyu Qu wrote:
> Hi Conor,
>=20
> Seems a bug or something, patchwork dropped patch 1, and I didn't noticed
> that, thanks.

It's there:
https://patchwork.kernel.org/project/linux-riscv/list/?submitter=3D208605

But for whatever reason it arrived before the cover, and thus was named
differently. We've been having some list troubles lately & that may be
the cause.


--tAhLt/yCXCKqLS/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFZgTAAKCRB4tDGHoIJi
0p5GAQDh9uTf6hzzu7fU4RJW+FMZNXs/JzIGsuyZuVJPiLc3UwD9FQDVYVbYtiNM
AJm6D9sV3P5Dt7QM8sR8N1Ws0kmkaw8=
=jpgU
-----END PGP SIGNATURE-----

--tAhLt/yCXCKqLS/O--


--===============6445503220827481540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6445503220827481540==--

