Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22645C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t33EyxnSH/HoQ1pWL/yws5ubvUqbS2ucMxAhfZWLfgc=; b=pcDg5vas9QiuTeV4SwhjxudMOy
	hbOEv59yMnpTN1Dnkisi1366/uJ2p0GVNkAAIRoaq9ceRoFE0/RHSsYDl5JI7nZSCq556sCkujZW2
	wgXp4kJLfYuPYcrxyk5y9QNIConmh4H7UaPDaay6DyRU8MNIt53SHepJcmMkbGfiOvaQZWuRqbnfe
	orhf740h5Cc63eEWgGV6bOUfDYqr7EkfgkybeyrOM3Vts9JoKwyUzcXmPFa9NX7VICz3C6nocz3Cq
	Yf6515HThmXX6WDol8CnAzVo0rl8s7dfbVNuTwmgO9PzPCPw5EvOQQ53iSXYLOQDsFAP965BByicw
	Bvk7Bpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyHw-00B4sF-0Q;
	Tue, 12 Dec 2023 08:38:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyHs-00B4rA-1N
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 08:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702370324; x=1733906324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlQSdutGnnJ/XqxX1PeaHL7qn3fxyzFw6HN2ZKxiL8Q=;
  b=idO/wKSmebFpebKsmuURABU1hUEsVByiVLfq1zhCtkcno4Pn41bu/BPp
   +ssOGdwpipXqSn5pPZYqSVZmrsc2fdRUglU625Hkb4hgIUnx8r8dLlwUF
   xH8mwVwMqSPqLcUj1z2gRkZHOWCCsceWTZPlPkqZK/yBFY3hO/2mrmGw4
   T5L5d1AGjVWTF/2Urqpkd0yFRKmUBLilaF8mJ6IFELhtjkHEBpgb25B5P
   DOaZQdSNL5xgE1gwKkdIXJjzCVk7M6lafZs8BpagJcmNERIDEmnN0e/oE
   vD9MDUk12myBTJ1Zj8P0yGy0RNYDU1j+v0Fof7VKAI7sFeDbdRTz9bZgC
   Q==;
X-CSE-ConnectionGUID: wGJ38t4bSIaNu9ouYmhVbA==
X-CSE-MsgGUID: Qgbb/YblTWedaUAGm9uKwA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="asc'?scan'208";a="13518116"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Dec 2023 01:38:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 01:38:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 12 Dec 2023 01:38:10 -0700
Date: Tue, 12 Dec 2023 08:37:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicorn_wang@outlook.com>
CC: Conor Dooley <conor@kernel.org>, Chen Wang <unicornxw@gmail.com>,
	<aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <richardcochran@gmail.com>,
	<robh+dt@kernel.org>, <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <haijiao.liu@sophgo.com>,
	<xiaoguang.xing@sophgo.com>, <guoren@kernel.org>, <jszhang@kernel.org>,
	<inochiama@outlook.com>, <samuel.holland@sifive.com>
Subject: Re: [PATCH v6 3/4] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <20231212-unnerving-rule-1052a5b7253e@wendy>
References: <cover.1701997033.git.unicorn_wang@outlook.com>
 <d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang@outlook.com>
 <20231208-opposite-stand-fc92fbaaed9c@spud>
 <MA0P287MB0332A937E4DF0044594B19CCFE8EA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB0332A937E4DF0044594B19CCFE8EA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_003844_548563_396F7D49 
X-CRM114-Status: GOOD (  34.91  )
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
Content-Type: multipart/mixed; boundary="===============5357500180183682516=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5357500180183682516==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wQrnDV9zD8q41CAE"
Content-Disposition: inline

--wQrnDV9zD8q41CAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:22:28AM +0800, Chen Wang wrote:

> On 2023/12/9 0:47, Conor Dooley wrote:
> > On Fri, Dec 08, 2023 at 09:14:32AM +0800, Chen Wang wrote:

> > > +#define ENCODE_PLL_CTRL(fbdiv, p1, p2, refdiv) \
> > > +	(((fbdiv & 0xfff) << 16) | ((p2 & 0x7) << 12) | ((p1 & 0x7) << 8) |=
 (refdiv & 0x3f))
> > IMO this should be a function not a macro.

> Would like to listen why it should be a function instead of a macro? Any
> experiences you can share with me?

Readability. A function, which could be inlined allows you to break this
up and make it easier to read.

