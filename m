Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8221C55172
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUCoH1ZjyQoxBurzi9CzJtZSWLuXLlO7+hWnEFpUMHs=; b=qThiUoU7/jcopcT+zQe9BqYMh4
	Al/hX8NEGwNIbsjn5soy2kz9326K5qROSSwScHQ6q/2CK9/dL+PrKpgz765FbjtBnKKGOF9RpxZdM
	gVOhkXway7yRzsDlQKRWa+tTe/sniEkGUul3V4ljMmInfUnopeSWjh1L/jj78rRK+fgXp4OteqAoO
	pJD1ajBgoUNfc2X0uVs1i4kROTeC/FvSfPndPR/HD7opb8oz5F5uAK71mR9E2o2tJCXyCpXnYLL+z
	SF0kVWkJHuqbV8DUh2++L4jzdZIfNHCT/tHtkiQcMBj9f5XVAeq/CuD6JGEnghLIdeGS1sZauXWNE
	FI1L3SXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBwj-00000001UL3-44d6;
	Tue, 04 Aug 2026 10:00:29 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBwg-00000001UIK-2eUq
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 10:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785837589;
	bh=Ysd0un+5gtGIkkj7N0nhvFD98XFxC6uJDNPImhDLpDg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ZjKQBO7xnm4ykcirNDumwvXn0M+qgFMqf5/zinvR1nf28eAUWb1ajsXBVfJRlIWdo
	 w5uRO/PsGH6xbBXHaUHsBeigrhozYoFXSvgvFMjBCDWBcg6SaD5jnqTv401+8pBiny
	 3Mcu0pLvdN55E6FTPWnAOXcXiL8qtIsLGcasu7No=
X-QQ-mid: zesmtpsz6t1785837580t822d7ccb
X-QQ-Originating-IP: /deDCG4cZbZ/zIhBmDDPRVENV3b+dlp0f/0Nmm7NpCw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 17:59:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11623012881500782239
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Tue, 04 Aug 2026 02:59:36 -0700
Message-Id: <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Takashi Iwai" <tiwai@suse.com>, "Mark
 Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Goko Mell" <goku.sonxin626@gmail.com>,
 "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Kuninori Morimoto"
 <kuninori.morimoto.gx@renesas.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field
 initialization
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>
References: <20260804043036.22065-1-phucduc.bui@gmail.com>
	<DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
	<CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
In-Reply-To: <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKTBhjEpzXIfuLhsfT/M6bRBLrAVgonnDdi8WJbc39DkG4DvH9dh0+Tr
	++yoe5lQ5QzXPAZZLPPzOldHRwDDlWTz7h6+DwplZK8d1XRtppcAeVTlIK38W46VHyX8yIQ
	4EMyNsoUlOmqn2oDpOdEG6BZ5IRBRfTbuOkiK/ckZ2Me2MsYgONx5Fm+9+THPnwgzF34LAU
	zK0oi22fjQ6PseZSANfk+Q9CFSpd1F+SWwelz697kPbvYIBiVrdpFbQRxTNGlR0cgk/mrf0
	REh4MbeRV90D2qjYtX+iUAbqKb65z9GrrcFhtW4+I4RBnc4fLCx3KOzXjT6mqT6OPKHmMLs
	A6tcJJ1m8pmI7olVTVrj4B4SbSx9bxUyUBa7cDE47l8YWtizxbC63qhDXnDSv/2APzrkW0s
	iXVAe0Jtdrl8ZKcHm0y6nbDJ622CeJjZVj8YVKFJxVLUez5y0xdTAGXJJ4U6L/YYLMeM5vE
	CU3Z0iikATaXyca8HP/Bj1L7MFDis9Da1anWCU8jIqJ8IP0KFP+pToKsHhDlHMrlEMUrzIe
	7x/yJKrvsyKRaj4i4Zzhdn1wA74zFCuN75l9xoq/dPusgpiFffcrDNUOuPTQ/IkpdEuIi5n
	geQzEH3JIoC5nN8R6MpDIwqM42f6v9B8l+MXEGqFwXSY1JUvphuaD2rSjdiaZ+bOh08HgJA
	x/+aUnO0slwz4tFwjYHOLDydl94e3YAYbWYtk3fBF+cAGkR30KFowA21BkeCFhP4jpMZMjh
	UZN+j8KmJlVOVI7A8hIGEeyI3PjzHfPUXQnIjlWLPyrbcTxeNwsNJhmutxrEJFp0MegRZqJ
	ddML83kGLggJLPRBpAQaf+Ze1m1zf2cT0q+RI19GH+3UCBIGwgna1x8BF4tEYCt+zXG36jO
	jhlbHxhrwOscCnYJ50p0bozz2BAmcRezHtt25ij3lIdPSVRLdEu0S83obZYllSNW/EUEkIf
	zNfcwxkp+2UKd/Y2jZvFNOm8WDTbkfAcVTimitLaOLctUCVXTKnGFlGiqJM+BnHfG2j7es5
	bSJlxH2Fb18x1BpGDqoOnXTdKYFi3KaP/HLalvcdc9zup/WfFaq+9RGACyfVF76qTbOMwjz
	E/Ts74+A2cNwkIwJmn5icwZv3HiYaXzOBYyewhhiYbfhJ+w2wh7987Eu5VFji9TrDx3nraO
	TZ8FhrYRtr8P/N4=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_030027_561645_ADCD3680 
X-CRM114-Status: GOOD (  10.34  )
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
Content-Type: multipart/mixed; boundary="===============8871616310543159755=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8871616310543159755==
Content-Type: multipart/signed;
 boundary=0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> I traced the probe path and confirmed that snd_soc_dai_stream_valid()
> is called from soc_new_pcm().
> However, I still couldn't see where a nonzero channels_min alone leads
> to creating a capture substream
> without an RX DMA channel.
> To avoid confusion, I'm referring specifically to the DMA-based
> configuration, not PIO mode.
> Could you point me to the relevant call path?

More precisely, channels_min alone is not sufficient. The codec DAI must
also support capture (or be the dummy DAI for a dynamic link), and the link
must not be playback_only.

Under those conditions, the path is:

  soc_new_pcm()
    -> soc_get_playback_capture()
    -> soc_create_pcm(..., capture =3D 1)
    -> snd_pcm_new()
    -> snd_pcm_new_stream(CAPTURE, 1)
    -> snd_soc_pcm_component_new()
    -> dmaengine_pcm_new()

dmaengine_pcm_request_chan_of() tolerates a missing "rx" channel and leaves
pcm->chan[CAPTURE] NULL. Once the capture substream exists,
dmaengine_pcm_new() returns -EINVAL with
"Missing dma channel for stream: 1".
The conditional initialization prevents the CPU DAI from advertising that
direction for a tx-only node.

                                            - Troy

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanG4CA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvmhgA/iKim769XKKzBMQSQN0e0WT8cDcERmf6hZVpFc2P
GucAAQCL7rMgg02LAyIJm55KkoPR7IBfAkfgUjclm5YznSGKCg==
=QizS
-----END PGP SIGNATURE-----

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3--


--===============8871616310543159755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8871616310543159755==--

