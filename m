Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E8AE92FDE
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M89bSNVHJ8VJzetGPt1VkLmg173ZABKq7dYX1S5xAjw=; b=l6JvWfAypWgLmhDiSVKruWiMbM
	LIcetEDo21hTo4dSzzcLgfPZQvaZXXn26mRQCxXCHVl2pxigE6PVYh+1IVG8iHo4hp92RddQ6Z/JF
	C7ktD2uq1OnMBwdtwtB0pL7QKzlz9hFFnBqfYlXCmgkSSA1CK0cx56+kn/mi0N7PCh0tMZp7bV7QL
	FC3IbREsTt+zwERjKzMhMUxnc8Cc8DMoqTVXxxCRfcuH6Vrwxqy2R7lqS52v0mDY796+klZDkJWTK
	AZQiCtLQEV+dB0AucUa3GoxJwDVeZndyIaJ6w22+6ZeUenyNTwMh9kXr9mBnfLvMfNXP4qMxq85Xe
	P1e/NEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoi3r-005bMJ-2A;
	Fri, 06 Oct 2023 10:27:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoi3n-005bIm-3C;
	Fri, 06 Oct 2023 10:27:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99de884ad25so353204666b.3;
        Fri, 06 Oct 2023 03:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696588074; x=1697192874; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9Fc0FVBGB2O2+FJ3vPJiIICpzRP6mifN4XxO0k9PQQ=;
        b=PO3ol3LnsH8nwZOgCZm/AYbUhsEcSRPe1VYKZeM6HDFiQhfbthddeM+wXb53YEpMw/
         tUf0XI83M1/AdLzV0NOFUUeucpECo+GthkdskxGyKqbxuhuVwQeA9bTa/zqwNrUCiBMC
         n/+pldHVUx7xa7PZmy41MRvhDJfLXshh9b6oRnD6jAMDl2Ow5R2xaja0tj91CPEB1sJh
         8Faink1AhpkIXqYnROfTGMrAlLSHzWTSNsNJA3+aEwBTM8ervLuIvzB3wq2VJlvGtSYH
         nSnC4N17BYNKGYAx2Q3Ro+VoKCT4daFI/Yk52IRjP2tsirX1rnCsJIJQUfTFHFUgWrfl
         xjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696588074; x=1697192874;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9Fc0FVBGB2O2+FJ3vPJiIICpzRP6mifN4XxO0k9PQQ=;
        b=WOllsiE1mG6bJCzO3P5FpAsuGB1LP6aBSd12W3rjhGkCa0NDjD5IX3rz+J2mkXIPVr
         9yUBgsv/6MXDLRKl1v8Fh8ilL41+X1s7ywIWGeFcKCuA5/pze8wP1mIkV3s7ET3Km2Zq
         /3SCwmPSGsUuJAFGKfn6S7R0TWtgqh4B8cVMogOhdIyUGt2XBf42unNNq8JKgpafCdcO
         djCgKnUceM2yCPCD0D1G3mbRmzBF4OCmFM4389ASFusjiNOhLiZSY+QJHD5lJcBLIpQu
         W26wWhZbAP0Dqf8F34kog2BvrfV3IuTH5OIqg7z/kfuoE0hzU2XbhvTAjM+Tjo7tOBfO
         9a9g==
X-Gm-Message-State: AOJu0YxOsuBRMCqsL+sgTNwIsRvoAJhSr6u9otF8rGXnxT/Ymp9pba70
	ri7+VRXyAhLZDSG5epGgjHQ=
X-Google-Smtp-Source: AGHT+IE/s3qAxgyljikxvjg80luFhar2eIhtc4hXlIZiE/53LwAa/wMyWOcQaAwad6HOJwQdJ6c/EQ==
X-Received: by 2002:a17:907:72c1:b0:9ad:7d5b:ba68 with SMTP id du1-20020a17090772c100b009ad7d5bba68mr8214636ejc.32.1696588074415;
        Fri, 06 Oct 2023 03:27:54 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fi10-20020a170906da0a00b009ad8796a6aesm2627941ejb.56.2023.10.06.03.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 03:27:54 -0700 (PDT)
