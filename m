Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F3EEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Is9ox46n3lXrMDyW8LYJgtqBGYvzQebOpobrHTXrmw=; b=iMJ0H3WrnSbLShB/IYGat6Wxh2
	MXAgreDBQ4s5f2/oC14FIEKoYPxd7+XvlBv0ozCXb7CKBIBkNieyzT8jyeXSc03wPmqYf3DIFqxA7
	RA2IM0pfSkonaUsF9TDExI34Xqr+Ew7HlYzfhcFPqdjSSc6CVO4kVA5V7DJRjnvbgzUrUFLT/rRUi
	HPyRHtDjDYrxOoxNHjBo8Qgqted5xJNZV5ZuSpiLTCzJuffRSIenqey4uVjADJ8GnKXp5Wa/DTXzE
	vVFg0K2JOsn5R/1I0dQN/44t4mn0dzWBRcH8p9absolluoRY/Mn/COebMb2XM4VEPzFDlN8wKqJzq
	FWNPJM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVBV-00BTQX-18;
	Thu, 20 Jul 2023 15:03:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVBS-00BTPD-1x;
	Thu, 20 Jul 2023 15:03:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31454996e06so748530f8f.2;
        Thu, 20 Jul 2023 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689865391; x=1690470191;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9T6xDcaGdFqXpwnBEyH6XzquYN88GIZKDHbykcmRxA=;
        b=dSEvn9QPxO9EVVW5ZGjUhUJUE3+OUOg7VWh6lwkKx+3zaEg/BnEepLUNRdoNU0j7Cz
         wyhm0EPH/tozgy0H1KYAWbgzLNDLTv8CvmCaXaZcclLRcMskp29IBudDp7X/9DhmiKlm
         HL3p3EUj9WhCU9sm01p/KtbD9vEAw+f1on0TfS8ssJvHluib1iHupvByidVbsWqzvzXJ
         6plME6LqTd/dyZ2j8xrx60lVKVk/7Tgyw88nHVYl1y57WOuQHaBuNQ1Rm2bmDTG7ahlF
         +jtPpxoBXCsAOQGw9+0lC721Of0twvgTCR7lhDxfAEnAywVrrsQ0izAvo5qRXad0Ld+Y
         D+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689865391; x=1690470191;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9T6xDcaGdFqXpwnBEyH6XzquYN88GIZKDHbykcmRxA=;
        b=Z+twtnDjfGrGn2RgsqSour0MtOuIuTa39YI5DcSyRscMUWIqw2rJ5pcRUIpSztey49
         971GI03DipFfOjFwdmcwuBfetJstvKH54s2CZETG6nkKHXlx8/rTbkrjXhFslP3VfI3/
         7lRnXOzEPMFETs5Dn5OQ9Aaa6wRAYJCfdVgdctxh6bZwokwCN1pFloyo+1JrbHuno5i1
         PENFwoXJ+1DkQu1FNbmSa+ZJNt0Og3svPEdaH9aKPSltiX23wNfMPSXIzwF+EoKlEabU
         boLP1QTjiLWix2GnYwocpKk73grqB0T9YgrylE5Awunx4VN/tddxi5NQnryyAQjHaSq6
         +rAQ==
X-Gm-Message-State: ABy/qLZzFZT8gP/BPR3p+NN5GclgkY8cYZgpV4g4KHYxIwbI1E0qgosx
	mQQlmLic+65L/1TtXmf62cE=
X-Google-Smtp-Source: APBJJlEr5CyHhhpLYp3q/AVdeWKExZ21rYH+UIIgwfGMQMwnqR91YpoT/wK/430U56C5ddPybLCc+g==
X-Received: by 2002:a5d:55ce:0:b0:313:e8bf:a77 with SMTP id i14-20020a5d55ce000000b00313e8bf0a77mr2183185wrw.5.1689865390637;
        Thu, 20 Jul 2023 08:03:10 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y16-20020a5d6150000000b00313e59cb371sm1599728wrt.12.2023.07.20.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 08:03:10 -0700 (PDT)
Date: Thu, 20 Jul 2023 17:03:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guenter Roeck <groeck@chromium.org>,
	linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pwm@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
	Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Benson Leung <bleung@chromium.org>,
	linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Walle <michael@walle.cc>,
	Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
