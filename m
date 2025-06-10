Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F921C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMuB8s9TM1G0qJSD0qkykHbQJ5TaOvn9lEKAOjRBxL8=; b=rNO2A5u7mpuOozsglExue8ekSA
	ZMS3dlnVbKG5ZZ2RDeVM3Z1H5vYYncw86xKcS3fCf/Rbf2lxktd8JhRoid+zm9TU8/cDEX5b/0TSq
	Ysk3HcJWHhwowteh5dWriwmDg1CnJ2aibGyZAZEFEonB/YGp5t5gm4uLerpms3iFsDdZZXok9pDyJ
	C9dXUMXQYEZN2WfmxrqbynX8awWlNXKU/RRnRYl1kXsjZrSjNu/ehMzQNAla4VMe2CMLZnf1XSsyJ
	ZPojYNUfr9iYv8XEobnw+YzjcH1Lsm4gsIfkkkeCpNw4qNktC4b4X+px3Etz/gTyqchz9JvU8y8gR
	CPh7h2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0pR-00000007IHd-43ID;
	Tue, 10 Jun 2025 15:23:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwxF-00000006dDu-0K9E
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 11:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UxiKx3fQ2UN0TdQSGe7J2LZQJpdb1R/YSkx1+hJ6ixs=; b=ibkfFJtj0irkH91+k9zf1lNSUT
	Nd0SOC1PUwb0+MSdHmzK15+lZMr8/g6nVsr/yQz6KtE8JVsV7KBU/olCOusBTtdXAQORUF9/gLotx
	u/jH4myRtQQ9a+ZSCZ1Nplr6KQSaoNzjKJKxEqHV7l6JvVPsS6z4QH1WCfWqwgSyTJ97I7QO4LjYv
	r+N2sDB5IPsb5JoYqQUPKsQJwjDxEO23Ys3XwfqBE1+WCIYa9VdRPqpWnfoGlAuRZGPRyElL0aasV
	No6bGM6ZJwtLfXWYZiKPi7FWZ0yWzuJY+9SdQ2IFWPp45X2q3cU8tyfjAxLc4zVmbdMDmrljiWjcs
	6mDOJ1XQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwxC-00000001m7x-39eg
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 11:15:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3172838f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749554139; x=1750158939; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UxiKx3fQ2UN0TdQSGe7J2LZQJpdb1R/YSkx1+hJ6ixs=;
        b=b2CuJetpW3vij0N3VBwe36immgRP0q4od+nmFEogBTIB9cq5Oj/PjpKVi5c4McIGSQ
         BVFuCuS3TjbIJ3sM9jvmdMmsoHCwYVpiGFgs5EJa6D+Jt5f6l7rw6SVtuUg74ht2/UPk
         jfOubQWm4JfuapDx3XQXe12/UGAMTLCPvFKhxUet/rhrEA1Q1DfG0oPehNLIXWYw66Cd
         157h5eDCfC99RGavQC9/bwBzOk9eHis0R9kuLCUJ7vzIIHd1hI9UnvYpqBMIwXsSh9lw
         Pxaef0CypX52X1pR2MOEkyaoh7yiSFoTr8xUOO5hfEt7LSYANd9ImDpSvBiEhNCaI2qO
         NmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554139; x=1750158939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxiKx3fQ2UN0TdQSGe7J2LZQJpdb1R/YSkx1+hJ6ixs=;
        b=Xq7Mo6/R6Xav8wMj+zS5388IA9wokxvQ6p6GC4fkCW0V9a8KmjsE6Zv83WWvAnOSgX
         ZdgHLko/8kNuCMw6MFKvSCsYdqYUWmEreoFVsjrPeseB8yyUQMRWkQ6QqVYGTkFPwlzv
         zjSAdOZScnwpdw9pbKaw1hZ4jn138RuUv/ebf4H9bkhfl8Vhn4Y73CfO75TjO0HrghHj
         R5GaWW8YlkUomLXF1IFxzZ29uKlYXser5QHBP2XxPROrbplr/gItrso9Y37lgT5fAgpl
         ebDQorTK7OnT4al61tf6C2DTsRzHjJiNNDxezDJ8oyAP/9KXZUO92jjBk/87MavU6ge1
         icjg==
X-Forwarded-Encrypted: i=1; AJvYcCUNYlsV7NgAU/Fs5JiLDYLY9uPo8/AdKqmtPsfNApSJUGNCphfAA2NB8DJok44FhApbAfajvbj1kbvtYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdWH6ofQ3in/StuPgjQ4oj7dzm/KVmzJ8Dbq3pxbh95SZNUY1c
	FrYHZp7nthBsjjOLMs4ioUf5q0pFwpjZr8zHR685Vdg3VGRd5k7iG7JR
X-Gm-Gg: ASbGnctUcDo9esuE30c0thLLJCBTB4EsHq8X4+RFEx48zVP7bGZquk9oDbHVc7EOdcT
	BtFPOTfcSL0zhePxYSqXgSDgbHtTRBKzJ8e1Z/mww8fNXoJUwxWCFmQJ/7WBR4nRyVWsVmHKq77
	T14wzXn4TEUb6HMZqzAPnetJgfSHO6Qb9Etdr25EiFSBtwcfrmAdvSUnBisZneXu3zw5B6Z6liC
	k031WM3LqQOZ5k52kpvk+ORkc5urooiZq6EigEgtskuCA8nzlXrhQhMDLxnFsZ+XYZz9gAE72kS
	GeQQm7/NF+P/OLa/NL+9QOIoPdJI4t/sj8ejR3YEeOZWp2CjdzzbYEKOIIzAKvV/wX26TBiYdBN
	eb1RcXWmR5avNuf8z24ctZuthA1pcdSpuVhDpudCJWJIB2bgF