Date: Fri, 6 Oct 2023 12:27:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sean Young <sean@mess.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pwm@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic
 context
Message-ID: <ZR_hJ05h5O6SpM_D@orome.fritz.box>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
 <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_032756_031235_32A79EDF 
X-CRM114-Status: GOOD (  22.03  )
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
Content-Type: multipart/mixed; boundary="===============4912169016888873559=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4912169016888873559==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BBvlNbMNXcP/VVb9"
Content-Disposition: inline


--BBvlNbMNXcP/VVb9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 11:59:20AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Sean,
>=20
> On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index dc66e3405bf5..d9679ae5b2be 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -505,7 +505,7 @@ int pwm_apply_state(struct pwm_device *pwm, const s=
truct pwm_state *state)
> >  	 * is a bad idea. So make it explicit that calling this function might
> >  	 * sleep.
> >  	 */
> > -	might_sleep();
> > +	might_sleep_if(pwm_can_sleep(pwm));
> > =20
> >  	if (!pwm || !state || !state->period ||
> >  	    state->duty_cycle > state->period)
>=20
> I'd like to have a mechanism to catch drivers that missed to set
> .can_sleep. The best idea I currently have for that is to disable
> preemption if IS_ENABLED(CONFIG_PWM_DEBUG) && !pwm_can_sleep(pwm) while
> .apply() is running.
>=20
> > diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> > index b7c6045c5d08..b8b9392844e9 100644
> > --- a/drivers/pwm/pwm-fsl-ftm.c
> > +++ b/drivers/pwm/pwm-fsl-ftm.c
> > @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *pd=
ev)
> > =20
> >  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
> >  	fpc->chip.dev =3D &pdev->dev;
> > +	fpc->chip.can_sleep =3D true;
>=20
> As .apply() being callable in non-sleepable context only depends on
> .apply() I think a better place for this property is in struct pwm_ops.

What about drivers for devices that can be either sleeping or not? There
are things like regmap which can abstract those differences away, so you
could have a driver that works on both types of devices, so setting this
in ops wouldn't be correct all the time. I think can_sleep needs to be
per-chip rather than per-driver.

Thierry

--BBvlNbMNXcP/VVb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUf4SUACgkQ3SOs138+
s6Hgnw//ccRZMpPdmSrNh4HxesaeJ6IDlrZScm72UvWlvlUAATBRaIcrFiy1VnCC
WRKKcuPsxwg26Zy8KPZ2IijwVz1zNEQtEtOE53pVnCvcF3rcVBdIZlkPqJjO9Zcc
0azGAvZ4E9ExFnxycj1GpI475JXS2UkZ98rObXv53zzOVAxBdsyzhOWj9shXxPh5
d5tQj65dx5EtNFzmuo/lBfG/G8Xpqv5p8gXhWnv80xSdUcWHjhIGoJYVPrqtOXjC
dvedwv/bL55kMiymSn0oKln/X37KXdRxtHVaHXOCbGZ79kNxipW5x/+7Kuz95wTt
+JA5eClBpGErs/qCJ0JQmgo7H/0gG5CtUQPOMnWfbC5qxDO4ZL2eonCyIcV6JBEO
i/Scpl+4A24euVRkE1vyXNpihMm3svCEcbviq9aQ75UHL0cjGz9FHeGb0ACo1c6p
hSA4l+cuSY7dRgNMqcWrxkKDJNE0/hlK1LzcfxskL9jpGgvFfPbrUDKqKOQ0lDFA
fy8gReA/eA6E0jWgnbDpCs5wukqBFSXcodjz/L4POhL2dpE93MfLpFzAOQZipBD6
6FNT5jDjZC27gI000KEp5TTiPYEOiRocARTyBEQ7Rnq8UolMPGDxVEZilhRWhxzL
h8mjM8w60+lKYDG77xjN7M4cLEcOVRzxxVpjaJ0khqMaHxhZdlo=
=bA40
-----END PGP SIGNATURE-----

--BBvlNbMNXcP/VVb9--


--===============4912169016888873559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4912169016888873559==--

