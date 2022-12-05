Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DC0C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U45/cBY37UI5JQTe0foQk+gjN9oLBqLbg4rORk6+LV4=; b=h1IhrLcQvVEk/xNrSaGjsFpciU
	oFhNFN3b+UO6GVIiiDzHMvVjmgupUXhZ0yYwmBK+aZOS/FxMBoCCF0K8WN1p9qc8gMZ2fyDdKfDY/
	BSrq4zfv/t0GZR5TJF1XGV8vryDHyt9C1rS5yhainnII0l7rS0bs2S4Rp8mxoacbh6O4m3Nd1Jn/G
	lCv5b7Zy8xZK27PRzLo0inKA15/H5gHtppFfrKPa8xztcGi8om85WzchvkfRkl2x0zF+rPMn7MPPq
	/2thMVOikTiC0gfVYeVZT5HN+uQAgQWmZYB/5oqZKcBu1LVLMvFCxAxVg5HlMMSVNhmUMQo+kftK9
	xxJ/n2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2D29-004UXT-RK; Mon, 05 Dec 2022 15:05:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2D27-004UWr-9P
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 15:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670252727; x=1701788727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zw8dxdg3m3R6zFIw4o03xsSd7j/WCHa3WWnrIy6K6ew=;
  b=Gd3iPEJ+rp+iYuikWZuRuDjnNT+9bghbFBdLew8aF0Q5LQZ5siTvkFNn
   qCR6W57mcNrn51OyNwCfPwdGzbW1WL0LrjxtUZWDOuUOUCfzYA/N6ZRw/
   KfqPw4v8MHMCMsGyOVcFD2ZtzWFAt2ta0VF2iv9sTXhxsthCKQTQN/Sgk
   HJtCLCTEynmuKO4rOPgazLwIvCSTSGXVZa0WYqky9FLa/IQTiu/sabiPM
   1JpZ1H5h5yPXLGXmCSlmdX/REvGfcYl/VFgecBBZuBKXJNcFsIPK72eYo
   VAMKh4IS+sLrXdqlnUn90k47zdbyrQ9Mx9xaKwyWU3qmKAvdEdUet9XHp
   A==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="asc'?scan'208";a="202643683"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Dec 2022 08:05:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Dec 2022 08:05:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Dec 2022 08:05:23 -0700
Date: Mon, 5 Dec 2022 15:05:04 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Icenowy Zheng <uwu@icenowy.me>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Marc Zyngier <maz@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible for
 OpenC906
Message-ID: <Y44IoC765yztZ6VF@wendy>
References: <20221121041757.418645-3-uwu@icenowy.me>
 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
 <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
 <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
 <20221130181330.GA2544489-robh@kernel.org>
 <Y4j+Gpptk3NAFBNV@spud>
 <4ad56fa249a30167844abcedac53d198606511d8.camel@icenowy.me>
 <Y43Jt3YOSbFyh954@wendy>
 <75a3ef9a175b16c46b57b2829ecbe4f97737de8a.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <75a3ef9a175b16c46b57b2829ecbe4f97737de8a.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_070527_358088_30017C8F 
X-CRM114-Status: GOOD (  21.82  )
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
Content-Type: multipart/mixed; boundary="===============9033061023047260393=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9033061023047260393==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dsnIWWXsziWEFZwU"
Content-Disposition: inline

--dsnIWWXsziWEFZwU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 07:03:17PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2022-12-05=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 10:36 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A

> > You lot all know the situation here a lot more than I do...
> > I don't think "letting" people use the bare "thead,c900-foo" makes
> > much
> > sense as it gives us no chance to deal with quirks down the line.
>=20
> Well, after rechecking the manual, I found it possible to handle quirks
> -- T-Head has a custom "mcpuid" CSR (@ RISC-V CSR 0xFC0), which can be
> used to retrieve some identification info of the core, including its
> model ID, version, etc; and the T-Head PLIC/CLINT are part of their
> C906 SoC design that there's another "mapbaddr" CSR that could be used
> to retrieve the base address of them.
>=20
> So I think it okay to just use "thead,c900-clint" here, and when
> necessary, try to retrieve mcpuid for dealing with quirks.

I'm not super sure I follow. What's the relevance of "mapbaddr" here?
We've got a reg property, so I don't think we need "mapbaddr"?

For "mcpuid", can you be sure that implementers will not omit setting
that value to something unique? I'd be happier if we were overly clear
now rather than have some headaches later. Have I missed something?

> > I don't think that using "thead,openc906-clint", "thead,c900-clint"
> > makes all that much sense either, in case someone does something
> > wacky
> > with the open-source version of the core.
> >=20
> > That leaves us with either:
> > "vendor,soc-clint", "thead,openc906-clint", "thead,c900-clint"
> > or:
> > "vendor,soc-clint", "thead,c900-clint"
> > right?
> >=20
> > The first one seems like possibly the better option as you'd kinda
> > expect that, in a perfect word, all of the open-source IP
> > implementations would share quirks etc?


--dsnIWWXsziWEFZwU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY44IoAAKCRB4tDGHoIJi
0kD4AQCR4eYQLgineg6X0LMoB3wJa2iav+5X+jNESvGVfuIctQEArogX3y1vXKA/
Car1Dd1C4S5kljZMxWlathZkKWQrVgY=
=Ozbn
-----END PGP SIGNATURE-----

--dsnIWWXsziWEFZwU--


--===============9033061023047260393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9033061023047260393==--

