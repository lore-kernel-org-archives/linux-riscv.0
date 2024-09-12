Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86E5EEB58C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3hu3fG/uSFwnl1KMlXto2HTp8DMDMQ345f8yk3vfpk=; b=UrS8/pVujkoTZABdakkm0QAPq3
	vy5okzdP0Vz20bq09ASrtMrDoEnqbuJlLK0YBR2tEeiL0txpiInuKV9b/rXy99r/kb7r2SSypJBtH
	7jW7udrSJJmkBOY6O/f2ErxB1zeMPfUo2M2fY3p7uOXU/1CwVRh3Qt96CqMKPBtJIM1VruOCTf/AY
	9w19G0pNSvt1BnaDSIxo+hBhJKyq+bnC3RbULddcuiKpoP5cgCMsgdA+5bdeCfP2NTfFF9GJSB5ko
	qKDdtVoZlxRhxPq/SbQ6A9HR1ZrfoOxZwsnDQoaeFIBxYsavOpC2kKwhSqSDbaj0y26n0GbYeyHpk
	in+eWmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sohIT-0000000CjRF-37YL;
	Thu, 12 Sep 2024 10:43:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sohGa-0000000Cj8a-2bZB
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 10:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726137697; x=1757673697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jpfMi5Rm1Hk8MtZMwmhmcakH/o80RIYQBe//R+tRjcE=;
  b=RZ5OkeiUThaFsnUl92FZqiD6mevahxrw7ZmAblkXQL4hx0OFRSdJoDQp
   vb9cZ3bjkiDfAwAYKrxEiSk2td/yn1pgZtVYsYLu+VRl85cZjGUgjpXA6
   BGlrZk2eu8/lOtjWAD5+twq6zTljwFUvKGy1x94CAQZOHBvHw81XjxssT
   fGLnvssWRpOuj+hy0/677HfoQH8htUc/zpyOacjzcr+/9xwM/xZgPXKYR
   n2/cGHnkZYpNfjgZN6xcl7kDIBG+NS/tuI6fJGgSBcz9xOgyz4uf825Yq
   oWhWb1Knrj9gyoAJozV9VXRpzsa1fMorKPMXo9+Lal3Fwt2qK2TGOrCe7
   w==;
X-CSE-ConnectionGUID: tqbkiD8eSzma3pF+wzscBA==
X-CSE-MsgGUID: Xax4C/E3Tu2vJ2YmG1yi8w==
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="asc'?scan'208";a="31694078"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 03:41:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 03:40:48 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 12 Sep 2024 03:40:44 -0700
Date: Thu, 12 Sep 2024 11:40:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: WangYuli <wangyuli@uniontech.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "sashal@kernel.org" <sashal@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, Walker Chen
	<walker.chen@starfivetech.com>, "robh@kernel.org" <robh@kernel.org>,
	"kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "richardcochran@gmail.com"
	<richardcochran@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH 6.6 v2 3/4] riscv: dts: starfive: Add the nodes and pins
 of I2Srx/I2Stx0/I2Stx1
Message-ID: <20240912-lividly-remover-6d71b985a803@wendy>
References: <20240912025539.1928223-1-wangyuli@uniontech.com>
 <D2DCF9E2F70EDC93+20240912025539.1928223-3-wangyuli@uniontech.com>
 <ZQ2PR01MB13070BA638E892A5516DEA8CE6642@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ2PR01MB13070BA638E892A5516DEA8CE6642@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_034136_710461_DD07F63F 
X-CRM114-Status: GOOD (  13.25  )
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
Content-Type: multipart/mixed; boundary="===============3011050572975127897=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3011050572975127897==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jXCjevABJ3fUeyuz"
Content-Disposition: inline

--jXCjevABJ3fUeyuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 10:23:09AM +0000, Hal Feng wrote:
> > On 12.09.24 10:55, WangYuli wrote:
> > +	i2srx_pins: i2srx-0 {
> > +		clk-sd-pins {
> > +			pinmux =3D <GPIOMUX(38, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_SYS_I2SRX_BCLK)>,
> > +				 <GPIOMUX(63, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_SYS_I2SRX_LRCK)>,
> > +				 <GPIOMUX(38, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_SYS_I2STX1_BCLK)>,
> > +				 <GPIOMUX(63, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_SYS_I2STX1_LRCK)>,
> > +				 <GPIOMUX(61, GPOUT_LOW,
> > +					      GPOEN_DISABLE,
> > +					      GPI_SYS_I2SRX_SDIN0)>;
> > +			input-enable;
> > +		};
> > +	};
> > +
> > +	i2stx1_pins: i2stx1-0 {
> > +		sd-pins {
> > +			pinmux =3D <GPIOMUX(44, GPOUT_SYS_I2STX1_SDO0,
> > +					      GPOEN_ENABLE,
> > +					      GPI_NONE)>;
> > +			bias-disable;
> > +			input-disable;
> > +		};
> > +	};
> > +
> > +	mclk_ext_pins: mclk-ext-0 {
> > +		mclk-ext-pins {
> > +			pinmux =3D <GPIOMUX(4, GPOUT_LOW,
> > +					     GPOEN_DISABLE,
> > +					     GPI_SYS_MCLK_EXT)>;
> > +			input-enable;
> > +		};
> > +	};
> > +
> >  	mmc0_pins: mmc0-0 {
> >  		 rst-pins {
> >  			pinmux =3D <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
>=20
> The above changes had been reverted in commit e0503d47e93d in the mainlin=
e.
> Is it appropriate to merge this patch into the stable branch?
>=20
> https://lore.kernel.org/all/20240415125033.86909-1-hannah.peuckmann@canon=
ical.com/

Hah, I had gone looking this morning because I had a hunch that there
was some missing fix this series didn't, but couldn't remember what it
was. I completely forgot that some of this was non-present overlay
related stuff that had had to be reverted.

So yes, if it had to be reverted in mainline, it shouldn't get
backported. Thanks for spotting that Hal.

Cheers,
Conor.

--jXCjevABJ3fUeyuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuLFCwAKCRB4tDGHoIJi
0kLkAQDZzYyDnfaVx1KPdhfL5iMpjCffndWbDiKFnYhExyDQbAD/b8scbjJYHqJK
OHORY7atNwZsEw8jTLQpkmAFLu/VRAc=
=3sWz
-----END PGP SIGNATURE-----

--jXCjevABJ3fUeyuz--


--===============3011050572975127897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3011050572975127897==--

