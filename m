Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96770E92FFB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7g3/1nAcp+houIsbyQ4GscwloZ0UsYM6cGTrfpC1H0c=; b=bGmmXrq0AN84xCtieU9892+vY1
	Wiye4zm9dKq7EMr5VDl+N8J8V7O6TCReKSPove8ZXhewVH18u/zyLKZcPVeBNAd/svoCDssVd0N1/
	AoXCuaAPB1NfX7QIfN8YPkmCFXmY1fTzyku2X0mTWPX2ZIKZ3AZ0aTOyF737MUgQXOuKFSUNyWp/m
	acUeFvuny75TF8oibgEYBGgPDWP4kTLid20qb5Dnj67jX1ZXcpf6DkyjKMrGz8lIcujLmj7u4zvAN
	NryTJ1Vzymp739i0hWjM5FFo9fsXVoWj6NDqhSF/rVekIW4oLeV1f4o6o8mNjYroSmeT2flR2T+lZ
	2X8kBVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoi5V-005cDn-2i;
	Fri, 06 Oct 2023 10:29:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoi5S-005cCz-23;
	Fri, 06 Oct 2023 10:29:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9b95622c620so367900866b.0;
        Fri, 06 Oct 2023 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696588177; x=1697192977; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FTsAYhfYTssJFz7CdhaD+H1tNbJvHmttIr6I4ZAM+s=;
        b=au+XgxxMBLBe+bJFN5tx2beMaGGRRsUpCHOlyEYAbYCEOop8w9lOwuKZ156vLDH9Ve
         R8pFsmZNUr+47R9kYnDojGmjXIXZGssQHdLLcVhyPKSvs+ejtJ5W+s1mBkPBJoQHRpqy
         4GC2PeH8VAV3cKGGUAi4a4OJw1R4v9UhkQUd1POTTSdbkh+bsRXPPtFQDumOp5uDuOPh
         b+B2Ec/tXQOS0Vrh6GyeXFDaXNBLogL/TX3Rp98CIzJ5qcJ8FRn3yMTxefhM7H5FB1a2
         RFc8eggMTxaOY47eHPHRLXqQCpqul6ZsvBe2jTJZRgCJT6ZBb/jjGzn54OP/dMEj497k
         AzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696588177; x=1697192977;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FTsAYhfYTssJFz7CdhaD+H1tNbJvHmttIr6I4ZAM+s=;
        b=DfM/MEYH7w8SCHPiU/4KTZ5l05dLEubYoNnry51B6+9YlGXU4J0Vq2Os/2etwPKXC0
         q+872L6iWIYt+2XTU9jezZZTvFSVlAw13T7VwKOgdOACVa96yJBsG6pCSMz/HHaWArRj
         0HJ33cHROU4B3UCAVfy8MPBR4DukpYr/6F6v4Q4fxm24OliIqUjIJ0T1YD/I7OnZaui0
         sXq+kZ18Oqp7k1LQYkT3lB2eZvo8tdRDoMkjKYHz6juV5+YzDIrvAwGWrTmoGRNLONQV
         uzjOOszAjHYMiMlf6kghHwCzMg/GfFz/UCoKRayJREXbOdKFy35XmTrwU/ivSZTexBZA
         nHOw==
X-Gm-Message-State: AOJu0YydYtYpBIdnj8KvdnewZoPjDmntF7KUafMRREBwAendDESoINHt
	t+6IFbTJvBQUxZQVkIUW8R8=
X-Google-Smtp-Source: AGHT+IF29lLhqYu1W7nFQy9/ogamXAd4uztCA0mlziEcK+D8YlweNIqxDxKUo5cSzTjeFjEwc2s/Ew==
X-Received: by 2002:a17:907:7857:b0:9b2:b153:925 with SMTP id lb23-20020a170907785700b009b2b1530925mr6657004ejc.21.1696588177046;
        Fri, 06 Oct 2023 03:29:37 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090640cb00b00977eec7b7e8sm2657390ejk.68.2023.10.06.03.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 03:29:36 -0700 (PDT)
