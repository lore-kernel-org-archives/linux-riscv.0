Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40812C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 06:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBZCWMLYHf/gAbCu3fOSSRd2as0VNerLYaPqDt+8Szo=; b=awQPJt0osmR/XCXeEIJ6QujF04
	wOHeyH4LpgHAG4wFRluiX149cpHUbablPgLXgxhz0iYyil363V3aQ/RM3ru0zCSgskbipFRcDaGA2
	QsRSqZWKEUcS9qIC3qxPGWIn8nyRV4xQcb9gc0DIJWrbZxyrWSOpho1X2QlYmcGfRkPG9NuCXXDdo
	b72thDz/oZCMxymmdvqHCszx+3e76hVeEFiExB1JfIQGrq35IZ6dwCNDJ/KZ/Cbmt9RFtOHTCND+w
	78pqWRgVYQPQDpO0or6Yxc2VhLk60OcA1cnnr+d3JpMhFDDfIakiyrAR/pCBkMgGM5QhhcXjlmrqf
	5x2e9ssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDcF-00EGVb-0l;
	Mon, 03 Apr 2023 06:24:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDcB-00EGUt-2T;
	Mon, 03 Apr 2023 06:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680503067; x=1712039067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SXF9ql1O4QqCDwpUFCx0XjbvGZ7VdcC3B9xFy+3JRBY=;
  b=IC+RipDWYVh0o8uCc1sOD3vIMJSHMqPdKYmXt/YWtb99jURGR5WO2iTA
   5FLafLrFXTR9YKZfLSFc6j3ETOzx/yRk3gGXANVoPBVhMmSG3xpOpWYzq
   4Ji0gQ23KNenZrfzMHcMUVw7f2/HRQm5mZhwXVPjNiwI+gWEw59coi8mX
   2OSI+QY9ejoBGLlV42qyUVwbjC1+XpDuCF06wTvbN84LHNGw9klqgpNv2
   iaTMEREDFaVFQpZ/wnQGM8UrGVvPO0P5G7ZzMymRJH5NhMS7xLsikm0ZN
   N7EpLAaRG/Lm2qbjiLlOYOBtWI2KBiSsyX8apXrxj32M+cv3gri8DLiUP
   g==;
X-IronPort-AV: E=Sophos;i="5.98,314,1673938800"; 
   d="asc'?scan'208";a="145160516"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Apr 2023 23:24:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 23:24:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Sun, 2 Apr 2023 23:24:20 -0700
Date: Mon, 3 Apr 2023 07:24:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] phy: starfive: Add mipi dphy rx support
Message-ID: <0dd5e35b-512e-41ed-af33-f94b7e2868c1@spud>
References: <20230223015952.201841-1-changhuang.liang@starfivetech.com>
 <20230223015952.201841-3-changhuang.liang@starfivetech.com>
 <ZBhTmTEcrV59oaw3@matsya>
 <2aa1bdbd-e37e-941a-9422-0908545c14f7@starfivetech.com>
 <ZCbloBdeffocT3Os@matsya>
 <d48ab612-213a-8d20-4b36-3f64f3d24721@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <d48ab612-213a-8d20-4b36-3f64f3d24721@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_232427_908594_ACFB45F7 
X-CRM114-Status: GOOD (  14.18  )
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
Content-Type: multipart/mixed; boundary="===============8748147791892648026=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8748147791892648026==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H+2gs+RwcKc2bDgt"
Content-Disposition: inline

--H+2gs+RwcKc2bDgt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 09:39:00AM +0800, Changhuang Liang wrote:
> On 2023/3/31 21:52, Vinod Koul wrote:
> > On 21-03-23, 14:08, Changhuang Liang wrote:
> >> On 2023/3/20 20:37, Vinod Koul wrote:
> >>> On 22-02-23, 17:59, Changhuang Liang wrote:
> >>>> [...]
> >>>> +static const struct regval_t stf_dphy_init_list[] =3D {
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(4), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(8), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(12), 0x0000fff0 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(16), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(20), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(24), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(28), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(32), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(36), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(40), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(40), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(48), 0x24000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(52), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(56), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(60), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(64), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(68), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(72), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(76), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(80), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(84), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(88), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(92), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(96), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(100), 0x02000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(104), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(108), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(112), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(116), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(120), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(124), 0x0000000c },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(128), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(132), 0xcc500000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(136), 0x000000cc },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(140), 0x00000000 },
> >>>> +	{ STF_DPHY_APBCFGSAIF__SYSCFG(144), 0x00000000 },
> >>>> +};
> >>>> +
> >>>> +static int stf_dphy_configure(struct phy *phy, union phy_configure_=
opts *opts)
> >>>> +{
> >>>> +	struct stf_dphy *dphy =3D phy_get_drvdata(phy);
> >>>> +	int map[6] =3D {4, 0, 1, 2, 3, 5};
> >>>
> >>> what does this mean?
> >>
> >> This is the physical lane and logical lane mapping table, should I add=
 a note for it?
> >=20
> > Yes please. Also will the mapping be always static or ever change?
> > =20
>=20
> The mapping is always static on the visionfive2 single board computer.
> Thanks for your comments.

What about other boards featuring a JH7110?

--H+2gs+RwcKc2bDgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCpw9gAKCRB4tDGHoIJi
0j48AP93KM8qo+2qFu0Q08mVxv8JhhX9LTXYPZrZ5Cr2SB5nbwEAwF35RRfom50o
FPXKuMztozN4Mw3e3uMacj/9cRNOlAo=
=1C53
-----END PGP SIGNATURE-----

--H+2gs+RwcKc2bDgt--


--===============8748147791892648026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8748147791892648026==--