X-Google-Smtp-Source: AGHT+IEq5h6QpOWbOPcXEokI/1kkApz0WSZPNMsqb+qTO25Obu6S4fRERowIAa6crf+gSKsbxpYBWg==
X-Received: by 2002:a05:6000:2891:b0:3a5:2b75:56cc with SMTP id ffacd0b85a97d-3a531cac39cmr14409541f8f.23.1749554139143;
        Tue, 10 Jun 2025 04:15:39 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ad414sm12186802f8f.31.2025.06.10.04.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:15:37 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:15:35 +0200
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
Message-ID: <72va4ohv5djerrqe6jwtas6j2yg5f4xkcfxpsmadclh25mhjlh@2zwl3d52ubvy>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
 <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
 <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
 <6ab83033-1349-4d5e-8d1f-8a13d851abf4@loongson.cn>
MIME-Version: 1.0
In-Reply-To: <6ab83033-1349-4d5e-8d1f-8a13d851abf4@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_121542_827336_CD4A68CF 
X-CRM114-Status: GOOD (  29.66  )
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
Content-Type: multipart/mixed; boundary="===============8375350577264229700=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8375350577264229700==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k45u4zwumvcsy4c2"
Content-Disposition: inline


--k45u4zwumvcsy4c2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
MIME-Version: 1.0

On Tue, Jun 10, 2025 at 06:21:27PM +0800, Binbin Zhou wrote:
> Hi Thierry:
>=20
> On 2025/6/10 17:42, Thierry Reding wrote:
> > On Sat, Jun 07, 2025 at 03:33:34PM +0800, Binbin Zhou wrote:
> > > Use new function devm_mmc_alloc_host() to simplify the code.
> > >=20
> > > Although sdhci_free_host() is no longer needed, to avoid drivers that=
 still
> > > use this function from failing to compile, sdhci_free_host() is tempo=
rarily
> > > set to empty. Finally, it will be removed when there are no more call=
ers.
> > >=20
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >   drivers/mmc/host/sdhci.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> > > index 32fa0b2bb912..ee5a5ae4db31 100644
> > > --- a/drivers/mmc/host/sdhci.c
> > > +++ b/drivers/mmc/host/sdhci.c
> > > @@ -4076,7 +4076,7 @@ struct sdhci_host *sdhci_alloc_host(struct devi=
ce *dev,
> > >   	WARN_ON(dev =3D=3D NULL);
> > > -	mmc =3D mmc_alloc_host(sizeof(struct sdhci_host) + priv_size, dev);
> > > +	mmc =3D devm_mmc_alloc_host(dev, sizeof(struct sdhci_host) + priv_s=
ize);
> > >   	if (!mmc)
> > >   		return ERR_PTR(-ENOMEM);
> > > @@ -5002,7 +5002,6 @@ EXPORT_SYMBOL_GPL(sdhci_remove_host);
> > >   void sdhci_free_host(struct sdhci_host *host)
> > >   {
> > > -	mmc_free_host(host->mmc);
> > >   }
> > Is there any point in keeping the sdhci_free_host() function around now?
> > I only see patches 1 and 31, so not sure if anything happens in between.
>=20
> To minimize email delivery failures, I handle each driver patch by sending
> it to the relevant person, while sending patches 0 and 1 to everyone.
>=20
> Keeping sdhci_free_host() as suggested by Adrian[1] is to minimize
> disruption to the compilation process. We first set sdhci_free_host() to
> empty, and once all callers have been cleaned up, we will remove it[2].
>=20
> Of course, perhaps I should also CC the final patch[2] to everyone, which
> would make the entire process clearer.

Makes sense, and no worries. There's no great solution to this. Either
you send to everyone and you get complaints, or you send to too few
people and you get complaints.

Thanks for clarifying.

Thierry

--k45u4zwumvcsy4c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhIE9cACgkQ3SOs138+
s6GQBA//Uwo2UNmg6Kz2FmjupP6jInce88oeU0wuRA2eXLJxily+e6i9k6VcnYrB
FwkVmYo7qNRUixAA6TkZuDe74mN5rUrDAgMaF8pLMvQ2tFXS8BO+02jTedHffhet
v6GXZJ4hARWlGL6EY5jGfWa7PIMtlXGyPiRmCH8gXSW3qoo6O5mfLLdWi6brHhts
lX3z6DxsSVN52Pa/95zoQQQ8eyQtdcYDWHqeTivi5Y82gDy6P24+1BLWiTfCTzEw
D2Cl3DgKUu1qKrMwG9V0gQyc6bmNFdJuS3BLA37hKPFOMrD0zS7SQsX2pt+yoMxO
zKjO5P3kkQFTJJhP6gDoXscax9d80EsHUgKOOdkLVp+3SmGLZ039rI94BGhHc1by
78S5I+HpQKr3B+WlwRBQqoQtTDDFB8lP2D0LRClGyW50bIDHwHU087JYcoCck13W
xHDXXMIsVCU3NKmXT8bI5GFF4WVlI8oAcHEtRTZRJy8IcSZa7fn8QYdIDwOmTjM7
Y5SY2/GHPYmcfHeUaGACsFGB8vCCdVi9qVCQtw9M3OjORZ3Hu6wCQ3BpQesJsJO+
CHX7XcTnKxG/o9LGeeimJMjqHK/oA4HU9/HXoqJgmlIDDr0nI3N6EVOPDL3CNATV
L81QfkNDQ+ORICzcQsgi8Q5Rbi5P7fOsmRpdcEck9u4NZGbgD4M=
=tny8
-----END PGP SIGNATURE-----

--k45u4zwumvcsy4c2--


--===============8375350577264229700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8375350577264229700==--

