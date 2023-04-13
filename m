Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7B5C77B6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzJvmBgBa3lmjcQQ6AOAcfUkJQ7rHWGkJqhv0gSoVn8=; b=Qt4PaqLoeEk7qpWePnJ3C9sZgU
	rPLT2pWJbtWq0Fn71FPgezBTQqwi5GqEk1LL/9YPZ3js8VhCEjMSOZY0h5ukJJYcDEsC0yWlAUynB
	2YmOM6MFfZ3VMLcsWDkUVU/mp6amtD//nwga1yHWF1gi5VkZ9XqhIzuo7RUjGARV+28mb04J9p8LR
	he9ig0fEQaeJjbOpYtz+Jsp6h22mJ8+MsFRPLrK53g82Ese+2c2WGVxH42LtD+2/8gxf6lOQMKcjG
	1rWbHdz7KzP4ZOyZHW0amnGIqysx+33nmJ/yS+33195bnDW7G/KZ/cncPJ3FNcrKJG50IVzyNriRo
	GP6o1NBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmxNw-006Jh6-1p;
	Thu, 13 Apr 2023 13:53:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmxNs-006Jfy-0s
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 13:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681393988; x=1712929988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RI5dxyny4pd6aZFj4Z1YM4GJ/8KIefexr1VJF7/pVbY=;
  b=Rrm4O644QZX58Tj2rthwEmD0dDatnn4pjRKUCNgW+eSTJUBHhbJxXHRx
   CuMsQgXWri1YGwChJyByovDhUloOvO2dhTL2daCLtppIM0xHJYIYriALX
   wD5eJg6ZjY1aZxCKfBTu8lQhmS5eO0tdSMM1kk7J2eIq51nmZBnVf+Av4
   kjmIijMcvjulJVNRdgL7ue78ubNH4PrkUib2JrHvaecQsk0Y56tVw4B3e
   /3vpbgyrLbSOCfN/JjQqkUlSwyl7VHqSH2cn/1r8jW2yzz/jQiyLt2kop
   KlFR+BXdUud5yF5zHJWCEdVOnYeflEBZDoSbfNWpIKup2qmgy94LAew/C
   w==;
X-IronPort-AV: E=Sophos;i="5.99,193,1677567600"; 
   d="asc'?scan'208";a="208958686"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2023 06:53:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Apr 2023 06:53:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Apr 2023 06:53:00 -0700
Date: Thu, 13 Apr 2023 14:52:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 07/10] clk: starfive: Add StarFive JH7110 Video-Output
 clock driver
Message-ID: <20230413-hardcover-ground-efbd862c5ec3@wendy>
References: <20230411135558.44282-1-xingyu.wu@starfivetech.com>
 <20230411135558.44282-8-xingyu.wu@starfivetech.com>
 <683cbe934d1df9436e003466d2a419ef.sboyd@kernel.org>
 <463ee23c-f617-bed0-27a8-56c6fb40d092@starfivetech.com>
 <cd4a11ae65e186799145410969d40421.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cd4a11ae65e186799145410969d40421.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_065308_360286_C73C9528 
X-CRM114-Status: GOOD (  18.88  )
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
Content-Type: multipart/mixed; boundary="===============9205812296213423031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9205812296213423031==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v0ip4bKAlPiDmbMW"
Content-Disposition: inline

--v0ip4bKAlPiDmbMW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 09:04:08PM -0700, Stephen Boyd wrote:
> Quoting Xingyu Wu (2023-04-11 23:15:26)
> > On 2023/4/12 2:33, Stephen Boyd wrote:
> > > Quoting Xingyu Wu (2023-04-11 06:55:55)

> > >> +       if (ret < 0)
> > >> +               return dev_err_probe(priv->dev, ret, "failed to turn=
 on power\n");
> > >> +
> > >> +       ret =3D jh7110_vout_top_crg_init(priv, top);
> > >> +       if (ret)
> > >> +               goto err_clk;
> > >> +
> > >> +       top->base =3D priv->base;
> > >> +       dev_set_drvdata(priv->dev, (void *)(&top->base));
> > >=20
> > > See comment later about setting this to 'top' instead. Casting away
> > > iomem markings is not good hygiene.
> >=20
> > JH7110 resets as the auxiliary device of clocks use the same iomem as t=
he clocks
> > and the iomem will be got by dev_get_drvdata() in the 7110 reset driver=
s when registering reset.
> > So I follow the basic 7110 reset driver and also set the iomem not top_=
crg struct.
>=20
> Oh I totally missed that this is how it's been done for the other
> starfive driver. It's still not good hygiene to stash the iomem pointer
> that way because the iomem marking is lost and has to be recovered. Can
> you make a wrapper struct, either for the adev or to pass in struct
> device::platform_data?

FWIW, this did come up on an earlier version of the other starfive
driver:
https://lore.kernel.org/linux-clk/e0d8f9ba-5bf4-d7dd-5110-20d4196556f9@star=
fivetech.com/

I probably should've pushed Hal to use a struct, but evidently I didn't
reply to his final message there, so apologies for that!


--v0ip4bKAlPiDmbMW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDgJLAAKCRB4tDGHoIJi
0grQAQD5cpctgc5Bq3S7CyFGTLA6byxDhiBh5Iyvw4xFI+lLdAD/SOinBHpjM3Vf
npC+7trX9b+0Hc7eNQTp7L341SH1nAw=
=b8hm
-----END PGP SIGNATURE-----

--v0ip4bKAlPiDmbMW--


--===============9205812296213423031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9205812296213423031==--

