Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92413C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 12:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A24222B2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 12:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jwikyziL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUxkLdnA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A24222B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GFYTE1ASbp1CHZ2rQXVU7oprAqY4h4RQrazHu1KLME4=; b=jwikyziLduZaYT1SHKg6sg0Yi
	JB1w9GatajJ47g+0BdeSZpbSSzA2SwcMg4144DB64QQWpez1583qJd4VQP3vNSMpM+3DbcW6RCIvR
	1cdli1Uk4pDopihtiko1JHYeW+4Q/C9GvxZQpNRaG2x3JShz4XTuKBHyi0F8ok81elVymXtAXgnjN
	T9Csls0oKhwss9T6BW4qAEOcLxA/ghPqJ3J0Jm8/HH61+mtdxhxifVmI6KGRlbgPhrF//5IrhIACC
	ysLpcjO/YpEa539JEiBkGyqzq91WWysg67A0ZehhlJrEJMcamZym7DkW/L9NDftaDS7NUlW15yhPd
	zB5NNd5KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gttmu-0008Ry-6p; Wed, 13 Feb 2019 12:37:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gttmn-0008LU-RC
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 12:37:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id h22so1790898wmb.0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 04:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Jvc0DPJeZC4x80fYz5SDp6GhltWn2bjfuEN2w5fshSY=;
 b=TUxkLdnAe1zAT/X4CfyiJxmFc8ForKs82JE9QJz9qNgs6NHvVX/J6cnm4eq+CkbT6t
 3OyvWsm+oilT+GD69lMjocKcnRPPZsICRTxNHFVX1Dm2hMHbH+U8CjcU7UouxBNQE23J
 zFIoHEVhkSGhQuxALKbCgrBYRQY8pvNsTScN9SGOjnZHsaniyesGZzWTwJr/6c9QEkd9
 j7FlR2YpQvsfuSXSg9JDmk+G8wUVmQdX3wCChZgeqzPDfkJJVkh1hZhgi40cEso+zfnQ
 f1jkZg1IJRSfBq18Ws8fPYRf5EkyNgKWzJxK020TqtspjlyV3ZOA1biixJU0dokyndkt
 1EdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jvc0DPJeZC4x80fYz5SDp6GhltWn2bjfuEN2w5fshSY=;
 b=FWfjhsPr4Z9T9RgbiaaqpeCFcJATiu/3ZRy/PJHY4hDqi2PKH65D7rHshefidAvxi5
 vYQCOxPUs6cR7xbNvBd284y8SwbQs/eeEAaE7DocgjPgyQX9PRFW/ixjBnXcKse9qPps
 UIX472zw8SVUZRBC7+8rT11VwxA5iPfBk5YL5YLddWEYBA9P8mzUJPmsKjicTJs2pZJU
 khVLdpnCZH5HNa5HSBY6CRXsXOzzgc/afyHYDcwEfMYJLWecy8n/dZZnnGuCVU9uYRfU
 wkQA8D5JSncHjldEOrC+0dssq8ydYEuTMACQpyoliPoiptREZUg7YxjU8XoMDGMPa8HU
 8DmQ==
X-Gm-Message-State: AHQUAuYPyPdPZX9ifdGPMoZaq1LmGHyqNfbEzJjr7GuVGTCmpb8hHUFM
 9qwjmo/MaTAx2LcZQYUVmnA=
X-Google-Smtp-Source: AHgI3IYprqT3ZersU5tdbD1oKTYH8pVnsPae64xazF5UiexuBJW+cShQAZXFQyds6K8kNfRTUkajZg==
X-Received: by 2002:a1c:c208:: with SMTP id s8mr146501wmf.75.1550061425078;
 Wed, 13 Feb 2019 04:37:05 -0800 (PST)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
 by smtp.gmail.com with ESMTPSA id b2sm12814914wrp.94.2019.02.13.04.37.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Feb 2019 04:37:04 -0800 (PST)
Date: Wed, 13 Feb 2019 13:37:03 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190213123703.GE647@ulmo>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
 <20190207101657.rfzcq6xdv6ocvubg@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190207101657.rfzcq6xdv6ocvubg@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_043709_881044_923E6B71 
X-CRM114-Status: GOOD (  13.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4424139838302361519=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4424139838302361519==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 11:16:57AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Jan 29, 2019 at 05:13:19PM +0530, Yash Shah wrote:
[...]
> > diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
[...]
> > +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> > +
> > +	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm * SIZE_PWMCM=
P);
> > +
> > +	val &=3D ~(1 << PWM_SIFIVE_PWMCFG_DEGLITCH);
> > +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> > +
> > +	pwm_sifive_get_state(chip, dev, state);
>=20
> Thierry: This changes the pwm_state. Is this how this should be done?

Yes, I think that's fine. The PWM state should always reflect the
current hardware state. If the configuration that we program does not
reflect the state that was requested, that should be reflected in the
PWM state.

Thierry

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxkD24ACgkQ3SOs138+
s6EJYQ/+PKXGl1Os9kb2ygrrqtwNAdMUKWPznwwYxi0Nba1r8Z1Yt3XBPDh8m3lO
JTqBUX6Cc6ePyQRlyMoMzrD41+OEWW2ueUG6i1VfFZJ3Yx1FyV+qGOjyh1ajfc+b
s4+8fPXzQ6VHrryvA0bYn8QHk2+DKeQgXTwd8i0FOxazVJ5eaE97aTiqoL5TSW7e
WpCmTuBj53sRoMO3qnYAJtKi/XElp/so+6gOz6zzz92SKnFVxlb7LskyRO4xVJt0
csGSkj2GVDnbTRGAfge8u5o/fTLzTI61TpNZSZfufGnpt5YjMG6y9T3lNUh7WSyz
E8PhNHH3WnFeegmUpj6zu8h+p2gJBa8H8wh6YjipVuUhhVBZVq/5AqYbavtrLlAb
FLxUcCltLcAaClAoAx9aLYyuq2fvkUjBd9ghNvASrxq9F28fYNCOz38vACpGCExq
s5rLgsClYTjTOPipRKUj+8vUJoQnjtGV+miQTeD4+MkUJLrOvCvimaVfda+68Phe
zq3huhk0+etRLAwkKY2MmRi6nJTneESXq8gE0pb+QtMzlWs71Pqa/lqC/MPsAo5E
IZoh6keN0VBUpxltE8UoGMu6QJXaxTtVtmfOS8dZjT4xKvef40boBdl0jVt6KGMt
d3RRmQQDGiYwusML2HCpJUY9RcipWOn2oEYbtGxGHm2SM9dg6M4=
=UK4T
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--


--===============4424139838302361519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4424139838302361519==--

