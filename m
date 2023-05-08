Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503FBC77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 01:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHxdxu7y7DZoV70mAZ/QKC+xR14UYQCQKJl3tWp5Owg=; b=Fad0Rmuo0Tb1ihUGlIrpVfPEfU
	UgJe3VTu4/SnPj7YkURJmDjRYipDPpHJlsxKR9/cxclwXS0dwm8kBS80XLRbKpn4u1M9BqcRRGU0/
	VaDBHtuoRi7pAsuj/P00mmfitOghNorWNKE8MErGfFRLOt9E+C8ppkINDgu2fGkvruv+2G64WrWga
	Xbw9Y2sxSYyY4xuN1T5wmKYQ6zMaJ/0rs5vQwr91hN8toNN1n/7Ycgyko6EET14JilppCpFOlcJGN
	uKt/4ILiw0PK0NzWn18FU1tAec/GEJbwZn5/fVTSJ7ihv1SXJaDS9yHjz392UpAr02+iiijZLc6U3
	jfW5bErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvpi7-00GxA8-38;
	Mon, 08 May 2023 01:30:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvpi5-00Gx9j-09
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 01:30:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBDEE61DD7;
	Mon,  8 May 2023 01:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72C2C4339B;
	Mon,  8 May 2023 01:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683509437;
	bh=71tKkv/u71avtNDi58s+M3G3sV9kmPvH9mDaj5alk/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdvBvb3sKdbaCJubt4senOcamv3ec20kFlVjpx22nVFzwX6sfJtAbNPbJk+dW6+nH
	 0Ff+MRKmezq1AfMxuO3SMNsZKbFqghzjJAFuqA63SGFHxBpBs6XIbyQfxL5J9Srra9
	 1QJgjwVAEB5OA/xVpqcLHpQP+nBGIjBjI23Jyda09T8QVv4GdvomrKqaldYS12SuIq
	 6Ht+h0GwHpHGJ6YgUFx+OHs47oCAP6Vkc3HLLhZDbdme0t5Omrp8Av4x47VAG+Dhng
	 n+Ex1plvYWG6XxOiR2l8+jZIyVHuj4Te7T2Yp8Kc5WV0hEWNBhyMp+H7YWtvMD3Rsw
	 Y/6zf0NnRHtIA==
Date: Mon, 8 May 2023 10:30:34 +0900
From: Mark Brown <broonie@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: sound: Add TDM for StarFive JH7110
Message-ID: <ZFhQujhpbt/7yGGc@finisterre.sirena.org.uk>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-2-walker.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230506090116.9206-2-walker.chen@starfivetech.com>
X-Cookie: Avoid contact with eyes.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_183041_149770_E4B4BB50 
X-CRM114-Status: GOOD (  11.96  )
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
Content-Type: multipart/mixed; boundary="===============0961039296309816154=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0961039296309816154==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qWpif/cLlKqgWzLh"
Content-Disposition: inline


--qWpif/cLlKqgWzLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 06, 2023 at 05:01:14PM +0800, Walker Chen wrote:
> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--qWpif/cLlKqgWzLh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRYULkACgkQJNaLcl1U
h9BS4Qf8CgZlP8jyB6NeLlBTyYs8KyQY4c35cBZLLJ+/fu2+EGGCptpPCtHXkrnx
jPTC4V5et4pWy2E4Aqk5vHXKmsR/cvXdjXM1VrdRwculFef0xWwV29F6ru8WrW5J
pQxXzgHn2PpZrdybJ4RFmABz9V9Pe9NotLtP5yxVCqHemsg09MZSmnqObikbqXi6
eqXK/b5HAkCHQUEJyisSCY4Fcxz8XaIc1a0bP6+++bwFdnVN0zk6WS499QQWgXc8
hZNcb1x6hXYav4LKZETl4xFYUHdopNIpL7cbdsvcyF8mRGI68qK84TFxTx9kXqS5
9ZCLw0ZkIwMad6/JkDdSGqETIZ0R4g==
=TbwX
-----END PGP SIGNATURE-----

--qWpif/cLlKqgWzLh--


--===============0961039296309816154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0961039296309816154==--

