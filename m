Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B42C55184
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFZzaYO1Zc0+89UwkJ13DckuSlsjoHxBBfJR1efj3/A=; b=zkAy+zuQwRubwTAgxBl1VFPEuf
	9I6ivYr8hRC7n+gtJyMusSNXZmaOoqIiFY4sDnyzxTpy+fTgnp9AZF3B82CSf36P6Fx9vo4lg5aH8
	C1iHYFu3vUlkoP8Ovg/SDm7lHULnJ3mIWb3AUcf72yFGlCTRkrwsrlEwnT9wI6cLVAEeFLpd4diBc
	utx4/qW3ylP2SNwgWofFflqM2tO2qBtANcLWM4i6s3RNlvLCxx6aLTN6+bB43Rc6dgY0v8dHXZ8PD
	yjCJwdlDSf7NctS7+I1uos3L+lGyWUY/8CkVoH0iVDMPFGLkb8HKoXRM5M8o+c4za0Gjaf7fDDp99
	vwlIi/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8pC-000000018b1-3XgX;
	Tue, 04 Aug 2026 06:40:30 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8p9-000000018XF-1rD3
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 06:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785825593;
	bh=LTq95m4NZXUv56aybCVzoaczk2vxOrA0Jv2yXEWtSSY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pUpuT3lMqTwyIyGCUSq3KXSQJRdDAjys1Jse9w3haGQf0SiXXV2MamL10na6pO2Kw
	 7GLKq6g/DrYPMrjFSqfqhlA93w5mNylz1yTDjzPyY0fqrURB5zHhfTwXkb1MkZbsOz
	 uffmSub+eSyUR6DB9vPkUYx+IL7MnFVlihB6hDR0=
X-QQ-mid: esmtpsz20t1785825583t9654d158
X-QQ-Originating-IP: mRnntLrRUGnKaEWnui5APgcJXpIUBJXfl5KWk4O1viY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 14:39:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16990820903706416116
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Mon, 03 Aug 2026 23:39:39 -0700
Message-Id: <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field
 initialization
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
In-Reply-To: <20260804043036.22065-1-phucduc.bui@gmail.com>
References: <20260804043036.22065-1-phucduc.bui@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OGYfdWl7iR1yUoqnCrv/LSSPBWqy1D/a3EK12AefQl15gyP2z2sgi3jU
	fgko1I2VLlTeTSkl/6Kl74kIfpALFg7sr0JbpiPeSmc/pbYYuh4kAIGFwBkiRX4Su1qEvPI
	rOve4K7J8WB0e2VbqrY9Uk5qSpGN6Avjoj1hfCRHhPENpEBDXtmjy8hLRm1ruBVwWwGSy4R
	sX47QN5fYcEVMzJ0Ast+Ua8eZdw8ROdDBYDSFQJYzMjrD5kBAWrpEOl+tTryKz81m8qru1g
	tBmexVXuae6EpYXnfZcU7Co1XjPDDPeL/pnSsD0vFznBlpExjVpPhz8dIwFdZ1nlIiPcO7C
	AweOfl89C7j5aDSr8SGSxg03UhOIPnhRpkgryyKT5QDfambx4GDLPF58mNhFdCmGJY0yPPJ
	Bt4W9eFoFvIPeAIBzy+uLY3y0hZWndKONpZmvQLxzZ7iN4QKYgTyKjUdtA9haOMdhsZI4a1
	S2wtsd1p3mjMEmlFd03hWRCIagzwJC4P9R+DKKc0D4vfputH0W/vm+kermIUIvPrxml9h4d
	+dhh25bmRG2ZEVBoGxExZr3JnFxUfT1AFVvQeg2K/M31hSuAgL8tBuLeNod/SVke/yhRWTn
	T1lDAD9xZAdFyoYyw/H8rEFr7CNzvmoV0i5KNvrBqQE4JRoLxv55luXUf/1jlWeJC9++kk+
	QiVxHZiGgiHD8+XFKq3FC1+X7/0bzPRuintw3PvnlbRKUmwocUqqgh0HPGqwqcRZyHEq0i2
	deJqgW4gQ+JeL+wTEZitVtGGgK4cDDN3e6VKm36QsroGjuUL7wRNBYv/B8ux3jpvJeFo8CR
	j7XKnew26qNsvU2EtNZnwtbFktVlZ69R9n/1RMfBimxX9tiQpISYQ395hH4WQrLK2I/sonI
	l//QFcx0F0Af0CL/cc+DR7RRhY4ZZP/p5bOX6v0mFw1ts6yEzbYbqpYnQjnMzSY6J+E+kqi
	FZE61EcM6c7zHvj3H2Qi41JPctmS/hYalf70dMxRIu+M9c7gkIXXElcV3QiIFXhhsNAgO0K
	ZPsyG4P1nfuET2Zl5yiwQbZZf4umk/IdVFA4HuPs0Y92vLiee6J6j9EUhHjHpokfAp4IVXs
	2QyaV4PPSSj3rdz+Ex2gwRS3PILL2yAevoKhgpf0Ioy
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_234028_498831_48741B88 
X-CRM114-Status: GOOD (  12.62  )
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
Content-Type: multipart/mixed; boundary="===============7812908307780932684=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7812908307780932684==
Content-Type: multipart/signed;
 boundary=61ecdfd0fe19057f00ac6f6f76c3e71ea0f2054d2589209ef8ab808b217a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--61ecdfd0fe19057f00ac6f6f76c3e71ea0f2054d2589209ef8ab808b217a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> spacemit_i2s_init_dai() already initializes the playback and capture
