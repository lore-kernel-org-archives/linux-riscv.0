Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057F2C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 12:44:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA8720B1F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 12:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9WbSNuJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlA7on3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAA8720B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ORMuFt1z3dYbxNAvC7GsCUynoOVHV1HirVs9AGdDcpE=; b=e9WbSNuJJlutW9qzj0r+3bjof
	+16MafEsAdDErqvoeKk6uBxNh4KAl/Wae06yDV9iG5mDg9b/PsVgxE3AwKcocpZeQfdNlfnB99/1h
	3H6ezoj/Xr16x6i40Av0/UM4ZQ59v/SqTI3Rl5llPe7sSa4fnxubPs8IfR36sl+Zf/q4/Az29M4TC
	+IkG+eue5L4zqitwvC2Ipc8if/O8r3sJpbp6vD5CHP472rE1pMiDBaM3AC5oS8F/Zucus5PyQW22Y
	RNrOup5MPcqksfhEbqUQWYOSPAIO1sxEmQEYGKGhehJg369Ld+mpecQxbdxaeyyIG0P58RMDUoxbg
	o4I7aHmFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grMZN-0003B3-9R; Wed, 06 Feb 2019 12:44:49 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grMZK-0003AH-2m
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 12:44:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id t200so2570656wmt.0
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 04:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hlvdYYOfL6ehCQai+lTJvgtWJnFUdDi5mj/8Y2nP4RE=;
 b=jlA7on3QeOM7dEx37X3Ohe6EySnzMPCJZcj0pdcWrM395P6EL13IBjRk63LlPRO0N0
 rSTU+iYV25J051ixUsrf1X3uBiBg1qUclnnoIYWLJhY7urXDNHhFFrEjyqOuhmEbG1nr
 FS/qyPmJzzGt5GLdyeytdBG/D9RJWHO8KarD0sG8dzL9TL0GR5rgfey2mf2T/G6cNlWM
 YMG+xOnzhh/6u5vqi3iddgZtSbWJGmb/Uq7kRHxbXGNz2gOBP13OIpF8iZBRKtgOipSQ
 UWGTwfxIFxSqbWXwbZU0FiGaW1Z+sXafoIHQcae2M91+xrLlNr3MdXozzQV4LqZBXKa6
 niAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hlvdYYOfL6ehCQai+lTJvgtWJnFUdDi5mj/8Y2nP4RE=;
 b=iVdF9XCHndJk31sfrecOWorQ+2iR+rFq4x1bZk4bdpLYKkM7XLbGGxF+/0H7klvWMo
 TyEKMYKyZWzMhYYJ6USRPOho2zB3dIu5QWDbNu3NM3GFPAyDN2yXpxVAEg4VZ9cuS3hv
 aC45r3hi/zKrHIS0OCsV61VfIsqzrZ09FBkvpErphUlLuv4rG+xvgJUCjb3prF21SPBA
 xn4avmBFUi3nDh5dOvCM+lrQIdgdPBxyIMU7KAnw3ctryCdQPeCnChdy2UTLrgQI60R4
 r0u0685XEuljS0WPSwzYWo0Ssv58Pnq65WxxYdBOju0ROvKIS+/LvjekwallhMMJTzdi
 wj3A==
X-Gm-Message-State: AHQUAuag8PMfsVB6g4uJXSNGVZ9QxO3u6Z97txriG4pii3KKOESeW2D/
 NLQH3zhrloa4EbSFXCnWnvk=
X-Google-Smtp-Source: AHgI3IZNDW51tDYuakz2WMiSQGf+ROa3dAL20dlNGc9oOjE/6tZF5cAfLPs6wN9igHxfgpypH4bg0A==
X-Received: by 2002:a1c:2d42:: with SMTP id t63mr3242686wmt.9.1549457084369;
 Wed, 06 Feb 2019 04:44:44 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
 by smtp.gmail.com with ESMTPSA id n15sm13590929wrt.21.2019.02.06.04.44.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 04:44:43 -0800 (PST)
Date: Wed, 6 Feb 2019 13:44:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v5 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190206124442.GG21676@ulmo>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
In-Reply-To: <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_044446_124248_A44DDE77 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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
 robh+dt@kernel.org, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1075001799000645865=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1075001799000645865==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eMnpOGXCMazMAbfp"
Content-Disposition: inline


--eMnpOGXCMazMAbfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 29, 2019 at 05:13:19PM +0530, Yash Shah wrote:
[...]
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
[...]
> +static void pwm_sifive_update_clock(struct pwm_sifive_ddata *pwm,
> +				    unsigned long rate)
> +{
> +	/* (1 << (16+scale)) * 10^9/rate = real_period */
> +	unsigned long scale_pow =
> +			(pwm->approx_period * (u64)rate) / NSEC_PER_SEC;

I think you need another div64_ul() for this one to fix the linker error
that the 0-day builder was pointing out.

Thierry

--eMnpOGXCMazMAbfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxa1roACgkQ3SOs138+
s6Ho7w/44E8oDkjBRAR5L9470vsccMPAjzx4g2A7RH4LgdftIUAZcBK6SO0hlwHQ
5Obv6Zz5m0W0RF8MkaVyIdtgLUfnEMSTSz3JMT3aDCZ6SvJttXthHoGuzNgEM1U2
zJJS/zw0Rkw1uDfIwlYU/A2dxa5pye5w/9XymmQfA2+1dUvEMtvDQLwg8sCxV7Kt
xxmZ/xkogqT15Dlez28duZ5qW9IHRBixx6ihoCEUgFF91tC/ZUAcnq3ouBuesAsf
5uuwgW86CUXYo7fqjwHObMVjqbAXTQOaXcr00pYsBRXD+KRfgHtYp6mGDeabXOa2
70wvWfzFGVama3PK6eUH/9pZ0Bl1HBZbn5L9PFHSxexsakZnLDKzeiuwdYLbBC6T
wTN+tekJhBZf/o286YsObORPMkjpQ8AYAtAnlMHsOLdiLJROPU+AMw9qnjQgOk54
4CfFuntAA9zJg+DaObAHuDlrU83pa71wSWytGSdgDjpvcmCtt7D30BuIvnIjp9D/
apsnqQRQY6jKtd5G76AQaGuhShJIoPFRJI4zRTjZ1UlGwA0isbIvqiU6R4iH4/v4
Y03Pcr1JBYn/adGE8v3PH+z0vuF3jrrVZ4sUdKWtErT99q/PdxK6pqYnoami1IFt
gMQmQrsiH8XfRde6dE1kf0ebvKwTe9IrbtR2HTEXhcnd4ieBGg==
=YYF2
-----END PGP SIGNATURE-----

--eMnpOGXCMazMAbfp--


--===============1075001799000645865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1075001799000645865==--

