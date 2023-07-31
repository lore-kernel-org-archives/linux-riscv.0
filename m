Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E8EC001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQoruGBA5jPUZkClO7tQRH3aVLpn0eIP1hGhq2hlwuU=; b=BRAzl4XZZfhS4WcYNT++6wfnop
	YhfiZTA7CWrJ4pGlmtYRuMbX94WJBYptJmw3+W4HL9VnmrkLXg2+LUvDPJ7DWS+qQJtNu5Fqo2ELw
	ChaWy7uyMqQVZqGievrQULCNqdBKlmKrNKyZPSoploOf26IyUW+8nTwDQANHd0VAWkaMpGgLLeK1M
	uORzeeg3Z0E+VeOXA6odKRk+9EIGt7t0vf71w/uyt7yDgX9WxWhMMG7GHLk9D5/vlGuoaZgngfZNx
	MS+xz2tZ/MlChW0ZZ650Ol40OsG5G+gPxHJgZRYS+K+KhQgXp8CfF+1ls+vizGMe6RW9YF5I7X/sO
	eTquQ6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYLx-00H5oD-0N;
	Mon, 31 Jul 2023 19:14:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYLu-00H5nD-1A
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 19:14:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB22761276;
	Mon, 31 Jul 2023 19:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AE9C433C7;
	Mon, 31 Jul 2023 19:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690830885;
	bh=SyJU7Qt2aBIN4OyFcC5oEmHd0DxKwQmqDlVAGFvHAGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfZY9GbnMx+aOUhNak8hhNx+W4RQngWJkELmDVGW8q222cnSMnvbobDN1oms+zhPq
	 cbVaocl89DiKxBWlHYimi8lIVjOKKdGuWYEqGxdADX6HTYgNkF/bhaNpRm+5thXsSY
	 95pSQw5/dAnIbHeWNjq0VSi+To/RKfwFY9qNzU6d/4/eUCt6xAJXOAcUW5q+AntKar
	 0ORk/O7jvBbHgP4x2jVPEcuU93ljKLAk2vQDp2COzlYpPQo/dsMr+jYANsNy2HLrST
	 UBrBWz75Wxw3pzn3gUxpb0wnlkuByXvUEP/1l3Fv5WdcsVQuTaTpKYdvVRdwI4VJOk
	 N5mKreLQOiTOQ==
Date: Mon, 31 Jul 2023 20:14:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
Message-ID: <9b03c7ed-845c-494b-8c40-10d1fe923b15@sirena.org.uk>
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
 <20230731032829.127864-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230731032829.127864-3-hal.feng@starfivetech.com>
X-Cookie: Single tasking: Just Say No.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_121446_486596_B4FCD8B0 
X-CRM114-Status: GOOD (  18.85  )
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
Content-Type: multipart/mixed; boundary="===============3235605393919307966=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3235605393919307966==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7WRSfejFGo+r56WO"
Content-Disposition: inline


--7WRSfejFGo+r56WO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 11:28:28AM +0800, Hal Feng wrote:

> +static const struct jh7110_ct_pwmdac pwmdac_ct_data_shift[] = {
> +	{ .name = "left 0 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_0 },
> +	{ .name = "left 1 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_1 },
> +	{ .name = "left 2 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_2 },
> +	{ .name = "left 3 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_3 },
> +	{ .name = "left 4 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_4 },
> +	{ .name = "left 5 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_5 },
> +	{ .name = "left 6 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_6 },
> +	{ .name = "left 7 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_7 }
> +};

It's not clear to me why this is user selectable - what does the control
do?

> +static int jh7110_pwmdac_put(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol,
> +			     int pwmdac_ct)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct jh7110_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
> +	int sel = ucontrol->value.enumerated.item[0];
> +	unsigned int items;

> +	if (pwmdac_ct == PWMDAC_CT_SHIFT)
> +		dev->shift = pwmdac_ct_shift[sel].vals;
> +	else if (pwmdac_ct == PWMDAC_CT_DUTY_CYCLE)
> +		dev->duty_cycle = pwmdac_ct_duty_cycle[sel].vals;
> +	else if (pwmdac_ct == PWMDAC_CT_DATA_CHANGE)
> +		dev->data_change = pwmdac_ct_data_change[sel].vals;
> +	else if (pwmdac_ct == PWMDAC_CT_DATA_MODE)
> +		dev->data_mode = pwmdac_ct_data_mode[sel].vals;
> +	else if (pwmdac_ct == PWMDAC_CT_DATA_SHIFT)
> +		dev->data_shift = pwmdac_ct_data_shift[sel].vals;
> +
> +	return 0;
> +}

_put() operations should return 1 if the control value changes so event
generation works - please test a card using this driver with the
mixer-test selftest, it'll identify this and a bunch of other potential
issues.

> +static int jh7110_pwmdac_component_probe(struct snd_soc_component *component)
> +{
> +	snd_soc_add_component_controls(component, jh7110_pwmdac_snd_controls,
> +				       ARRAY_SIZE(jh7110_pwmdac_snd_controls));
> +	return 0;
> +}

The driver can just point to the controls from the _driver struct and
skip having a probe() function.


--7WRSfejFGo+r56WO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTICB4ACgkQJNaLcl1U
h9Bkogf7B5sn9Y3g1mTAAspid/NHj9EJnpyylKVFcCH8D0UOo11qJLylO7cb8DQw
3M6ifjvdgMPSgZiwoshQnv3dS0yPr422sWUV65Dnm9pI0lwju9mFo4mh6i0zexdi
AvQWj6reLoNjF1zn3ZSLU0qkqSTxaOebz1O9RkldqqmbcVixM4sLJOoDzhb5K76O
lfD2y7zU3/GBt/+OwRObmMLz/AlrPbPkT2YF+0txEYEIitxWHgMoqJFWJI9cdg9I
8WBjG+5nh/yKozj2EYOEGhKNjBegDGOOp/7sqWdUMdrkRNdtczS3sp5/jRHLv6ph
1AMqKDncC9OfgKfFLfJy2saNmIxWlg==
=JSoy
-----END PGP SIGNATURE-----

--7WRSfejFGo+r56WO--


--===============3235605393919307966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3235605393919307966==--

