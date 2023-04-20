Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BCBC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OG0+ozBuPoa4FAKnvQliFpl83ciJ5l0tDUiZX5IKAU=; b=RcCO5/pa9frQDA+LKYfZNGH7Nh
	lkDiO9OGej677UMjjL87SC0C9Ty/deo64TaDH6GME5ROUW6eo5uEmXDMNjPobOBydJjn3/tfU8Ck8
	SrpOGf6wpONtMCI7ciNYex9+Wgj+feIhhNLclNCwWJKBKLjtTwudO+xj4d/Mca3tUKSeab1IBpUzR
	yDpYXMVWXFuXD/4b8vFslZFtRfxglwUAzjKP9k6JiJ4odg7UoH3awTTLDAp2yUsoAreDJv5M30zX7
	rEUo92uuhrP9YTDWo0KrPJC7hGk+E0JBsdKu7rtyhOcCpaUYPVG7edAcnD8sYjMwoZbVlo4YMiHo7
	N5HXS0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppROx-007fNI-2y;
	Thu, 20 Apr 2023 10:20:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppROu-007fMN-2P
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 10:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681986028; x=1713522028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p04UFiXEk3VmCHfHIzOZk2Ms3A+ezDFOWY1y5ayhRR0=;
  b=o3mWa2Wb29ynr5zq+5TPlyFtNsPgALcHKVgvsYbeUfmV3BImYfCS5D+K
   jj17BVVXqumY0esvBkVZclKviPwD9hCmXOobNqY18X9YLXqvGsKHpUX5d
   eL6M3XK5LSpHCMXpG6Aw5p6JEoNR62PhUv9dmWTEwjYN9mfsaFQTsJcH2
   x1ssV2VVli/Fe3KJunRi5+XEboEkaYAg9vEE8EBnTVkGSToEGBvJfY8lC
   rzXHKyDAbyvRFa8Wk331XFFQTDPVwXLHBHTGR7l+hYT+yPePnWDgbW42O
   1UC5pXSo1T04LVUXi0bE903nYh9xjuHrKirOpC0nHlZxfAqApBOCZQHf3
   g==;
X-IronPort-AV: E=Sophos;i="5.99,212,1677567600"; 
   d="asc'?scan'208";a="221784309"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Apr 2023 03:20:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 20 Apr 2023 03:20:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 20 Apr 2023 03:20:22 -0700
Date: Thu, 20 Apr 2023 11:20:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nylon Chen <nylon.chen@sifive.com>
CC: <aou@eecs.berkeley.edu>, <conor@kernel.org>,
	<emil.renner.berthing@canonical.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <devicetree@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <nylon7717@gmail.com>, <zong.li@sifive.com>,
	<greentime.hu@sifive.com>, <vincent.chen@sifive.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: sifive: unleashed/unmatched: Remove
 PWM controlled LED's active-low properties
Message-ID: <20230420-backshift-negotiate-1c3d508582d2@wendy>
References: <20230420093457.18936-1-nylon.chen@sifive.com>
 <20230420093457.18936-2-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230420093457.18936-2-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_032028_911929_BA17EA33 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3783031295335856290=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3783031295335856290==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pPcnETLhjtC5Ocdl"
Content-Disposition: inline

--pPcnETLhjtC5Ocdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 05:34:56PM +0800, Nylon Chen wrote:
> This removes the active-low properties of the PWM-controlled LEDs in
> the HiFive Unmatched device tree.
>=20
> The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schemat=
ics-v3.pdf[1].
>=20
> Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf845=
3f8698_hifive-unleashed-a00-schematics-1.pdf [0]
> Link: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce7=
6f4192_hifive-unmatched-schematics-v3.pdf [1]
>=20

Just a minor nit here, there should not be a blank line between the
link:s and the rest of the trailers.

Cheers,
Conor.

--pPcnETLhjtC5Ocdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEER1QAKCRB4tDGHoIJi
0pdYAQCPVswMeIM5oND35Up46NzXuOHouWn5KIqzUs0HHAlgLQD/QKvS9/hYcyAB
eE/lmP3GQ/5SacVC8RcfI3No2qzVJQI=
=PEvj
-----END PGP SIGNATURE-----

--pPcnETLhjtC5Ocdl--


--===============3783031295335856290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3783031295335856290==--

