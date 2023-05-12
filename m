Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE326C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcay/S8vnTrAC/jLSdJRO/UeliKVZnSWM/A1Yf2LFBg=; b=0z5L6pgngrPM+ZsFoTm6/k3yjq
	wrIZ8CBLo0bTybc9E/+1ZB2lKYDcCVpr4IFeux7jW4pK9WejkFo9/gnxTznMD76+deL6JeYQqBzgQ
	qg0uiCN0QoWkhELKZVXDRzQaL0Dsk1yptvjCe6F+uQraTpsX7ezRGmVV3jhW4hKEgjjZdDt7uMEiu
	QdmriW84o41HgNA8mnvNbtT+Ctb6Cqritx+MRtNX/q63C15rdIOW+Boh4nLsEjZ9Nj+J54wnyRLt/
	nQ9kUVx/a5Oe5l/RbKZH8hr6foL2WQnlSxuHh0KvTtEQzeK7XFqjn4VJgbn3T6SpUDZCiwKS9q8dl
	kBWl9yjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMVc-00B6lY-0l;
	Fri, 12 May 2023 06:44:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMVY-00B6k8-0X
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 06:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683873844; x=1715409844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e7vrZzjTAHYlhbziScGZpOcO6sx7L2qpbdYMGhzF+tY=;
  b=Zq8PVEpMOOGiBPa/gFGZMD5gqE+1FJvm0kooWxqaOXP9eb+FyEy/nq42
   pd7ofP3IUZLPOjHirmJbGIzXaCrGLfe1Pt00ogZbtno/qCiEEh12cmSxl
   /OPhoJAwiMGNWn1OfBTJhDS4bx/q8JN/OtIouogYDHC2OHV6HQnkq79w9
   gso4a+XiVRSZ/fQoxlz+LsKQHAn7qjJ2268MSEWO7ygiQMOKnw6GChR9M
   wvT7uuMmNJmpQ5gor8I/BbD6IYMZOVa4C6Ao2avzivwJb0fKZqgQwVwT6
   /iXq0lgmKiKPMJvyV2BKmbVDXwS1zfJ5q/s2b8z+48qqRHltLHRsZzRoO
   w==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="210904823"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 23:43:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 23:43:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 23:43:55 -0700
Date: Fri, 12 May 2023 07:43:35 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal
 Feng <hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <20230512-brewery-spouse-86350c9664d8@wendy>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
 <2fb8c88a-dab5-791b-eefe-c983decad5e8@linaro.org>
MIME-Version: 1.0
In-Reply-To: <2fb8c88a-dab5-791b-eefe-c983decad5e8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_234404_401470_CD24E156 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: multipart/mixed; boundary="===============8392557159656054835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8392557159656054835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5hr07LkZOQg1PDAv"
Content-Disposition: inline

--5hr07LkZOQg1PDAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 08:35:43AM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2023 04:20, Xingyu Wu wrote:
> > From: William Qiu <william.qiu@starfivetech.com>

> > +  "#power-domain-cells":
> > +    const: 1
>=20
> Add it to the existing examples.
>=20
> This part confuses me... why aon appeared here?  Why power-controller
> disappeared? I don't think that Rob or me proposed any of this.

Rob did actually suggest this, as the power-controller child node had no
properties other than #power-domain-cells.

--5hr07LkZOQg1PDAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF3gDQAKCRB4tDGHoIJi
0uuIAQCH6VV+uDnZjuZ3RNd9XXAUySuX/C89byQ08aS6KRCLLAEAxr99pkJRygwB
r3nW46PrmXXBLmPQpoyoWa59BWkCyAg=
=Mzk6
-----END PGP SIGNATURE-----

--5hr07LkZOQg1PDAv--


--===============8392557159656054835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8392557159656054835==--

