Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F01FC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKSF4ibX2tlUt6VpBsLiiGhqdlazHXHNH+c/tLt7Rqw=; b=vK7fFBM9JpeSrmF3D+/PFHq+A2
	t11DPigKg05dIL3lJF4juwxB9Eb1z9CFSxckxpPGBlif+e6i+qQfYIYMPA8kDXI201Vfl1kIzNckP
	IHpfwbbhQhhYgoTCi6mGJWDYyjZl+LnTsvQPcuxbETfKe6n2xUq7ot7hIyLD6QpPG99zvcMPfXF95
	iDsXzxn9USl0e80S30TZ5pMLCKeTM1fkVu+kaTWXaUrJvq9+phIL4gN9CC4+VpBlAL2TjawChUftt
	Mu5sTAejBG1rJG95PPFD22auPMKaQlDUc5ye7HiuFgrmvcHzHJ96YaNsWeDfxMNctu/Cw7tRUPuup
	DOocDIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOweq-00000006XyQ-0otS;
	Tue, 10 Jun 2025 10:56:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvVT-00000006NS4-2yqT
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 09:43:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1584538f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548578; x=1750153378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hy4HQMp4/QVu7y941pMtwqO2t1zabov2n9nxhccD5I8=;
        b=W2ZLjZD78crDsXqmvnTkDYbhgwDBo+nlt6zq5mwZLlye7SeY1Vci5Fn21LbrGiyaRU
         VZ7TgZez32kE3BCb1eQxiY3TwapFKIUhbd0XDgaWTE6aBt8YfI9Q+wTyc2sFBfXSbQSq
         /hgudxqYdIWatdrzmGaltmXZqzSyf1pIDLlzFQC82Vrsu9qYbtrPW/wCV1jGmSUC9Y07
         NtEr4o9KCALrR1BN7pWTYIg3sPTm/T6GILmVPdiI1TplzXMFid8uHPiApbH5TGvkoK/c
         BK27pw+UU6D/opXcmB7ZsXhGuvsKgTPJjoKxao8LILStFU8pTa4ujyKTRhsjbFYv51zG
         AAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548578; x=1750153378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hy4HQMp4/QVu7y941pMtwqO2t1zabov2n9nxhccD5I8=;
        b=B+diLmc8SNpPqSIZKqvYVbfbWVXyeKEvvK8Gu3PReXHTLGC1CdN41pBXkL5kizASHu
         HvMaIgqcgBdm728j4DqxfLwbF+ZlqcphNuzSc6/D9KdQDOE06OwDKK9WcQrfi+WiQPz5
         Vm3X9VNjjRSIwdOZCJ47JgSD1V+JEQpk8ZgHFxXHw10gjx65OKteIf29U6IBgt87y3IV
         wvqgqTgRj4TuykQizF0iwxnUH0v3SvToga9eO0sQpRUD43WdbcTVpcS/0ANvQf9cT5K9
         OAF2k6n42FgjVXsaYjKq7GPXVGmsCsvZizKseK4osPx0ADx5AX+vaV7Bb2YP69gmQVHc
         f7jA==
X-Forwarded-Encrypted: i=1; AJvYcCUM7mcG3k7qpJvFpCofJYC92QnjiV7i599NG3TloEgm4ZzQYcG4kiSfEYumTEMPSWL/x2FSR2XtY3EXJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoXQ3G06FEEOOKb6FGazeg9u9nB+USUy7iaBeD2oz81Cy19uD9
	nsJV26rWvU2/6/WXVDornVaQycpb3P5X4Oo1nbBzw4MAH5UpSZdxU63g
X-Gm-Gg: ASbGnctH9pHBYyjYwrszQpvmjV/kU2NE76q7ONQrdxV+DgC8zWTWK+v72CN3w7rOSj4
	NfUoJLwhCZhxQp6Lcke/rgs+7KYpqAnmoic1y+ftui2mdPCYepT3X+XBGT48NSoCQ9oHkUferNx
	SQuJdUqcP/Rjo+VoL8X5dNoUySWP8MbSfgn+IgGv9fDUjB3ii75OsNRV3Nqj+rDaPKDM1ma/0zu
	TyHrdK6ESBb2j0+fuhuiPatDmzOtYsW1OrdLuxeFiMnI5ajfZAX7bV2TCjMcODTyLV/1uglfEYA
	PYt5qx125rxJTd8a879l0S6uKRmyerd+O8qaVHxvsdyX/6sx/zjRk65gDc7OyorGAOzERybJzBU
	mUa7Jcf6xwnFY0f56MG50Rh0tiKF0uz6/gTNkPOfUDbZ1Uchh
