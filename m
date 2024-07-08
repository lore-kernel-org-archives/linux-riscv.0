Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0035AC3DA42
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEX0cppVOxXnLvl+trC3VHMNxophX+S3PUOjlF5uepg=; b=Z0KOXuDQDwZUrJ
	hGAp07swDJ2N5xHYtPMlXSt4QAAdAfgjBBrEvPtuYT19OmHP+Q/6vpOQJv/UXbCZS4sia37DJ4/Df
	HYHuJwqtECFSlgsCmSIgiTjuLZRav4fA6JLv1IgRlBmx+8eGH3kS1k2DARIyzIw9/7A1UnVN0Y81w
	EmzUDx8AMpKZ6qWOkDextmv5dSACWMdmjwXrH1h7NdBVGMPNpum3ZIK8/278SGCVVBCqjOm+0B43B
	/Cu2djBDwIZpN+l8/CdnyZH4cIicKKlfLDvalM/WgTpj4NE/CsotMEpzC+NffRj17D0mYB2SXaYQj
	SmDXQp7JEq10HaHppDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqkE-00000004KIX-1Toi;
	Mon, 08 Jul 2024 15:57:38 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqkA-00000004KFA-0quy
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 15:57:37 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WHpcw5ts8z6K5r4;
	Mon,  8 Jul 2024 23:56:00 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E4AF1400CF;
	Mon,  8 Jul 2024 23:57:20 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 8 Jul
 2024 16:57:19 +0100
Date: Mon, 8 Jul 2024 16:57:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jonathan Cameron
	<jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc:
 sophgo,cv18xx-saradc.yaml: Add Sophgo SARADC binding documentation
Message-ID: <20240708165719.000021b9@Huawei.com>
In-Reply-To: <20240708142344.47da466e@xps-13>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
	<20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
	<20240705-unaired-pesticide-4135eaa04212@spud>
	<6b5459fd-2873-4c26-b986-882413b8d95b@bootlin.com>
	<20240706-remote-undergo-3b9dfe44d16f@spud>
	<20240708083011.058d0c57@xps-13>
	<304b7bb1-d315-4147-820b-1ec0aa63e759@kernel.org>
	<20240708142344.47da466e@xps-13>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_085734_553695_DB6A3F7A 
X-CRM114-Status: GOOD (  25.61  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 8 Jul 2024 14:23:44 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Krzysztof,
> =

> krzk@kernel.org wrote on Mon, 8 Jul 2024 09:33:04 +0200:
> =

> > On 08/07/2024 08:30, Miquel Raynal wrote:  =

> > > Hi Conor,
> > >     =

> > >>>>> +properties:
> > >>>>> +  compatible:
> > >>>>> +    oneOf:
> > >>>>> +      - items:
> > >>>>> +          - enum:
> > >>>>> +              - sophgo,cv1800b-saradc
> > >>>>> +          - const: sophgo,cv18xx-saradc      =

> > >>>>
> > >>>> I don't think the fallback here makes sense. If there's other devi=
ces
> > >>>> with a compatible programming model added later, we can fall back =
to the
> > >>>> cv1800b.    =

> > > =

> > > I'm sorry but isn't this slightly disagreeing with the "writing
> > > bindings" doc pointed in v1? It says,
> > > =

> > > * DO use fallback compatibles when devices are the same as or a subset
> > >   of prior implementations.
> > > =

> > > I believe we fall in the "devices are the same" category, so I would
> > > have myself wrote a similar binding here with a compatible matching
> > > them all, plus a hardware-implementation-specific compatible as well;
> > > just in case.    =

> > =

> > Fallback from one model to another. There is no "another" model here,
> > but wildcard. There is no such device as cv18xx, right?  =

> =

> No there is not. But I don't think there is a "base" model either.
> Just multiple SoCs named cv18<something> with apparently the same ADC.
> =

> So actually I guess the discussion here is about the wildcard
> compatible. It feels strange to me to have no generic compatible either
> with a wildcard or with a "base" implementation (because there is
> probably none). So I guess the solution here is to just list a single
> specific compatible in the end.

It comes from long experience of silicon vendors not being consistent
with part naming.  Far too often we've had a nice generic wild card
entry and along comes the vendor with a new part in the middle
of that range that is completely incompatible.  Then we end up with
people assuming the wildcard means it will work and a bunch of bug
reports.  Hence no wild cards, just define first supported part as your
'base' and go from there.

It's even more fun when a vendor driver papers over the differences
and so it 'works', but the upstream one doesn't.  In extreme case
because a different driver entirely is required.

So basically we don't trust silicon vendors :)
Speaking as someone who works for one - I think that's entirely
reasonable!!

Jonathan

> =

> Thanks,
> Miqu=E8l
> =

> =



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