Date: Fri, 6 Oct 2023 12:29:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
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
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic
 context
Message-ID: <ZR_hjjS1VMAPLYVI@orome.fritz.box>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
MIME-Version: 1.0
In-Reply-To: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_032938_685714_88966C41 
X-CRM114-Status: GOOD (  18.93  )
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
Content-Type: multipart/mixed; boundary="===============1246856344588881300=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1246856344588881300==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mL8QfLbOLLpS8F7R"
Content-Disposition: inline


--mL8QfLbOLLpS8F7R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
[...]
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index d2f9f690a9c1..c94894ffa4c4 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -287,6 +287,7 @@ struct pwm_ops {
>   * @ops: callbacks for this PWM controller
>   * @base: number of first PWM controlled by this chip
>   * @npwm: number of PWMs controlled by this chip
> + * @can_sleep: can the driver sleep in pwm_apply_state
>   * @of_xlate: request a PWM device given a device tree PWM specifier
>   * @of_pwm_n_cells: number of cells expected in the device tree PWM spec=
ifier
>   * @list: list node for internal use
> @@ -297,6 +298,7 @@ struct pwm_chip {
>  	const struct pwm_ops *ops;
>  	int base;
>  	unsigned int npwm;
> +	bool can_sleep;

Can we please call this "might_sleep"?

> =20
>  	struct pwm_device * (*of_xlate)(struct pwm_chip *chip,
>  					const struct of_phandle_args *args);
> @@ -380,6 +382,18 @@ static inline void pwm_disable(struct pwm_device *pw=
m)
>  	pwm_apply_state(pwm, &state);
>  }
> =20
> +/**
> + * pwm_can_sleep() - can a pwm driver sleep in pwm_apply_state()
> + * @pwm: PWM device
> + *
> + * Returns: true if the driver may sleep, false if pwm_apply_state()
> + * can be called from atomic context.
> + */
> +static inline bool pwm_can_sleep(struct pwm_device *pwm)

And this one pwm_might_sleep()? I don't see why we need to deviate from
the nomenclature that the core introduced.

Thierry

--mL8QfLbOLLpS8F7R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUf4Y4ACgkQ3SOs138+
s6E4FBAAg0tEpfYfp9Yw8ogU74h4roxmvYnytJpFXp2sixtyVANVEMQepzR2LQIE
CqWassqeXgYIpkDitSttcCUwtGZ31Klbd+7irCzb1X75W6u6xbsbhAgiQ+edclP2
5+C0wAerMMAavdgn7hYf1JYpupZM9H5/RvZLcSkywvpfHEfzrOFU20ackUlLiXsG
Lc6RTVMwki88bxnA5WerSZuTIOYSVl0Pkg+4djuN6xtdv4zF53Cfkz3o7d7dc5US
lSxjcikOpDealmS75qLW61PWWiDC8AZXxZysVjwuiwP0xnIk52KhHMsQeignaZ2b
G5NdTZZHyLpfF/HV23LdQKCOP3/J/50lkO1pslq8VcccJYqeOFhreG7MaCax2i7b
DZi0KEX/MGGRmA7hZj9014u5Q1KfvClbrWuctt9SLbbcWLeV2YW+MOcb/PSoj82D
DE9u62SJ4/xck9btpwuFXQ47Smxlub8qeOEh941qJsImqskMUJV42BI1mSITOexx
Mnfi9SD5H5+KxEkr39VbAA55ypAS1DNS/BubpmI/kPFXz01tjUxFtqLnQxl1ANVB
QnIUADVzpB0kmmJoUyiLU0FWLaExWqfrJDSzbt/WDeKaS4O5P1VfrCOsPcPelIYs
xP5n3y/MN01SRytptbW9Z7+tJBSJSrP2M8gt2JnmPFQxCe+ISto=
=LVfE
-----END PGP SIGNATURE-----

--mL8QfLbOLLpS8F7R--


--===============1246856344588881300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1246856344588881300==--