Message-ID: <ZLlMqwAnoPzI8ONt@orome>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
 <ZLjYqwGh178EHrVY@orome>
 <20230720071033.e72hjkpghf5ooe73@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230720071033.e72hjkpghf5ooe73@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_080314_644449_274D183F 
X-CRM114-Status: GOOD (  25.21  )
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
Content-Type: multipart/mixed; boundary="===============2606418300306780448=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2606418300306780448==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CL52jB4nG8OB1M/q"
Content-Disposition: inline


--CL52jB4nG8OB1M/q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 09:10:33AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Thu, Jul 20, 2023 at 08:48:11AM +0200, Thierry Reding wrote:
> > On Fri, Jul 14, 2023 at 10:56:13PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Uwe Kleine-K=C3=B6nig (10):
> > >   pwm: Use a consistent name for pwm_chip pointers in the core
> > >   pwm: atmel-hlcdc: Use consistent variable naming
> > >   pwm: bcm-kona: Consistenly name pwm_chip variables "chip"
> > >   pwm: crc: Consistenly name pwm_chip variables "chip"
> > >   pwm: cros-ec: Consistenly name pwm_chip variables "chip"
> > >   pwm: lp3943: Consistenly name pwm_chip variables "chip"
> > >   pwm: rockchip: Consistenly name pwm_chip variables "chip"
> > >   pwm: sifive: Consistenly name pwm_chip variables "chip"
> > >   pwm: sl28cpld: Consistenly name pwm_chip variables "chip"
> > >   staging: greybus: pwm: Consistenly name pwm_chip variables "chip"
> >=20
> > This would've been much easier if it had been a single patch. Now I have
> > to either make you redo the whole series because you've misspelled PWM
> > or I have to go and update it myself in most of the above patches. Hint:
> > I'll do the latter.
>=20
> I guess you want to do s/pwm driver/PWM driver/? Fine for me, thanks.
>=20
> > There is really no reason to split this up into this many patches for
> > such a trivial change.
>=20
> Well, that's a subjective view. There are reasons to prefer several
> small patches over one big one, too. A small patch can be indiviually
> reviewed, so the "Reviewed-by: Alex Elder ..." tag only goes to the one
> change that he actually looked at and if later a fix to the sifive
> driver is to be backported to stable, the stable maintainers just pick
> the sifive one instead of one big patch.

Backports becoming more complicated would actually be a good reason not
to do this in the first place, but we've already discussed that enough
elsewhere.

> Did you skip the sl28cpld patch, or squash the fixup I sent in the reply
> to Michael Walle?

I squashed the fixup.

Thierry

--CL52jB4nG8OB1M/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS5TKsACgkQ3SOs138+
s6F+LQ//Zs8K61taGOGqAeIFgMkT8WRglsOSZQPOn2E1/c4RWwUspgRCfQs6nAN3
n1D2d2th0c0z2xfswoA6Q4TIzMyfejDbfKdslO705EbwQLXXLsOrrPJ0ART1RfsD
rfsvJ/xiJlVX9AEFK9BvNyICipw36JhttBLrai9rVpd6Qw9SrhTt635P5xY5+DhY
YK+dKHlwQYICb6dr4v14AbszZOAZsQLq2tro0AhcB7CwCUKvmZIAhGKfbj4jlsWd
Q6iS2UWxdBMV7rjl9v3OwU2+MqNQwSKQ/RAFWIN/w/jHH7gdj9H/z7I7yBVDJMyg
21uVm556sofBlWFwlVSfkng9YkM6fTBOt8Su7mV3AUZ4ufy03RMqXV29t6ks+8S+
CTztOmWniJT/lJdhkAA3H9Sv010rjRKZjvHiOCilbgDyZ8B7BNY2gl1zoBUC/WrJ
HzIwcpbVc6NQsnjFtnBMsczS9MHqIFXjHnUMSIYIhoUxRc5mnZWs+cgbzc9y16UD
N/WWzMSwkhtaXIGVo4PSkNxuTl0vHFRHdXiy7o34cANT+UwWhHrJgNFx9VTphYHY
VeP/0Qv+NWY4/6B113lh2Bq7cXY7RtyDXygdB3yraplPW3/vdU9d/kHeiHCTPRDK
/w3AlUr10ciCY/6VXaGVt3JsNpWKpK3qaI/B0lkLNJt0+ZOwHFE=
=Z1TB
-----END PGP SIGNATURE-----

--CL52jB4nG8OB1M/q--


--===============2606418300306780448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2606418300306780448==--

