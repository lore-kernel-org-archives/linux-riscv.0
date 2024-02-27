Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129E5C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lB+jm+pbnUSDmL8RJDsqWeJwtVtDFM8jdau2rr8PrtE=; b=G+/As2Xlj7lH+URW4QoGC2prkN
	tZTAb8IEJgCzvMPjHpstMlwuUesr5KHKT/ZaspQpFk45VW3YDK6TW7hcmGpaxML96ZSNTPOhPybOG
	HkvKjJC18Xme1v91Q6EWl4fYDs4FttqU3mBb+p3i/Uw0ONGU2ZF/U4MOIg99nfnUNwqRLyTuYaURp
	GTMin4ySavi8sf3IZ+owz2z1Sl39QUTut2lXYHC8ASP2YnDirOY2ocwamHMQ+e87sdm9sLfCs378j
	fv3cREcY1zpK/e+osnkK1q8LR+JfFDxwgdXTPvGo3EUTmTvKqWPjz8c2lk0tmFBuWu9CoPvmfkoZA
	hClMs56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retEw-00000004PQR-00oR;
	Tue, 27 Feb 2024 08:55:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retEt-00000004PP9-0lfg
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 08:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709024103; x=1740560103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WoJYGL2TCnkr2w1VlrLBVfG92mEtbt6KEliQlVa4KHQ=;
  b=BIpPy6KMCJPAyeOzkkJ7Z4jOKyEo8+oJ42jnYmfOvJqhAHhdpUOcNb/V
   18++qvE82P1xGuXNCzbDzthTjOgffb9rkXSyd5VJttMzaMwkJyZdM7Z1e
   zxesW7sGdBVps8giYLbGGaEWuwztPC+MbO3ZU5Zeqr/A94UtzXtJvhQ44
   10jXSzwy024CS9P2HjhVABQQefaU9J1lnPkfhN5UQ8Lj7vr49/EyjJ6TW
   0ceTO/IXG0Z+q5xy8szwaRpNxy8f/VqIA3GfcjL1dvLqmN5h376y2I3rS
   xdRxOTif+Noxf1LPmkPcG1fw8tqffwY40SXJiP6lJLSCcQunzENOmKg6T
   Q==;
X-CSE-ConnectionGUID: qD79kU+kQWmT4/4KcnQg6g==
X-CSE-MsgGUID: cXEwV6uyTb+fwDN6W0wmcg==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="16875102"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 01:55:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 01:54:46 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 01:54:43 -0700
Date: Tue, 27 Feb 2024 08:54:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: JiSheng Teoh <jisheng.teoh@starfivetech.com>
CC: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, Leyfoon
 Tan <leyfoon.tan@starfivetech.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Guenter Roeck <linux@roeck-us.net>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Message-ID: <20240227-arrange-theft-021133800c24@wendy>
References: <20231221084358.3458713-1-jisheng.teoh@starfivetech.com>
 <20231221084358.3458713-2-jisheng.teoh@starfivetech.com>
 <170319257135.88357.1722653226891421278.robh@kernel.org>
 <ZQ0PR01MB11603A15E27E344ADA11AC43EB59A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ0PR01MB11603A15E27E344ADA11AC43EB59A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_005503_403088_0B75D60C 
X-CRM114-Status: GOOD (  14.91  )
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
Content-Type: multipart/mixed; boundary="===============0941515339539706489=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0941515339539706489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5/NNhPt6yL350ZtX"
Content-Disposition: inline

--5/NNhPt6yL350ZtX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 01:57:43AM +0000, JiSheng Teoh wrote:
> > On Thu, 21 Dec 2023 16:43:57 +0800, Ji Sheng Teoh wrote:
> > > Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> > > watchdog.
> > > Since JH8100 watchdog only has 1 reset signal, update binding document
> > > to support one reset for "starfive,jh8100-wdt" compatible.
> > >
> > > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > > ---
> > >  .../watchdog/starfive,jh7100-wdt.yaml         | 40 ++++++++++++++---=
--
> > >  1 file changed, 31 insertions(+), 9 deletions(-)
> > >
> >=20
> > Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> Hi Conor, since this patch is reviewed, could you help to pick this
> dt-bindings patch for riscv-dt-for-next branch?

Ideally I would not and it would go via the watchdog tree.

Failing that, I'd rather Rob take it.

Thanks,
Conor.

--5/NNhPt6yL350ZtX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd2jGwAKCRB4tDGHoIJi
0o02AQDUgzrn6JnUOaFQ4y/ICrPh1DIxb6FFKMBBGx82o4xb8QEA2JRBmceCzOh8
/YRRWMvcMwl2ARgGcFNuZBE0hbOttgU=
=x9oX
-----END PGP SIGNATURE-----

--5/NNhPt6yL350ZtX--


--===============0941515339539706489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0941515339539706489==--

