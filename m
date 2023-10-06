Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94957E92FF8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 09:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egDlqfVaicOKlzqwf6up/1Nb9WSD8rYuozZ6alf6sHM=; b=JEAn+DF3pVmaat+qhiCttGPv9e
	3XTxL4c9fwLoENRwoysy3IzpHjhcV4aRytPEBuC+uRw2oQn0uk+gKWodg6mGshOK5YwZ+FY0P9kL7
	EpGvsWDs0dhYGjA62TLR1ANPmb9i1FsIrj8+r5KbE9tXY/aBRxLzyOLrhKEEZ7+r52fCM0+rfrtMC
	jsE/1I59CFaasDeI987fxeOcewiNsufQV21gSTQgRkuJx10mSEFxrNPMQP//z2VN2eRCl1DekdKtY
	7aVJTlQpG1HGlHeO7ti3PfsTidhvqoanOeOp8KZ+8csqixVPjyHc3hF76kWwtVMPd46tPd2Q2n6r5
	fyCdLG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qogjF-005LSk-1t;
	Fri, 06 Oct 2023 09:02:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qogjD-005LRO-0j
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 09:02:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-405361bba99so16850135e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696582950; x=1697187750; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AekrZMIN+BPe5vd5X22JkiYTiDkXtnH2g16+z44L6lA=;
        b=HycZF4swbioFxPoUm7wQSMxoxp5t0YpTOVcxku9Zy5eUANBbcVK9N3G8pTPYcOaLYB
         glF3eMBA0LNwbEV1LBgmY/7d5jhi5CmmpZRdAUb9Xv+MvS66JlodLCMQmeyowM/cotDA
         j9eSQZ+aWAyQPJSW4nCnql4NQumw6fB3/gJ93M3qSpJihMEPIOadeIvLruzLwJ/HheDG
         /XyjJGYm9c72o+RzOBWlfVwlx3uaqtDAetT2M3VPxrVlZmOduAMEBclluLpnh3T1R6u2
         VfocB5FOMWAF1eg9IUzOvSnyUD79+XGqatHXmb5qzOZ/qoITl28vThI8KtcIrGDmuZJh
         oMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696582950; x=1697187750;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AekrZMIN+BPe5vd5X22JkiYTiDkXtnH2g16+z44L6lA=;
        b=FLagO2Fj2QIQIRnpWq3ELH2+a+LJ+EdinJSqKLWnXbpBvRK6IX7+xKqOErUbiLfEsO
         tcsjS6yAeQ1xjWbWENCyb9v+UGF3bu0u0QWYV+YS/cQcA7uDtPgWe6Bt5YPaBbnXCV9y
         sXOX2nlLtE9nIB+5IXK1NCSCjdGJSVDTSHXuUBecI8Io2KUcPW7VD6ZD+jhkuKnEucF2
         2fAVY0PR3agP6o0zzpv52spF65UJkQG40lEKKQ5Dp7zZkaJL5nWHtjMc6fzJ0VBIp7BW
         uDbsiU1HneSZ0KWm+yLjNHxqWdGSGGGUm9FpKPdi2BDitb/r1KGWYl2P1pryrYTtHw6y
         lNsg==
X-Gm-Message-State: AOJu0YwmOs+vw8VD91cIMGu3YVMfwdbF7tGyaUCFLc8gkTvhH7YThZlV
	eMJrBTDEaAklFwgP68n2IPZbBGVm6lA=
X-Google-Smtp-Source: AGHT+IE4OR2jYadxCC90pm47th9ABHmPSukjCkHmkQrN3b9DO/ig7J0InFKRSj164iTrxy8RC3/jOQ==
X-Received: by 2002:a5d:474f:0:b0:31f:d5db:a13 with SMTP id o15-20020a5d474f000000b0031fd5db0a13mr7060019wrs.61.1696582950133;
        Fri, 06 Oct 2023 02:02:30 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t11-20020a5d534b000000b003232380ffd5sm1149279wrv.106.2023.10.06.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:02:29 -0700 (PDT)
Date: Fri, 6 Oct 2023 11:02:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: William Qiu <william.qiu@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v5 2/4] pwm: starfive: Add PWM driver support
Message-ID: <ZR_NIya611D9LyeB@orome.fritz.box>
References: <20230922092848.72664-1-william.qiu@starfivetech.com>
 <20230922092848.72664-3-william.qiu@starfivetech.com>
 <CAJM55Z8d368MAQPpnRO8giKmasN5XETP40i3JVdW_0gTF3Ktqg@mail.gmail.com>
 <ade1c061-63d8-8b48-b8e2-69416cd8aa48@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <ade1c061-63d8-8b48-b8e2-69416cd8aa48@starfivetech.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_020235_283110_CCF0454F 
X-CRM114-Status: GOOD (  29.96  )
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
Content-Type: multipart/mixed; boundary="===============5111132612261461397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5111132612261461397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jla5kCtQoKWTa8Ob"
Content-Disposition: inline


