Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECA0C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py/ldo2CyY/XhfoLHVeS5Y/X6a4KE4uW1Ot9SLaevl8=; b=w65pfaya1X9oF886FUtSmCUUCL
	2v5xt+pJy84QAJToN2XzosDydjTRac6T192CVOFPdeOdM8+6ByoKCYO5m0fHECr0LX9OOfGVcgzxS
	+FVw7oXsW1717Dq/97Vdpe09F0Yse725UgQPaAcoK4mR15rmsR4niXGYoayxf7l7QXGpa55FHkwi8
	yRA1ahEiiwdZ1859MuwVoIaKacypxqDfVr3Lv4MIn14+6NncM5k5lc/rFozAsUMaWE7EMamA37Kgm
	HgLvvBl7DiaBHipB9de4kCVyV34JAlgp4TRt6HK4Jb3n8bFaKRVOKzYTbKuq128ZAwqEkZ0YM4PqT
	WfPshM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqz2D-00Gnly-1n;
	Mon, 24 Apr 2023 16:27:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqz2B-00GnlU-1U
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 16:27:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5421B6267F;
	Mon, 24 Apr 2023 16:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3476BC433EF;
	Mon, 24 Apr 2023 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682353639;
	bh=fvEq0mh5AUQNzwqp8tKYBSzSOfpXgtSJnYThK3jJ/co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrxTNc0mPXjGr5XtVHzM1S9zf0iUmFMuPC17ws2mi1Bs4gFpZ/hC27u7b+1L7fnbf
	 Kv1hjkP+zLnF1sfHw0dMhTqZxRjEz0xHmHDJtjIZN8M5cAjZsPhvo0E3OJpnIznBf/
	 FfNUHkJf0ELeugXGpgUF88t6uH5a6VaoTZdzdA8/t/5M582yND5AHlrAJYd8WiRcHx
	 Syn1VTKBB21LIO2oRwBlhPLysGKZFWQhihSiHNRO+mxuEF3sggJQAmof9X3kmG221U
	 Z2r+WEFJU1R/vAZQIGxFt5UAJ0r/8qtTTUiu31IZwZwgIJT1qCtn9u7Zp1YLGAZAAr
	 ON2KjfHmn87gA==
Date: Mon, 24 Apr 2023 17:27:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: add tdm node and sound card
Message-ID: <20230424-roundness-everybody-659599d44963@spud>
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-5-walker.chen@starfivetech.com>
 <20230421-dropper-upstage-200ae7e47092@spud>
 <607f3604-056c-6f3a-b154-0f298b870811@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <607f3604-056c-6f3a-b154-0f298b870811@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_092723_598287_A26466D3 
X-CRM114-Status: GOOD (  24.67  )
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
Content-Type: multipart/mixed; boundary="===============6815710351837995306=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6815710351837995306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j+Ycr2hphDkEqIhB"
Content-Disposition: inline


--j+Ycr2hphDkEqIhB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 11:21:11AM +0800, Walker Chen wrote:
>=20
>=20
> On 2023/4/22 0:50, Conor Dooley wrote:
> > Hey Walker,
> >=20
> > On Thu, Apr 20, 2023 at 10:41:18AM +0800, Walker Chen wrote:
> >> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
> >=20
> > Is this one of these waveshare things + a visionfive 2?
> > https://www.waveshare.com/wm8960-audio-hat.htm
>=20
> Hey Conor,
> I'm glad to receive your comments.
>=20
> Now we are using this board + VisionFive2 :
> https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/
>=20
> >=20
> > I'm a bit lost as to why this needs a whole new board, should it not
> > just be an overlay that you can apply to the existing dts?
> >=20
> > Taking this to an extreme, should I expect to see a new devicetree for
> > everything RPi hat that you decide to use with a VisionFive 2?
>=20
> For your response, I did some thinking. Because wm8960 codec is not integ=
rated
>  on the VisionFive2 board, perhaps using overlay is a better way.

Aye. I think so too. From my PoV, if this particular seeed audio board
is something you're bundling with VisionFive 2 boards on your storefront
etc, then I'm fine with taking it as an in-tree overlay.
If it is just a "random" RPi hat (that happens to be exactly what you
need for testing the audio drivers), then I don't know where to draw a
line for what is & what is not acceptable for inclusion.

In both cases, it's Emil's call.

Cheers,
Conor.

> > Also, it'd be nice to provide a Link: to where someone can find more
> > info on this combination of items. Google for "wm8960 visionfive 2"
> > gives me nothing, nor does "starfive audio card" etc.


--j+Ycr2hphDkEqIhB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEat3wAKCRB4tDGHoIJi
0jkcAP9PVqqvxUun7YG2AskDTqNN3Vw6Lcltm7vAqHee10z2JQEArKIyMolTkXjQ
rNlamogL71o+AG5sxWxXqc/9qYTm3wU=
=z1wj
-----END PGP SIGNATURE-----

--j+Ycr2hphDkEqIhB--


--===============6815710351837995306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6815710351837995306==--

