Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EBBC77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 00:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Snt7D7fr2PFT6BQEVywBxqyQtdZoQYPuwBfuWlgZzaE=; b=wniHY0DcQAeD6l44XT33UWOKui
	0RFvvCIbogckXORBBzkWVJ49j87ooQwbxRyWd41g7mJZOzu3Vycy+7P/5SqByV5uiUjj0wMgb6q1U
	9hHitckEbMi88MVc9CDGxgxf0ljPPMeXYJDNXLmx4yEl32o2a66P/Dl6mdgkunsRDoEuhfRC/gYyP
	Cs/3XUlHsUTXDtEjjpp1lBaseDZb2lV65KMRdQ9+2cs8KhyY5v68bouXj2GAeTpHZ1zeETj3h3045
	XyzQWI3PAKsr6n8cGlJPlzO19PZh9iBKMQ6QqM9Eb/xRRRSFACQ23/PuCu33OMa1q8oBPVXEPmxUv
	Z5ZhV3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvoRy-00GsL7-0I;
	Mon, 08 May 2023 00:09:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvoRv-00GsKf-17
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 00:09:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 386726106E;
	Mon,  8 May 2023 00:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E14C433EF;
	Mon,  8 May 2023 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683504593;
	bh=A32A0fMavO0Ip81/GDeG/O8Dt1b/AHEN/Q9Ag7VxJ/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YzfMivA8lavBpLa0kuam03gytpAKOIxDo3i/gd5rGSh/fBFIhSC2RTH93vddmU8/d
	 3Bj8mKzdI4jbG3vWlhJ1Wa0SK16Qpvf2ryv/mxvwWgB9SN45Z1Yc0+U4B+mq0Mgg1n
	 U87vTTdAP2X5ed7PeXOrVt3Kvhd5ST2QlTPn8jmAEhYt1zNIhbSIhcnu6Kv7DozjNw
	 GbMVLl54RcV3ohYPrabVLFn5WnsvcB4yh8csgfIPnyUb4IalsjnnJJKkg+t0RzW1PH
	 ggafPW9wR5hSLPRt7fMK8kl4G+eNZHVxoYphhCT0quHS0Q/WABfFnS/B9lqb+JRL5n
	 mkzcg/jceFgrA==
Date: Mon, 8 May 2023 09:09:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] ASoC: starfive: Add JH7110 TDM driver
Message-ID: <ZFg9zpVEpVSQJrfZ@finisterre.sirena.org.uk>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-3-walker.chen@starfivetech.com>
 <TY3P286MB26118DAB0E0E2BF32C91B19F98739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <TY3P286MB26118DAB0E0E2BF32C91B19F98739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Cookie: Avoid contact with eyes.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_170955_448546_EEB7A8FC 
X-CRM114-Status: GOOD (  14.11  )
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
Content-Type: multipart/mixed; boundary="===============4164220807397046589=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4164220807397046589==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ci+RuukFZBKZOQn"
Content-Disposition: inline


--9ci+RuukFZBKZOQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 09:47:55PM +0800, Shengyu Qu wrote:
> Hi,
>=20
> > Add tdm driver support for the StarFive JH7110 SoC.
> >=20
> > Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> > ---
> >   MAINTAINERS                     |   6 +
> >   sound/soc/Kconfig               |   1 +
> >   sound/soc/Makefile              |   1 +

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--9ci+RuukFZBKZOQn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRYPc0ACgkQJNaLcl1U
h9Dmbwf/Xcbsz/f576Mnx9hVH2Cly67ZCtBddqWB7pV+pDcaXRcceHN3aX2c4LRR
wCAYUrX+SQu5hXybB4KLamAtL9zqrf0wUmZIMsPAwVSMCj4pgvabvXjvQBhCC/JE
yF7GbhvWGOIcmO4P4rCUC3wir3XvaZJUTxd31sfqRQ1QuJQld2K4tVn7GpIn+Yqm
TzwVoWu6phAweem94ZbvQD1LUL8P6jaiFTr+Y7CXhbtjKFyDPWsL//xxzqpzpxeY
C7I3om/FG2R7stwBxmjLERGtXg2b+JDKqRvUl/RCL1nUzyWa9MyoPQgkooMqnI7h
sHiUX1OQyLsOMMf6ruvYLbgC28hu0g==
=Mg6z
-----END PGP SIGNATURE-----

--9ci+RuukFZBKZOQn--


--===============4164220807397046589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4164220807397046589==--

