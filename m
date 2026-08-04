Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AF0C55172
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 09:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxmFnJVRPLO2jIiN2gd2O5rExTBmpNUuK7c8F6i1pQw=; b=K34S72B/OC0vfwGTXjlX//K52n
	sIV0mJ0aiE8xVdpgkTDYsBfqkWjZ3Ybe530sOqI6pcfUTj3CbTJEb1dISTcnm2L1j//LyElTfO//V
	BcHTLoUOp3N3uWj1LeeVVepTlAapFOCnZ7Rusg7ypx8UgxYdX8MilVD5rSGO6FeCvuF3YB6s3kZ3M
	Qjbg3STjtGMZzGD3ZUH/reCevVN/Z+0TK2i7PXsni+SzHr0BrZfTll7aMcrf8iLkLi4fHjtAyp4/G
	xkYVittQ955RG93aZNnqUOw4k6CbSkUq16lM2EBhhnrXkJQB8LDToDuwKe37FVIZL1FnN086GJTgH
	sfWFYn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBvc-00000001UAi-3726;
	Tue, 04 Aug 2026 09:59:20 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBvX-00000001U7v-3hVR
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 09:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785837523;
	bh=eASxnIu27cM4kSePkHRjBYViS2jgTwYuVb5LZLVqwAk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=EiJ/poHO6qCniTZ85Gs5EJwiRLSwHsmmbWzp2iu4UK8c46y6Rxa2D9ADtPx7g+Z/m
	 J/MlxtFIlfW1kobx18u0cGsE+QsOkYgufa9+eftbYXfY+oCZjLAmcw++H7MMvRoRPC
	 4FVcVUOtt9cqnURkp25ztxsbaeJJiQGGyNqkR8pE=
X-QQ-mid: zesmtpgz8t1785837514tb710e2bc
X-QQ-Originating-IP: gOdDl/GieSB+p1OcvJg/0pTe9PzCnvv0wn9y3EHVhAc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 17:58:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8218745806127972950
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Tue, 04 Aug 2026 02:58:30 -0700
Message-Id: <DKG2KAJX4WFA.O51VPZ9PSCH9@linux.spacemit.com>
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
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NHmMC+6XyEPfAkj0je/tVTFyvOf/ZtCUWRX2t2mkE0Wowj2SidPTyOO+
	fjpnvihZr0V1yNs7yTsMLRLqtidAphVGTKO3V69iY7V/lbixaBYq5iyMPxJvG9UNd1Q4qEB
	w6Dp5mwApKSa9geE7DAML8eQS4ntM3AbJ759UhercaVP145lvmjW22LG7STwZvBGymiZrZX
	G7l/YrbkkpRhw3V1oWX2FiAU1gKSTfRf0MvIHOrpvnogSuaAf/dxNPYLVgmF0VD4P7ENr1X
	W0lApTjgvv0/urWfRp9W9lSTc791sQfwAt/mZ76ccdja8q06JUpsOEfZxoATM9+q2O2gCmN
	8oFg9YGVzpGFnF8TTUtbFCNxA0heObRGPJXDG11vkEC2HH/Sl4xcg6afu+Mpp5Fb+TTY3MS
	nLT6qYQx6wDXE65K7eKSE8VtP2WdwYcuDqvOF1O6hq+2kXesapcQQvb9NoyOSFR3dvp/Bkd
	oZZmD8diasbVa3DbPl+kWGN54hfoc8nOQ8NCweoZ5FyjgNvshKBDWGUtRCtIjgjwGHfAGvb
	TFcjhOXxDQw4W5+jPFjbO+7uY9J8SZRc2yK3n4ZQ8OsxkheTIh5cjL8Kk7CpZP5vi2c+e00
	+yELKsE7sW3SMzB6Z4IK3vD/cBSt9Kwp+a8LQ+br+VZZInf6/+j5pD5neqd3Az3MeuNLuJr
	aNd+b0ARaqiNZ0j3XjKdxZC+jbesAx8LzHMW68DpqbhfF372dzQGweJ4FqSwBwBEL7lI9bl
	rgdDGeZaultp/WUZnqWY2W6KhmMQ2VH/S1gzxdtuvYuaay2AP+xeMfLv9bfDxuzJsG8Utiu
	jJgG6s1NwZPLDaGHiovJqHXUnwkYJZ127zXH1p1jWJHnEnT5mDqeXKCDA/zPgW9ntOWpa9C
	wgDAaK8ssztDYH8VSBujWIuyJJeTycFpcCFh2EZjtOAbARYYE8iALPiFR96ptpZTHtCIAYg
	rImHqpy/Plc5HRBpnphRxf1Ep7vE0zcKX2M/9QwR3B0Qpcz+4zWT9PkN4D9X7ZrZpMCY83L
	LTe+DomxeoeS1zVQSPKL9VXod7nXm6Zq9hUEBYNHH35K/qY3AG/JbFbU1W0K2mCMUtPc7na
	5Q9e+ryYwP9M1lAs/xj25c=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_025916_698021_04282DFD 
X-CRM114-Status: UNSURE (   9.10  )
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
Content-Type: multipart/mixed; boundary="===============1341040737906988449=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1341040737906988449==
Content-Type: multipart/signed;
 boundary=8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff
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

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanG3xg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv3rsA/2enFw0bQFhdVHzqRfjGAS8XMICv20KQTtx7sWDo
HgV6AQCJZ2ce17LUExbaXiGqo5RUP6KShzKJeeVv+oVziPH8DQ==
=AgpX
-----END PGP SIGNATURE-----

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff--


--===============1341040737906988449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1341040737906988449==--