--Jla5kCtQoKWTa8Ob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 06:27:16PM +0800, William Qiu wrote:
>=20
>=20
> On 2023/9/23 20:08, Emil Renner Berthing wrote:
> > William Qiu wrote:
> >> Add Pulse Width Modulation driver support for StarFive
> >> JH7100 and JH7110 SoC.
> >>
> >> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >> ---
> >>  MAINTAINERS                |   7 ++
> >>  drivers/pwm/Kconfig        |   9 ++
> >>  drivers/pwm/Makefile       |   1 +
> >>  drivers/pwm/pwm-starfive.c | 190 +++++++++++++++++++++++++++++++++++++
> >>  4 files changed, 207 insertions(+)
> >>  create mode 100644 drivers/pwm/pwm-starfive.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index bf0f54c24f81..bc2155bd2712 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -20495,6 +20495,13 @@ F:	drivers/pinctrl/starfive/pinctrl-starfive-=
jh71*
> >>  F:	include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
> >>  F:	include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> >>
> >> +STARFIVE JH71X0 PWM DRIVERS
> >> +M:	William Qiu <william.qiu@starfivetech.com>
> >> +M:	Hal Feng <hal.feng@starfivetech.com>
> >> +S:	Supported
> >> +F:	Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml
> >> +F:	drivers/pwm/pwm-starfive-ptc.c
> >> +
> >>  STARFIVE JH71X0 RESET CONTROLLER DRIVERS
> >>  M:	Emil Renner Berthing <kernel@esmil.dk>
> >>  M:	Hal Feng <hal.feng@starfivetech.com>
> >> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> >> index 8ebcddf91f7b..e2ee0169f6e4 100644
> >> --- a/drivers/pwm/Kconfig
> >> +++ b/drivers/pwm/Kconfig
> >> @@ -569,6 +569,15 @@ config PWM_SPRD
> >>  	  To compile this driver as a module, choose M here: the module
> >>  	  will be called pwm-sprd.
> >>
> >> +config PWM_STARFIVE
> >> +	tristate "StarFive PWM support"
> >> +	depends on ARCH_STARFIVE || COMPILE_TEST
> >> +	help
> >> +	  Generic PWM framework driver for StarFive SoCs.
> >> +
> >> +	  To compile this driver as a module, choose M here: the module
> >> +	  will be called pwm-starfive.
> >> +
> >>  config PWM_STI
> >>  	tristate "STiH4xx PWM support"
> >>  	depends on ARCH_STI || COMPILE_TEST
> >> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> >> index c822389c2a24..93b954376873 100644
> >> --- a/drivers/pwm/Makefile
> >> +++ b/drivers/pwm/Makefile
> >> @@ -52,6 +52,7 @@ obj-$(CONFIG_PWM_SIFIVE)	+=3D pwm-sifive.o
> >>  obj-$(CONFIG_PWM_SL28CPLD)	+=3D pwm-sl28cpld.o
> >>  obj-$(CONFIG_PWM_SPEAR)		+=3D pwm-spear.o
> >>  obj-$(CONFIG_PWM_SPRD)		+=3D pwm-sprd.o
> >> +obj-$(CONFIG_PWM_STARFIVE)	+=3D pwm-starfive.o
> >>  obj-$(CONFIG_PWM_STI)		+=3D pwm-sti.o
> >>  obj-$(CONFIG_PWM_STM32)		+=3D pwm-stm32.o
> >>  obj-$(CONFIG_PWM_STM32_LP)	+=3D pwm-stm32-lp.o
> >> diff --git a/drivers/pwm/pwm-starfive.c b/drivers/pwm/pwm-starfive.c
> >=20
> > Hi William,
> >=20
> > You never answered my questions about what PTC is short for and if ther=
e are
> > other PWMs on the JH7110. You just removed -ptc from the name of this f=
ile..
> >=20
> Hi Emil,
>=20
> The PTC, short for PWM/TIMER/CONUTER, comes from OpenCore's ip, but only =
PWM
> mode is used in the JH7110. So the register still has the word "PTC".
> s the best way to change all the prefix to STARFIVE?

This is the first time I see mentioned that this is based on an Open-
Cores IP. It's definitely something you want to note somewhere so that
others can reuse this driver if they've incorporated the same IP into
their device.

Given the above it might be better to name this something different
entirely. The original OpenCores PTC IP seems to be single-instance,
but that's about the only difference here (i.e. the OpenCores IP lists
one clock and one reset, which this driver supports).

So it'd be easy to turn this into a generic OpenCores driver and then
use the starfive compatible string(s) to parameterize (number of
instances, register stride, etc.).

Thierry

--Jla5kCtQoKWTa8Ob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUfzSAACgkQ3SOs138+
s6GkoBAAo2YnFbKw9yRSCrbScmBZIjuZSwCQpBTVxFz/3x1RBRFl3Huq/xWwguHc
DrPkU0/N6t6X/f9zJMAwrwsG6K2U5zZhNNW63llxB1FYAydKz+DAJP05s9R4e2/H
QqVsUzmwH/lYND9/+uQQviS1dBik4Gr7chyRibP2kABPwINuYkPYcsaVBPFz2S4v
5WCxuQ98rRL2PqJszkhzWPP8SjYlxt2VIZ8INAiBZiU63YRRSScVE34721/kTzpn
jX2jGHJLJLnFp3AR+T/JAyGyLv6UJT4QhAKebJOu9IMk2u4Xyw4epVhUT13j5sLs
JMXQivDhnmnD+ESYcg0MHlyZzyezSoEse19XVd7mEwHb7+5WnVw6HCVfSQfNgEJR
KAj7EqAWD3mwzqDpjsAZz/zv8XZcWqtqkE365Aj0Z6PiIo1g4hE3lNOtOVyufhGz
O2NvJrEnjl8pxX51IzBJU9hQ0DdT9QANc5WYy7hYWSKkNtclEn/GruwYjJWHhYjm
hw6gXIikdKo5QkRTDJAgc/enjEM1jRZFg6B9HoGXMAwuupnM7ApHN2wdvJ378jaC
MsIaP4648VTF8ohlysQbtX+wsq7SSOUvUw+e1lMoEgVfmaBMkkRcq2s58qgAD8/Y
SB6msvcOBpkEbSOm2/q3XFz+Rg2LxdEyN46jHp5BF4640xMbROs=
=k6bZ
-----END PGP SIGNATURE-----

--Jla5kCtQoKWTa8Ob--


--===============5111132612261461397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5111132612261461397==--

