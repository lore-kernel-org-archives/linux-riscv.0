Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF2AC55175
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 06:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjPDoFnUw8xYXAuIDey9j+WD5WYr/vNim6ORYYt7LVE=; b=Quy4sCd2TyKWXd0OFQtPBB79xW
	TGCwoywG58MHN8TZlb8YoDslZEBiYqudM9vbniXhjL5mUMAo0nt8g2VfZRvG7Sg+TtYD3puOxM0X9
	AkBeZLFpqw5DV60jm5ocjrjI7riySljCdq+H+rNGkW5cydpylsq0rs/fTfCo4w7ukROZ0n4EKTdFI
	uncffPqYXbR85bxeBGLx+2O2Has5vi+Ajeo4CLHkUX/yEsicwgfiDKQlngb5wUIpj74kR8q/TDC9G
	wAWFkVZU9Yu7ANSCrxcg9B+L8mUnGU5ReSYvPAbnStt5gwrwNgT9iQ6c5nu7dZjnp92ZPW8SfpXCG
	M+WYTH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmKY-0000000GSY5-3x4z;
	Mon, 03 Aug 2026 06:39:22 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmKU-0000000GSVs-3EeX
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 06:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785739127;
	bh=Cyf/k/y8sYcnNGGfb5GcBuEuO/FaLLsXj8kGmuu9NXg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=TRHpMORuPORZpaJZjLJmqkfbX76tcybnQQ2W0dQcIZ+3rQyNFrt1lgeFQgXnLeal/
	 ZXGcTzcGIA/+66TEveTujLeq4/HY4F9YZF9HJIQmIB6otMCNytytKN569yp4BUwDyt
	 a6W4Aa+HkoZ9C0LKQHoK7l/WOZZt9az6WNJUeIqg=
X-QQ-mid: zesmtpgz6t1785739117ta0f49f04
X-QQ-Originating-IP: kyQ/fgpCqoV7CFbJ4ul1NfqxMDWHXTEhy1TPJdL1y5U=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 14:38:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3503827160041228308
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Sun, 02 Aug 2026 23:38:33 -0700
Message-Id: <DKF3ONLMSCC7.23CTHB22RU044@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
In-Reply-To: <CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
	<20260731101539.36290-2-phucduc.bui@gmail.com>
	<DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
	<CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
	<CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NfQlibDnAESHH22VDhnsAIWlPTWSv1sPJB17wjN73yiFbeYE/qGuQ2ay
	zB/KllYKKq3mzNpyoDM7JW+5ee7Ngq1YxPCsen0lCCPAP9g0Gf9sgp2eY/fbk/fPj1FqKji
	cTeS0bNWMxtG8vz9g4SlmgbWR8iQq7BCWoYqZCBZ0aM+X721IJPmrYr5JBFW4XWp1WxZZk0
	ST7z8o3arqK3tHzD5KubsTpUwFQRwPEbtI1INr74+2xY+pv1GvSusAhat+7c7eoULov5PEG
	7vMVbaPnuTVikAec6cHUDqP5xXufwE0srT/kh1mGhlINK/hswvu4RcpjoGOe4Ckd3noHrAZ
	7HTI3h5n32Y0r+MJauB/34GL6jdn0823bTdmTAjHcyeh/k+rDGdCIOFNUdxFfQyW5O+pQEs
	PM8wWVpNd5YO+4KA4Ytix0zlXPR512zfDZkowC88g6BIGocvQIODqWPcXYz+tX6BZmMd5IE
	T2bZxXjLXk/I2/mtRlt7md0Dqn/dVkOcvRWoKucJoaIKYygpisa/hRAxQAiJ3lbFhx/O13o
	EGrjoivJQBGO+alkMUKMAsWPxtO41JiXuIn/vld1F5tbWnr4GHDoCSerDlSbWGZeWa0QH6G
	93o+wxM4oTlqa0IcL6EmjfM9Abq4l8VSv4vvKRfNTt11tQFJBwKwCLi7C5X9+KQbi3FvIyD
	+y4sCryjiUFwjS67V61bwNvwKbX3SSmIZA5DJdOVKU8rV5x4zsHStk/4H1ML8Pq8oyHvzOU
	TV7Bdq3u+yTaAL+gAQPXJ+YsZQoFTwzofcADoITC44wkwk1vNZyWqCvGxDIkKbSNKzNcepU
	SyHDq3Lb8PU86Q4c59a0SPYdXuvU+K4NMfUK5pLD1e+CbnPOIQiY3hYcRkpVXHoxhf3pzFH
	xw+IU/Tuddaxvdk/ewiKS0b9rZu8rvs/KOmEBQN9GFo/5JanQcAokGdD8tXwcjgXaKe6M+v
	Q6OmHbL60OsIScUCD31Wu6f73ZLogAcpi6OYab9K2hfCjIqbLR4UwvIWqWoyqXOli0Dlqah
	OZZJqdKkTLs+2BMVfrFPbHUfQP+cBSsUGyuyVC/dS2MTr1kFn0jp46rp+fbsY1ui0VoOKJG
	xbUpkFSoovrAa7q0Z6l841S+djEWxiKCIQHh4+Hts3pEniwJwX/7OK8bfX66AGl3Id1lBWJ
	AZzr
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_233919_373887_48354CC3 
X-CRM114-Status: GOOD (  10.86  )
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
Content-Type: multipart/mixed; boundary="===============8891790365125529530=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8891790365125529530==
Content-Type: multipart/signed;
 boundary=a949f4f959a9e9c73ede8a4278dba00f3ef3605053293f1a8c4444af32a1;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--a949f4f959a9e9c73ede8a4278dba00f3ef3605053293f1a8c4444af32a1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> However, unlike the Rockchip driver, spacemit_i2s_dai already has most
> of the playback
> and capture capabilities initialized statically. As a result,
> spacemit_i2s_init_dai() ends up
> assigning the same values again, for example channels_min, channels_max,
> rates,
> and formats, which seems redundant.
>
> If you think that makes sense, I can either remove those redundant
> assignments,
> or make it follow the Rockchip approach by keeping the static
> spacemit_i2s_dai
> minimal and initializing those fields only in spacemit_i2s_init_dai().

Nice catch. Please follow the Rockchip approach: keep the static
spacemit_i2s_dai minimal and initialize the playback and capture fields
conditionally in spacemit_i2s_init_dai().

Simply removing the assignments from spacemit_i2s_init_dai() would leave
channels_min nonzero for both directions in the static template.
snd_soc_dai_stream_valid() treats a direction with a nonzero channels_min
as supported, so the driver would continue advertising capture even for
a device with only a "tx" DMA. The binding permits such a configuration.

Please preserve rate_min and rate_max when moving the capability fields,
and send this change as a separate patch.

                                            - Troy

--a949f4f959a9e9c73ede8a4278dba00f3ef3605053293f1a8c4444af32a1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanA3aQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv1GoA/RVsXEtyqcJ8RIszmDUsvLd9IgXmmHhzlEIWkd7W
P8riAQDkDsHlnhNzz31IA1D0iHM2d+mqgfvD61Dyns2CnOZ3Bw==
=zb68
-----END PGP SIGNATURE-----

--a949f4f959a9e9c73ede8a4278dba00f3ef3605053293f1a8c4444af32a1--


--===============8891790365125529530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8891790365125529530==--