X-Google-Smtp-Source: AGHT+IExWHAWVGdsU8NZWtNNaxdbfHHyFINoY6jGqsgVAuuDRCnCkj/k/dAfVKD2bDGIuerocgV4wQ==
X-Received: by 2002:a05:6000:1a88:b0:3a5:2f23:3780 with SMTP id ffacd0b85a97d-3a531caa458mr12387967f8f.18.1749548577777;
        Tue, 10 Jun 2025 02:42:57 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323bee86sm11546484f8f.43.2025.06.10.02.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:42:56 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:42:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Huacai Chen <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, Ben Dooks <ben-linux@fluff.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Michal Simek <michal.simek@amd.com>, 
	Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	Aubin Constans <aubin.constans@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Hu Ziji <huziji@marvell.com>
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
Message-ID: <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
 <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
In-Reply-To: <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_024259_747520_59A2AF31 
X-CRM114-Status: GOOD (  21.94  )
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
Content-Type: multipart/mixed; boundary="===============3147141354410910417=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3147141354410910417==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ebq3qw5vudglyq6u"
Content-Disposition: inline


--ebq3qw5vudglyq6u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
MIME-Version: 1.0

On Sat, Jun 07, 2025 at 03:33:34PM +0800, Binbin Zhou wrote:
> Use new function devm_mmc_alloc_host() to simplify the code.
>=20
> Although sdhci_free_host() is no longer needed, to avoid drivers that sti=
ll
> use this function from failing to compile, sdhci_free_host() is temporari=
ly
> set to empty. Finally, it will be removed when there are no more callers.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mmc/host/sdhci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 32fa0b2bb912..ee5a5ae4db31 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4076,7 +4076,7 @@ struct sdhci_host *sdhci_alloc_host(struct device *=
dev,
> =20
>  	WARN_ON(dev =3D=3D NULL);
> =20
> -	mmc =3D mmc_alloc_host(sizeof(struct sdhci_host) + priv_size, dev);
> +	mmc =3D devm_mmc_alloc_host(dev, sizeof(struct sdhci_host) + priv_size);
>  	if (!mmc)
>  		return ERR_PTR(-ENOMEM);
> =20
> @@ -5002,7 +5002,6 @@ EXPORT_SYMBOL_GPL(sdhci_remove_host);
> =20
>  void sdhci_free_host(struct sdhci_host *host)
>  {
> -	mmc_free_host(host->mmc);
>  }

Is there any point in keeping the sdhci_free_host() function around now?
I only see patches 1 and 31, so not sure if anything happens in between.

Thierry

--ebq3qw5vudglyq6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH/h0ACgkQ3SOs138+
s6Ed0Q/8DpTJQXo20TdxekQF0hnrIFHjlPauJ5ZtKpB7NF/fe3sNtEeoyrxts1E+
6CikEMpo4L/9bzrdo8rcGjuzMgcpss6NFQPLN31d61YD04Ue/ib1QRzc9s8WeRhm
d2h52zCebC+C0o89UyR09Z9yAMPLBo3dFbY4ibo7x+QETIAVk1ylMTTHxsna2lbA
rD8sWJHCrQSEVKJpRPHCF+GD693iCP/q8Dgm47QSRtgpXWKoP4sWMdhMnELuTc1C
49SbTj2Q6FJc4T7jMesthftnLrwTnk4RQCgGzty0EbXAX/FXgdBpBTn2TqYASH/e
qDjx7z9K2S8VESBxTes5vkv5Z0AT8qv7Vzm/2zHTGjo237lZL5oa1b7HsTmj7mby
VLmkcfGVct/6SmGGGEEbH+Eyvsi7CMjv6Xls6fUs9nQOMzUmx3T+mfs9Ue4G/HlY
h30GPSXXwUAmq99Q30qXxH53S8JE0GnfuusLlKdR3T09CmgxIFlV8Tx0MOr76Jvi
RolNAGHx546QFtJsQfxIA2OUBGMqeXr/wOtRb5hJNfHfvM2QpmlKklVesiuaexvk
CJ8iC9/tiE5asSU69f++Wmzl8Z7+k/PefX4vWbYQCv30JQUqqxorXZ8NApulKlen
/uPDSM0UyLzvefatJZYZIolhaRuG+4CpstVYXqzMfvA3Ci4F2FE=
=J2Mb
-----END PGP SIGNATURE-----

--ebq3qw5vudglyq6u--


--===============3147141354410910417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3147141354410910417==--