> > > +/*
> > > + * Based on input rate/prate/fbdiv/refdiv, look up the postdiv1_2 ta=
ble
> > > + * to get the closest postdiiv combination.
> > > + * @rate: FOUTPOSTDIV
> > > + * @prate: parent rate, i.e. FREF
> > > + * @fbdiv: FBDIV
> > > + * @refdiv: REFDIV
> > > + * @postdiv1: POSTDIV1, output
> > > + * @postdiv2: POSTDIV2, output
> > > + * See TRM:
> > > + * FOUTPOSTDIV =3D FREF * FBDIV / REFDIV / (POSTDIV1 * POSTDIV2)
> > > + * So we get following formula to get POSTDIV1 and POSTDIV2:
> > > + * POSTDIV =3D (prate/REFDIV) x FBDIV/rate
> > > + * above POSTDIV =3D POSTDIV1*POSTDIV2
> > > + */
> > > +static int __sg2042_pll_get_postdiv_1_2(
> > > +	unsigned long rate,
> > > +	unsigned long prate,
> > > +	unsigned int fbdiv,
> > > +	unsigned int refdiv,
> > > +	unsigned int *postdiv1,
> > > +	unsigned int *postdiv2)
> > This is not the coding style btw.
> Agree, will fix this.
> > > +{
> > > +	int index =3D 0;
> > > +	int ret =3D 0;
> > > +	u64 tmp0;
> > > +
> > > +	/* prate/REFDIV and result save to tmp0 */
> > > +	tmp0 =3D prate;
> > > +	do_div(tmp0, refdiv);
> > > +
> > > +	/* ((prate/REFDIV) x FBDIV) and result save to tmp0 */
> > > +	tmp0 *=3D fbdiv;
> > > +
> > > +	/* ((prate/REFDIV) x FBDIV)/rate and result save to tmp0 */
> > > +	do_div(tmp0, rate);
> > > +
> > > +	/* tmp0 is POSTDIV1*POSTDIV2, now we calculate div1 and div2 value =
*/
> > > +	if (tmp0 <=3D 7) {
> > > +		/* (div1 * div2) <=3D 7, no need to use array search */
> > > +		*postdiv1 =3D tmp0;
> > > +		*postdiv2 =3D 1;
> > > +	} else {
> > > +		/* (div1 * div2) > 7, use array search */
> > > +		for (index =3D 0; index < ARRAY_SIZE(postdiv1_2); index++) {
> > > +			if (tmp0 > postdiv1_2[index][POSTDIV_RESULT_INDEX]) {
> > > +				continue;
> > > +			} else {
> > > +				/* found it */
> > > +				break;
> > > +			}
> > > +		}
> > > +		if (index < ARRAY_SIZE(postdiv1_2)) {
> > > +			*postdiv1 =3D postdiv1_2[index][1];
> > > +			*postdiv2 =3D postdiv1_2[index][0];
> > > +		} else {
> > > +			pr_debug("%s can not find in postdiv array!\n", __func__);
> > > +			ret =3D -EINVAL;
> > > +		}
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > Reading this function it makes me wonder if (and I am far from the best
> > person to comment, someone like Stephen is vastly more qualified) you
> > should model this as several "stages", each implemented by the
> > "standard" clocks - like clk_divider etc. The code here is quite
> > complicated IMO as it seems to be trying to implement several stages of
> > division in one go.
>=20
> The objective of __sg2042_pll_get_postdiv_1_2() is straightforward: based=
 on
> the formula defined by the TRM, with input rate/prate/fbdiv/refdiv, we can
> get the possiblle combination of POSTDIV1 and POSTDIV2 by looking up the
> table of postdiv1_2. We will later use it to setup the clock register.
>=20
> Though the codes looks a bit complicated, but accually it is calculate wi=
th
> the formula : POSTDIV =3D (prate/REFDIV) x FBDIV/rate, I just separate it=
 into
> several steps to make it easy to understand, I have listed the formula in
> the comment on top of the function.

I understand what you are doing, I did something similar myself
previously. My suggestion/question was about using the "standard" types
of clock that the core provides to represent as many of the clocks in
this driver as is feasible.

> > There's quite a lot in the driver and I will admit that I have not read
> > it all my any means (I skimmed from here onwards), but in general my
> > advice would be to try and reuse the generic code as much as possible.
> Agree, I will double check and try to optimize the code in next revision.

--wQrnDV9zD8q41CAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXgbxQAKCRB4tDGHoIJi
0nOCAQD2K8NI7O2nSzjOsquexbQTw8D7tl5+jg2IZJ/dyjMnmQEAi/IZQy64yp5f
zo77ZimRDysmDn+1uyqEqxszNT5r/g4=
=9lTh
-----END PGP SIGNATURE-----

--wQrnDV9zD8q41CAE--


--===============5357500180183682516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5357500180183682516==--

