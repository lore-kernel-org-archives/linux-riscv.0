Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1119C04A68
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jul 2022 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc7tnlg+t64JxvaysstkXwtP2T4QjGlLhGlnGEUa+Cg=; b=hOOJzYMuN6L6TeDQoZh+nTeXU9
	qnZ+FTkH3ruPUnHtmpB6sKOyhO41lDFilmTkt6LK95bABuGbRHFw66g09fP8iqlVXkudtEoh5gmP8
	am70OB53kE6XyGPBNDukb6+1G7yV2K2/NiSULPC9yon76aBLnfyzq5/O47mUOuD3NnouRqqaTAEF9
	iedsHo9jopHSGp0YWus2AL0zFwfUOz0/YLnFe7Bq3mIAXYcxXlambzfZa+xlCcaE8IvTGlb2jPBhH
	2PAwWok2AIQhLjHuWkr1ShHeJuRIxOSRciC+h1JmGBoK02FVXdki8gS3cJy+3AO3rT5mPhwiKctWR
	0GcHfSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH73Z-00C8bw-VH; Thu, 28 Jul 2022 17:12:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH73W-00C8Rm-Ni
	for linux-riscv@lists.infradead.org; Thu, 28 Jul 2022 17:12:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id b11so4200343eju.10
        for <linux-riscv@lists.infradead.org>; Thu, 28 Jul 2022 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uzaYzu/7YpWdMzqpQ1Y/ZAohuFNkiDQbSm5ara1NJVU=;
        b=BAsucz+Hz5v/kpd7FHUcdbnOqnjbw0IdK3L6ici654KuNt+EXJEmCp6iU2f2xjvDuV
         i7PkEEn0r/64W3x9f3vehW24PEN1pvanEVIUIc3y9mz7tBrZ92RYrZlF1Fi7qqFye6up
         pFO9+LC7S7fB2/iqkqO0/Mh6X2lJISc/In+oC5eHxM+j1Sm+1N8uszIOHjq08wG/bSco
         0lu8DsTCrkwUqrMlh2nELFXOWR9PoDe88AEBKSjdz9THeRQMYYqdilYNNWshAMJKttlX
         FQUwirmEnbvonChSTQwMD43+JpQsKd5YN4yBRVDc6YHLHfTtAlxs/jxPep67QGbclYVE
         LisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uzaYzu/7YpWdMzqpQ1Y/ZAohuFNkiDQbSm5ara1NJVU=;
        b=AfLyEqa5X5V1uvbZWldkHsODX+QFSOwUbIeeI7ptqVltjOtOclyhR3uNr5Um+aSpl6
         VVfxabhAl6V4Pz6DEF2UVgoXgNJGy3cvm86S70mhtKz+aYcy0jrt1SyYFU2TACAwQWUD
         ajOcscK+/Uu2lEUhb/EA1aWkkTfxlKV3OK75JrbmdO0CRqdKLpmwdSoiGQMP1bVCDMyu
         iIb9LkWn4XMoRMEDIzNQNlbHd82Uz4dpo9dHhdSknIrMgY15/7nIyxlk4X3BZzLVpwnI
         foJw/04d4T4YcYRifKbOIK/QY1zuiT71X1LRp4Njt5U1rFfwS8yJ1q0XgAqRCO6wI6lj
         7rSA==
X-Gm-Message-State: AJIora9bf2+4rm4WmMOQbyXsp/BxhELw3RYYBs/t+hFMg+kAonfQyYzi
	K5eD+Co8OnD/+w7MHTAY1pA=
X-Google-Smtp-Source: AGRyM1vAAv1IAbdH5r/BCjTknzu9ruuKTH7W5MxzEtu7d3GCD1p7btWP7WZK9+g5UutNMvYrwfm2Og==
X-Received: by 2002:a17:907:7f9e:b0:72e:d375:431 with SMTP id qk30-20020a1709077f9e00b0072ed3750431mr22295254ejc.580.1659028333247;
        Thu, 28 Jul 2022 10:12:13 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g17-20020a170906539100b00722dcb4629bsm629302ejo.14.2022.07.28.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 10:12:11 -0700 (PDT)
