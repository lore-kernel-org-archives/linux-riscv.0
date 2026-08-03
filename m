Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25CFC55162
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 02:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jET/UcRnJ/tBzBYjkD5N4W4EHCKTf+cd8hhvYM9EB8A=; b=JcLOPhSQq+MH2kFD1Cpg0vi38W
	wFqESRrvwGq+l20gg6JIlByO4XCNt82plyXasq7ADMY+4LEggJULwR8eF5GipUJBowzySgVeQ+ZVL
	N+RUPM2h3gkvMft10Iks/xkTHYtckDG4Df55vBccPpgdLZEUbFCmzQuDaCgS+P62VwdoucYt5lZyi
	/YaHY6LQw6//gTQrtslg+idepAS75WJas05dPGb6tDo1BX8aVJG/5aY654bIEcRkXjHqIqpxjPfrl
	xAINrCdCDDvbpfZt3gt2p6YerHjcvsQ+hA0LdF4uREpGgyjgV7eTtCddHi3kFXEcxaZVGILa2pLqs
	mVgjk1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqiSs-0000000GCKx-0EFe;
	Mon, 03 Aug 2026 02:31:42 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqiSo-0000000GCK1-2ddH
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 02:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785724220;
	bh=VHxV9t8YiiS63VYfe+5FgSlLpbL8CZ/gf+KB/A1f4zk=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=iOTT0CoKWyM4Nxf9osJcTTHEf52BPHXLT6xdoWQspjFBkQ07iCUTYWf4HhyL2Mr2m
	 vpUPg7g0x0Qeh6wK5ZSWmkWKkQ7Qvff0PaH44Zjdb7aYmmtqwPBs+Y0xpKTm3v+84y
	 A6jcKaCHwxMLBdvOmqAM2eSZQwqb0MEhVJDVEWxs=
X-QQ-mid: zesmtpgz4t1785724211tfe1ca16a
X-QQ-Originating-IP: kZcIIQPw8yJ2Ij6Xeff5lr9tzuCK2zUjxQmqPijcBAs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 10:30:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7980296911698113881
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Sun, 02 Aug 2026 19:30:08 -0700
Message-Id: <DKEYEG48XLAC.4J8YYSOVORZ8@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>, "Takashi Iwai"
 <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: spacemit: Drop redundant error messages
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
In-Reply-To: <20260731101539.36290-1-phucduc.bui@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MOuEXcjulCr6PXSMnzY77oWzbaVMPkBJhzm2qvkh0p0H/g26r5MJJLJE
	C9tfGpVMq8t6JH3qjmaTbNzTUR3eazxRCrh2P1/Xxwr1bafCVFN/chziVHL45218jMR4bVA
	yN7CpULYM6cuX3Uxr/YbrBYWxPgTIP94KWhivSvZo9UIhyfp5EPW1DwvIzUpYgu6FJYMsjM
	JwWziZfPvvpsnFwyi80kdN+FqVkUThib5ozgdSwCvTOQT4vh4nSuvT3tdXNdc7d1VPDB3F6
	ONOWUq2RmtQOqTdejbkDQHLHd8UL33SfFRtmWM+PoXo5myMpt1r/pigqeJT3+bHslQr11sa
	yMSUD3nLMdppKWYj/lqiV1CBIaedZJ1sZFoiZ0ZXVwSD393DBgxrnjnXC4QR2ESXW4muEku
	TywlDK/CPYFmpsehj8Jdbx/EDp4XrQbb6GjmHURo0Wm64VqyLOikO0pnR4wrFAs6fc2f5+v
	sufMa8Lh5Pgv1IV45sB2Ubh93ZDwF+lnIsfhRZCPVPdu1WqAObXxDPClPhatLBXunEk4cZH
	DAj9RZeNDmZ0Hk2YxWFgmlJbRIrE9bZQDn50loe4Q2ZOYyAgjaZhbl7S0IgZW/OBRicwBjK
	X1zJIhhJQWGgR8ocvXrSTmCyXAuZ4GtVM9/y3ExvaXZkAml0AZ1ZIUVYs9rS4iSrB7NHEXn
	vFRf50dpLj1l8LC+oG6CECcnOGaHOgR9hl5WA6z84pQzlwA20ymBaWW1wWJRKZ3zIhGcN85
	2EaRtOU4zZDmFu/s/HBdZ6sZgKqGtwg95SKcqAb9CCQ6ZmDvAl19DmZ9ezYREPUaHLNj6cM
	O+CXJgVVNhHEkLv0gS0ohciR6TNQC8JaK080KX/c4ws3T90TrVx03q8/BfrGyF+acG8BM5y
	dUJZ0SNAymEKlqi5Ud+6jek12A+qQMXnkJr291k9NyZ+xYoHGVvkjlhZAu5lFgBZT6XH11u
	T3ppLRbxDQmrN9Fj1anAroMo2eR+nWxfac29lfPCiQucbh4A/vJQROd5KNKPL3dUDJgZuNi
	xCUUO/ysH5OCEBnioWNPOIKDbu7jBlHxj8EtcH0X/HEXnyeSPp9lCPuS5Xxr6c6fevhP8Gy
	jwLaci76nM3+z9iZCDvpTI=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_193139_130374_AA94BC92 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Type: multipart/mixed; boundary="===============2015112816820925233=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2015112816820925233==
Content-Type: multipart/signed;
 boundary=bf64bd363e0e8996a0a5ca0feb58c7dceb1ae0c90bcd07b3717d13d5a465;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--bf64bd363e0e8996a0a5ca0feb58c7dceb1ae0c90bcd07b3717d13d5a465
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jul 31, 2026 at 3:15 AM PDT, phucduc.bui wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The called functions already log failures where appropriate. Return the
> original error directly and avoid duplicate error messages.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/spacemit/k1_i2s.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
> index cd461f2aa756..64510c9a1a89 100644
> --- a/sound/soc/spacemit/k1_i2s.c
> +++ b/sound/soc/spacemit/k1_i2s.c
> @@ -478,7 +478,7 @@ static int spacemit_i2s_probe(struct platform_device =
*pdev)
> =20
>  	i2s->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(i2s->base))
> -		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map regi=
sters\n");
> +		return PTR_ERR(i2s->base);
> =20
>  	i2s->reset =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
>  	if (IS_ERR(i2s->reset))
> @@ -495,7 +495,7 @@ static int spacemit_i2s_probe(struct platform_device =
*pdev)
>  					      &spacemit_i2s_component,
>  					      dai, 1);
>  	if (ret)
> -		return dev_err_probe(i2s->dev, ret, "failed to register component");
> +		return ret;
> =20
>  	return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_=
pcm_config, 0);
>  }
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--bf64bd363e0e8996a0a5ca0feb58c7dceb1ae0c90bcd07b3717d13d5a465
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCam/9MA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvAxQA/2DYCuc67ctUxgO1VADuU8NdphBXB5/3GDya8AM5
p+GmAQDtiqRFSDixu2qu42rj/vId1THpHiepPIVvYmqVFAwCCg==
=ZzYU
-----END PGP SIGNATURE-----

--bf64bd363e0e8996a0a5ca0feb58c7dceb1ae0c90bcd07b3717d13d5a465--


--===============2015112816820925233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2015112816820925233==--

