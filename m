Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D1BC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 11:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l/vBnCOWNbZrDoNhR19wv0psQaSjwuFRaY0BMQgUMU=; b=dDiIaLA2s/eOC4ychiNzhj5YxD
	s1idOR9iR9koyQ+rpoE/FV8+2OQFxOh4LAjWol2DDwDxCOHyJGO9IuYvNheRlxbr63UgavjVmzmbW
	/xaWzBUWdY8jl9ThzicGQGymNnNofTN6Lv4nl19CEp5nTjaNdg5AkK1snx4O34IP+/Rs8FNXX5jL0
	QwcyHRcjuI7nrV3GdN4b/lyuIdK7dU6tgcOiizKsefpbiR8gZhzPRoPoq6iUE6MBng5N7v3U88l2Q
	6ZypAjmTa9sWfIOOPr+iGgrGgMpjctDBbZAUPKK7iKR5fHzOknoElPysPHKYOh+UG+injJV04mqz0
	aRyO0A2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxth-00Cv63-6o; Tue, 28 Feb 2023 11:11:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxte-00Cv5V-J8
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 11:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677582710; x=1709118710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8/W68TntRup6W2xyDuU46LT4rXG2iGw63eM9OwzTey0=;
  b=MmJcbmVIfuw5IA4vz5mUW5xImuQv2SDjIJa3tGTR0bMy5BvdxvBBQhVm
   z1gPk6u1+1YJg94XDS+uC+y76b9xQfnSxQbhgh/Pv7i6pjKpv1nTyTktm
   4kqozQ+a3TORevznDEFuUvfJsSfYu/sUozxnuYdjPQ6cAZpcrfdjAJfVv
   fPELnjg2dJI64ydDYVh0OHQuiNUOwQp6Kd0L3H/v4LDa96ewAMgnT/50i
   KkDeFbJFALxg+y9BHoCVGF7uxMzajJK5zSnQT1epBAwrtR5POwxBw3rWr
   S0gvG6SHAJffNAJZz515SeOm/0Jp93u4yMmX1vJbPgEbveRgMLE2BHc07
   A==;
X-IronPort-AV: E=Sophos;i="5.98,221,1673938800"; 
   d="asc'?scan'208";a="199103866"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Feb 2023 04:11:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 04:11:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 28 Feb 2023 04:11:45 -0700
Date: Tue, 28 Feb 2023 11:11:18 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp
 Zabel <p.zabel@pengutronix.de>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Message-ID: <Y/3hVlp/YPnWHDCX@wendy>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <0ffb02d2-0bbd-fd0d-b0f6-cb5605570050@starfivetech.com>
 <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
 <Y/3coFvMWOLaaY9p@wendy>
 <545c23f3-1d68-2bff-89d9-584e3ca31044@linaro.org>
MIME-Version: 1.0
In-Reply-To: <545c23f3-1d68-2bff-89d9-584e3ca31044@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_031150_716701_55FDA0CC 
X-CRM114-Status: GOOD (  15.98  )
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
Content-Type: multipart/mixed; boundary="===============4548873797686066633=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4548873797686066633==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jLh5qG3hXRv5ahXq"
Content-Disposition: inline

--jLh5qG3hXRv5ahXq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 11:57:58AM +0100, Krzysztof Kozlowski wrote:
> On 28/02/2023 11:51, Conor Dooley wrote:
> > On Tue, Feb 28, 2023 at 11:36:49AM +0100, Emil Renner Berthing wrote:
> >> On Tue, 28 Feb 2023 at 10:44, Xingyu Wu <xingyu.wu@starfivetech.com> w=
rote:
> >>> On 2023/2/26 22:14, Emil Renner Berthing wrote:
> >>>> On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com>=
 wrote:
> >=20
> >>> So the dt-bingdings need to rename, and which one could be better,
> >>> 'starfive,jh71x0-wdt.yaml' or 'starfive,jh-wdt.yaml'?
> >>
> >> Sure, starfive,jh71x0-wdt.yaml sounds good to me.
> >=20
> > I feel like a common comment I see from the dt folks is to not put
> > wildcards in filenames & just pick the first compatible.
> > I could very well be wrong on that front though...
>=20
> First compatible is a bit better, unless you are sure this will cover
> all such compatibles now and in the future. For many bindings the
> family/wildcards were fine in filename.

Ahh cool, good to know what the specific policy is - thanks!

--jLh5qG3hXRv5ahXq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/3hVgAKCRB4tDGHoIJi
0iFfAQDNJAIopU3zHNYFn2s2i+au7uDl7O7iIjf1FY4nFUaCFwD4y+Erbm3dLnRc
dO8BxfN/ImoHPfoqemQXS3dw0Pj0AA==
=sqkI
-----END PGP SIGNATURE-----

--jLh5qG3hXRv5ahXq--


--===============4548873797686066633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4548873797686066633==--