> fields after duplicating the static DAI template with devm_kmemdup().
> Remove the duplicated initializers from the static template and keep
> all field initialization in spacemit_i2s_init_dai().

The code change is functionally correct, but the commit message currently
describes it only as removing redundant initialization. It also changes
which stream directions ASoC considers valid.

> @@ -354,22 +354,6 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai=
_ops =3D {
> =20
>  static struct snd_soc_dai_driver spacemit_i2s_dai =3D {
>  	.ops =3D &spacemit_i2s_dai_ops,
> -	.playback =3D {
> -		.channels_min =3D 1,
> -		.channels_max =3D 2,
> -		.rates =3D SPACEMIT_PCM_RATES,
> -		.rate_min =3D SNDRV_PCM_RATE_8000,
> -		.rate_max =3D SNDRV_PCM_RATE_48000,
> -		.formats =3D SPACEMIT_PCM_FORMATS,
> -	},
> -	.capture =3D {
> -		.channels_min =3D 1,
> -		.channels_max =3D 2,
> -		.rates =3D SPACEMIT_PCM_RATES,
> -		.rate_min =3D SNDRV_PCM_RATE_8000,
> -		.rate_max =3D SNDRV_PCM_RATE_48000,
> -		.formats =3D SPACEMIT_PCM_FORMATS,
> -	},
>  	.symmetric_rate =3D 1,
>  };

With the current static initialization, channels_min is nonzero for both
directions before dma-names is examined. snd_soc_dai_stream_valid()
therefore considers capture valid even when the device only provides a
"tx" DMA channel, which is permitted by the binding. The DMAengine PCM
code may then create a capture substream without an RX DMA channel and
fail during PCM creation.

> [...]
>
> @@ -399,6 +383,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_=
dev *i2s,
>  		dai->playback.channels_min =3D 1;
>  		dai->playback.channels_max =3D 2;
>  		dai->playback.rates =3D SPACEMIT_PCM_RATES;
> +		dai->playback.rate_min =3D SNDRV_PCM_RATE_8000;
> +		dai->playback.rate_max =3D SNDRV_PCM_RATE_48000;
>  		dai->playback.formats =3D SPACEMIT_PCM_FORMATS;
> =20
>  		i2s->playback_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
>
> [...]
>
> @@ -411,6 +397,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_=
dev *i2s,
>  		dai->capture.channels_min =3D 1;
>  		dai->capture.channels_max =3D 2;
>  		dai->capture.rates =3D SPACEMIT_PCM_RATES;
> +		dai->capture.rate_min =3D SNDRV_PCM_RATE_8000;
> +		dai->capture.rate_max =3D SNDRV_PCM_RATE_48000;
>  		dai->capture.formats =3D SPACEMIT_PCM_FORMATS;
> =20
>  		i2s->capture_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;

Initializing these fields conditionally preserves the existing
capabilities for devices with both "tx" and "rx" DMA channels, while
correctly disabling directions without a corresponding DMA channel. The
added rate_min and rate_max assignments also preserve the existing rate
constraints.

Please update the subject and commit message to describe this functional
fix rather than only the removal of redundant initialization. A possible
subject is:

  ASoC: spacemit: advertise only DMA-backed DAI streams

Since the issue was introduced with the original driver, please also add:

  Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")

                                            - Troy

--61ecdfd0fe19057f00ac6f6f76c3e71ea0f2054d2589209ef8ab808b217a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanGJKw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvrYMBAMbOjR8cB3gZnCCwoFuogtbhkkXZKuHUVOalvNnO
xLXaAP9cyjXtTVuRiipuj1Wc5jAjZomGvTqPv1ctpbtf1xqFBA==
=BzH6
-----END PGP SIGNATURE-----

--61ecdfd0fe19057f00ac6f6f76c3e71ea0f2054d2589209ef8ab808b217a--


--===============7812908307780932684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7812908307780932684==--

