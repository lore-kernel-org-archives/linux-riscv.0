Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EBFC5AC82
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 06:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vK5ieOtQDK0nlPendVy35S9BljCgrM43tkXn976zMc=; b=SwZVul0FnXC1bEgkf/E/26aG5R
	GOA1YGs4KN+6EwpAoB0Eb4LJs7PcY/wStOBkOkiohTjm2jJygOrp2n+cdao2dwMrLKdrsRgF0JxI6
	Rf7RCcAPMsdHlHwYhrnmPlEkdngLPvou0XxJnfKtdDzlu1AmYOpQ+etkPcvB2tDAX1vtWph0Dw/dB
	fSsffkShh2zDpAa3jXS8AbhX9j8dSXQgzZdr5mqUHct7iyr+xaoFWrqThP7m24dDxGmc3NSDYrGLs
	jBFq2j75I1ECdEuXp9fvF/OXwS7ai+6PxUlUSYJtIL5MRAuI3V2jwcUjcTH3am1lbq9pQMsJWhXna
	FxIv9Fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsE9E-00000007BGo-37Nh;
	Fri, 07 Aug 2026 06:33:40 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsE9B-00000007BFI-0J2T
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 06:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786084376;
	bh=5MdlN0g6g3JiytnyVknNHCb/qJjIV3yg7qNcbGc6QRg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pKwZpG1Zl4YtqXLyzCtI0aoBf1iuNV+D+H/B2ac7YDTy1Ct8sAGDLlu/MuHNgK4b5
	 F3AsES+LAoTQX9h0UY3fC3Q+cRp2pFEm6g2Y3G6QB8SBJI8Rs5FEAdOv7F04E+hH4o
	 YBHyg0X29p6XtLSEsgb2AP3nz3KgFT7S9r1IhLDM=
X-QQ-mid: zesmtpsz7t1786084374t62737953
X-QQ-Originating-IP: Sng1q14c/po68KsubI3vLuw3R4iDanUTACsAlviElMA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Aug 2026 14:32:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10684818840048973946
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Fri, 07 Aug 2026 14:32:49 +0800
Message-Id: <DKII2FXWGL7C.F6B941Z9F9J9@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: spacemit: advertise only DMA-backed DAI
 streams
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>, "Takashi Iwai"
 <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260805064348.44283-1-phucduc.bui@gmail.com>
In-Reply-To: <20260805064348.44283-1-phucduc.bui@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mx4a6RVPsZn7SPLXLOB+MH0nEuLA8OUTKEOFpsFaq4M4Y0Ot8jFfi110
	xi/ZiHTBy7E17nEUYSGgOi1lXd4ngliBqe9w6Dww3PHhPQZWyfvc2yidSfg6M8by9+3lJqW
	2t63p7dnjfn9XbrcEMryK1Lt5FmvSm51q00IgpzGki79OVFSphBxdmjqWWiCg8YTkWR8+ei
	f+iIIfo5kijlQziNongYfQ/PPZaXBD8WffagsQ7k3sEc3L7eAewrdwRn35cjz60rjYV7FGF
	QtUEanZoyMD3EzecdryAEPy9ZFKygNf+ZlgEwW77wpda/y9pRF3vnY6uqT6I6Z402kPFuin
	ArrAp7fNaHM8/fKYgSsKJdpLpv8qPbaqK8HK0WdL6uK/T0MA1eOy9iII+kZQ9+MnIG+jmJm
	n+f96Anu03IdsviUaAbYYoQvHfA3nvYtDJsmouThFWZ56rIw9dFTfqBjsXXXC9U/rMlNELR
	UZ++sZ0aqaZ3yCjSSUYGHImoDDeoeJpbtBTYCjYJHnFnnmOFGio+kj2bxHmBTN75EwCCRK8
	mIM7YThpsvq62m5VJ9Hq+CwQNhNvRoAyjuEroWMOSndrskSNE9Rr2n3gT/7bUfO/amdrNsU
	frhZvBrhiLVKhhouQigKh9fC4p4AsEd+hG1Bq4bqG/Qwt+2yyVkKtgAKdsYM8xf8cLTAWJp
	Qub0G5E5c6yJnlZ1dIwCp7j+DQG5z5s9o7bWSb/vJyy3KQfvvGfbGeWU+1X7l3R8VUDh9Rp
	p5Nj55SsFO9T4Fjw93tyVEMhhjkwAxWQWCIKxWgv41OhhJsNtCq+lphcrHk/+GIeD/L3Cxl
	++ouWuR4+aEcYmEj6hKJDmK+Ls4wP9RuS0stsFzii4zy0W2XewDlD5ELwuaPTTPhfy8+nBV
	2tN8Ycd2XLApSuU2U6RswjRMT1IJu/DHLEzRvK+cUwxaDccJJtf4SvLF4IIeCwGagBwjxS2
	FV2wVQl5IKAYGqRkHMe5cBNVRrEhcAkCJG4nQ8ndsdxajipi7Cb2kU6DKZOSo8oYfJbvlvd
	OwcLgEI3RZy8jEhuUFQh/5Dp3+e0gYAM54bIMgmqSFMOpA6C59yUti//vZyzmxrZxrMlwj+
	nDMZJ557qwy/uVK/oTT0rzAGmmaPXJJvg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_233338_263916_142927DD 
X-CRM114-Status: UNSURE (   9.37  )
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
Content-Type: multipart/mixed; boundary="===============7781789926759432360=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7781789926759432360==
Content-Type: multipart/signed;
 boundary=c237d4cb3ee5a8bd56d5cd3485a4b31cb02272d470fc4d54b8dcc63a50ab;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--c237d4cb3ee5a8bd56d5cd3485a4b31cb02272d470fc4d54b8dcc63a50ab
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Aug 5, 2026 at 2:43 PM +08, phucduc.bui wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The static DAI template initializes both playback and capture stream
> capabilities before dma-names is examined. As a result,
> snd_soc_dai_stream_valid() considers both directions valid even when the
> device only provides a single DMA channel.
>
> Move the playback and capture capability initialization into
> spacemit_i2s_init_dai(), where it is performed only for the stream
> directions backed by a corresponding DMA channel. This preserves the
> existing capabilities for devices with both "tx" and "rx" DMA channels,
> while preventing unsupported stream directions from being advertised.
>
> Initialize rate_min and rate_max together with the other stream
> capabilities to preserve the existing rate constraints.
>
> Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Please don't send out the next version so quickly. Many people may miss
it before they even have a chance to see it.

--=20
Troy Mitchell


--c237d4cb3ee5a8bd56d5cd3485a4b31cb02272d470fc4d54b8dcc63a50ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanV8EQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvAX4BAOHjCv7ECGQ4DfJ7+iuPzmRhMFbc5GAhwoISzU9Q
V/RYAQDGGrjRRBR2tC9vXENPWGWxVc78HVuyymlyDMJBTTiECA==
=8Duy
-----END PGP SIGNATURE-----

--c237d4cb3ee5a8bd56d5cd3485a4b31cb02272d470fc4d54b8dcc63a50ab--


--===============7781789926759432360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7781789926759432360==--