Date: Thu, 28 Jul 2022 19:12:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Wan Jiabing <wanjiabing@vivo.com>, kernel@pengutronix.de,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yash Shah <yash.shah@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>
Subject: Re: [PATCH 7/7] pwm: sifive: Shut down hardware only after
 pwmchip_remove() completed
Message-ID: <YuLDaawwep6noOJL@orome>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
 <20220721103129.304697-7-u.kleine-koenig@pengutronix.de>
 <CAJM55Z_+AOmyFs-QgaQdnk4m7SN=JMcszjG+mtANzBcWkGYBkQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_+AOmyFs-QgaQdnk4m7SN=JMcszjG+mtANzBcWkGYBkQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_101214_795090_20AECBC8 
X-CRM114-Status: GOOD (  15.18  )
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
Content-Type: multipart/mixed; boundary="===============2605862960538274432=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2605862960538274432==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5sXYq7NI5EQUbDCH"
Content-Disposition: inline


--5sXYq7NI5EQUbDCH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2022 at 07:45:32PM +0200, Emil Renner Berthing wrote:
> On Thu, 21 Jul 2022 at 12:32, Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > The PWMs are expected to be functional until pwmchip_remove() is called.
> > So disable the clks only afterwards.
> >
> > Fixes: 9e37a53eb051 ("pwm: sifive: Add a driver for SiFive SoC PWM")
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> Hi Uwe,
>=20
> You didn't send a cover letter so unsure which mail to respond to, but
> I tested this series with
>=20
> https://lore.kernel.org/linux-riscv/20220705210143.315151-1-emil.renner.b=
erthing@canonical.com/
>=20
> ..and everything keeps working, so
>=20
> Tested-by: Emil Renner Berhing <emil.renner.berthing@canonical.com>

This is fine, I've applied the tag to the whole series since you said
that you had tested the whole series. I'm not sure, but I don't think
patchwork automatically adds tags to all patches if they are given to
the cover letter, so in those cases a bit of manual intervention can
be necessary. Perhaps b4 can do this automatically. I should probably
test that at some point.

Thierry

--5sXYq7NI5EQUbDCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLiw2kACgkQ3SOs138+
s6GyVBAAhAQ9zC9phmeAQTqcxqO5Z5LtK6QeNJcWghr384o6ChUV+AVPb/3gh31Z
P3hGn9/aKarKOZnYcVWweOzEYvwxyGkaR1zrLQKp535RaG9BO6t+gnusW2Ckc78t
v7l7+3OwsUCUsc9WJOoRppQjT3ukcPCe+2KU1Vn6ExezmMz8IBpDHN9axtER3Pxt
UDHH0HRVDttj4KM01XPJ/SVWYDbrXtLHOEGw0RM2VG4xjBA8y9hqd394Dg5d3y5o
8d3P8CfnxhXkjCw6PH9gS65K0xSQ9+rAR59IVMtUw9Kon5X8yX5dgkAcjEY/I41c
ngvsVojR4ioq6ynjlS5/TybkpOWSjjVlvDn21TbfqE78/aWKXecE0R7LGcqTkzPB
YYcjDlXLfaoJHScATL1GpdTg7Ea58CilLbe+QBE0PqmdxjjETv4T923uIZfyYDxt
zEjsvpgkr1NZT2NrIV6CaRJoMQS8r0vlfREC5oUMEhzzHPkNyBI1WTfott9U7T24
l3bqXcRGAkYTrg069UlgSApVQwjX1WiBa2F/VxBcM//hq0E7Glbu0CZ8fH5LUBEc
BDzHCNlWKql67OXsowFHix6HOFGl2H8s4iAHZ8aOBNAXIL3Qf4vNXOsaJ4vMJWdr
WHLg3FmwlxGtaV3xKVjB/l+gRRuWbUR5usJLK/yqVc2AH8Ehwfw=
=FYFF
-----END PGP SIGNATURE-----

--5sXYq7NI5EQUbDCH--


--===============2605862960538274432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2605862960538274432==--

