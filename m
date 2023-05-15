Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07389C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRN4Uu4O+ipz/bwsSReSbOFNc4m39IA3TX5zECQU6tM=; b=bl2TdHxo49gRtNTEVz6a8ZziuE
	jWHA6KS1Wi4uGj3npBEBORUtjVLxSA7c5Pnr5+kIJr3u3JCHRsplBpcZFKSB9BYZRGcSWAnUhNK5h
	8J0M9v6rHQZSzPkR5+gB+oq+fGvZISLB/pmP7NnXDucy+JjW7yqWKJORbvi2BpjMMkGl4UR1DOwdw
	0B/zhWEp/EyORxYk5Xx5tNeO7mgkme08v3+Kk5YWar6f6HuKXQm5B0f2r924t+a7Knitdd745//I/
	GOdrHB01S0DQpYAeaagZTLDypvIoyUMkdgPb96qWwVogh15omlLpRtn0yt8x8M5AbXGEcLdV5I1fI
	CKFh00kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyVnM-001u4S-0f;
	Mon, 15 May 2023 10:51:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyVnJ-001u3y-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 10:51:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5129C61448;
	Mon, 15 May 2023 10:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB75C4339B;
	Mon, 15 May 2023 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684147868;
	bh=io4J5rFtWRubjfwy7aiwD5CIoNUnGdBdd48t4O4XGbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPhi5hYEqrh2Bq2YZS6bCRTjHMGCiqPxcEGfOH/RW32uvF2vxqB/EWwBq7cBibMTM
	 1C3BzSbQJH9K2Ovo9G14Nk4ytYtz0/V+2BYs5ahZHB4fldSqWYXk3jcxiGXwAZ2zgD
	 sDqlgOzO7s2wvMiH2vOegNgHeYkg2V/dgJaxOWe9b+OPYBF8JDUNto8AwztpSgqdmJ
	 JvkBWag0E+qGBTVl+l2/XACqvOfPGBp55tGqdaGPw/QV++kA+hNbBCCrh1uTevdBG+
	 7IZmKxGE7EU2H8jQ78uUYiz0FSPGDEl8l/NdyM3aTelGqsrQ7Xz57awJGIJOkgMoGn
	 EM5Xec3sGxmmA==
Date: Mon, 15 May 2023 19:51:05 +0900
From: Mark Brown <broonie@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] ASoC: starfive: Add JH7110 TDM driver
Message-ID: <ZGIOmWyxPGOuWHx+@finisterre.sirena.org.uk>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-3-walker.chen@starfivetech.com>
 <21bc5b06-3d3e-5a30-a90d-ea9f7abc6575@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <21bc5b06-3d3e-5a30-a90d-ea9f7abc6575@starfivetech.com>
X-Cookie: Avoid contact with eyes.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_035109_825184_CF861684 
X-CRM114-Status: GOOD (  16.08  )
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
Content-Type: multipart/mixed; boundary="===============2860109353427699341=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2860109353427699341==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nLJs/sEpOhNQJzse"
Content-Disposition: inline


--nLJs/sEpOhNQJzse
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 04:29:07PM +0800, Walker Chen wrote:

> I have submitted new version of patch for TDM driver. Could you please he=
lp to review and give your comments?=20

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--nLJs/sEpOhNQJzse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRiDpgACgkQJNaLcl1U
h9CHJgf8DPHBxTaAmn9FNyXgqSV4aT0FqSJQ2RK6Jgls0b5SpIQuIRWFyk+OHUiw
PlCg9J1Ohg+YDGsgvrzwqbvU0VcUmxl1IJjEcT4o2di/bm70vkqv5L/Kfm1Vfu35
SBMzYSScyEW2tk/7A1VJK4ngJssreMyJgu0O1rePTl+fkwxJaFiEnMQCVvcltvfA
H5lQp1qhqS2zz2jpBbjQJFu6vlvvDIscznZ4ItCfHPGaazC3rO9qbpLSz9jdk1aX
36mhrJEWN2Q0YEZatiFIb5B2ItoUCW3gj+QLcfaf8dN6gwGDPk+zF2hFbyE0fweh
k/dF9R3SXQCMhuxtL9ipJ9rVNjD5xQ==
=WDUc
-----END PGP SIGNATURE-----

--nLJs/sEpOhNQJzse--


--===============2860109353427699341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2860109353427699341==--

